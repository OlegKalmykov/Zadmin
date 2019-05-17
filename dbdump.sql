--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: backpacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backpacks (
    player_id bigint,
    item_id integer,
    count integer
);


ALTER TABLE public.backpacks OWNER TO postgres;

--
-- Name: chatids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chatids (
    player_id bigint,
    chat_id integer,
    getting_time timestamp with time zone
);


ALTER TABLE public.chatids OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    item_id integer NOT NULL,
    item_name character varying(50),
    item_info character varying(50)
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: mining_loot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mining_loot (
    player_id bigint,
    mining_location_id integer,
    item_id integer,
    item_count integer
);


ALTER TABLE public.mining_loot OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    first_name character varying(50),
    location integer,
    mileage bigint,
    current_health integer,
    health_edge integer,
    killed_zombies integer,
    money integer DEFAULT 80,
    last_activity timestamp with time zone DEFAULT now(),
    is_mining boolean DEFAULT false,
    is_selling boolean DEFAULT false
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: quests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quests (
    player_id bigint,
    quest_line_id integer,
    quest_progress_number integer DEFAULT 0,
    getting_time timestamp with time zone
);


ALTER TABLE public.quests OWNER TO postgres;

--
-- Name: trade_lots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trade_lots (
    lot_id integer NOT NULL,
    player_id bigint,
    item_id integer,
    count integer,
    price integer,
    create_date timestamp with time zone DEFAULT now()
);


ALTER TABLE public.trade_lots OWNER TO postgres;

--
-- Name: trade_lots_lot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trade_lots_lot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trade_lots_lot_id_seq OWNER TO postgres;

--
-- Name: trade_lots_lot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trade_lots_lot_id_seq OWNED BY public.trade_lots.lot_id;


--
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    player_id bigint,
    weapon_id integer,
    weapon_uid character varying(255),
    weapon_name character varying(255),
    is_in_hand boolean
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: lot_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trade_lots ALTER COLUMN lot_id SET DEFAULT nextval('public.trade_lots_lot_id_seq'::regclass);


--
-- Data for Name: backpacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backpacks (player_id, item_id, count) FROM stdin;
403337353	2	41
403337353	6	3
403337353	1	108
31603947	4	3
271658230	1	2
664222943	4	5
31603947	2	3
664222943	7	5
664222943	2	8
664222943	1	683
96553356	4	178
96553356	7	582
31603947	1	8
475023449	4	88
96553356	2	156
96553356	1	1271
475023449	2	88
475023449	3	11
475023449	1	391
356670096	4	1
430556710	4	1
430556710	2	1
430556710	1	4
339983184	4	6
356670096	1	5
437130459	4	1
339983184	2	6
339983184	1	104
437130459	2	4
437130459	1	120
135382980	4	1
128097972	4	2
107568319	4	5
189275039	4	2
189275039	2	2
189275039	1	4
277766759	4	2
277766759	2	2
128097972	2	2
128097972	1	5
161590582	1	3
187570958	4	87
277766759	1	4
187570958	2	87
282004798	4	2
282004798	2	2
187570958	1	296
409281473	4	1
282004798	3	1
409281473	1	1
658707813	4	14
282004798	1	17
383416354	4	124
383416354	7	98
383416354	2	118
383416354	3	101
658707813	7	2096
658707813	2	1
658707813	1	4214
230379668	4	1
132567753	2	4
383416354	6	1
383416354	1	960
547283172	1	1
132567753	1	3
162744706	4	24
162744706	2	24
162744706	3	5
162744706	1	159
17506490	4	6
17506490	2	6
17506490	1	135
399183866	7	6
399183866	2	9
399183866	6	1
399183866	1	112
261618085	4	5
261618085	2	5
261618085	1	131
38956395	1	5
276373573	4	2
276373573	2	2
276373573	1	4
297550845	4	7
297550845	2	6
297550845	1	115
392269987	4	164
392269987	7	392
392269987	2	164
392269987	3	21
392269987	1	1315
573707058	4	4
271658230	4	1
573707058	2	4
573707058	1	8
403337353	4	3
403337353	7	249
271658230	2	1
\.


