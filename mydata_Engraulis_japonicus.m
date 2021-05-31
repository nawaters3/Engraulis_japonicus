  function [data, auxData, metaData, txtData, weights] = mydata_Engraulis_japonicus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Engraulis_japonicus'; 
metaData.species_en = 'Japanese anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 26];                           
metaData.email    = {'laure.pecquerie@ird.fr'};                 
metaData.address  = {'IRD, Brest'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 26];

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'Fuku1983'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp range 23-25, mouth open and functional from day 2';
data.tp_20 = 96;  units.tp_20 = 'd'; label.tp_20 = 'time since birth at puberty'; bibkey.tp_20 = 'YoneYama2015';
  temp.tp_20 = C2K(20.8);  units.temp.tp_20 = 'K'; label.temp.tp_20 = 'temperature';
  comment.tp_20 = 'Females; temp range 20-22; ad libitum food; guess 50% individuals mature at 96 days given data in paper'; 
data.tp_m20 = 88;  units.tp_m20 = 'd'; label.tp_m20 = 'time since birth at puberty'; bibkey.tp_m20 = 'YoneYama2015';
  temp.tp_m20 = C2K(20.8);  units.temp.tp_m20 = 'K'; label.temp.tp_m20 = 'temperature';
  comment.tp_m20 = 'Males; temp range 20-22; ad libitum food; guess 50% mature at 88 days given 14/25 individuals mature at 90d';
data.tp_26 = 65;   units.tp_26 = 'd'; label.tp_26 = 'time since birth at puberty'; bibkey.tp_26 = 'YoneYama2015';
  temp.tp_26 = C2K(26.8);  units.temp.tp_26 = 'K'; label.temp.tp_26 = 'temperature';
  comment.tp_26 = 'Females; temp range 26-28; ad libitum food; guess 50% individuals mature at 65 days';
data.tp_m26 = 60;   units.tp_m26 = 'd'; label.tp_m26 = 'time since birth at puberty'; bibkey.tp_m26 = 'YoneYama2015';
  temp.tp_m26 = C2K(26.8);  units.temp.tp_m26 = 'K'; label.temp.tp_m26 = 'temperature';
  comment.tp_m26 = 'Males; temp range 26-28; ad libitum food; 50% individuals mature at 60 days';
