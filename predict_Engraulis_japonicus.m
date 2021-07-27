function [prdData, info] = predict_Engraulis_japonicus(par, data, auxData)

 % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

filterChecks = f_tL >1 || ... % f contrained to not be larger than 1 or negative
               f_tL <0 ||... 
               f_tR > 1.2 || f_0 > f_35 || f_35 > f_tR ; %   scaled food for repro experiments
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
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_juv = tempcorr(temp.tL_juv, T_ref, T_A);
  TC_tL_larv = tempcorr(temp.tL_larv, T_ref, T_A);
  TC_20 = tempcorr(temp.tp_20, T_ref, T_A);
  TC_26 = tempcorr(temp.tp_26, T_ref, T_A);
  TC_19 = tempcorr(temp.tR_f1_19, T_ref, T_A);
  TC_23 = tempcorr(temp.tR_f1_23, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j tau_p tau_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  
% initial
   pars_UE0 = [V_Hb; g; k_J ;k_M; v];
   U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. Fraction des réserves restantes at birth
   Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V; % g, initial dry weight

  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth 
  Lw_b = L_b/ del_Mb;               % cm, standard length at birth
  Ww_b = L_b^3 * (1 + f * ome);      % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;          % d, age at birth of foetus at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, standard length at metam
  tT_j = tau_j/ k_M/ TC_tj;          % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);       % g, wet weight at puberty 
  tT_p20 = (tau_p - tau_b)/ k_M/ TC_20; % d, time since birth at puberty
  tT_p26 = (tau_p - tau_b)/ k_M/ TC_26; % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                    % ultimate reproduction rate

% life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;                  % d, mean life span at T
  
%Males
%   p_Amm = z_m * p_M/ kap;
%   E_mm     = p_Amm/v;             % J/cm^3, [E_m], reserve capacity 
%   gm       = E_G/ kap/ E_mm ;      % -, energy investment ratio
%   L_mm     = v/ k_M/ gm;           % cm, maximum length
L_mm = L_m; % assume males and females have same L_m (and L_i)
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm20 = (tau_pm - tau_bm)/ k_M/ TC_20; % d, time since birth at puberty
  tT_pm26 = (tau_pm - tau_bm)/ k_M/ TC_26; % d, time since birth at puberty
  Lw_p_m = (L_mm * l_pm)/ del_M;                % cm, total length at puberty at f
  
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp_26 = tT_p26;
  prdData.tp_20 = tT_p20;
  prdData.tp_m26 = tT_pm26;
  prdData.tp_m20 = tT_pm20;
  prdData.am = aT_m;
 
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lp_m = Lw_p_m;
  
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

