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
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 26];                           
metaData.email    = {'laure.pecquerie@ird.fr'};                 
metaData.address  = {'IRD, Brest'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 26];


modification.author  = {'Neil Waters'}; 
modification.email   = {'nawaters3@gmail.com'};
modification.date    = [2021 04 30]
%% set data
% zero-variate data
data.ab29 = 20.5/24;      units.ab29 = 'd';    label.ab29 = 'age at birth';           bibkey.ab29 = 'Fuku1983'; 
  temp.ab29 = C2K(29.6); units.temp.ab29 = 'K'; label.temp.ab29 = 'temperature';
data.ab24 = 31/24;      units.ab24 = 'd';    label.ab24 = 'age at birth';           bibkey.ab24 = 'Fuku1983'; 
  temp.ab24 = C2K(24); units.temp.ab24 = 'K'; label.temp.ab24 = 'temperature';
data.ap26 = 90;      units.ap26 = 'd';    label.ap26 = 'age at puberty';           bibkey.ap26 = 'Yone2015'; 
  temp.ap26 = C2K(26.8); units.temp.ap26 = 'K'; label.temp.ap26 = 'temperature';
  comment.ap26 = 'Both sexes; temp. range of 26-28. Ad libitum food. 100% individuals mature at 90 days. 27/61 at 60 days';
data.ap20 = 120;      units.ap20 = 'd';    label.ap20 = 'age at puberty';           bibkey.ap20 = 'Yone2015'; 
  temp.ap20 = C2K(20.8); units.temp.ap20 = 'K'; label.temp.ap20 = 'temperature';
  comment.ap20 = 'Both sexes; temp. range of 20-22; Ad libitum food; 100% individuals mature at 120 days. 29/67 at 90 days';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Engraulis encrasicolus';

data.Lp = 10.5;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Lp1 = 6;      units.Lp1 = 'cm';   label.Lp1 = 'standard length at puberty';bibkey.Lp1 = 'Funa2001';
  comment.Lp1 = '50% of females mature at 6cm in Sagami Bay; Temp Unknown. assuming "体長(body length)　= standard length; 7.38 (Osaka Bay) & 8.53cm SL (Wakasa Bay) reported in FunaAoki 2004. Length at sexual maturity noted to be highly variable';
data.Lp2 = 9.13;    units.Lp2 = 'cm';   label.Lp2 = '"body length" at first sexual maturity';bibkey.Lp2 = 'OkadWada2000';
  comment.Lp2 = 'Both sexes; stock caught in Japanese Pacific (Hokkaido - Mie). Temp unknown. Assuming "body length" = "standard length", 9.13cm is average of 19 years data, range 7.5 cm - 10 cm';
data.Li = 18;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'FukuTaka1988';
  comment.Wwb = 'based on egg length of 1.21 mm, width 0.63 mm: pi/6*0.121*0.063^2';
data.Wwi = 45; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 600;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(18.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Engraulis encrasicolus'; 
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
 0.487	0.295
13.791	1.236
31.661	2.318
43.127	3.105
47.699	3.288
55.057	3.962
55.076	4.130
55.491	3.779
55.508	3.934
55.893	3.316
55.932	3.653
58.258	4.102
58.676	3.780
58.691	3.906
60.966	3.906
61.038	4.538
63.288	4.313
69.668	4.398
79.707	4.637
86.092	4.764
86.097	4.806
86.108	4.904
86.118	4.988
86.126	5.059
122.989	5.089
164.057	6.075
185.455	6.160
199.471	5.361
199.530	5.881
199.538	5.951
200.540	6.765
202.718	5.909
231.113	7.497
236.491	6.767
240.984	6.263
240.992	6.333
241.016	6.543
242.106	4.129
247.850	6.614
249.236	6.796
294.247	6.449
294.260	6.561
300.949	5.354
301.163	7.235
305.678	6.927
305.688	7.011
306.469	5.874
306.481	5.986
306.558	6.660
310.639	6.534
310.647	6.604
311.479	5.917
312.049	6.927
314.756	6.717
314.767	6.815
315.249	7.054
315.565	5.833
317.965	6.928
318.826	6.493
319.254	6.254
320.138	6.029
320.304	7.489
320.624	6.296
321.107	6.549
324.247	6.142
325.195	6.479
325.688	6.816
325.757	7.419
327.542	7.111
328.341	6.128
328.352	6.227
328.363	6.325
328.381	6.479
331.515	6.030
331.981	6.129
332.069	6.900
334.407	7.448
334.854	7.378
336.101	6.339
341.266	7.743
363.448	6.720
390.800	7.143];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FukuTaka1988';
%
data.tLj = [ ...  % time since birth (d), standard length (cm)
0.000	0.247
0.715	0.304
3.688	0.376
7.795	0.526
10.771	0.697
14.878	0.847
17.783	0.990
20.971	1.196
24.724	1.296
28.902	1.468
30.886	1.568
34.920	1.612
39.880	1.925
43.916	2.040
48.022	2.154
51.001	2.466
55.036	2.553
59.145	2.746
62.192	2.930];
units.tLj = {'d', 'cm'}; label.tLj = {'time since birth', 'standard length'};  
temp.tLj = C2K(22);  units.temp.tLj = 'K'; label.temp.tLj = 'temperature';
bibkey.tLj = 'Fuku1983';

