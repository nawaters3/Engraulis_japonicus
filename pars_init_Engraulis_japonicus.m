function [par, metaPar, txtPar] = pars_init_Engraulis_japonicus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6913.931;   free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 0.28821;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.034582;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.88679;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 370.272;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5227.2755;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.171e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.472e+02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.487e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.179e-08;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 1.889e-04; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatching'; 
par.E_Hpm = 1.118e+04; free.E_Hpm = 1;   units.E_Hpm = 'J';        label.E_Hpm = 'maturity at puberty for males'; 
par.del_M = 0.20012;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for standard length'; 
par.del_M_TL = 0.25439;  free.del_M_TL = 1;   units.del_M_TL = '-';     label.del_M_TL = 'shape coefficient for total length'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_0 = 0.39463;    free.f_0   = 1;   units.f_0 = '-';          label.f_0 = 'scaled functional response for N-T 0 food data'; 
par.f_35 = 0.4085;    free.f_35  = 1;   units.f_35 = '-';         label.f_35 = 'scaled functional response for N-T low food data'; 
par.f_LWw = 0.27205;  free.f_LWw = 1;   units.f_LWw = '-';        label.f_LWw = 'scaled functional response for length-weight data in Wakasa Bay'; 
par.f_tL = 0.55609;   free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.f_tR = 0.9314;    free.f_tR  = 1;   units.f_tR = '-';         label.f_tR = 'scaled functional response for ad libitum part of tN-data experiments'; 
par.t_0 = 1;          free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time at start development at 20 C'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
