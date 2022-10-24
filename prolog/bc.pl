:-dynamic facto/2, ultimo_facto/1.


ultimo_facto(380).
ultima_regra(13).

regra 1
	se [avalia(community(R,>,1))]
	entao [avalia(batteryPeriod(B_Act, <, B_Max))]

regra 2
	se [avalia(community(R,>,1))]
	entao [avalia(batteryPeriod(B_Act, >, B_Max))]

regra 3
	se [avalia(community(R,<=,1))]
	entao [avalia(participant(R,>,1))] #tem q se ver para todos os partici+antes?? (participants with surplus)

regra 4
	se [avalia(batteryPeriod(B_Act, <, B_Max))]
	entao [avalia(scarcity)]

regra 5
	se [avalia(batteryPeriod(B_Act, >, B_Max))]
	entao [avalia(participant(R,>,1))] #para todos os participantes

regra 6
	se [avalia(batteryPeriod(B_Act, >, B_Max))]
	entao [avalia(participant(R,<=,1))] #para todos os participantes


regra 7
	se [avalia(participant(R,>,1))]
	entao [cria_facto(sell(local, (P-C do participant), Valor do mercado))] #para todos os participantes

regra 8
	se [avalia(participant(R,<=,1))]
	entao [avaliar external market] #para todos os participantes

regra 9
	se [avalia(scarcity)]
	entao [charge battery] 

regra 10
	se [avalia(not scarcity)]
	entao [avalia(expensive hour)] 
