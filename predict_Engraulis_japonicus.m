function [prdData, info] = predict_Engraulis_japonicus(par, data, auxData)

 % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

filterChecks = f_tL >1 || ... % f contrained to not be larger than 1 or negative
               f_tL <0 ; %   
if filterChecks
   info = 0;
   prdData = {};
   return;
end

if E_Hb < E_Hh || E_Hh < 0
    prdData = []; info = 0; return
end

%% compute temperature correction factors
  TC_Tah = tempcorr(Tah(:,1), T_ref, T_A); 
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_20 = tempcorr(temp.tp_20, T_ref, T_A);
  TC_26 = tempcorr(temp.tp_26, T_ref, T_A);
  TC_19 = tempcorr(temp.NT19_f1, T_ref, T_A);
  TC_23 = tempcorr(temp.NT23_f1, T_ref, T_A);
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  
% initial
   pars_UE0 = [V_Hb; g; k_J ;k_M; v];
   U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. Fraction des réserves restantes at birth
   Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V; % g, initial dry weight

  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth 
  Lw_b = L_b/ del_M;               % cm, standard length at birth
  Ww_b = L_b^3 * (1 + f * w);      % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;          % d, age at birth of foetus at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, standard length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p20 = (t_p - t_b)/ k_M/ TC_20; % d, time since birth at puberty
  tT_p26 = (t_p - t_b)/ k_M/ TC_26; % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % ultimate reproduction rate
  ER19f1 = (TC_19 * reprod_rate_j(9.55 * del_M, f, pars_R)); % #, daily fecundity
  ER23f1 = (TC_23 * reprod_rate_j(9.55 * del_M, f, pars_R)); % #, daily fecundity
  ER19f35 = (TC_19 * reprod_rate_j(9.55 * del_M, f_35, pars_R)); % #, daily fecundity
  ER23f35 = (TC_23 * reprod_rate_j(9.55 * del_M, f_35, pars_R)); % #, daily fecundity
  ER19f0 = (TC_19 * reprod_rate_j(9.55 * del_M, f_0, pars_R)); % #, daily fecundity
  ER23f0 = (TC_23 * reprod_rate_j(9.55 * del_M, f_0, pars_R)); % #, daily fecundity
  
% life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %Males
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm20 = (t_pm - t_bm)/ k_M/ TC_20; % d, time since birth at puberty
  tT_pm26 = (t_pm - t_bm)/ k_M/ TC_26; % d, time since birth at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tp_26 = tT_p26;
  prdData.tp_20 = tT_p20;
  prdData.tp_m26 = tT_pm26;
  prdData.tp_m20 = tT_pm20;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.NT19_f1 = ER19f1
  prdData.NT19_f35 = ER19f35
  prdData.NT19_f0 = ER19f0
  prdData.NT23_f1 = ER23f1
  prdData.NT23_f35 = ER23f35
  prdData.NT23_f0 = ER23f0

  %% uni-variate data
  
 % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0  = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
%  E0    = U_E0 * p_Am;               % J, initial energy in egg
  
  % time-length
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B] = get_tj(pars_tj, f_tL);
  kT_M = TC_tL * k_M; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;     % 1/d, von Bert, exponential growth rate
  tT_j = (t_j - t_b)/ kT_M; Lw_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL(tL(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_ji]/ del_M; % % cm, standard length
  %
  L_bj = L_b * exp(tLj(tLj(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tLj(tLj(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  ELw_j = [L_bj; L_ji]/ del_M; % % cm, standard length

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + ome * f_tL); % g, wet weight
  EWw_L = (LWw(:,1) * del_M).^3 * (1 + ome * f_LWw); % g, wet weight
  
% T-ah data   
  U_E0 = initial_scaled_reserve(f_Tah, pars_UE0); % d.cm^2, initial scaled reserve
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);                 % d, age at hatch at f and T_ref
  Eah = a_h ./ TC_Tah; 
 
% pack to output
  prdData.Tah = Eah;
  prdData.tp_20 = tT_p20;
  prdData.tp_26 = tT_p26;
  prdData.tL = ELw;
  prdData.tLj = ELw_j;
  prdData.LW = EWw;
  prdData.LWw = EWw_L

  