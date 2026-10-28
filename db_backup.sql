--
-- PostgreSQL database dump
--

\restrict OuxQg3UgRefXSmNtU7ZQfzDVC4HKrpeROCnau09d9WixR570hxNfvy5l4Rtb2GS

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_details (
    admin_id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100),
    contact character varying(15),
    designation character varying(100) NOT NULL,
    date_of_join date DEFAULT CURRENT_DATE NOT NULL
);


--
-- Name: admin_details_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_details_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_details_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_details_admin_id_seq OWNED BY public.admin_details.admin_id;


--
-- Name: attendance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attendance (
    attendance_id integer NOT NULL,
    student_id integer NOT NULL,
    attendance_date date DEFAULT CURRENT_DATE NOT NULL,
    check_in_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) NOT NULL,
    CONSTRAINT attendance_status_check CHECK (((status)::text = ANY (ARRAY[('present'::character varying)::text, ('absent'::character varying)::text, ('late'::character varying)::text])))
);


--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attendance_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attendance_attendance_id_seq OWNED BY public.attendance.attendance_id;


--
-- Name: public_holidays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.public_holidays (
    holiday_id integer NOT NULL,
    holiday_name character varying(100) NOT NULL,
    holiday_date date NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: public_holidays_holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.public_holidays_holiday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_holidays_holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.public_holidays_holiday_id_seq OWNED BY public.public_holidays.holiday_id;


--
-- Name: student_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student_details (
    student_id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100),
    contact character varying(15),
    course character varying(100) NOT NULL,
    enrollment_date date DEFAULT CURRENT_DATE NOT NULL,
    duration integer NOT NULL
);


--
-- Name: student_details_student_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.student_details_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_details_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.student_details_student_id_seq OWNED BY public.student_details.student_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password_hash text NOT NULL,
    role character varying(20) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('admin'::character varying)::text, ('student'::character varying)::text])))
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: admin_details admin_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_details ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_details_admin_id_seq'::regclass);


--
-- Name: attendance attendance_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attendance ALTER COLUMN attendance_id SET DEFAULT nextval('public.attendance_attendance_id_seq'::regclass);


--
-- Name: public_holidays holiday_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_holidays ALTER COLUMN holiday_id SET DEFAULT nextval('public.public_holidays_holiday_id_seq'::regclass);


