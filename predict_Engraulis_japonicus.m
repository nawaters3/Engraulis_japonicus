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
%  TC_ah29 = tempcorr(temp.ah29, T_ref, T_A);
%  TC_ah24 = tempcorr(temp.ah24, T_ref, T_A);
%  TC_ah17 = tempcorr(temp.ah17, T_ref, T_A);
  TC_Tah = tempcorr(Tah(:,1), T_ref, T_A); 
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_20 = tempcorr(temp.tp_20, T_ref, T_A);
  TC_26 = tempcorr(temp.tp_26, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  
  %hatching
%  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%  aT_h29 = aUL(2,1)/ TC_ah29; % d, age at hatch at f and T
%  aT_h24 = aUL(2,1)/ TC_ah24; % d, age at hatch at f and T
%  aT_h17 = aUL(2,1)/ TC_ah17; % d, age at hatch at f and T
%  L_h = aUL(2,3); % cm, strucural length at hatch
%  E_h = aUL(2,2) * p_Am; % J, energy in reserves at hatch
%  E_0 = aUL(2,2) * p_Am; % J, energy in reserves at initial state
%  Wdh = (d_V * L_h^3 + w_E/ mu_E * E_h); % g, dry weight at hatch

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

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
%  prdData.ah29 = aT_h29;
%  prdData.ah24 = aT_h24;
%  prdData.ah17 = aT_h17;
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

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
  
 % [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
 % aT_h = aUL(2,1)/ TC_ah;          % d, age at hatch at f and T
 % M_Eh = J_E_Am * aUL(2,2);        % mol, reserve at hatch at f
 % L_h = aUL(2,3);                  % cm, structural length at f
 % Lw_h = L_h/ del_M;               % cm, S-V length at hatch at f
 % Ww_h = L_h^3  + M_Eh * w_E/ d_E; % g, wet weight at hatch at f

  % pack to output
  prdData.Tah = Eah;
% prdData.ah = aT_h;
  prdData.tp_20 = tT_p20;
  prdData.tp_26 = tT_p26;
  prdData.tL = ELw;
  prdData.tLj = ELw_j;
  prdData.LW = EWw;
  prdData.LWw = EWw_L;

  