data.am = 4*365.5;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Fishbase';   
  temp.am = C2K(18.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.33475;   units.Lb = 'cm'; label.Lb = 'standard length at birth';bibkey.Lb = 'Fuku1983';
  comment.Lb = 'Guessed SL of larvae at day 2 (functional mouth / onset feeding) given SL at day 1 and day 5';
data.Lj = 2.1;   units.Lj = 'cm';   label.Lj = 'standard length at metamorphosis' ;bibkey.Lj = 'Fuku1983';
  comment.Lj = ' "Transformation from the larval to the juv. stage", signified by completed fin development';
%data.Lj = 3.44;   units.Lj = 'cm';   label.Lj = 'standard length at metamorphosis';bibkey.Lj = 'TakaWata2004';
%  comment.Lj = 'Range 2.64-4.70 cm, mean 3.44. Metam defined as: "fish with guanine deposition on the peritoneal surface but not on the trunk surface correspond to the end of the metamorphosing stage" for anchovy in Pacific around 35N 150E';
data.Lp = 6.5;   units.Lp = 'cm'; label.Lp = 'standard length at puberty';bibkey.Lp = 'FunaAoki2004';
  comment.Lp = 'Guessed. 7.38 in Osaka Bay where food was considered "high". 50% of females mature in Sagami Bay at 6 cm SL (no food info), 8.53cm In Wakasa Bay where food availability for large anchovy (copepods) was considered "low"';
data.Li = 18;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'total length * 1.162 = 20.91 SL, seems a bit high...';
data.Wwb = 2.5e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'FukuTaka1988';
  comment.Wwb = 'based on egg length of 1.21 mm, width 0.63 mm: pi/6*0.121*0.063^2';
data.Wwi = 45; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = ';From Fishbase. Changed from 620g, which was calculated based on Li and LW data: 63*(18/8.4)^3';
  
data.Ri = 600;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(18.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Engraulis encrasicolus'; 

%{  
data.NT19_f0 = 1478/50; units.NT19_f0 = '# / d';  label.NT19_f0 = 'Mean # of eggs laid per day';    bibkey.NT19_f0 = 'YoneKita2014';   
  temp.NT19_f0 = C2K(19.5); units.temp.NT19_f0 = 'K'; label.temp.NT19_f0 = 'temperature';
  comment.NT19_f0 = 'Adults of unknown weight, length and age. Food treatment after 1 week ad libitum acclimation period.'; 
data.NT23_f0 = 2245/50; units.NT23_f0 = '# / d';  label.NT23_f0 = 'Mean # of eggs laid per day';    bibkey.NT23_f0 = 'YoneKita2014';   
  temp.NT23_f0 = C2K(23.7); units.temp.NT23_f0 = 'K'; label.temp.NT23_f0 = 'temperature';
  comment.NT23_f0 = 'Adults of unknown weight, length and age. Food treatment after 1 week ad libitum acclimation period. n=30'; 
data.NT19_f35 = 5252/50; units.NT19_f35 = '# / d';  label.NT19_f35 = 'Mean # of eggs laid per day';    bibkey.NT19_f35 = 'YoneKita2014';   
  temp.NT19_f35 = C2K(19.5); units.temp.NT19_f35 = 'K'; label.temp.NT19_f35 = 'temperature';
  comment.NT19_f35 = 'Adults of unknown weight, length and age. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1'; 
data.NT23_f35 = 7371/50; units.NT23_f35 = '# / d';  label.NT23_f35 = 'Mean # of eggs laid per day';    bibkey.NT23_f35 = 'YoneKita2014';   
  temp.NT23_f35 = C2K(23.7); units.temp.NT23_f35 = 'K'; label.temp.NT23_f35 = 'temperature';
  comment.NT23_f35 = 'Adults of unknown weight, length and age. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1'; 
data.NT19_f1 = 12519/50; units.NT19_f1 = '# / d';  label.NT19_f1 = 'Mean # of eggs laid per day';    bibkey.NT19_f1 = 'YoneKita2014';   
  temp.NT19_f1 = C2K(19.5); units.temp.NT19_f1 = 'K'; label.temp.NT19_f1 = 'temperature';
  comment.NT19_f1 = 'Total eggs laid / # of adults in tank of unknown weight or age. Avg length recorded as 9.1 cm "body length", which seems to be the same as standard length. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1'; 
data.NT23_f1 = 14737/50; units.NT23_f1 = '# / d';  label.NT23_f1 = 'Mean # of eggs laid per day';    bibkey.NT23_f1 = 'YoneKita2014';   
  temp.NT23_f1 = C2K(23.7); units.temp.NT23_f1 = 'K'; label.temp.NT23_f1 = 'temperature';
  comment.NT23_f1 = 'Adults of unknown weight, length and age. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1'; 
%}
  
% uni-variate data

% embryo   
data.Tah = [ ... % temperature (°C), development time (days) until hatching
29 20.5/24;
24 31/24;
17 52/24];
data.Tah(:,1) = C2K(data.Tah(:,1)); % convert C to K
units.Tah = {'K', 'd'};  label.Tah = {'temperature', 'age at hatching'};  
bibkey.Tah = {'Fuku1983'};

%{
% temp-reprod data
data.TR_f1 = [ ... T (deg C) - # eggs in tank / day (by 50 individuals)
19.5	20091
19.5	20157
19.5	17613
19.5	5358
19.5	13750
19.5	10238
19.5	8808
19.5	19133
19.5	10282
19.5	14671
19.5	15243
19.5	11082
19.5	9581
19.5	6638
19.5	14671
19.5	15141
19.5	7434
19.5	9159
19.5	8460
19.5	9822
19.5	19623
19.5	6166
19.5	16042
19.5	9107
19.5	17605
19.5	12403
19.5	11820
19.5	8107
19.5	19324
19.5	8069
23.7	15285
23.7	14726
23.7	16990
23.7	19272
23.7	14079
23.7	7868
23.7	8913
23.7	14210
23.7	26312
23.7	11378
23.7	13617
23.7	12026
23.7	13484
23.7	15222
23.7	24045
23.7	16983
23.7	16363
23.7	11547
23.7	11731
23.7	5937
23.7	12240
23.7	12479
23.7	18652
23.7	25962
23.7	13275
23.7	14490
23.7	18924
23.7	8630
23.7	13592
23.7	13872];
units.TR_f1   = {'C', '#/d'};  label.TR_f1 = {'temperature', 'egg production per day'};  
bibkey.TR_f1 = 'YoneKita2014';
comment.TR_f1 = '# of eggs in tank per day from 50 individuals. Adults of unknown weight and age, avg length one week before experiment = 9.4 cm body length. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1';

% temp-reprod data
data.TR_f35 = [ ... T (deg C) - # eggs in tank / day (by 50 individuals)
19.5	4031
19.5	12167
19.5	13004
19.5	6940
19.5	10072
19.5	3354
19.5	1807
19.5	7547
19.5	3013
19.5	6771
19.5	2452
19.5	2273
19.5	1965
19.5	756
19.5	5266
19.5	8659
19.5	5864
19.5	3612
19.5	2313
19.5	5755
19.5	9478
19.5	4516
19.5	4226
19.5	11599
19.5	3761
19.5	2299
19.5	4394
19.5	756
19.5	4236
19.5	4665
23.7	15585
23.7	19612
23.7	4454
23.7	5793
23.7	7881
23.7	14738
23.7	7707
23.7	5761
23.7	2845
23.7	9696
23.7	7365
23.7	5358
23.7	4864
23.7	6669
23.7	5006
23.7	12835
23.7	11484
23.7	3207
23.7	10500
23.7	10080
23.7	6613
23.7	5780
23.7	4801
23.7	8535
23.7	932
23.7	4721
23.7	5740
23.7	4669
23.7	5492
23.7	2403];
units.TR_f35   = {'C', '#/d'};  label.TR_f35 = {'temperature', 'egg production per day'};  
bibkey.TR_f35 = 'YoneKita2014';
comment.TR_f35 = '# of eggs in tank per day from 50 individuals. Adults of unknown weight and age, avg length one week before experiment = 9.4 cm body length. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1';

% temp-reprod data
data.TR_f0 = [ ... T (deg C) - # eggs in tank / day (by 50 individuals)
19.5	5076
19.5	3665
19.5	3179
19.5	2169
19.5	14
19.5	0
19.5	0
19.5	0
19.5	904
19.5	2708
19.5	1533
19.5	606
19.5	0
19.5	2
19.5	451
19.5	4972
19.5	3981
19.5	3457
19.5	0
19.5	0
19.5	0
19.5	321
19.5	2517
19.5	1903
19.5	1721
19.5	2242
19.5	592
19.5	0
19.5	1577
19.5	763
23.7	11906
23.7	7268
23.7	1929
23.7	2941
23.7	2779
23.7	2047
23.7	3549
23.7	416
23.7	21
23.7	40
23.7	20
23.7	1660
23.7	633
23.7	213
23.7	435
23.7	10944
23.7	7246
23.7	2342
23.7	1372
23.7	1188
23.7	2663
23.7	810
23.7	745
23.7	601
23.7	847
23.7	436
23.7	449
23.7	1210
23.7	310
23.7	356];
units.TR_f0   = {'C', '#/d'};  label.TR_f0 = {'temperature', 'egg production per day'};  
bibkey.TR_f0 = 'YoneKita2014';
comment.TR_f0 = '# of eggs in tank per day from 50 individuals. Adults of unknown weight and age, avg length one week before experiment = 9.4 cm body length. Food treatment after 1 week ad libitum acclimation period. n=30. Ad libitum considered 5% BW d−1, low food considered 1.75% BW d−1';

% T-dL data, temperature - growth rate 
data.TdL = [ ... % temperature (C), growth rate (cm^-3/day) of oocytes from mothers fed ad-libitum
18.08902811	1.92265E-06
18.09088712	1.80445E-06
18.10575922	8.58833E-07
18.10761823	7.40631E-07
18.11170806	4.80586E-07
18.84899242	2.68256E-07
18.87260187	4.33754E-07
18.87148647	5.04675E-07
18.86739664	7.6472E-07
18.86479402	9.30203E-07
18.86330681	1.02477E-06
18.83412032	1.21387E-06
18.85494126	1.55668E-06
18.84583209	2.13587E-06
20.751134	2.65709E-06
20.75875595	2.17246E-06
20.76377528	1.85331E-06
20.7663779	1.68783E-06
20.77269854	1.28594E-06
20.77455756	1.16774E-06
20.7808782	7.65851E-07
20.78552573	4.70346E-07
24.28976428	9.92511E-07
24.28139872	1.52442E-06
24.27396267	1.99723E-06
24.22042311	2.06812E-06
24.26987284	2.25727E-06
24.26912924	2.30456E-06
24.26020598	2.87193E-06
24.22655785	3.34472E-06
24.19960217	3.39199E-06
27.93194155	2.74407E-06
27.93398647	2.61405E-06
27.93473007	2.56677E-06
27.93547368	2.51949E-06
27.93807629	2.35401E-06
27.94049301	2.20034E-06
27.94142252	2.14124E-06
27.94588415	1.85756E-06
27.94774316	1.73935E-06
27.95108938	1.52659E-06
27.95480741	1.29019E-06
27.93473007	2.56677E-06
24.27061645	2.20999E-06];
units.TdL = {'°C', 'cm/day'};
label.TdL = {'temperature', 'growth rate'};
L0.TdL = mean(data.tL1_T(:,2));  units.L0.TdL1 = 'cm'; label.L0.TdL1 = 'initial length';
bibkey.TdL = 'YoneKita2014';
comment.TdL = 'Growth rate of volume (cm^-3) taken from formula for volume of ellipsoid V = pi*a*b^2 / 6 . Mothers fed ad-libitum';
%}

% time-Length
data.tL = [ ... % time since birth (d), standard length (cm)
0.487	13.791	31.661	43.127	47.699	55.057	55.076	55.491	55.508	55.893	55.932	58.258	58.676	58.691	60.966	61.038	63.288	69.668	79.707	86.092	86.097	86.108	86.118	86.126	122.989	164.057	185.455	199.471	199.53	199.538	200.54	202.718	231.113	236.491	240.984	240.992	241.016	242.106	247.85	249.236	294.247	294.26	300.949	301.163	305.678	305.688	306.469	306.481	306.558	310.639	310.647	311.479	312.049	314.756	314.767	315.249	315.565	317.965	318.826	319.254	320.138	320.304	320.624	321.107	324.247	325.195	325.688	325.757	327.542	328.341	328.352	328.363	328.381	331.515	331.981	332.069	334.407	334.854	336.101	341.266	363.448	390.8
0.295	1.236	2.318	3.105	3.288	3.962	4.13	3.779	3.934	3.316	3.653	4.102	3.78	3.906	3.906	4.538	4.313	4.398	4.637	4.764	4.806	4.904	4.988	5.059	5.089	6.075	6.16	5.361	5.881	5.951	6.765	5.909	7.497	6.767	6.263	6.333	6.543	4.129	6.614	6.796	6.449	6.561	5.354	7.235	6.927	7.011	5.874	5.986	6.66	6.534	6.604	5.917	6.927	6.717	6.815	7.054	5.833	6.928	6.493	6.254	6.029	7.489	6.296	6.549	6.142	6.479	6.816	7.419	7.111	6.128	6.227	6.325	6.479	6.03	6.129	6.9	7.448	7.378	6.339	7.743	6.72	7.143
]';
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FukuTaka1988';

%
data.tLj = [ ...  % time since birth (d), standard length (cm)
0	0.715	3.688	7.795	10.771	14.878	17.783	20.971	24.724	28.902	30.886	34.92	39.88	43.916	48.022	51.001	55.036	59.145	62.192
0.247	0.304	0.376	0.526	0.697	0.847	0.99	1.196	1.296	1.468	1.568	1.612	1.925	2.04	2.154	2.466	2.553	2.746	2.93
]';
units.tLj = {'d', 'cm'}; label.tLj = {'time since birth', 'standard length'};  
temp.tLj = C2K(22);  units.temp.tLj = 'K'; label.temp.tLj = 'temperature';
bibkey.tLj = 'Fuku1983';

% Length-Weight
data.LW = [ ... 
0.795	0.856	0.932	1.039	1.1	1.131	1.207	1.299	1.345	1.375	1.498	1.559	1.742	1.834	1.941	2.017	2.078	2.078	2.185	2.216	2.292	2.338	2.399	2.399	2.46	2.537	2.552	2.552	2.567	2.628	2.644	2.735	2.751	2.812	2.843	2.919	2.995	3.026	3.057	3.148	3.164	3.194	3.332	3.378	3.454	3.485	3.561	3.592	3.73	3.73	3.79	3.791	3.791	3.821	3.836	3.929	3.974	4.035	4.097	4.142	4.143	4.219	4.495	4.525	4.586	4.648	4.663	4.709	4.723	4.724	4.849	4.877	4.877	4.924	4.924	5.062	5.076	5.107	5.183	5.249	5.263	5.276	5.306	5.398	5.413	5.461	5.475	5.52	5.536	5.551	5.566	5.566	5.69	5.692	5.719	5.765	5.781	5.796	5.812	5.815	5.827	5.827	5.857	5.888	5.892	5.933	5.95	5.964	5.995	5.995	6.025	6.026	6.061	6.071	6.118	6.133	6.133	6.146	6.168	6.194	6.214	6.227	6.23	6.24	6.301	6.316	6.377	6.378	6.44	6.454	6.454	6.473	6.516	6.531	6.562	6.562	6.576	6.577	6.607	6.609	6.67	6.674	6.684	6.7	6.716	6.73	6.747	6.747	6.762	6.791	6.797	6.809	6.822	6.853	6.885	6.916	6.916	6.917	6.931	6.958	6.96	6.98	6.992	7.039	7.041	7.052	7.114	7.115	7.129	7.129	7.144	7.181	7.236	7.266	7.282	7.303	7.343	7.406	7.406	7.406	7.464	7.527	7.527	7.528	7.559	7.574	7.68	7.68	7.835	7.957	8.357	8.372
0.0222	0.022	0.034	0.0337	0.0336	0.0213	0.0211	0.0208	0.0329	0.0328	0.0325	0.0323	0.0318	0.0316	0.0435	0.0677	0.0431	0.0919	0.0672	0.0671	0.0547	0.1278	0.091	0.152	0.0909	0.2614	0.0662	0.176	0.115	0.066	0.2001	0.1145	0.212	0.1875	0.2484	0.1872	0.2235	0.2722	0.2478	0.3085	0.2597	0.3206	0.4665	0.381	0.3686	0.3564	0.4659	0.3805	0.5386	0.624	0.4409	0.5263	0.6116	0.4652	0.2701	0.8918	0.5868	0.6963	0.7084	0.5009	0.818	0.9641	0.9878	1.1462	0.7924	1.1459	1.3654	1.2311	0.5359	1.2798	2.3161	1.1331	1.2063	1.7671	1.9012	1.7423	1.596	1.4251	1.5957	3.8272	2.9491	1.8393	1.5466	1.7292	1.5463	2.9486	1.9973	1.9606	2.0825	1.7532	1.9605	2.0215	2.4723	3.5577	1.9113	1.8624	2.277	2.0574	2.3988	3.8257	2.35	2.3988	2.3012	2.4352	4.1059	2.0571	2.7399	2.2887	2.4227	2.4715	2.3007	2.6056	4.7152	2.1786	2.5809	2.5931	2.7638	1.7638	4.5564	2.6905	4.7514	3.5684	5.0075	2.605	2.7756	2.3975	2.5437	2.6046	3.324	2.7873	2.8483	4.3117	2.9823	2.7871	2.9822	3.348	2.6163	3.1773	2.8479	3.5186	3.4209	5.4209	3.2257	3.4452	3.6037	2.9939	3.7134	3.8841	3.6036	3.0181	5.6889	4.1157	3.4449	3.457	3.9081	4.1154	4.3105	4.8349	4.0056	2.7372	3.225	5.5786	4.1152	4.5175	5.4565	3.7857	3.7856	4.3953	3.8587	3.9075	3.9074	6.7854	3.9925	3.6632	4.1022	6.6875	4.0532	4.5775	4.6506	4.8823	3.5529	4.1015	4.1503	4.6381	5.0648	4.6258	4.2474	4.3938	5.3446	5.3442	6.3554	6.2821
]';
units.LW = {'cm', 'g'}; label.LW = {'standard length', 'wet weight'};  
bibkey.LW = 'FukuTaka1988';

data.LWw = [ ... % Standard length (cm), (total) wet weight (g)
    6.330054446	6.608553456	6.850764692	7.110987523	7.375158089	7.610028576	7.652229658	7.900159657	8.162842716	8.118978691	8.359281145	8.408204235	8.621610575	8.672168136	8.87424445	8.953674266	9.124463709	9.139324585	9.166427718	9.389780858	9.378958469	9.419665739	9.555705333	9.65642753	9.649705011	9.66878242	9.847382998	9.896355816	9.921577053	9.893309657	10.06395758	10.16083118	10.24486215	10.3392132	10.43337202	10.42117464	10.60317286	10.59948481	10.69949489	10.83987153	10.84567659	10.91948098	10.94787089	11.00021965	11.08040337	11.09596667	11.18438396	11.19921627	11.2276084	11.25669511	11.42415332	11.40010755	11.47504878	11.45019075	11.54413953	11.70842311	11.67608218	11.6297869	11.76926955	11.94777425	11.97822302	12.03701818	12.06015531	12.07574464	12.11215711	12.21769006	12.30685921	12.34175415	12.3760853	12.39459411	12.47920382	12.58135411	12.56594261	12.50565568	12.63047959	12.67806343	12.66149222	12.78008594	12.88103217	12.90946841	12.92888317	13.09066702	13.1516525	13.1611397	13.17689	13.18076634	13.41017854	13.32744968	13.43356401	13.59547994	13.56068641	13.69288273	13.88929801	13.93017928	13.83694684	14.09587402	14.35219798	14.46525522	14.46972862;
	2.301296183	2.534298923	2.798773597	3.14606915	3.494929098	4.485441046	3.796075017	4.473653334	5.19504918	4.327812668	6.400085826	4.998394437	6.596732062	5.34634384	7.19653322	5.416189448	8.049238725	6.506388287	5.686841179	8.546326473	7.102061533	6.382488252	9.88101275	10.89853612	8.237344661	6.76451336	9.882752494	11.42578287	8.214568919	7.074263448	10.15275321	8.604945133	7.797013653	10.45162625	11.99853974	8.862366229	10.59623667	9.420333559	12.20578991	13.63329326	10.41200623	15.751568	12.46702887	11.02070901	14.45220462	18.15920572	15.84904094	12.59692451	11.30751465	17.59286019	14.33596653	15.21380743	12.80257255	11.74202519	17.20751633	14.42403527	13.2424202	11.83236897	18.17971513	15.45273162	14.14115434	18.89208972	17.10371317	12.11057043	20.29479277	16.07914101	18.34626409	16.97467112	20.40384223	21.74828277	15.60481911	18.95375293	17.68394146	16.69274118	22.57115421	20.22573593	21.5364377	18.31007914	23.25665693	20.08879379	21.63648874	15.19086298	22.7239434	19.85973097	21.57776378	18.68989175	24.33535156	20.38982973	22.21482863	27.53184881	25.9885216	24.41273768	27.12735508	25.36140644	24.19655998	27.58626519	28.76107169	32.81220132	29.47951981
    ]';
units.LWw = {'cm','g'};      label.LWw = {'standard length', 'wet weight'};
bibkey.LWw = 'FunaAoki2004';
comment.LWw = 'Data from Wakasaka Bay. Both sexes. Temperatures during year of sampling in paper.';

%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 0 * weights.Lj;
weights.Li = 0.3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Added ____ as part of DEB School 2021';
D2 = 'The data in this entry may be biased towards the Japanese populations of E. japonicus. Uncertain if parameters are the same for other areas e.g. Yellow Sea';
D3 = 'The value of Lp in the previous mydata file (>10cm) seemed larger than what studies have observed around Japan (8.53, 7.57 and 6 cm respectively). The 8.53 cm Lp was observed at "low" food levels, where differences in temperature and daylight were accounted for. I therefore assumed that for Sagami Bay (where Lp = ~6.5cm) that f = 1 ';
D4 = 'Changed the max wet weight Wwi to 45g (the value in Fishbase), which seems more realistic than the previously calculated value (>600g)';
D5 = 'The original LW data from FukuTaka1988 was in units of mg. It seems the LW data in the original mydata file was over-converted by a factor of 10. New weight range is 0-6 g (instead of 0-60 g)';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  
                                 
%% Links
metaData.links.id_CoL = 'c8c10a1c14ab21459eb2f38d4bf851ad'; % Cat of Life
metaData.links.id_EoL = '46562562'; % Ency of Life
metaData.links.id_Wiki = 'Engraulis_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Engraulis_japonicus'; % ADW
metaData.links.id_Taxo = '42686'; % Taxonomicon
metaData.links.id_WoRMS = '219984'; % WoRMS
metaData.links.id_fishbase = 'Engraulis-japonicus.html'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Engraulis_japonicus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fuku1983'; type = 'Article'; bib = [ ...  
'author = {O. Fukuhara}, ' ...
'year = {1983}, ' ...
'title = {Development and growth of laboratory reared \emph{Engraulis japonica} ({H}outtuyn) larvae}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {23}, '...
'pages = {641-652}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FukuTaka1988'; type = 'Article'; bib = [ ...  
'author = {O. Fukuhara and K. Takao}, ' ...
'year = {1988}, ' ...
'title = {Growth and larval behaviour of \emph{Engraulis japonica} in captivity}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = 4, '...
'pages = {158-167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FunaAoki2004'; type = 'Article'; bib = [ ...
'author = {Funamoto, T. and Ichiro, A. and Wada, Y.},' ...
'year = {2004}, ' ...
'title = {Reproductive characteristics of Japanese anchovy, Engraulis japonicus, in two bays of Japan}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {70}, '...
'pages = {71-81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YoneKita2014'; type = 'Article'; bib = [ ...
'author = {Yoneda, M. and Kitano, H. and Tanaka, H. and Kawamura, K. and Selvaraj, S. and Ohshimo, S. and Matsuyama, M. and Shimmizu, A.}, ' ...
'year = {2014}, ' ...
'title  = {Temperature- and income resource availability- mediated variation in reproductive investment in a multiple-batch-spawning Japanese anchovy}, ' ...
'journal = {MARINE ECOLOGY PROGRESS SERIES}, ' ...
'volume = {516}, '...
'pages = {251-262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YoneYama2015'; type = 'Article'; bib = [ ...
'author = {Yoneda, M. and Yamamoto, T. and Yamada, T. and Takahashi, M.}, ' ...
'year = {2015}, ' ...
'title  = {Temperature-induced variation in sexual maturation of Japanese anchovy Engraulis japonicus}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {95}, '...
'pages = {1271-1276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Engraulis-japonicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