--
-- Name: student_details student_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_details ALTER COLUMN student_id SET DEFAULT nextval('public.student_details_student_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: admin_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_details (admin_id, user_id, first_name, last_name, contact, designation, date_of_join) FROM stdin;
1	5	Arun	Kumar	9876543212	System Administrator	2025-01-10
2	6	Meena	Devi	9876543213	HR Administrator	2025-03-15
3	1	Arun	Kumar	9876543212	System Administrator	2025-01-10
4	2	Meena	Devi	9876543213	HR Administrator	2025-03-15
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attendance (attendance_id, student_id, attendance_date, check_in_time, status) FROM stdin;
1	1	2026-10-26	2026-10-26 13:48:12.072227	present
2	2	2026-10-26	2026-10-26 13:48:12.072227	absent
3	1	2026-10-28	2026-10-28 11:51:13.0396	present
5	2	2026-10-24	2026-10-24 18:16:20.076466	present
6	2	2026-10-25	2026-10-25 10:07:38.234881	present
\.


--
-- Data for Name: public_holidays; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.public_holidays (holiday_id, holiday_name, holiday_date, description, created_at) FROM stdin;
1	New Year	2026-01-01	New Year's Day	2026-10-28 12:19:17.588321
2	Pongal	2026-01-15	Pongal festival	2026-10-28 12:19:17.588321
3	Thiruvalluvar Day	2026-01-16	Thiruvalluvar Day	2026-10-28 12:19:17.588321
4	Uzhavar Thirunal	2026-01-17	Farmers' festival	2026-10-28 12:19:17.588321
5	Republic Day	2026-01-26	Indian Republic Day	2026-10-28 12:19:17.588321
6	Maha Shivaratri	2026-02-15	Maha Shivaratri	2026-10-28 12:19:17.588321
7	Holi	2026-03-04	Holi festival	2026-10-28 12:19:17.588321
8	Ugadi	2026-03-19	Ugadi / Telugu and Kannada New Year	2026-10-28 12:19:17.588321
9	Eid al-Fitr	2026-03-20	Date may vary by local moon sighting	2026-10-28 12:19:17.588321
10	Good Friday	2026-04-03	Good Friday	2026-10-28 12:19:17.588321
11	Tamil New Year	2026-04-14	Tamil New Year	2026-10-28 12:19:17.588321
12	May Day	2026-05-01	Labour Day	2026-10-28 12:19:17.588321
13	Eid al-Adha	2026-05-27	Date may vary by local moon sighting	2026-10-28 12:19:17.588321
14	Muharram	2026-06-26	Date may vary by local moon sighting	2026-10-28 12:19:17.588321
15	Independence Day	2026-08-15	Indian Independence Day	2026-10-28 12:19:17.588321
16	Milad-un-Nabi	2026-08-26	Date may vary by local moon sighting	2026-10-28 12:19:17.588321
17	Krishna Janmashtami	2026-09-04	Krishna Janmashtami	2026-10-28 12:19:17.588321
18	Ganesh Chaturthi	2026-09-14	Ganesh Chaturthi	2026-10-28 12:19:17.588321
19	Gandhi Jayanti	2026-10-02	Gandhi Jayanti	2026-10-28 12:19:17.588321
20	Navaratri	2026-10-11	Navaratri	2026-10-28 12:19:17.588321
21	Ayudha Pooja	2026-10-20	Ayudha Pooja	2026-10-28 12:19:17.588321
22	Vijayadashami	2026-10-21	Vijayadashami	2026-10-28 12:19:17.588321
23	Deepavali	2026-11-08	Deepavali	2026-10-28 12:19:17.588321
24	Chhath Puja	2026-11-15	Chhath Puja	2026-10-28 12:19:17.588321
25	Christmas	2026-12-25	Christmas Day	2026-10-28 12:19:17.588321
\.


--
-- Data for Name: student_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.student_details (student_id, user_id, first_name, last_name, contact, course, enrollment_date, duration) FROM stdin;
1	3	Rahul	Kumar	9876543210	BCA	2026-06-15	3
2	4	Priya	Sharma	9876543211	BCA	2026-06-20	3
3	7	YourTestFirstName	YourTestLastName	9876543210	BCA	2026-10-27	3
4	1	Rahul	Kumar	9876543210	BCA	2026-06-15	3
5	2	Priya	Sharma	9876543211	BCA	2026-06-20	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, name, email, password_hash, role) FROM stdin;
1	Alice Smith	alice@example.com	$2b$10$ExRnLeDEjQ.S4zgmy5xHj.msY4kr3.1VXNoVTv99ThyZkSrfVwRe.	student
2	Aria	aria@example.com	$2b$10$ExRnLeDEjQ.S4zgmy5xHj.msY4kr3.1VXNoVTv99ThyZkSrfVwRe.	admin
3	Rahul Kumar	rahul.demo@example.com	$2b$10$ExRnLeDEjQ.S4zgmy5xHj.msY4kr3.1VXNoVTv99ThyZkSrfVwRe.	student
4	Priya Sharma	priya.demo@example.com	$2b$10$ExRnLeDEjQ.S4zgmy5xHj.msY4kr3.1VXNoVTv99ThyZkSrfVwRe.	student
5	Arun Kumar	arun.admin.demo@example.com	$2b$10$ExRnLeDEjQ.S4zgmy5xHj.msY4kr3.1VXNoVTv99ThyZkSrfVwRe.	admin
6	Meena Devi	meena.admin.demo@example.com	$2b$10$ExRnLeDEjQ.S4zgmy5xHj.msY4kr3.1VXNoVTv99ThyZkSrfVwRe.	admin
7	YourTestFirstName YourTestLastName	your-test-email@example.com	$2b$12$H/p8xYvOTFVQeHbOQvjnU.IKZcJFX6FklHEBjoKEPCyj7WOW9cnDC	student
8	Test Admin	admin@example.com	temporary_hash	admin
9	Test Student	student@example.com	temporary_hash	student
\.


--
-- Name: admin_details_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_details_admin_id_seq', 4, true);


--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attendance_attendance_id_seq', 6, true);


--
-- Name: public_holidays_holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.public_holidays_holiday_id_seq', 25, true);


--
-- Name: student_details_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.student_details_student_id_seq', 5, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


--
-- Name: admin_details admin_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_details
    ADD CONSTRAINT admin_details_pkey PRIMARY KEY (admin_id);


--
-- Name: admin_details admin_details_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_details
    ADD CONSTRAINT admin_details_user_id_key UNIQUE (user_id);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendance_id);


--
-- Name: public_holidays public_holidays_holiday_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_holidays
    ADD CONSTRAINT public_holidays_holiday_date_key UNIQUE (holiday_date);


--
-- Name: public_holidays public_holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_holidays
    ADD CONSTRAINT public_holidays_pkey PRIMARY KEY (holiday_id);


--
-- Name: student_details student_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_details
    ADD CONSTRAINT student_details_pkey PRIMARY KEY (student_id);


--
-- Name: student_details student_details_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_details
    ADD CONSTRAINT student_details_user_id_key UNIQUE (user_id);


--
-- Name: attendance unique_student_attendance_date; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT unique_student_attendance_date UNIQUE (student_id, attendance_date);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: attendance attendance_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(user_id);


--
-- Name: admin_details fk_admin_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_details
    ADD CONSTRAINT fk_admin_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: student_details fk_student_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_details
    ADD CONSTRAINT fk_student_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict OuxQg3UgRefXSmNtU7ZQfzDVC4HKrpeROCnau09d9WixR570hxNfvy5l4Rtb2GS

