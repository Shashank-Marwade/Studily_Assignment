--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
-- Name: demo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo (
    id integer NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    hint text DEFAULT ''::text NOT NULL
);


--
-- Name: demo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student (
    enr_no integer NOT NULL,
    std_name text,
    section text,
    opt_sub1 text,
    opt_sub2 text
);


--
-- Name: subject_; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subject_ (
    sub_code integer NOT NULL,
    sub_name text,
    opt text
);


--
-- Name: subject_allot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subject_allot (
    sub_code integer NOT NULL,
    teacher_id integer NOT NULL,
    section text
);


--
-- Name: teacher; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teacher (
    teacher_id integer NOT NULL,
    teacher_name text
);


--
-- Name: demo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (enr_no);


--
-- Name: subject_ subject__pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_
    ADD CONSTRAINT subject__pkey PRIMARY KEY (sub_code);


--
-- Name: subject_allot subject_allot_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_allot
    ADD CONSTRAINT subject_allot_pkey PRIMARY KEY (sub_code, teacher_id);


--
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id);


--
-- PostgreSQL database dump complete
--