--
-- Data for Name: chatids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chatids (player_id, chat_id, getting_time) FROM stdin;
96553356	96553356	2018-09-16 17:11:35.53193+00
475023449	475023449	2018-09-16 17:12:57.732804+00
658707813	658707813	2018-09-16 17:17:36.109459+00
383416354	383416354	2018-09-16 17:43:04.491608+00
392269987	392269987	2018-09-17 05:46:27.865696+00
187570958	187570958	2018-09-18 17:16:03.072934+00
395227351	395227351	2018-09-19 09:22:32.499238+00
282004798	282004798	2018-09-19 10:43:22.884454+00
93212972	93212972	2018-09-20 09:06:48.344813+00
5025344	5025344	2018-09-20 10:46:17.782476+00
356670096	356670096	2018-09-21 13:29:55.356854+00
128097972	128097972	2018-09-22 11:54:02.998274+00
255690323	255690323	2018-09-22 11:54:52.860984+00
339983184	339983184	2018-09-22 12:08:23.02916+00
664222943	664222943	2018-09-24 11:12:10.951451+00
17506490	17506490	2018-09-24 11:39:59.832678+00
162744706	162744706	2018-09-24 12:02:59.330551+00
189275039	189275039	2018-09-24 12:03:54.313363+00
206817108	206817108	2018-09-24 19:25:43.068075+00
277766759	277766759	2018-09-25 09:22:26.537438+00
573707058	573707058	2018-09-27 05:25:30.384589+00
304365907	304365907	2018-10-01 10:28:35.783497+00
414965789	414965789	2018-10-22 11:24:34.006492+00
31603947	31603947	2018-10-27 18:15:29.578734+00
708124875	708124875	2018-10-27 18:15:37.748975+00
467572418	467572418	2018-11-09 22:01:43.427607+00
38956395	38956395	2018-11-10 16:48:42.362719+00
506007034	506007034	2018-11-20 09:55:03.326825+00
271658230	271658230	2018-11-23 16:44:08.797568+00
707945993	707945993	2019-01-31 17:09:48.593466+00
74318273	74318273	2019-01-31 17:29:40.381209+00
383767922	383767922	2019-01-31 17:43:36.894827+00
276373573	276373573	2019-01-31 18:57:16.429904+00
363844048	363844048	2019-01-31 19:00:56.590084+00
135382980	135382980	2019-02-02 02:05:57.789853+00
261618085	261618085	2019-02-21 14:30:44.67561+00
430556710	430556710	2019-03-12 17:06:59.603444+00
152670644	152670644	2018-09-16 17:00:21.69978+00
289461808	289461808	2018-09-16 17:00:21.724527+00
161590582	161590582	2018-09-16 17:00:21.768875+00
116907085	116907085	2018-09-16 17:00:21.78513+00
190786909	190786909	2019-04-03 20:45:16.703873+00
156957031	156957031	2019-04-03 20:49:37.920625+00
236308920	236308920	2019-04-03 21:00:36.932033+00
70481833	70481833	2019-04-03 21:14:30.929262+00
18813623	18813623	2019-04-03 21:15:08.029992+00
175512400	175512400	2019-04-03 22:10:38.375025+00
314827706	314827706	2019-04-03 22:36:31.372711+00
403337353	403337353	2019-04-03 22:42:46.961988+00
243974934	243974934	2019-04-04 03:51:55.582775+00
297550845	297550845	2019-04-04 05:21:17.450835+00
208515219	208515219	2019-04-04 05:47:05.062614+00
409281473	409281473	2019-04-04 06:32:11.557968+00
512283902	512283902	2019-04-04 06:34:52.787227+00
88236917	88236917	2019-04-04 06:35:11.25984+00
547283172	547283172	2019-04-04 06:42:39.66463+00
133519017	133519017	2019-04-04 06:48:48.912904+00
222231701	222231701	2019-04-04 06:53:56.508392+00
399183866	399183866	2019-04-04 07:14:32.24011+00
145354793	145354793	2019-04-04 08:15:42.104586+00
286348605	286348605	2019-04-04 08:42:03.913669+00
437130459	437130459	2019-04-04 08:55:09.348078+00
360293374	360293374	2019-04-04 09:03:51.46907+00
379530162	379530162	2019-04-04 09:38:32.320758+00
126784923	126784923	2019-04-04 10:02:57.74353+00
289678169	289678169	2019-04-04 10:03:56.984001+00
679430405	679430405	2019-04-04 10:07:25.778822+00
115126425	115126425	2019-04-04 10:09:26.755896+00
251422500	251422500	2019-04-04 11:15:36.152513+00
230379668	230379668	2019-04-04 12:16:49.281948+00
200170745	200170745	2019-04-04 13:42:14.852039+00
107568319	107568319	2019-04-04 13:50:01.54692+00
368064120	368064120	2019-04-04 16:03:22.569408+00
443029895	443029895	2019-04-05 10:48:55.275102+00
132567753	132567753	2019-04-05 11:53:16.935376+00
293010686	293010686	2019-04-05 16:12:46.762449+00
462941662	462941662	2019-04-10 16:44:37.560546+00
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (item_id, item_name, item_info) FROM stdin;
\.


