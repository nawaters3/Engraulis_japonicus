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

%data.ah29 = 20.5/24;      units.ah29 = 'd';    label.ah29 = 'age at hatching';     bibkey.ab29 = 'Fuku1983'; 
%  temp.ah29 = C2K(29.6); units.temp.ab29 = 'K'; label.temp.ab29 = 'temperature';
%data.ah24 = 31/24;        units.ah24 = 'd';  label.ah24 = 'age at hatching';       bibkey.ah24 = 'Fuku1983'; 
%  temp.ah24 = C2K(24); units.temp.ah24 = 'K'; label.temp.ah24 = 'temperature';
%data.ah17 = 52/24;        units.ah17 = 'd';  label.ah17 = 'age at hatching';       bibkey.ah17 = 'Fuku1983'; 
%  temp.ah17 = C2K(17.5); units.temp.ah17 = 'K'; label.temp.ah17 = 'temperature';
data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'Fuku1983'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp range 23-25, mouth open and functional from day 2';
data.tp_20 = 120;  units.tp_20 = 'd'; label.tp_20 = 'time since birth at puberty'; bibkey.tp_20 = 'YoneYama2015';
  temp.tp_20 = C2K(20.8);  units.temp.tp_20 = 'K'; label.temp.tp_20 = 'temperature';
  comment.tp_20 = 'Both sexes; temp range 20-22; ad libitum food; 100% individuals mature at 120 days. 27/61 individuals mature at 60 days'; 
data.tp_26 = 90;   units.tp_26 = 'd'; label.tp_26 = 'time since birth at puberty'; bibkey.tp_26 = 'YoneYama2015';
  temp.tp_26 = C2K(26.8);  units.temp.tp_26 = 'K'; label.temp.tp_26 = 'temperature';
  comment.tp_26 = 'Both sexes; temps range 26-28; ad libitum food; 100% individuals mature at 90 days. 29/67 individuals mature at 90 days';