%
data.LW = [ ... 
0.795	0.222
0.856	0.220
0.932	0.340
1.039	0.337
1.100	0.336
1.131	0.213
1.207	0.211
1.299	0.208
1.345	0.329
1.375	0.328
1.498	0.325
1.559	0.323
1.742	0.318
1.834	0.316
1.941	0.435
2.017	0.677
2.078	0.431
2.078	0.919
2.185	0.672
2.216	0.671
2.292	0.547
2.338	1.278
2.399	0.910
2.399	1.520
2.460	0.909
2.537	2.614
2.552	0.662
2.552	1.760
2.567	1.150
2.628	0.660
2.644	2.001
2.735	1.145
2.751	2.120
2.812	1.875
2.843	2.484
2.919	1.872
2.995	2.235
3.026	2.722
3.057	2.478
3.148	3.085
3.164	2.597
3.194	3.206
3.332	4.665
3.378	3.810
3.454	3.686
3.485	3.564
3.561	4.659
3.592	3.805
3.730	5.386
3.730	6.240
3.790	4.409
3.791	5.263
3.791	6.116
3.821	4.652
3.836	2.701
3.929	8.918
3.974	5.868
4.035	6.963
4.097	7.084
4.142	5.009
4.143	8.180
4.219	9.641
4.495	9.878
4.525	11.462
4.586	7.924
4.648	11.459
4.663	13.654
4.709	12.311
4.723	5.359
4.724	12.798
4.849	23.161
4.877	11.331
4.877	12.063
4.924	17.671
4.924	19.012
5.062	17.423
5.076	15.960
5.107	14.251
5.183	15.957
5.249	38.272
5.263	29.491
5.276	18.393
5.306	15.466
5.398	17.292
5.413	15.463
5.461	29.486
5.475	19.973
5.520	19.606
5.536	20.825
5.551	17.532
5.566	19.605
5.566	20.215
5.690	24.723
5.692	35.577
5.719	19.113
5.765	18.624
5.781	22.770
5.796	20.574
5.812	23.988
5.815	38.257
5.827	23.500
5.827	23.988
5.857	23.012
5.888	24.352
5.892	41.059
5.933	20.571
5.950	27.399
5.964	22.887
5.995	24.227
5.995	24.715
6.025	23.007
6.026	26.056
6.061	47.152
6.071	21.786
6.118	25.809
6.133	25.931
6.133	27.638
6.146	17.638
6.168	45.564
6.194	26.905
6.214	47.514
6.227	35.684
6.230	50.075
6.240	26.050
6.301	27.756
6.316	23.975
6.377	25.437
6.378	26.046
6.440	33.240
6.454	27.873
6.454	28.483
6.473	43.117
6.516	29.823
6.531	27.871
6.562	29.822
6.562	33.480
6.576	26.163
6.577	31.773
6.607	28.479
6.609	35.186
6.670	34.209
6.674	54.209
6.684	32.257
6.700	34.452
6.716	36.037
6.730	29.939
6.747	37.134
6.747	38.841
6.762	36.036
6.791	30.181
6.797	56.889
6.809	41.157
6.822	34.449
6.853	34.570
6.885	39.081
6.916	41.154
6.916	43.105
6.917	48.349
6.931	40.056
6.958	27.372
6.960	32.250
6.980	55.786
6.992	41.152
7.039	45.175
7.041	54.565
7.052	37.857
7.114	37.856
7.115	43.953
7.129	38.587
7.129	39.075
7.144	39.074
7.181	67.854
7.236	39.925
7.266	36.632
7.282	41.022
7.303	66.875
7.343	40.532
7.406	45.775
7.406	46.506
7.406	48.823
7.464	35.529
7.527	41.015
7.527	41.503
7.528	46.381
7.559	50.648
7.574	46.258
7.680	42.474
7.680	43.938
7.835	53.446
7.957	53.442
8.357	63.554
8.372	62.821];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'FukuTaka1988';