--
-- Data for Name: mining_loot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mining_loot (player_id, mining_location_id, item_id, item_count) FROM stdin;
392269987	25	7	0
403337353	25	7	242
658707813	25	7	374
664222943	25	7	0
383416354	25	7	1
96553356	25	7	7
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, user_id, first_name, location, mileage, current_health, health_edge, killed_zombies, money, last_activity, is_mining, is_selling) FROM stdin;
43	430556710	LIDIYA	0	12	8	10	4	86	2019-03-13 09:33:05.007761+00	f	f
12	289461808	Андрей	0	1	5	10	0	80	2019-03-12 16:05:13.616354+00	f	f
22	17506490	Kate	0	74	7	10	37	85	2019-03-16 19:25:09.127192+00	f	f
3	282004798	Oleg	0	53	8	10	13	84	2019-04-04 07:49:55.30691+00	f	f
44	70481833	Tim	0	0	10	10	0	80	2019-04-03 21:17:35.05737+00	f	f
41	261618085	Sergey	0	18	10	10	7	80	2019-03-31 14:18:36.821808+00	f	f
28	304365907	Alexey	0	0	8	10	0	80	2019-03-12 16:05:13.616354+00	f	f
48	243974934	Анатолий	0	0	10	10	0	80	2019-04-04 03:54:03.555064+00	f	f
2	383416354	Lena	0	497	5	10	90	2045	2019-04-10 19:20:27.020087+00	f	f
46	314827706	Vladislav	0	0	10	10	0	80	2019-04-03 22:37:49.66934+00	f	f
65	289678169	Boris	0	0	10	10	0	80	2019-04-04 10:04:47.611143+00	f	f
67	679430405	Сергей Щудляк	0	0	10	10	0	80	2019-04-04 10:09:49.291295+00	f	f
55	547283172	Павел	0	2	5	10	1	12	2019-04-04 07:36:26.884299+00	f	f
51	208515219	fl	0	0	10	10	0	80	2019-04-04 05:48:59.926758+00	f	f
5	187570958	Alexandr	0	314	8	10	138	444	2019-04-07 07:27:58.331109+00	f	f
21	93212972	Боброний	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
52	409281473	Amidamaru	0	10	5	10	7	27	2019-04-04 18:24:40.300638+00	f	f
29	414965789	Anton	0	2	5	10	1	80	2019-03-25 17:00:20.020395+00	f	f
15	658707813	BelkaVolf	0	68	5	10	34	1054	2019-04-07 08:38:22.573906+00	f	t
30	708124875	Koraline	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
53	88236917	Илья	0	0	10	10	0	80	2019-04-04 13:03:19.79525+00	f	f
38	363844048	Aleksei	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
32	38956395	Anatoly	0	2	10	10	1	80	2019-03-12 16:05:13.616354+00	f	f
57	222231701	Артём	0	0	10	10	0	80	2019-04-04 06:54:30.874467+00	f	f
17	116907085	Санёк	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
35	707945993	Viktor	0	7	5	10	1	80	2019-03-12 16:05:13.616354+00	f	f
37	276373573	Nikita	0	12	10	10	6	18	2019-03-15 20:09:44.348779+00	f	f
49	156957031	Alexander	0	0	10	10	0	80	2019-04-04 05:33:57.371068+00	f	f
13	392269987	Тема	0	490	17	10	145	379	2019-03-28 07:03:21.407335+00	f	f
27	573707058	Aleksei	0	72	5	10	37	80	2019-03-12 16:05:13.616354+00	f	f
34	271658230	Alexander	0	1	5	10	1	80	2019-03-15 20:08:05.891241+00	f	f
4	664222943	Jhareg	0	240	10	10	53	587	2019-04-08 07:30:49.284586+00	f	f
39	383767922	Vaska	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
11	152670644	Olga	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
1	96553356	Nikolay	3	1081	7	10	224	880737	2019-04-10 09:06:18.905655+00	f	t
8	356670096	irina	0	27	6	10	4	80	2019-03-12 16:05:13.616354+00	f	f
63	379530162	Максм	0	0	10	10	0	80	2019-04-04 09:44:43.942923+00	f	f
61	437130459	Artur	0	17	10	10	4	39	2019-04-05 12:44:33.079865+00	f	f
36	74318273	Albert	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
69	230379668	Rodion	0	13	2	10	4	19	2019-04-05 09:46:25.903148+00	f	f
73	132567753	Пирожков	0	45	10	10	9	27	2019-04-05 17:09:51.410866+00	f	f
23	162744706	Alex	0	117	10	10	35	80	2019-03-15 20:09:02.864559+00	f	f
71	107568319	Иван	0	22	7	10	9	99	2019-04-05 15:00:05.940622+00	f	f
59	145354793	Yury	0	0	10	10	0	80	2019-04-05 06:07:33.166054+00	f	f
26	277766759	Oleg	0	1	5	10	1	80	2019-03-12 16:05:13.616354+00	f	f
10	255690323	Dmitriy	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
25	206817108	Nikolai	0	10	5	10	1	80	2019-03-12 16:05:13.616354+00	f	f
16	31603947	𝕍𝕆𝕍𝔸ℕ	0	19	10	10	7	89	2019-03-23 14:07:12.004786+00	f	f
18	475023449	deberton91	0	237	10	10	118	28	2019-03-23 16:34:42.317378+00	f	f
47	403337353	Николай	25	117	10	10	52	399	2019-04-11 08:12:06.95052+00	t	f
62	360293374	MaXXaM	0	1	5	10	0	10	2019-04-04 09:07:44.864794+00	f	f
74	293010686	Alexandr	0	5	10	10	0	80	2019-04-05 16:38:06.401263+00	f	f
7	339983184	Anna	0	62	5	10	28	80	2019-04-04 18:23:19.011001+00	f	f
64	126784923	Boris	0	1	5	10	0	80	2019-04-04 10:06:48.929556+00	f	f
9	128097972	Daria	0	25	5	10	4	80	2019-03-16 19:27:52.901943+00	f	f
19	161590582	Aleksey	0	4	2	10	2	80	2019-03-12 16:05:13.616354+00	f	f
70	200170745	Kseniya	0	2	8	10	1	82	2019-04-04 15:02:45.660759+00	f	f
31	467572418	Artur	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
45	18813623	↙️👾🤖🙉🎲🙊🕺🤙🏻🤾🏼‍♂️🚴🏻	0	0	10	10	0	80	2019-04-03 21:17:35.204346+00	f	f
60	286348605	Yuriy	0	0	10	10	0	80	2019-04-04 08:44:31.459447+00	f	f
58	399183866	Vitaliy	0	109	5	10	18	561	2019-04-06 15:00:24.709483+00	f	f
50	297550845	Андрей	0	31	10	10	8	97	2019-04-05 06:21:20.25864+00	f	f
66	115126425	Виктор	0	7	5	10	4	86	2019-04-05 13:06:57.100555+00	f	f
33	506007034	Andrey	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
40	135382980	Aqwarion	0	8	5	10	2	12	2019-03-31 14:19:16.390408+00	f	f
24	189275039	Iola	0	6	5	10	2	80	2019-03-12 16:05:13.616354+00	f	f
68	251422500	Danil	0	0	10	10	0	80	2019-04-04 11:20:03.931251+00	f	f
20	395227351	Mikhail	0	0	10	10	0	80	2019-03-12 16:05:13.616354+00	f	f
56	133519017	Ондреич	0	0	10	10	0	80	2019-04-04 06:49:23.008011+00	f	f
72	443029895	L	0	0	10	10	0	80	2019-04-05 10:53:49.236019+00	f	f
54	512283902	Юрчик	0	3	5	10	1	11	2019-04-04 06:41:52.58286+00	f	f
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 74, true);