regra 11
	se [avalia(expensive hour)]
	entao [avalia(avalia(participant(R,>,1))]  #para todos os participantes

regra 12
	se [avalia(expensive hour)]
	entao [avalia(avalia(participant(R,<=,1))]  #para todos os participantes

regra 13
	se [avalia(not expensive hour)]
	entao [avalia(charge battery)] 

facto (1, device(0,AC1,0.0)).
facto (2, device(0,AC2,0.0)).
facto (3, device(0,AC3,0.0)).
facto (4, device(0,AC4,0.0)).
facto (5, device(0,Water heater,0.0)).
facto (6, device(0,TV,0.0)).
facto (7, device(0,Microwave,0.0)).
facto (8, device(0,Kettle,0.0)).
facto (9, device(0,Lighting,0.0)).
facto (10, device(0,Refrigerator,0.0)).
facto (11, device(1,AC1,0.0)).
facto (12, device(1,AC2,0.0)).
facto (13, device(1,AC3,0.0)).
facto (14, device(1,AC4,0.0)).
facto (15, device(1,Water heater,0.0)).
facto (16, device(1,TV,0.0)).
facto (17, device(1,Microwave,0.0)).
facto (18, device(1,Kettle,0.0)).
facto (19, device(1,Lighting,0.0)).
facto (20, device(1,Refrigerator,0.0)).
facto (21, device(2,AC1,0.0)).
facto (22, device(2,AC2,0.0)).
facto (23, device(2,AC3,0.0)).
facto (24, device(2,AC4,0.0)).
facto (25, device(2,Water heater,0.0)).
facto (26, device(2,TV,0.0)).
facto (27, device(2,Microwave,0.0)).
facto (28, device(2,Kettle,0.0)).
facto (29, device(2,Lighting,0.0)).
facto (30, device(2,Refrigerator,0.0)).
facto (31, device(3,AC1,0.0)).
facto (32, device(3,AC2,0.0)).
facto (33, device(3,AC3,0.0)).
facto (34, device(3,AC4,0.0)).
facto (35, device(3,Water heater,0.0)).
facto (36, device(3,TV,0.0)).
facto (37, device(3,Microwave,0.0)).
facto (38, device(3,Kettle,0.0)).
facto (39, device(3,Lighting,0.0)).
facto (40, device(3,Refrigerator,0.14)).
facto (41, device(4,AC1,0.0)).
facto (42, device(4,AC2,0.0)).
facto (43, device(4,AC3,0.0)).
facto (44, device(4,AC4,0.0)).
facto (45, device(4,Water heater,0.0)).
facto (46, device(4,TV,0.0)).
facto (47, device(4,Microwave,0.0)).
facto (48, device(4,Kettle,0.0)).
facto (49, device(4,Lighting,0.0)).
facto (50, device(4,Refrigerator,0.0)).
facto (51, device(5,AC1,0.0)).
facto (52, device(5,AC2,0.0)).
facto (53, device(5,AC3,0.0)).
facto (54, device(5,AC4,0.0)).
facto (55, device(5,Water heater,0.0)).
facto (56, device(5,TV,0.0)).
facto (57, device(5,Microwave,0.0)).
facto (58, device(5,Kettle,0.0)).
facto (59, device(5,Lighting,0.0)).
facto (60, device(5,Refrigerator,0.14)).
facto (61, participant(1,0,0,2.964,consumer)).
facto (62, participant(2,0,1,2.322958983918477,prosumer)).
facto (63, participant(3,0,2,1.544607493639792,prosumer)).
facto (64, participant(4,0,3,0.7783099395084976,prosumer)).
facto (65, participant(5,0,4,1.962011826046124,prosumer)).
facto (66, participant(6,0,5,2.677445367083165,prosumer)).
facto (67, participant(7,0,6,0.237877330780441,prosumer)).
facto (68, participant(8,0,7,0.6891935986879821,prosumer)).
facto (69, participant(9,0,8,0.3585249549461553,prosumer)).
facto (70, participant(10,0,9,0.8146429049405036,prosumer)).
facto (71, participant(11,0,10,0.2326003794271399,prosumer)).
facto (72, participant(12,0,11,0.8077217791535207,prosumer)).
facto (73, participant(13,0,12,2.686247529003368,prosumer)).
facto (74, participant(14,0,13,1.036777596453748,prosumer)).
facto (75, participant(15,0,14,1.390459462250228,prosumer)).
facto (76, participant(16,0,15,2.093229121352714,prosumer)).
facto (77, participant(17,0,16,0.2553324348785181,prosumer)).
facto (78, participant(18,0,17,0.7573693819586466,prosumer)).
facto (79, participant(19,0,18,1.787318675458677,prosumer)).
facto (80, participant(20,0,19,0.7894036726985778,prosumer)).
facto (81, participant(21,0,20,0.2347489034825825,prosumer)).
facto (82, participant(22,0,21,1.279636657969713,prosumer)).
facto (83, participant(23,0,22,0.2178894463735212,prosumer)).
facto (84, participant(24,0,23,2.810089420873691,prosumer)).
facto (85, participant(25,0,24,1.201687619930011,prosumer)).
facto (86, participant(26,0,25,1.759957197743961,prosumer)).
facto (87, participant(27,0,26,2.025325035178291,prosumer)).
facto (88, participant(28,0,27,0.6372828712124737,prosumer)).
facto (89, participant(29,0,28,0.437127592748915,prosumer)).
facto (90, participant(30,0,29,0.5243452257568406,prosumer)).
facto (91, participant(31,0,30,3.130360169138259,prosumer)).
facto (92, participant(32,0,31,0.363297629583434,prosumer)).
facto (93, participant(33,0,32,0.6642706778823714,prosumer)).
facto (94, participant(34,0,33,2.557167958191306,prosumer)).
facto (95, participant(35,0,34,1.788410101620488,prosumer)).
facto (96, participant(36,0,35,0.8083375526126922,prosumer)).
facto (97, participant(37,0,36,1.231520726019236,prosumer)).
facto (98, participant(38,0,37,2.648362246305826,prosumer)).
facto (99, participant(39,0,38,1.059202226416187,prosumer)).
facto (100, participant(40,0,39,1.021860954123626,prosumer)).
facto (101, participant(41,0,40,0.26340107709899,prosumer)).
facto (102, participant(42,0,41,0.8988945657074416,prosumer)).
facto (103, participant(43,0,42,0.2038247900991002,prosumer)).
facto (104, participant(44,0,43,0.2216235395919069,prosumer)).
facto (105, participant(45,0,44,0.3195313727486728,prosumer)).
facto (106, participant(46,0,45,0.8309961974884607,prosumer)).
facto (107, participant(47,0,46,0.9249865744175978,prosumer)).
facto (108, participant(48,0,47,0.2191276373660727,prosumer)).
facto (109, participant(49,0,48,0.274880184816258,prosumer)).
facto (110, participant(50,0,49,0.9904884444694865,prosumer)).
facto (111, participant(0,0,0,2.964,consumer)).
facto (112, community(0,60.69866702915368,1225)).
facto (113, participant(1,1,0,2.584,consumer)).
facto (114, participant(2,1,1,2.371797342050958,prosumer)).
facto (115, participant(3,1,2,1.544607493639792,prosumer)).
facto (116, participant(4,1,3,0.7783099395084976,prosumer)).
facto (117, participant(5,1,4,1.962011826046124,prosumer)).
facto (118, participant(6,1,5,2.733736518422043,prosumer)).
facto (119, participant(7,1,6,0.1929291845719168,prosumer)).
facto (120, participant(8,1,7,0.5589669203484695,prosumer)).
facto (121, participant(9,1,8,0.3585249549461553,prosumer)).
facto (122, participant(10,1,9,0.6607119343899742,prosumer)).
facto (123, participant(11,1,10,0.1886493403417925,prosumer)).
facto (124, participant(12,1,11,0.6550985909493807,prosumer)).
facto (125, participant(13,1,12,2.686247529003368,prosumer)).
facto (126, participant(14,1,13,1.036777596453748,prosumer)).
facto (127, participant(15,1,14,1.390459462250228,prosumer)).
facto (128, participant(16,1,15,2.137237592526628,prosumer)).
facto (129, participant(17,1,16,0.2070860568943501,prosumer)).
facto (130, participant(18,1,17,0.7573693819586466,prosumer)).
facto (131, participant(19,1,18,1.824895623727337,prosumer)).
facto (132, participant(20,1,19,0.7894036726985778,prosumer)).
facto (133, participant(21,1,20,0.1903918897166729,prosumer)).
facto (134, participant(22,1,21,1.279636657969713,prosumer)).
facto (135, participant(23,1,22,0.1767181138183777,prosumer)).
facto (136, participant(24,1,23,2.869169307548841,prosumer)).
facto (137, participant(25,1,24,1.201687619930011,prosumer)).
facto (138, participant(26,1,25,1.796958892787352,prosumer)).
facto (139, participant(27,1,26,2.067905877150741,prosumer)).
facto (140, participant(28,1,27,0.6372828712124737,prosumer)).
facto (141, participant(29,1,28,0.3545300838303646,prosumer)).
facto (142, participant(30,1,29,0.4252674960978783,prosumer)).
facto (143, participant(31,1,30,3.196173492611643,prosumer)).
facto (144, participant(32,1,31,0.363297629583434,prosumer)).
facto (145, participant(33,1,32,0.5387533137286146,prosumer)).
facto (146, participant(34,1,33,2.610930373030154,prosumer)).
facto (147, participant(35,1,34,1.826009996252873,prosumer)).
facto (148, participant(36,1,35,0.8083375526126922,prosumer)).
facto (149, participant(37,1,36,1.231520726019236,prosumer)).
facto (150, participant(38,1,37,2.704041948248495,prosumer)).
facto (151, participant(39,1,38,1.059202226416187,prosumer)).
facto (152, participant(40,1,39,1.021860954123626,prosumer)).
facto (153, participant(41,1,40,0.2136300876310788,prosumer)).
facto (154, participant(42,1,41,0.9177931063305341,prosumer)).
facto (155, participant(43,1,42,0.1653110467497932,prosumer)).
facto (156, participant(44,1,43,0.1797466309005859,prosumer)).
facto (157, participant(45,1,44,0.3195313727486728,prosumer)).
facto (158, participant(46,1,45,0.8484672291255374,prosumer)).
facto (159, participant(47,1,46,0.944433678693602,prosumer)).
facto (160, participant(48,1,47,0.1777223422488612,prosumer)).
facto (161, participant(49,1,48,0.2229401588524086,prosumer)).
facto (162, participant(50,1,49,1.011312673270757,prosumer)).
facto (163, participant(0,1,0,2.584,consumer)).
facto (164, community(1,59.36338630996921,1225)).
facto (165, participant(1,2,0,3.071,consumer)).
facto (166, participant(2,2,1,2.415960995878566,prosumer)).
facto (167, participant(3,2,2,1.319879764032363,prosumer)).
facto (168, participant(4,2,3,0.6650722228996793,prosumer)).
facto (169, participant(5,2,4,1.67655518742056,prosumer)).
facto (170, participant(6,2,5,2.784639599859466,prosumer)).
facto (171, participant(7,2,6,0.3828687899096064,prosumer)).
facto (172, participant(8,2,7,1.109272238247306,prosumer)).
facto (173, participant(9,2,8,0.3771981296829343,prosumer)).
facto (174, participant(10,2,9,1.311185652704754,prosumer)).
facto (175, participant(11,2,10,0.3743754207750963,prosumer)).
facto (176, participant(12,2,11,1.300045948697733,prosumer)).
facto (177, participant(13,2,12,2.295420531955747,prosumer)).
facto (178, participant(14,2,13,1.090776429602381,prosumer)).
facto (179, participant(15,2,14,1.188159007701526,prosumer)).
facto (180, participant(16,2,15,2.177033665955936,prosumer)).
facto (181, participant(17,2,16,0.4109631634333507,prosumer)).
facto (182, participant(18,2,17,0.7968157039356594,prosumer)).
facto (183, participant(19,2,18,1.858875786015621,prosumer)).
facto (184, participant(20,2,19,0.8305184473182954,prosumer)).
facto (185, participant(21,2,20,0.3778335174440817,prosumer)).
facto (186, participant(22,2,21,1.346284400572302,prosumer)).
facto (187, participant(23,2,22,0.3506978508351559,prosumer)).
facto (188, participant(24,2,23,2.922594192476748,prosumer)).
facto (189, participant(25,2,24,1.264275516801366,prosumer)).
facto (190, participant(26,2,25,1.83041886387193,prosumer)).
facto (191, participant(27,2,26,2.106410971025073,prosumer)).
facto (192, participant(28,2,27,0.6704746874214568,prosumer)).
facto (193, participant(29,2,28,0.7035664639534345,prosumer)).
facto (194, participant(30,2,29,0.8439451603973845,prosumer)).
facto (195, participant(31,2,30,3.255687304014526,prosumer)).
facto (196, participant(32,2,31,0.3822193811242379,prosumer)).
facto (197, participant(33,2,32,1.069158249669452,prosumer)).
facto (198, participant(34,2,33,2.659546763274854,prosumer)).
facto (199, participant(35,2,34,1.860010908527499,prosumer)).
facto (200, participant(36,2,35,0.8504384668112699,prosumer)).
facto (201, participant(37,2,36,1.295662430499405,prosumer)).
facto (202, participant(38,2,37,2.754392106932168,prosumer)).
facto (203, participant(39,2,38,1.11436900904203,prosumer)).
facto (204, participant(40,2,39,1.075082878817565,prosumer)).
facto (205, participant(41,2,40,0.4239498203503016,prosumer)).
facto (206, participant(42,2,41,0.9348827186320207,prosumer)).
facto (207, participant(43,2,42,0.3280604775696371,prosumer)).
facto (208, participant(44,2,43,0.3567079559058765,prosumer)).
facto (209, participant(45,2,44,0.3361736317459996,prosumer)).
facto (210, participant(46,2,45,0.8642659705807275,prosumer)).
facto (211, participant(47,2,46,0.9620193472958324,prosumer)).
facto (212, participant(48,2,47,0.3526907464399612,prosumer)).
facto (213, participant(49,2,48,0.442425696410173,prosumer)).
facto (214, participant(50,2,49,1.03014365095251,prosumer)).
facto (215, participant(0,2,0,3.071,consumer)).
facto (216, community(2,65.27200582542154,1225)).
facto (217, participant(1,3,0,2.694,consumer)).
facto (218, participant(2,3,1,2.302537907218246,prosumer)).
facto (219, participant(3,3,2,1.319879764032363,prosumer)).
facto (220, participant(4,3,3,0.6650722228996793,prosumer)).
facto (221, participant(5,3,4,1.67655518742056,prosumer)).
facto (222, participant(6,3,5,2.653908009092603,prosumer)).
facto (223, participant(7,3,6,0.4420524308085737,prosumer)).
facto (224, participant(8,3,7,1.280742913156907,prosumer)).
facto (225, participant(9,3,8,0.3771981296829343,prosumer)).
facto (226, participant(10,3,9,1.513867988969032,prosumer)).
facto (227, participant(11,3,10,0.4322461614792008,prosumer)).
facto (228, participant(12,3,11,1.501006315819977,prosumer)).
facto (229, participant(13,3,12,2.295420531955747,prosumer)).
facto (230, participant(14,3,13,1.090776429602381,prosumer)).
facto (231, participant(15,3,14,1.188159007701526,prosumer)).
facto (232, participant(16,3,15,2.074827594363118,prosumer)).
facto (233, participant(17,3,16,0.4744896166944938,prosumer)).
facto (234, participant(18,3,17,0.7968157039356594,prosumer)).
facto (235, participant(19,3,18,1.771606399860195,prosumer)).
facto (236, participant(20,3,19,0.8305184473182954,prosumer)).
facto (237, participant(21,3,20,0.4362388087745233,prosumer)).
facto (238, participant(22,3,21,1.346284400572302,prosumer)).
facto (239, participant(23,3,22,0.4049085261758327,prosumer)).
facto (240, participant(24,3,23,2.785385992188365,prosumer)).
facto (241, participant(25,3,24,1.264275516801366,prosumer)).
facto (242, participant(26,3,25,1.744485456239672,prosumer)).
facto (243, participant(27,3,26,2.007520451381246,prosumer)).
facto (244, participant(28,3,27,0.6704746874214568,prosumer)).
facto (245, participant(29,3,28,0.8123233698401932,prosumer)).
facto (246, participant(30,3,29,0.9744017257475469,prosumer)).
facto (247, participant(31,3,30,3.10284124798818,prosumer)).
facto (248, participant(32,3,31,0.3822193811242379,prosumer)).
facto (249, participant(33,3,32,1.234428126923078,prosumer)).
facto (250, participant(34,3,33,2.534687956016877,prosumer)).
facto (251, participant(35,3,34,1.7726882313208,prosumer)).
facto (252, participant(36,3,35,0.8504384668112699,prosumer)).
facto (253, participant(37,3,36,1.295662430499405,prosumer)).
facto (254, participant(38,3,37,2.625080557332318,prosumer)).
facto (255, participant(39,3,38,1.11436900904203,prosumer)).
facto (256, participant(40,3,39,1.075082878817565,prosumer)).
facto (257, participant(41,3,40,0.4894837436892026,prosumer)).
facto (258, participant(42,3,41,0.8909924051446374,prosumer)).
facto (259, participant(43,3,42,0.3787718805602259,prosumer)).
facto (260, participant(44,3,43,0.4118476698875836,prosumer)).
facto (261, participant(45,3,44,0.3361736317459996,prosumer)).
facto (262, participant(46,3,45,0.823690929851799,prosumer)).
facto (263, participant(47,3,46,0.9168550396321654,prosumer)).
facto (264, participant(48,3,47,0.4072094824555543,prosumer)).
facto (265, participant(49,3,48,0.5108156102158848,prosumer)).
facto (266, participant(50,3,49,0.9817810843158069,prosumer)).
facto (267, participant(0,3,0,2.694,consumer)).
facto (268, community(3,64.65709946052861,1225)).
facto (269, participant(1,4,0,2.569,consumer)).
facto (270, participant(2,4,1,2.363063026112907,prosumer)).
facto (271, participant(3,4,2,0.9131542252358197,prosumer)).
facto (272, participant(4,4,3,0.4601279048118884,prosumer)).
facto (273, participant(5,4,4,1.159918876668661,prosumer)).
facto (274, participant(6,4,5,2.723669335185115,prosumer)).
facto (275, participant(7,4,6,0.1922418529380518,prosumer)).
facto (276, participant(8,4,7,0.556975538653201,prosumer)).
facto (277, participant(9,4,8,0.6684996555766854,prosumer)).
facto (278, participant(10,4,9,0.6583580747891782,prosumer)).
facto (279, participant(11,4,10,0.1879772561280309,prosumer)).
facto (280, participant(12,4,11,0.6527647295076348,prosumer)).
facto (281, participant(13,4,12,1.588078713355475,prosumer)).
facto (282, participant(14,4,13,1.933158226721051,prosumer)).
facto (283, participant(15,4,14,0.8220236779901448,prosumer)).
facto (284, participant(16,4,15,2.129367059898548,prosumer)).
facto (285, participant(17,4,16,0.2063482898315199,prosumer)).
facto (286, participant(18,4,17,1.41217832677706,prosumer)).
facto (287, participant(19,4,18,1.818175313079793,prosumer)).
facto (288, participant(20,4,19,1.47190893138589,prosumer)).
facto (289, participant(21,4,20,0.1897135974773522,prosumer)).
facto (290, participant(22,4,21,2.385989185172693,prosumer)).
facto (291, participant(23,4,22,0.1760885359233908,prosumer)).
facto (292, participant(24,4,23,2.858603383231623,prosumer)).
facto (293, participant(25,4,24,2.2406467079945,prosumer)).
facto (294, participant(26,4,25,1.790341461180096,prosumer)).
facto (295, participant(27,4,26,2.060290663598993,prosumer)).
facto (296, participant(28,4,27,1.188267020281592,prosumer)).
facto (297, participant(29,4,28,0.3532670310562905,prosumer)).
facto (298, participant(30,4,29,0.4237524334412295,prosumer)).
facto (299, participant(31,4,30,3.184403351637814,prosumer)).
facto (300, participant(32,4,31,0.6773987051607779,prosumer)).
facto (301, participant(33,4,32,0.5368339452505022,prosumer)).
facto (302, participant(34,4,33,2.601315432341091,prosumer)).
facto (303, participant(35,4,34,1.819285581847585,prosumer)).
facto (304, participant(36,4,35,1.507212728309082,prosumer)).
facto (305, participant(37,4,36,2.296273020390034,prosumer)).
facto (306, participant(38,4,37,2.694084117422476,prosumer)).
facto (307, participant(39,4,38,1.974970818005181,prosumer)).
facto (308, participant(40,4,39,1.905344904043011,prosumer)).
facto (309, participant(41,4,40,0.2128690067324061,prosumer)).
facto (310, participant(42,4,41,0.9144132665717444,prosumer)).
facto (311, participant(43,4,42,0.1647221077973451,prosumer)).
facto (312, participant(44,4,43,0.1791062635773489,prosumer)).
facto (313, participant(45,4,44,0.5957928721042962,prosumer)).
facto (314, participant(46,4,45,0.8453426869435917,prosumer)).
facto (315, participant(47,4,46,0.9409557330926038,prosumer)).
facto (316, participant(48,4,47,0.1770891866786282,prosumer)).
facto (317, participant(49,4,48,0.2221459097916553,prosumer)).
facto (318, participant(50,4,49,1.00758844091587,prosumer)).
facto (319, participant(0,4,0,2.569,consumer)).
facto (320, community(4,65.18009711261745,1225)).facto (321, device(0,AC,0.0)).
facto (322, device(0,Dish washer,0.0)).
facto (323, device(0,Washing Machine,0.0)).
facto (324, device(0,Dryer,0.0)).
facto (325, device(0,Water heater,0.0)).
facto (326, device(0,TV,0.0)).
facto (327, device(0,Microwave,0.0)).
facto (328, device(0,Kettle,0.0)).
facto (329, device(0,Lighting,0.0)).
facto (330, device(0,Refrigerator,0.0)).
facto (331, device(0,AC,0.0)).
facto (332, device(0,Dish washer,0.0)).
facto (333, device(0,Washing Machine,0.0)).
facto (334, device(0,Dryer,0.0)).
facto (335, device(0,Water heater,0.0)).
facto (336, device(0,TV,0.0)).
facto (337, device(0,Microwave,0.0)).
facto (338, device(0,Kettle,0.0)).
facto (339, device(0,Lighting,0.0)).
facto (340, device(0,Refrigerator,0.14)).
facto (341, device(0,AC,0.0)).
facto (342, device(0,Dish washer,0.0)).
facto (343, device(0,Washing Machine,0.0)).
facto (344, device(0,Dryer,0.0)).
facto (345, device(0,Water heater,0.0)).
facto (346, device(0,TV,0.0)).
facto (347, device(0,Microwave,0.0)).
facto (348, device(0,Kettle,0.0)).
facto (349, device(0,Lighting,0.0)).
facto (350, device(0,Refrigerator,0.0)).
facto (351, device(0,AC,0.0)).
facto (352, device(0,Dish washer,0.0)).
facto (353, device(0,Washing Machine,0.0)).
facto (354, device(0,Dryer,0.0)).
facto (355, device(0,Water heater,0.0)).
facto (356, device(0,TV,0.0)).
facto (357, device(0,Microwave,0.0)).
facto (358, device(0,Kettle,0.0)).
facto (359, device(0,Lighting,0.0)).
facto (360, device(0,Refrigerator,0.0)).
facto (361, device(0,AC,0.0)).
facto (362, device(0,Dish washer,0.0)).
facto (363, device(0,Washing Machine,0.0)).
facto (364, device(0,Dryer,0.0)).
facto (365, device(0,Water heater,0.0)).
facto (366, device(0,TV,0.0)).
facto (367, device(0,Microwave,0.0)).
facto (368, device(0,Kettle,0.0)).
facto (369, device(0,Lighting,0.0)).
facto (370, device(0,Refrigerator,0.14)).
facto (371, device(0,AC,0.0)).
facto (372, device(0,Dish washer,0.0)).
facto (373, device(0,Washing Machine,0.0)).
facto (374, device(0,Dryer,0.0)).
facto (375, device(0,Water heater,0.0)).
facto (376, device(0,TV,0.0)).
facto (377, device(0,Microwave,0.0)).
facto (378, device(0,Kettle,0.0)).
facto (379, device(0,Lighting,0.0)).
facto (380, device(0,Refrigerator,0.14)).