%% uni-variate data
 % time-length
  [tau_j ,tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = TC_tL * k_M; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;     % 1/d, von Bert, exponential growth rate
  tT_j = (tau_j - tau_b)/ kT_M; L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL(tL(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  EL_bj = L_bj / del_Mb;
  EL_ji = L_ji / del_M;
  ELw = [EL_bj; EL_ji]; %[L_bj; L_ji]/ del_M; % % cm, standard length
  
  % time-length juveniles
  kT_M = TC_tL_juv * k_M; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;     % 1/d, von Bert, exponential growth rate
  L_bj = L_b * exp(tL_juv(tL_juv(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_juv(tL_juv(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  EL_bj = L_bj / del_Mb;
  EL_ji = L_ji / del_M;
  ELw_juv = [EL_bj; EL_ji]; % % cm, standard length

  % time-length larvae
  kT_M = TC_tL_larv * k_M; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;     % 1/d, von Bert, exponential growth rate
  L_bj = L_b * exp(tL_larv(tL_larv(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_larv(tL_larv(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  EL_bj = L_bj / del_Mb;
  EL_ji = L_ji / del_M;
  ELw_larv = [EL_bj; EL_ji]; % % cm, standard length
  
  % length-weight
  EWw = [(LW(LW(:,1)<data.Lj,1) * del_Mb).^3 * (1 + ome * f_tL);
      (LW(LW(:,1)>data.Lj,1) * del_M).^3 * (1 + ome * f_tL)]; % g, wet weight
  EWw_L = [(LWw(LWw(:,1)<data.Lj,1) * del_Mb).^3 * (1 + ome * f_LWw);
      (LWw(LWw(:,1)>data.Lj,1) * del_M).^3 * (1 + ome * f_LWw)]; % g, wet weight
  
% T-ah    
%   pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
%   U_E0 = initial_scaled_reserve(f_Tah, pars_UE0); % d.cm^2, initial scaled reserve
%   [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%   a_h = aUL(2,1);                 % d, age at hatch at f and T_ref
%   Eah = a_h ./ TC_Tah; 

  pars_lh = [g k l_T v_Hh v_Hj v_Hp];
  [tau_j tau_p t_h] = get_tj(pars_lh, f); % use standard f, get_tj takes into account acceleration
  Eah = (t_0 + t_h/ k_M) ./ TC_Tah; % d, time at hatch
  
%% temperature - daily reproduction rate
 pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp]; % compose parameter vector at T_ref
 
% t-R exp1, f=1, temp = 19C
[~ , ~,  ~ , ~,  ~, ~,  l_i , ~, rhoB_ftR] = get_tj(pars_tj, f_tR);
 Li_ftR = l_i * L_m; % 1/d, L_i for  general rearing and  the first week(f= ad libitum)
 
 rT_B = rhoB_ftR * k_M * TC_19;  % 1/d, von Bert growth rate 
 L_1 = Li_ftR - (Li_ftR - L0.tR_f1_19*del_M) * exp( - rT_B * 7); % cm, expected structural length at start of experiment 
  % get predictions for (structural) length throughout experiment; Li and rB will later be different because it depends on f
  Li_f1 = Li_ftR; 
  L_f1_19 = Li_f1 - (Li_f1 - L_1) * exp( - rT_B * tR_f1_19(:,1)); % cm, expected structural length throughout experiment 
  ER_f1_19 = reprod_rate_j(L_f1_19, f_tR, pars_R);
  
% t-R exp2, f=1, temp = 23C
 rT_B = rhoB_ftR * k_M * TC_23;  % 1/d, von Bert growth rate 
 L_1 = Li_ftR - (Li_ftR - L0.tR_f1_23*del_M) * exp( - rT_B * 7); % cm, expected structural length at start of experiment 
  % get predictions for (structural) length throughout experiment; Li and rB will later be different because it depends on f
  L_f1_23 = Li_f1 - (Li_f1 - L_1) * exp( - rT_B * tR_f1_23(:,1)); % cm, expected structural length throughout experiment 
  ER_f1_23 = reprod_rate_j(L_f1_23, f_tR, pars_R);
      
% t-R exp3, f=0.35, temp = 19C  
   rT_B = rhoB_ftR * k_M * TC_19; 
   L_1 = Li_ftR - (Li_ftR - L0.tR_f35_19*del_M) * exp( - rT_B * 7); % cm, expected structural length at start of experiment 
  % get predictions for (structural) length throughout experiment; Li and rB will later be different because it depends on f
  [~ , ~,  ~ , ~,  ~, ~,  l_i , ~, rhoB_f35] = get_tj(pars_tj, f_35);
   Li_f35 = l_i * L_m; 
  rT_B = rhoB_f35 * k_M * TC_19; % 1/d, von Bert growth rate and L_i for the experiment
   L_f35_19 = Li_f35 - (Li_f35 - L_1) * exp( - rT_B * tR_f35_19(:,1)); % cm, expected structural length throughout experiment 
   ER_f35_19 = reprod_rate_j(L_f35_19, f_35, pars_R);
     
 % t-R exp4, f=0.35, temp = 23C 
 rT_B = rhoB_ftR * k_M * TC_23; 
   L_1 = Li_ftR - (Li_ftR - L0.tR_f35_23*del_M) * exp( - rT_B * 7); % cm, expected structural length at start of experiment   
 % get predictions for (structural) length throughout experiment; Li and rB will later be different because it depends on f
   rT_B = rhoB_f35 * k_M * TC_23;
   L_f35_23 = Li_f35 - (Li_f35 - L_1) * exp( - rT_B * tR_f35_23(:,1)); % cm, expected structural length throughout experiment 
   ER_f35_23 = reprod_rate_j(L_f35_23, f_35, pars_R);
     
% t-R exp5, f=0.1, temp = 19C  
   rT_B = rhoB_ftR * k_M * TC_19; 
   L_1 = Li_ftR - (Li_ftR - L0.tR_f0_19*del_M) * exp( - rT_B * 7); % cm, expected structural length at start of experiment 
 % get predictions for (structural) length throughout experiment; Li and rB will later be different because it depends on f
  [~ , ~,  ~ , ~,  ~, ~,  l_i , ~, rhoB_f0] = get_tj(pars_tj, f_0);
   Li_f0 = l_i * L_m; 
   rT_B = rhoB_f0 * TC_19;
   L_f0_19 = Li_f0 - (Li_f0 - L_1) * exp( - rT_B * tR_f0_19(:,1)); % cm, expected structural length throughout experiment 
   ER_f0_19 = reprod_rate_j(L_f0_19, f_0, pars_R);
     
% t-R exp6, f=0.1, temp = 23C 
   rT_B = rhoB_ftR * k_M * TC_23; % 1/d, von Bert growth rate for the first week (f= ad libitum)
   L_1 = Li_ftR - (Li_ftR - L0.tR_f0_23*del_M) * exp( - rT_B * 7); % cm, expected structural length at start of experiment 
 % get predictions for (structural) length throughout experiment; Li and rB will later be different because it depends on f
   rT_B = rhoB_f0 * TC_23;  
  L_f0_23 = Li_f0 - (Li_f0 - L_1) * exp( - rT_B * tR_f0_23(:,1)); % cm, expected structural length throughout experiment 
   ER_f0_23 = reprod_rate_j(L_f0_23, f_0, pars_R );
    
% pack to output

  prdData.Tah = Eah;
  prdData.tR_f1_19 = ER_f1_19;
  prdData.tR_f1_23 = ER_f1_23;
  prdData.tR_f35_19 = ER_f35_19;
  prdData.tR_f35_23 = ER_f35_23;
  prdData.tR_f0_19 = ER_f0_19; 
  prdData.tR_f0_23 = ER_f0_23;
%   prdData.tp_20 = tT_p20;
%   prdData.tp_26 = tT_p26; 
  prdData.tL = ELw;
  prdData.tL_juv = ELw_juv;
  prdData.tL_larv = ELw_larv;
  prdData.LW = EWw;
  prdData.LWw = EWw_L;

  