--
-- Data for Name: quests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quests (player_id, quest_line_id, quest_progress_number, getting_time) FROM stdin;
414965789	1	1	2018-10-22 11:26:35.81627+00
162744706	1	12	2018-09-25 14:02:07.014506+00
467572418	1	0	2018-11-09 22:01:50.622174+00
38956395	1	1	2018-11-10 16:51:09.27096+00
356670096	1	11	2018-09-22 21:31:11.236778+00
506007034	1	1	2018-11-20 09:55:59.434731+00
475023449	1	10	2018-09-13 21:33:01.560817+00
116907085	1	0	2018-11-20 11:20:26.536771+00
189275039	1	0	2018-11-20 11:20:38.045299+00
116907085	1	0	2018-11-20 11:20:52.136888+00
161590582	1	0	2018-11-20 11:21:04.112863+00
395227351	1	0	2018-11-20 11:21:13.58167+00
93212972	1	0	2018-11-20 11:21:26.580082+00
573707058	1	12	2018-09-27 11:47:16.32168+00
339983184	1	10	2018-09-24 09:19:19.406539+00
243974934	1	0	2019-04-04 03:53:56.016624+00
277766759	1	0	2018-11-20 11:21:44.587581+00
152670644	1	0	2018-11-20 11:21:53.48681+00
255690323	1	0	2018-11-20 11:22:00.964483+00
289461808	1	0	2018-11-20 11:22:09.317911+00
708124875	1	0	2018-11-20 11:22:17.027417+00
271658230	1	1	2018-11-24 16:01:40.300695+00
707945993	1	1	2019-01-31 17:11:50.048411+00
74318273	1	1	2019-01-31 17:37:10.324095+00
156957031	1	2	2019-04-04 05:32:52.829746+00
392269987	1	10	2018-09-18 11:09:56.135708+00
128097972	1	2	2018-09-22 11:56:50.692445+00
304365907	1	1	2018-10-02 07:33:45.763538+00
658707813	1	12	2018-10-14 06:01:39.832683+00
208515219	1	1	2019-04-04 05:47:23.231154+00
261618085	1	10	2019-02-23 16:59:47.286173+00
206817108	1	6	2018-09-24 19:38:21.169184+00
282004798	1	2	2019-03-12 10:55:02.848931+00
512283902	1	1	2019-04-04 06:37:16.718721+00
88236917	1	1	2019-04-04 06:38:34.648781+00
430556710	1	4	2019-03-13 09:33:04.966829+00
547283172	1	1	2019-04-04 06:44:26.860129+00
437130459	1	10	2019-04-05 12:44:10.558074+00
222231701	1	1	2019-04-04 06:54:30.932022+00
96553356	1	13	2019-03-14 16:26:39.202838+00
276373573	1	3	2019-03-15 16:11:27.380887+00
17506490	1	12	2019-03-16 19:19:42.797482+00
187570958	1	12	2019-03-17 15:37:43.056885+00
145354793	1	1	2019-04-04 08:16:13.411333+00
31603947	1	6	2019-03-23 14:07:12.067207+00
360293374	1	1	2019-04-04 09:05:36.033772+00
379530162	1	1	2019-04-04 09:42:14.312819+00
126784923	1	1	2019-04-04 10:03:41.125869+00
664222943	1	10	2019-03-28 07:30:45.143851+00
383416354	1	13	2019-03-28 10:04:50.295183+00
135382980	1	2	2019-03-31 12:16:20.889737+00
18813623	1	1	2019-04-03 21:15:40.930331+00
679430405	1	2	2019-04-04 10:08:11.786681+00
115126425	1	1	2019-04-04 10:10:04.792964+00
251422500	1	1	2019-04-04 11:17:59.955957+00
230379668	1	1	2019-04-04 12:18:19.505366+00
200170745	1	1	2019-04-04 13:49:08.524415+00
403337353	1	13	2019-04-05 15:23:39.213421+00
107568319	1	8	2019-04-04 16:32:32.095378+00
293010686	1	4	2019-04-05 16:37:24.392398+00
132567753	1	12	2019-04-05 17:09:43.553503+00
409281473	1	2	2019-04-04 17:36:49.650918+00
297550845	1	12	2019-04-05 02:27:18.68644+00
399183866	1	13	2019-04-05 18:01:22.234655+00
\.