%L-Ww Wakasa Bay
data.LW1 = [ ... % Standard length (cm), (total) wet weight (g)
    6.330054446	6.608553456	6.850764692	7.110987523	7.375158089	7.610028576	7.652229658	7.900159657	8.162842716	8.118978691	8.359281145	8.408204235	8.621610575	8.672168136	8.87424445	8.953674266	9.124463709	9.139324585	9.166427718	9.389780858	9.378958469	9.419665739	9.555705333	9.65642753	9.649705011	9.66878242	9.847382998	9.896355816	9.921577053	9.893309657	10.06395758	10.16083118	10.24486215	10.3392132	10.43337202	10.42117464	10.60317286	10.59948481	10.69949489	10.83987153	10.84567659	10.91948098	10.94787089	11.00021965	11.08040337	11.09596667	11.18438396	11.19921627	11.2276084	11.25669511	11.42415332	11.40010755	11.47504878	11.45019075	11.54413953	11.70842311	11.67608218	11.6297869	11.76926955	11.94777425	11.97822302	12.03701818	12.06015531	12.07574464	12.11215711	12.21769006	12.30685921	12.34175415	12.3760853	12.39459411	12.47920382	12.58135411	12.56594261	12.50565568	12.63047959	12.67806343	12.66149222	12.78008594	12.88103217	12.90946841	12.92888317	13.09066702	13.1516525	13.1611397	13.17689	13.18076634	13.41017854	13.32744968	13.43356401	13.59547994	13.56068641	13.69288273	13.88929801	13.93017928	13.83694684	14.09587402	14.35219798	14.46525522	14.46972862;
	2.301296183	2.534298923	2.798773597	3.14606915	3.494929098	4.485441046	3.796075017	4.473653334	5.19504918	4.327812668	6.400085826	4.998394437	6.596732062	5.34634384	7.19653322	5.416189448	8.049238725	6.506388287	5.686841179	8.546326473	7.102061533	6.382488252	9.88101275	10.89853612	8.237344661	6.76451336	9.882752494	11.42578287	8.214568919	7.074263448	10.15275321	8.604945133	7.797013653	10.45162625	11.99853974	8.862366229	10.59623667	9.420333559	12.20578991	13.63329326	10.41200623	15.751568	12.46702887	11.02070901	14.45220462	18.15920572	15.84904094	12.59692451	11.30751465	17.59286019	14.33596653	15.21380743	12.80257255	11.74202519	17.20751633	14.42403527	13.2424202	11.83236897	18.17971513	15.45273162	14.14115434	18.89208972	17.10371317	12.11057043	20.29479277	16.07914101	18.34626409	16.97467112	20.40384223	21.74828277	15.60481911	18.95375293	17.68394146	16.69274118	22.57115421	20.22573593	21.5364377	18.31007914	23.25665693	20.08879379	21.63648874	15.19086298	22.7239434	19.85973097	21.57776378	18.68989175	24.33535156	20.38982973	22.21482863	27.53184881	25.9885216	24.41273768	27.12735508	25.36140644	24.19655998	27.58626519	28.76107169	32.81220132	29.47951981
    ]';
units.LW1 = {'cm','g'};      label.LW1 = {'standard length', 'wet weight'};
bibkey.LW1 = 'FunaAoki2004';
comment.LW1 = 'Data from Wakasaka Bay. Both sexes. Temp in paper.'

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tLj = 5 * weights.tLj;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Added data.ap26, data.ap20, data.Lps, data.Lpo data.LWa as part of DEB School 2021';
D2 = 'Not sure if the literature in this entry, mainly from Japanese waters, is enough to justify a seperate species entry, as other populations, e.g. Yellow Sea, may differ in parameter values';
metaData.discussion = struct('D1',D1, 'D2',D2);  

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
bibkey = 'Funa2001'; type = 'Article'; bib = [ ...
'author = {Funamoto, T.},' ...
'year = {2001}, ' ...
'title = {Maturation and Spawning of Japanese Anchovy}, ' ... 
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {67}, '...
'pages = {1129-1130}'];
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
bibkey = 'YoneYama2015'; type = 'Article'; bib = [ ...
'author = {Yoneda, M. and Yamamoto, T. and Yamada, T. and Takahashi, M.}, ' ...
'year = {2015}, ' ...
'title  = {Temperature-induced variation in sexual maturation of Japanese anchovy Engraulis japonicus}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {95}, '...
'pages = {1271-1276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OkadWada2000'; type = 'Article'; bib = [ ...
'author = {Okada, Y. and Wada, T.}, ' ...
'year = {2000}, ' ...
'title  = {Reproductive relationships of the Pacific stock of Japanese Anchovy Engraulis japonicus}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {66}, '...
'pages = {80-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Engraulis-japonicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
