--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-30 19:08:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16587)
-- Name: festivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festivo (
    id integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    nombre character varying(100) NOT NULL,
    idtipo integer NOT NULL,
    diaspascua integer NOT NULL
);


ALTER TABLE public.festivo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16586)
-- Name: festivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.festivo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.festivo_id_seq OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 217
-- Name: festivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.festivo_id_seq OWNED BY public.festivo.id;


--
-- TOC entry 216 (class 1259 OID 16580)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id integer NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16579)
-- Name: tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_id_seq OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;


--
-- TOC entry 4694 (class 2604 OID 16590)
-- Name: festivo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivo ALTER COLUMN id SET DEFAULT nextval('public.festivo_id_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 16583)
-- Name: tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);


--
-- TOC entry 4846 (class 0 OID 16587)
-- Dependencies: 218
-- Data for Name: festivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.festivo (id, dia, mes, nombre, idtipo, diaspascua) FROM stdin;
1	1	1	Año nuevo	1	0
2	6	1	Santos Reyes	2	0
3	19	3	San José	2	0
4	0	0	Jueves Santo	3	-3
5	0	0	Viernes Santo	3	-2
6	0	0	Domingo de Pascua	3	0
7	1	5	Día del Trabajo	1	0
8	0	0	Ascensión del Señor	4	40
9	0	0	Corpus Christi	4	61
10	0	0	Sagrado Corazón de Jesús	4	68
11	29	6	San Pedro y San Pablo	2	0
12	20	7	Independencia Colombia	1	0
13	7	8	Batalla de Boyacá	1	0
14	15	8	Asunción de la Virgen	2	0
15	12	10	Día de la Raza	2	0
16	1	11	Todos los santos	2	0
17	11	11	Independencia de Cartagena	2	0
18	8	12	Inmaculada Concepción	1	0
19	25	12	Navidad	1	0
\.


--
-- TOC entry 4844 (class 0 OID 16580)
-- Dependencies: 216
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo (id, tipo) FROM stdin;
1	Fijo
2	Ley Puente Festivo
3	Basado en Pascua
4	Basado en Pascua y Ley Puente Festivo
\.


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 217
-- Name: festivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.festivo_id_seq', 19, true);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_seq', 4, true);


--
-- TOC entry 4698 (class 2606 OID 16592)
-- Name: festivo festivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivo
    ADD CONSTRAINT festivo_pkey PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 16585)
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 4699 (class 2606 OID 16593)
-- Name: festivo fkfestivo_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivo
    ADD CONSTRAINT fkfestivo_tipo FOREIGN KEY (idtipo) REFERENCES public.tipo(id);


-- Completed on 2024-04-30 19:08:44

--
-- PostgreSQL database dump complete
--