--
-- Data for Name: trade_lots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trade_lots (lot_id, player_id, item_id, count, price, create_date) FROM stdin;
35	96553356	1	20	30	2019-04-10 09:06:00.671584+00
11	135382980	4	0	0	2019-03-31 12:13:03.932797+00
17	658707813	7	100	55	2019-03-31 13:56:04.831465+00
22	132567753	4	0	0	2019-04-05 14:31:42.437934+00
27	383416354	4	1	300	2019-04-05 17:43:08.024768+00
28	399183866	6	1	100000	2019-04-05 19:21:32.499595+00
33	403337353	7	100	50	2019-04-07 08:31:33.77436+00
\.


--
-- Name: trade_lots_lot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trade_lots_lot_id_seq', 35, true);


--
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapons (player_id, weapon_id, weapon_uid, weapon_name, is_in_hand) FROM stdin;
31603947	2	7e29e1cd-7627-4f88-9446-c56b7bda8eff	Чугунная сковородка	t
107568319	7	af80ede5-a3b5-4e37-ab1e-9e3ee96a913c	Автомат АК47	f
475023449	1	301c448f-6711-48a6-b2ff-8a7c889270f3	Бейсбольная бита	f
475023449	5	745941a1-a004-486a-b181-53c52d09c67d	Маленький нож	f
293010686	1	b2b7f0a3-3556-41bd-95ea-d93da650e298	Бейсбольная бита	f
430556710	2	a41d7e8d-3562-49d5-95a9-983eb5eae18a	Чугунная сковородка	f
107568319	7	f6f0a226-d7d3-480f-b325-bda51601037b	Автомат АК47	f
339983184	2	d559895b-91c7-4ea3-a122-b02917e67311	Чугунная сковородка	t
187570958	2	453b68ca-f7fb-4762-a33c-2afb3cdce101	Чугунная сковородка	t
409281473	5	a136fd27-2afb-4dd6-b8de-1bd2827874fd	Маленький нож	t
658707813	6	b426bf9c-2ef8-4329-9b5e-d77e0992821b	Столовый нож	t
658707813	6	fa6ca684-f4c9-49f9-b753-9629f1af27ee	Столовый нож	f
658707813	6	f1d582f4-a7c9-48f7-adec-b1a326bc1206	Столовый нож	f
658707813	5	e00304f0-e57a-42a5-a4d1-1efa467556ea	Маленький нож	f
658707813	6	d4f13cd0-6a10-43d3-ad03-37ada425877d	Столовый нож	f
658707813	6	c0b6edeb-7f46-4381-9d38-99c27c1b29ae	Столовый нож	f
96553356	7	5f98fcb8-6b98-4d43-a0f2-0dadd42f07ec	Автомат АК47	f
96553356	6	90df8a34-4012-4379-ad11-087e54b637b7	Столовый нож	f
96553356	3	ebb60cc9-b210-497e-ae19-1eb63e709ca0	Армейский нож	t
96553356	6	9cde4a27-2501-4438-9015-010132973383	Столовый нож	f
96553356	3	2200f491-7fee-4c36-80e2-72873c155808	Армейский нож	f
96553356	7	6113a0a6-1227-4b68-97f2-a183a7412f75	Автомат АК47	f
107568319	2	b8b716d5-66a4-4615-a99d-4b327fd858f7	Чугунная сковородка	t
96553356	6	336e20ba-13ff-4015-a508-ea4feec3185c	Столовый нож	f
17506490	2	4d5dfd8a-078e-4d28-8862-bb6574080c4b	Чугунная сковородка	t
664222943	2	78a13877-77fb-44ab-a84f-04b1ef230b9b	Чугунная сковородка	t
356670096	2	e6b616ee-1045-477f-a642-0f33f6bab151	Чугунная сковородка	t
437130459	2	a22bdd26-b479-4522-98f0-7f9c7fabf264	Чугунная сковородка	t
261618085	2	00151874-1a8c-46c6-b3c8-1426277fdeaa	Чугунная сковородка	t
399183866	3	d9f313ab-e3f3-4932-96a7-492868664dd9	Армейский нож	f
383416354	1	829cee78-48ef-4f9b-a690-a1d28a15c4a6	Бейсбольная бита	t
230379668	5	87595a75-0127-4029-9d7c-bea11dc39078	Маленький нож	t
132567753	5	6018d018-2b4d-45eb-81b8-61d78424bc0c	Маленький нож	f
276373573	5	b45835a0-187c-4c6a-865a-26102d8984d2	Маленький нож	t
392269987	2	d11bf6ca-e297-4208-9768-de27ec0de303	Чугунная сковородка	t
475023449	2	011a8fa2-1cf7-4378-be6b-6707cd6ee265	Чугунная сковородка	t
392269987	1	1956a645-bdae-4872-905d-6eb9bcb36f5e	Бейсбольная бита	f
96553356	5	73603ada-3239-4f30-b70d-671a01217209	Маленький нож	f
96553356	10	10638bd7-3f14-4999-a115-34655e8781d0	Лопата	f
96553356	10	dd621f1f-9df5-40a0-92ca-e75920636e66	Лопата	f
96553356	5	795a2855-1435-4b91-8364-555d928513eb	Маленький нож	f
96553356	4	869ac766-ddc0-4ca2-8314-00f085e3b4e0	Охотничий нож	f
96553356	4	b3aac4d9-7ee1-4db3-b565-4342e6a80404	Охотничий нож	f
96553356	8	074b5860-d85a-4963-9da2-78f21f386c4e	Винтовка M16	f
547283172	5	0e519265-26c5-4e2d-81f9-7da3dc5c6c57	Маленький нож	f
573707058	2	58e5e4ec-a347-4f0e-a7fa-b38c28596a15	Чугунная сковородка	t
403337353	3	b6321819-93da-44c9-9acf-c64d4412d55b	Армейский нож	t
206817108	2	96667cc5-8435-4233-a2ca-57a52adcdd55	Чугунная сковородка	t
360293374	5	3a6204e3-9d89-4c87-83aa-171a75fb308e	Маленький нож	f
31603947	1	cf78d41c-384d-46df-b1a5-466e33730478	Бейсбольная бита	f
132567753	7	e6c99212-040c-44c4-a9ca-1d47ed53231a	Автомат АК47	f
162744706	2	36e9e338-6f0d-4b1f-bb48-a919dffda06e	Чугунная сковородка	t
297550845	2	703acc57-b43c-4e14-9396-0832618ad45f	Чугунная сковородка	t
135382980	5	1c176e0e-51fe-4b0d-be5b-a5e20d99b878	Маленький нож	f
282004798	7	4204cb02-5b6c-4e60-8b65-44ba40fcd313	Автомат АК47	f
282004798	2	d74f44eb-e528-406d-a716-b9088d4f033a	Чугунная сковородка	f
512283902	5	611f8e2c-6297-4f1e-b03a-adea31deb193	Маленький нож	t
383416354	2	e7b7436a-545e-4739-b132-e0da53bcd80f	Чугунная сковородка	f
383416354	10	9c66ba45-dc95-4166-8330-de18ba82a8ab	Лопата	f
383416354	10	bc7fbb45-6ca6-42a9-9c2a-f95bc86a8ead	Лопата	f
383416354	6	111fb537-6d8e-4232-800e-1e70d4d407eb	Столовый нож	f
383416354	2	ec95c967-d70c-4c4e-b121-c120d9e54f73	Чугунная сковородка	f
383416354	10	613c5186-9a19-4451-9f5a-0a5e1a18a572	Лопата	f
132567753	7	4b4f1f4f-c4fb-4017-bcf0-4aaf39067d34	Автомат АК47	f
132567753	2	54529f9b-9943-4372-801e-2d37e49fd0e4	Чугунная сковородка	t
399183866	2	5f960322-0d0c-4c82-9f7e-25d772a0a2d8	Чугунная сковородка	t
96553356	10	599f8c89-13b1-456e-a16f-c2f83b6c5761	Лопата	f
96553356	2	e0ca2a4a-5808-42e0-9d90-660f46a30606	Чугунная сковородка	f
282004798	7	3be78bb7-21a7-48a7-a9cb-0cef0e7f7bff	Автомат АК47	f
282004798	1	020fa321-38ea-477e-b715-77ef91afa798	Бейсбольная бита	t
\.


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