data.am = 4*365.5;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Fishbase';   
  temp.am = C2K(18.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.33475;   units.Lb = 'cm'; label.Lb = 'standard length at birth';bibkey.Lb = 'Fuku1983';
  comment.Lb = 'Guessed SL of larvae at day 2 (functional mouth / onset feeding) given SL at day 1 and day 5';
data.Lj = 3.44;   units.Lj = 'cm';   label.Lj = 'standard length at metamorphosis';bibkey.Lj = 'TakaWata2004';
  comment.Lj = 'Range 2.64-4.70 cm, mean 3.44. Metam defined as: "fish with guanine deposition on the peritoneal surface but not on the trunk surface correspond to the end of the metamorphosing stage" for anchovy in Pacific around 35N 150E';
data.Lp = 6.5;   units.Lp = 'cm'; label.Lp = 'standard length at puberty';bibkey.Lp = 'FunaAoki2004';
  comment.Lp = 'Guessed value, given 50% of females mature in Sagami Bay at 6 cm SL, 8.53cm In Wakasa Bay where food availability for large anchovy (copepods) was considered "low", and 7.38cm in Osaka Bay where food density was considered higher.';
data.Li = 18;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'FukuTaka1988';
  comment.Wwb = 'based on egg length of 1.21 mm, width 0.63 mm: pi/6*0.121*0.063^2';
data.Wwi = 45; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = ';From Fishbase. Changed from 620g, which was calculated based on Li and LW data: 63*(18/8.4)^3';
  
data.Ri = 600;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(18.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Engraulis encrasicolus'; 
  
% uni-variate data

% embryo   
data.Tah = [ ... % temperature (°C), development time (days) until hatching
29 20.5/24;
24 31/24;
17 52/24];
data.Tah(:,1) = C2K(data.Tah(:,1)); % convert C to K
units.Tah = {'K', 'd'};  label.Tah = {'temperature', 'age at hatching'};  
bibkey.Tah = {'Fuku1983'};

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
0.795	0.0222
0.856	0.022
0.932	0.034
1.039	0.0337
1.1	    0.0336
1.131	0.0213
1.207	0.0211
1.299	0.0208
1.345	0.0329
1.375	0.0328
1.498	0.0325
1.559	0.0323
1.742	0.0318
1.834	0.0316
1.941	0.0435
2.017	0.0677
2.078	0.0431
2.078	0.0919
2.185	0.0672
2.216	0.0671
2.292	0.0547
2.338	0.1278
2.399	0.091
2.399	0.152
2.46	0.0909
2.537	0.2614
2.552	0.0662
2.552	0.176
2.567	0.115
2.628	0.066
2.644	0.2001
2.735	0.1145
2.751	0.212
2.812	0.1875
2.843	0.2484
2.919	0.1872
2.995	0.2235
3.026	0.2722
3.057	0.2478
3.148	0.3085
3.164	0.2597
3.194	0.3206
3.332	0.4665
3.378	0.381
3.454	0.3686
3.485	0.3564
3.561	0.4659
3.592	0.3805
3.73	0.5386
3.73	0.624
3.79	0.4409
3.791	0.5263
3.791	0.6116
3.821	0.4652
3.836	0.2701
3.929	0.8918
3.974	0.5868
4.035	0.6963
4.097	0.7084
4.142	0.5009
4.143	0.818
4.219	0.9641
4.495	0.9878
4.525	1.1462
4.586	0.7924
4.648	1.1459
4.663	1.3654
4.709	1.2311
4.723	0.5359
4.724	1.2798
4.849	2.3161
4.877	1.1331
4.877	1.2063
4.924	1.7671
4.924	1.9012
5.062	1.7423
5.076	1.596
5.107	1.4251
5.183	1.5957
5.249	3.8272
5.263	2.9491
5.276	1.8393
5.306	1.5466
5.398	1.7292
5.413	1.5463
5.461	2.9486
5.475	1.9973
5.52	1.9606
5.536	2.0825
5.551	1.7532
5.566	1.9605
5.566	2.0215
5.69	2.4723
5.692	3.5577
5.719	1.9113
5.765	1.8624
5.781	2.277
5.796	2.0574
5.812	2.3988
5.815	3.8257
5.827	2.35
5.827	2.3988
5.857	2.3012
5.888	2.4352
5.892	4.1059
5.933	2.0571
5.95	2.7399
5.964	2.2887
5.995	2.4227
5.995	2.4715
6.025	2.3007
6.026	2.6056
6.061	4.7152
6.071	2.1786
6.118	2.5809
6.133	2.5931
6.133	2.7638
6.146	1.7638
6.168	4.5564
6.194	2.6905
6.214	4.7514
6.227	3.5684
6.23	5.0075
6.24	2.605
6.301	2.7756
6.316	2.3975
6.377	2.5437
6.378	2.6046
6.44	3.324
6.454	2.7873
6.454	2.8483
6.473	4.3117
6.516	2.9823
6.531	2.7871
6.562	2.9822
6.562	3.348
6.576	2.6163
6.577	3.1773
6.607	2.8479
6.609	3.5186
6.67	3.4209
6.674	5.4209
6.684	3.2257
6.7	    3.4452
6.716	3.6037
6.73	2.9939
6.747	3.7134
6.747	3.8841
6.762	3.6036
6.791	3.0181
6.797	5.6889
6.809	4.1157
6.822	3.4449
6.853	3.457
6.885	3.9081
6.916	4.1154
6.916	4.3105
6.917	4.8349
6.931	4.0056
6.958	2.7372
6.96	3.225
6.98	5.5786
6.992	4.1152
7.039	4.5175
7.041	5.4565
7.052	3.7857
7.114	3.7856
7.115	4.3953
7.129	3.8587
7.129	3.9075
7.144	3.9074
7.181	6.7854
7.236	3.9925
7.266	3.6632
7.282	4.1022
7.303	6.6875
7.343	4.0532
7.406	4.5775
7.406	4.6506
7.406	4.8823
7.464	3.5529
7.527	4.1015
7.527	4.1503
7.528	4.6381
7.559	5.0648
7.574	4.6258
7.68	4.2474
7.68	4.3938
7.835	5.3446
7.957	5.3442
8.357	6.3554
8.372	6.2821];
units.LW = {'cm', 'g'}; label.LW = {'standard length', 'weight'};  
bibkey.LW = 'FukuTaka1988';

%L-Ww Wakasa Bay
data.LWw = [ ... % Standard length (cm), (total) wet weight (g)
    6.330054446	6.608553456	6.850764692	7.110987523	7.375158089	7.610028576	7.652229658	7.900159657	8.162842716	8.118978691	8.359281145	8.408204235	8.621610575	8.672168136	8.87424445	8.953674266	9.124463709	9.139324585	9.166427718	9.389780858	9.378958469	9.419665739	9.555705333	9.65642753	9.649705011	9.66878242	9.847382998	9.896355816	9.921577053	9.893309657	10.06395758	10.16083118	10.24486215	10.3392132	10.43337202	10.42117464	10.60317286	10.59948481	10.69949489	10.83987153	10.84567659	10.91948098	10.94787089	11.00021965	11.08040337	11.09596667	11.18438396	11.19921627	11.2276084	11.25669511	11.42415332	11.40010755	11.47504878	11.45019075	11.54413953	11.70842311	11.67608218	11.6297869	11.76926955	11.94777425	11.97822302	12.03701818	12.06015531	12.07574464	12.11215711	12.21769006	12.30685921	12.34175415	12.3760853	12.39459411	12.47920382	12.58135411	12.56594261	12.50565568	12.63047959	12.67806343	12.66149222	12.78008594	12.88103217	12.90946841	12.92888317	13.09066702	13.1516525	13.1611397	13.17689	13.18076634	13.41017854	13.32744968	13.43356401	13.59547994	13.56068641	13.69288273	13.88929801	13.93017928	13.83694684	14.09587402	14.35219798	14.46525522	14.46972862;
	2.301296183	2.534298923	2.798773597	3.14606915	3.494929098	4.485441046	3.796075017	4.473653334	5.19504918	4.327812668	6.400085826	4.998394437	6.596732062	5.34634384	7.19653322	5.416189448	8.049238725	6.506388287	5.686841179	8.546326473	7.102061533	6.382488252	9.88101275	10.89853612	8.237344661	6.76451336	9.882752494	11.42578287	8.214568919	7.074263448	10.15275321	8.604945133	7.797013653	10.45162625	11.99853974	8.862366229	10.59623667	9.420333559	12.20578991	13.63329326	10.41200623	15.751568	12.46702887	11.02070901	14.45220462	18.15920572	15.84904094	12.59692451	11.30751465	17.59286019	14.33596653	15.21380743	12.80257255	11.74202519	17.20751633	14.42403527	13.2424202	11.83236897	18.17971513	15.45273162	14.14115434	18.89208972	17.10371317	12.11057043	20.29479277	16.07914101	18.34626409	16.97467112	20.40384223	21.74828277	15.60481911	18.95375293	17.68394146	16.69274118	22.57115421	20.22573593	21.5364377	18.31007914	23.25665693	20.08879379	21.63648874	15.19086298	22.7239434	19.85973097	21.57776378	18.68989175	24.33535156	20.38982973	22.21482863	27.53184881	25.9885216	24.41273768	27.12735508	25.36140644	24.19655998	27.58626519	28.76107169	32.81220132	29.47951981
    ]';
units.LWw = {'cm','g'};      label.LWw = {'standard length', 'wet weight'};
bibkey.LWw = 'FunaAoki2004';
comment.LWw = 'Data from Wakasaka Bay. Both sexes. Temperatures during year of sampling in paper.';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL = 5 * weights.tL;
%weights.tLj = 5 * weights.tLj;
% weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Added data.Lb, data.Tp_20, data.Tp_26, data.LWw and changed Lp to 6 cm as part of DEB School 2021';
D2 = 'The data in this entry may be biased towards the Japanese populations of E. japonicus. Uncertain if parameters are the same for other areas e.g. Yellow Sea';
D3 = 'The original value for Lp (>10cm) seemed larger than what studies have observed around Japan (8.53, 7.57 and 6 cm respectively). The 8.53 cm Lp was observed at "low" food levels, where differences in temperature and daylight were accounted for. I therefore assumed that for Sagami Bay (where Lp = 6cm) f = 1 ';
D4 = 'Changed the max wet weight Wwi to 45g, the value in Fishbase and more realistic than the previous >600g value that was calculated';
D5 = 'The original LW data from FukuTaka1988 was in units of mg. LW data in mydata file was over-converted by a factor of 10. New range is 0-6 g (instead of 0-60 g)';
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
