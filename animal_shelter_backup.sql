--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animal; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE animal (
    id integer NOT NULL,
    animal_name character varying,
    gender character varying,
    date timestamp without time zone,
    animal_type character varying,
    animal_breed character varying,
    customer_id integer
);


ALTER TABLE animal OWNER TO "Guest";

--
-- Name: animal_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animal_id_seq OWNER TO "Guest";

--
-- Name: animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE animal_id_seq OWNED BY animal.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE customers (
    id integer NOT NULL,
    customer_name character varying,
    phone character varying,
    animal_type_preference character varying,
    breed_preference character varying
);


ALTER TABLE customers OWNER TO "Guest";

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO "Guest";

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: animal id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY animal ALTER COLUMN id SET DEFAULT nextval('animal_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY animal (id, animal_name, gender, date, animal_type, animal_breed, customer_id) FROM stdin;
\.


--
-- Name: animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('animal_id_seq', 100, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY customers (id, customer_name, phone, animal_type_preference, breed_preference) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('customers_id_seq', 1, false);


--
-- Name: animal animal_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

