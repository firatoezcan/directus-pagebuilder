--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--



--
-- Roles
--

ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md54ee9a320f612675f442e79d794dd16b3';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 12.5 (Debian 12.5-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 12.5 (Debian 12.5-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: buttons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buttons (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    text character varying(255) NOT NULL,
    direct_link character varying(255) NOT NULL,
    page uuid NOT NULL
);


ALTER TABLE public.buttons OWNER TO postgres;

--
-- Name: component_homepage_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_homepage_features (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone
);


ALTER TABLE public.component_homepage_features OWNER TO postgres;

--
-- Name: component_homepage_features_single; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_homepage_features_single (
    id uuid NOT NULL,
    sort integer DEFAULT 0,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    image uuid NOT NULL,
    headline character varying(255) NOT NULL,
    text text,
    component_feature uuid
);


ALTER TABLE public.component_homepage_features_single OWNER TO postgres;

--
-- Name: component_homepage_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_homepage_hero (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    headline character varying(255) NOT NULL,
    subline text NOT NULL,
    image_left uuid NOT NULL
);


ALTER TABLE public.component_homepage_hero OWNER TO postgres;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50) NOT NULL,
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64)
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    locked boolean DEFAULT false NOT NULL,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    "group" integer,
    translations json,
    note text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize integer DEFAULT 0 NOT NULL,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    "limit" integer
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    filters json,
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    many_primary character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_primary character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64)
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    module_list json,
    collection_list json,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(10),
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128) NOT NULL,
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(8) DEFAULT 'en-US'::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255)
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url text,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: page_meta_seo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_meta_seo (
    id uuid NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) NOT NULL,
    tags character varying(255) DEFAULT NULL::character varying,
    image uuid,
    description text NOT NULL
);


ALTER TABLE public.page_meta_seo OWNER TO postgres;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    slug character varying(255) NOT NULL,
    meta_seo uuid NOT NULL
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_components (
    id integer NOT NULL,
    pages_id uuid,
    collection character varying(255),
    item character varying(255),
    sort integer
);


ALTER TABLE public.pages_components OWNER TO postgres;

--
-- Name: pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_components_id_seq OWNER TO postgres;

--
-- Name: pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_components_id_seq OWNED BY public.pages_components.id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_components ALTER COLUMN id SET DEFAULT nextval('public.pages_components_id_seq'::regclass);


--
-- Data for Name: buttons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buttons (id, date_created, date_updated, text, direct_link, page) FROM stdin;
\.


--
-- Data for Name: component_homepage_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_homepage_features (id, date_created, date_updated) FROM stdin;
9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	2021-02-26 23:57:41.422+00	2021-02-27 00:38:30.381+00
\.


--
-- Data for Name: component_homepage_features_single; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_homepage_features_single (id, sort, date_created, date_updated, image, headline, text, component_feature) FROM stdin;
0de6097b-be71-4806-bd07-40355120ab26	0	2021-02-27 00:36:16.404+00	2021-02-27 00:38:30.385+00	4da79b14-1c41-4ce6-81cc-83efd0f19682	Nachhaltige Optionen	<p>Entdecke unsere <a href="/informationen/made-for-recycling/">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc
eec75cc9-bb77-4300-b2df-4a06a86470a8	1	2021-02-27 00:36:28.946+00	2021-02-27 00:38:30.393+00	206f6912-6bcb-47c3-9872-b129e45c2f97	Kleine Auflagen möglich	<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc
\.


--
-- Data for Name: component_homepage_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_homepage_hero (id, date_created, date_updated, headline, subline, image_left) FROM stdin;
417f36a0-942d-4aba-a2b2-ea4ebd9af82c	2021-02-26 23:22:12.814+00	\N	Bestell bei uns individuell bedruckte nachhaltige Verpackungen	<p>Hat dein Produkt schon die Verpackung, die es verdient? Finde den richtigen Pack Hero und mach dein Produkt zum Hingucker in jedem Warenregal. Individuell bedruckt bereits ab 500 St&uuml;ck.</p>	4d6194fb-a9f9-4ef8-9146-c734490dda40
6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9	2021-02-26 23:44:14.199+00	2021-02-26 23:44:44.013+00	Auch geile Headline	<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>	4d6194fb-a9f9-4ef8-9146-c734490dda40
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment) FROM stdin;
1	authenticate	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:40:37.357925+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_users	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N
2	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts	\N
3	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	1	\N
4	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	2	\N
5	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	3	\N
6	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	4	\N
7	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	5	\N
8	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.781773+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	6	\N
9	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.870418+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	1	\N
10	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:42:19.870418+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	2	\N
11	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:43:34.706012+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	7	\N
12	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:13.113832+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	8	\N
13	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:19.958137+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	9	\N
14	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.037427+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	languages	\N
15	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.04033+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_translations	\N
16	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.037427+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	10	\N
17	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.037427+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	11	\N
18	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.04033+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	12	\N
19	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.096635+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	13	\N
20	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.098969+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	14	\N
21	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.175525+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	3	\N
22	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:20.188569+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	4	\N
30	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.395884+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	1	\N
31	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.401581+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	2	\N
32	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.406394+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	3	\N
33	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.411888+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	4	\N
34	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.416831+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	5	\N
35	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.422529+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	6	\N
36	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.427253+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	7	\N
37	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.432239+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	9	\N
38	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:24.437145+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	8	\N
39	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.273987+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	1	\N
40	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.281726+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	2	\N
41	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.28853+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	3	\N
42	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.293791+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	4	\N
43	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.300582+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	5	\N
44	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.306842+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	6	\N
45	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.311432+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	7	\N
46	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.315864+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	8	\N
47	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:25.320535+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	9	\N
48	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:44.579234+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	15	\N
49	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:45:54.99518+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	16	\N
50	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:04.844239+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	12	\N
51	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:04.855924+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	13	\N
52	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:04.866729+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	14	\N
53	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:04.876996+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	16	\N
54	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:04.887767+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	15	\N
55	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:23.8266+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_translations	\N
56	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:48.918483+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
57	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:46:50.866699+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	2	\N
60	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:48:35.277762+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts	\N
61	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:49:47.06741+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	17	\N
62	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:49:49.402967+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts	\N
64	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.167289+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	1	\N
65	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.177656+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	2	\N
66	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.188414+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	17	\N
67	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.198595+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	3	\N
68	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.207533+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	4	\N
69	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.216704+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	5	\N
70	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.225772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	6	\N
71	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:07.235314+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	9	\N
72	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.277513+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	1	\N
73	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.284664+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	17	\N
74	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.293749+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	2	\N
75	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.304502+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	3	\N
76	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.313871+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	4	\N
77	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.324226+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	5	\N
78	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.333608+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	6	\N
79	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:08.344255+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	9	\N
80	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:12.071548+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	17	\N
81	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:13.499981+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	2	\N
82	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:33.499797+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts	\N
83	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:50:37.538848+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	17	\N
84	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:51:03.568109+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	2	\N
85	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:51:04.887774+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
86	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.237933+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	18	\N
87	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.329129+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_languages_2	\N
88	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.329129+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	19	\N
89	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.3924+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	20	\N
90	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.397465+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	21	\N
91	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.449931+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	5	\N
92	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:55:47.459934+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	6	\N
93	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:56:03.51253+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_languages_2	\N
94	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.114282+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	22	\N
95	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.17389+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_i18n	\N
96	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.17389+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	23	\N
97	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.222618+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	24	\N
98	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.227739+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	25	\N
99	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.282843+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	7	\N
100	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:58:39.286566+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	8	\N
101	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 19:59:17.104694+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	26	\N
102	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:01:39.666122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	27	\N
103	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:02:43.978075+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	22	\N
104	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:02:44.071091+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	8	\N
105	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:02:44.07706+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	7	\N
106	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:02:54.648593+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_translations	\N
108	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:04:08.556265+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	languages	\N
109	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:04:50.464278+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	languages	\N
110	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:05:53.647754+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	28	\N
111	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:05:53.743025+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	9	\N
112	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:05:53.757409+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	10	\N
113	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:21.747166+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	28	\N
114	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:21.843098+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_translations	\N
115	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:21.843098+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	29	\N
116	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:21.923632+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	31	\N
119	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:22.035827+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	9	\N
117	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:21.919667+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	30	\N
118	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:22.026592+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	10	\N
120	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:06:58.965722+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	32	\N
121	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:07:05.231512+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	33	\N
122	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:07:08.233664+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_i18n	\N
125	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:18.98405+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
126	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:21.718126+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
127	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:23.595327+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
128	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:27.28895+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
129	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:29.028293+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
131	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:42.318626+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
134	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:08:54.268162+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	1	\N
135	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:09:31.650386+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	1	\N
136	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:09:38.166357+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	2	\N
137	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:09:40.800382+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	3	\N
138	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:09:47.650394+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	4	\N
139	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:10:50.458682+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	4	\N
140	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:10:52.428612+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	4	\N
141	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:11:22.618333+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	1	\N
142	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:11:45.378177+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	1	\N
144	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 20:12:21.380954+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	1	\N
145	authenticate	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:31:14.731298+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_users	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N
146	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:31:58.440443+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_1	\N
147	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:31:58.440443+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	34	\N
148	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:31:58.440443+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	35	\N
149	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:31:58.440443+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	36	\N
150	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:33:50.536705+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	37	\N
151	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:34:33.639297+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	38	\N
152	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:34:45.053663+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	39	\N
153	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:35:35.317278+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	buttons	\N
154	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:35:35.317278+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	40	\N
155	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:35:35.317278+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	41	\N
156	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:35:35.317278+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	42	\N
157	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:35:54.418052+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	43	\N
158	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:36:59.759582+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	44	\N
159	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:37:54.3756+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	45	\N
160	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:37:54.438136+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	11	\N
161	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:38:20.311105+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_2	\N
162	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:38:20.311105+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	46	\N
163	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:38:20.311105+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	47	\N
164	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:38:20.311105+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	48	\N
165	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:40:02.99592+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_2_feature	\N
166	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:40:02.99592+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	49	\N
167	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:40:02.99592+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	50	\N
168	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:40:02.99592+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	51	\N
169	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:40:43.313292+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	52	\N
170	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:41:31.545525+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	53	\N
171	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:08.369331+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	54	\N
172	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:08.420908+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	12	\N
173	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages	\N
174	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	55	\N
175	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	56	\N
176	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	57	\N
177	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	58	\N
178	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	59	\N
179	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.132508+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	60	\N
180	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.216117+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	13	\N
181	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:42:25.216117+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	14	\N
182	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:04.858498+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	61	\N
183	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:04.915579+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
184	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:04.915579+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	62	\N
185	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:04.968959+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	63	\N
186	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:04.978902+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	64	\N
187	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:04.984951+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	65	\N
188	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:05.04136+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	15	\N
189	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:43:05.041648+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	16	\N
190	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.438808+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	66	\N
191	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.522083+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_2_feature_translations	\N
192	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.522083+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	67	\N
193	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.58635+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	68	\N
196	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.697909+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	18	\N
197	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:09.521914+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	70	\N
198	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:14.273061+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	71	\N
194	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.590014+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	69	\N
195	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:44:01.681935+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	17	\N
199	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:07.204361+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	buttons	\N
200	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:09.793652+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_1	\N
201	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:11.847769+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_2	\N
202	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:13.98067+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_2_feature	\N
203	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:16.296068+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	languages	\N
204	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:18.403259+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages	\N
205	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:20.369058+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts	\N
206	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:22.271808+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_2_feature_translations	\N
207	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:24.187244+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
208	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:28.174614+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	posts_translations	\N
209	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:30.491932+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
210	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:32.994365+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
211	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages	\N
212	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	72	\N
213	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	73	\N
214	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	74	\N
215	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	75	\N
216	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	76	\N
217	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.440082+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	77	\N
218	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.502461+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	19	\N
219	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:45:43.502461+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	20	\N
220	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:42.159424+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	78	\N
221	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:52.247329+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	73	\N
222	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:56.376182+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	78	\N
223	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.052874+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	72	\N
224	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.061228+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	73	\N
225	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.068922+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	78	\N
226	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.07755+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	74	\N
227	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.085122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	75	\N
228	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.09403+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	76	\N
229	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:46:58.102738+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	77	\N
230	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:51:09.17676+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_homepage_hero	\N
231	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:51:09.17676+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	79	\N
232	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:51:09.17676+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	80	\N
233	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:51:09.17676+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	81	\N
234	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:51:29.600685+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	82	\N
235	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:52:23.991096+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	83	\N
236	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:54:06.137292+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	84	\N
237	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:54:06.231744+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	21	\N
238	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:54:53.058395+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	buttons	\N
239	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:54:53.058395+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	85	\N
240	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:54:53.058395+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	86	\N
241	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:54:53.058395+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	87	\N
242	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:55:05.606866+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	88	\N
243	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:56:30.383438+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	89	\N
244	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:57:38.341912+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	90	\N
245	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:57:38.393774+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	22	\N
246	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.430772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	page_meta_seo	\N
247	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.430772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	91	\N
248	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.430772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	92	\N
249	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.430772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	93	\N
250	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.430772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	94	\N
251	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.430772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	95	\N
252	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.485525+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	23	\N
253	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:10.485525+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	24	\N
254	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 22:58:51.911224+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	96	\N
255	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:00:13.123659+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	97	\N
256	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:01:41.291406+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
257	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:01:58.858446+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	99	\N
258	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:01:58.947203+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	25	\N
259	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:02:20.743827+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
260	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:02:39.178318+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
261	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:09:17.946809+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
262	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:10:12.130288+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
263	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:10:52.914271+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
264	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:11:42.579783+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	99	\N
265	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:11:42.678581+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	25	\N
266	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:07.410018+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	100	\N
267	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.467107+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	91	\N
268	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.475772+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	92	\N
269	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.488491+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	93	\N
270	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.49712+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	94	\N
271	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.508285+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	95	\N
272	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.5172+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	100	\N
273	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.525656+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	96	\N
274	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.53344+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	97	\N
275	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.540947+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
276	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:11.548939+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	99	\N
277	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:13:52.13262+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
278	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:15:28.706888+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	101	\N
279	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:15:28.785459+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	26	\N
280	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.096539+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	102	\N
281	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.185713+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
282	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.185713+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	103	\N
283	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.235006+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	104	\N
284	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.242938+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	105	\N
285	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.257355+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	106	\N
286	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.350376+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	27	\N
287	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:16:05.359723+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	28	\N
288	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:18:19.309393+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	105	\N
289	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:18:20.997219+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	104	\N
290	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:18:23.818301+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	106	\N
291	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:07.723308+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_files	4d6194fb-a9f9-4ef8-9146-c734490dda40	\N
292	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:43.153675+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	page_meta_seo	9552db4f-b942-4b12-aeab-1c06f4d85841	\N
293	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:43.153675+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
294	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:48.035619+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	104	\N
295	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:49.153177+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	105	\N
296	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:50.602313+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	106	\N
297	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:21:30.292844+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	101	\N
298	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:21:30.360557+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	26	\N
299	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:12.812285+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_hero	417f36a0-942d-4aba-a2b2-ea4ebd9af82c	\N
301	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:12.812285+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
302	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:37.267178+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
303	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:38.144554+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
304	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:39.2031+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
305	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:39.900191+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
306	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:40.483279+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
307	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:41.007457+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
308	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:41.606768+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
309	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:42.245791+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
311	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:43.970953+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
310	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:22:43.117759+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	3	\N
312	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:34:10.854254+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	107	\N
313	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:34:18.406539+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	102	\N
314	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:34:18.490585+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	27	\N
315	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:34:18.493978+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	28	\N
317	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:44:14.190466+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_hero	6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9	\N
319	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:44:14.190466+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
321	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:44:43.996777+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_hero	6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9	\N
323	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:44:43.996777+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
326	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:45:13.624763+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
329	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:45:25.814393+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
330	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:47:28.857997+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
331	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:47:37.282441+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
332	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:48:27.095564+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_homepage_features	\N
333	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:48:27.095564+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	108	\N
334	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:48:27.095564+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	109	\N
335	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:48:27.095564+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	110	\N
336	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:14.448877+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_homepage_features_single	\N
337	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:14.448877+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	111	\N
338	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:14.448877+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	112	\N
339	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:14.448877+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	113	\N
340	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:14.448877+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	114	\N
341	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:35.999422+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	115	\N
342	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:36.056358+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	29	\N
343	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:49:50.187211+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	116	\N
344	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:38.584444+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	117	\N
345	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.119471+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	111	\N
346	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.124206+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	112	\N
347	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.130915+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	113	\N
348	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.139537+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	114	\N
349	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.147531+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	116	\N
350	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.154236+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	117	\N
351	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:50:46.161708+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	115	\N
352	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:51:59.779516+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	118	\N
353	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:51:59.874388+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	30	\N
354	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.022407+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	119	\N
355	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.080747+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	pages_components	\N
356	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.080747+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	120	\N
357	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.140706+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	121	\N
358	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.147914+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	122	\N
359	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.165968+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	123	\N
360	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.233162+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	31	\N
361	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:52:48.236424+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	32	\N
362	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:53:19.828806+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_collections	component_homepage_hero	\N
363	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:54:27.608205+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_files	206f6912-6bcb-47c3-9872-b129e45c2f97	\N
364	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:55:01.012178+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	1	\N
365	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:55:01.012178+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
366	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:56:10.472129+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	124	\N
367	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:56:10.558601+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	33	\N
368	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:08.118776+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_files	4da79b14-1c41-4ce6-81cc-83efd0f19682	\N
369	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:41.414038+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	1	\N
370	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:41.414038+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
371	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:41.414038+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
372	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:41.414038+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
373	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:41.414038+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	2	\N
374	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:57:41.414038+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
375	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:58:29.760538+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	125	\N
376	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:58:48.222986+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	125	\N
377	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:59:03.9679+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	125	\N
378	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:59:13.158058+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	119	\N
379	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:59:13.214392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	32	\N
380	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:59:13.224751+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	31	\N
381	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:59:59.545173+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	83	\N
382	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:39.659838+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	126	\N
383	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:45.882065+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	page_meta_seo	9552db4f-b942-4b12-aeab-1c06f4d85841	\N
384	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.414631+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	91	\N
385	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.423485+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	92	\N
386	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.435314+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	93	\N
387	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.445221+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	94	\N
388	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.452317+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	95	\N
389	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.457325+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	100	\N
390	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.462871+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	96	\N
391	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.468476+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	126	\N
392	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.472789+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	98	\N
393	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:52.477229+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	99	\N
394	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:54.28236+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	126	\N
395	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:03:15.57689+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	4	\N
396	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:03:19.016385+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	4	\N
397	authenticate	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:08:17.314801+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_users	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N
398	authenticate	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:08:37.459977+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_users	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N
399	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:09:51.128879+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	5	\N
400	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:11:06.233064+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	6	\N
401	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:11:21.928481+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	7	\N
402	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:11:23.307723+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	8	\N
403	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:11:24.383034+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	9	\N
404	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:11:25.641036+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	10	\N
405	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:11:28.283251+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	11	\N
406	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:25:55.852543+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	1	\N
407	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:25:55.852543+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
408	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:25:55.852543+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
409	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:25:55.852543+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
410	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:25:55.852543+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	2	\N
411	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:25:55.852543+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
412	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:23.477037+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	\N
413	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:26.277166+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	5	\N
414	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:31.518392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	1	\N
415	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:31.518392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
416	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:31.518392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
417	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:31.518392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
418	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:31.518392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	2	\N
419	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:31.518392+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
420	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:37.509487+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	6	\N
421	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:26:39.074518+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	5	\N
422	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.55122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	1	\N
423	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.55122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
424	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.55122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
425	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.55122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
426	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.55122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages_components	2	\N
427	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.55122+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	\N
428	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:13.409553+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
429	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:13.409553+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
430	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:13.409553+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
431	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:28:21.123712+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	127	\N
432	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:28:21.227408+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	34	\N
433	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:28:45.371927+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
434	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:28:45.371927+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
435	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:28:45.371927+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
436	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:31:56.034342+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	128	\N
437	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:31:56.141117+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	129	\N
438	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:31:56.200554+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
439	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:17.194838+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
440	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:17.194838+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	\N
441	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:17.194838+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
442	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:33.260042+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	128	\N
443	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:33.349908+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
444	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:37.494986+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	128	\N
445	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.310861+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	111	\N
446	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.318264+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	112	\N
447	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.32329+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	113	\N
448	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.327305+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	114	\N
449	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.331123+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	128	\N
450	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.334968+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	116	\N
451	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.340448+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	117	\N
452	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:32:39.346366+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	115	\N
453	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:15.339946+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	129	\N
454	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:15.432436+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
455	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:25.953554+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	129	\N
456	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:26.048622+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
457	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:48.344652+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	129	\N
458	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:48.43052+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
459	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:55.358074+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	129	\N
460	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:33:55.409421+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
465	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:34:26.396228+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	128	\N
466	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:34:26.484698+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_relations	35	\N
470	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:35:15.781303+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	8	\N
467	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:34:31.463303+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	\N
468	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:34:31.463303+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
469	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:34:31.463303+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
471	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:35:41.015471+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
472	delete	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:35:41.015471+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	\N
473	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:36:16.40273+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	\N
474	create	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:36:28.944362+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	\N
475	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:36:34.385621+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_presets	6	\N
476	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:36:42.469532+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	\N
477	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:36:42.469532+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	\N
478	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:36:42.469532+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
479	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:05.987852+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_permissions	8	\N
480	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:30.819905+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	\N
481	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:30.819905+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	\N
482	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:30.819905+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
483	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:39.670314+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	\N
484	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:39.670314+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	\N
485	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:37:39.670314+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
486	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:13.342608+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	112	\N
487	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:21.690907+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	\N
488	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:21.690907+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	\N
489	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:21.690907+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
490	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:30.380898+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	\N
491	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:30.380898+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	\N
492	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:38:30.380898+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	\N
493	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:39:40.134669+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	111	\N
494	update	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:39:44.585708+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	directus_fields	108	\N
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field) FROM stdin;
pages	\N	\N	\N	f	f	\N	status	t	archived	draft	\N
buttons	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N
page_meta_seo	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N
component_homepage_features	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N
component_homepage_features_single	\N	\N	\N	f	f	\N	\N	t	\N	\N	sort
pages_components	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N
component_homepage_hero	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, locked, readonly, hidden, sort, width, "group", translations, note) FROM stdin;
99	page_meta_seo	image	\N	image	\N	image	\N	f	f	f	10	full	\N	\N	If no image is provided a default image will be used
95	page_meta_seo	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	f	t	t	5	half	\N	\N	\N
72	pages	id	uuid	text-input	\N	\N	\N	f	t	t	1	full	\N	\N	\N
73	pages	status	\N	dropdown	{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]}	f	f	f	2	half	\N	\N	\N
78	pages	slug	\N	slug	{"iconLeft":"insert_link"}	raw	\N	f	f	f	3	half	\N	\N	This slug is used to connect this content to a specific url
74	pages	user_created	user-created	user	{"display":"both"}	user	\N	f	t	t	4	half	\N	\N	\N
75	pages	date_created	date-created	datetime	\N	datetime	{"relative":true}	f	t	t	5	half	\N	\N	\N
76	pages	user_updated	user-updated	user	{"display":"both"}	user	\N	f	t	t	6	half	\N	\N	\N
77	pages	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	f	t	t	7	half	\N	\N	\N
79	component_homepage_hero	id	uuid	text-input	\N	\N	\N	f	t	t	\N	full	\N	\N	\N
80	component_homepage_hero	date_created	date-created	datetime	\N	datetime	{"relative":true}	f	t	t	\N	half	\N	\N	\N
81	component_homepage_hero	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	f	t	t	\N	half	\N	\N	\N
82	component_homepage_hero	headline	\N	text-input	{"trim":true}	raw	\N	f	f	f	\N	full	\N	\N	\N
84	component_homepage_hero	image_left	\N	image	\N	image	\N	f	f	f	\N	full	\N	\N	\N
85	buttons	id	uuid	text-input	\N	\N	\N	f	t	t	\N	full	\N	\N	\N
86	buttons	date_created	date-created	datetime	\N	datetime	{"relative":true}	f	t	t	\N	half	\N	\N	\N
87	buttons	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	f	t	t	\N	half	\N	\N	\N
88	buttons	text	\N	text-input	{"trim":true}	raw	\N	f	f	f	\N	full	\N	\N	\N
89	buttons	direct_link	\N	text-input	{"trim":true,"placeholder":"/subpage/checkout"}	raw	\N	f	f	f	\N	full	\N	\N	Use this field in special cases where you can't use a page connection
90	buttons	page	\N	many-to-one	{"template":"{{slug}}"}	related-values	{"template":"{{slug}}"}	f	f	f	\N	full	\N	\N	\N
112	component_homepage_features_single	sort	\N	numeric	\N	\N	\N	f	f	t	2	full	\N	\N	\N
100	page_meta_seo	hint	alias,no-data	notice	{"text":"These fields are important for SEO reasons and as such should not change too often and also be relevant to the user","color":"info","icon":"article"}	\N	\N	f	t	f	6	full	\N	\N	\N
96	page_meta_seo	title	\N	text-input	{"trim":true}	raw	\N	f	f	f	7	full	\N	\N	\N
126	page_meta_seo	description	\N	textarea	{"trim":true}	raw	\N	f	f	f	8	full	\N	\N	\N
116	component_homepage_features_single	headline	\N	text-input	{"trim":true}	raw	\N	f	f	f	6	full	\N	\N	\N
117	component_homepage_features_single	text	\N	wysiwyg	{"toolbar":["italic","underline","link","code","bold","strikethrough"]}	raw	\N	f	f	f	7	full	\N	\N	\N
115	component_homepage_features_single	image	\N	image	\N	image	\N	f	f	f	8	full	\N	\N	\N
111	component_homepage_features_single	id	uuid	text-input	\N	\N	\N	f	t	f	1	full	\N	\N	\N
129	component_homepage_features	features	o2m	one-to-many	{"fields":["headline"],"sortField":"sort"}	related-values	{"template":"{{headline}}"}	f	f	f	\N	full	\N	\N	\N
101	pages	meta_seo	\N	many-to-one	{"template":"{{title}}"}	related-values	{"template":"{{title}}"}	f	f	f	\N	full	\N	\N	\N
128	component_homepage_features_single	component_feature	\N	many-to-one	{"template":"{{id}}"}	related-values	{"template":"{{id}}"}	f	f	t	5	full	\N	\N	\N
109	component_homepage_features	date_created	date-created	datetime	\N	datetime	{"relative":true}	f	t	t	\N	half	\N	\N	\N
110	component_homepage_features	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	f	t	t	\N	half	\N	\N	\N
108	component_homepage_features	id	uuid	text-input	\N	\N	\N	f	t	f	\N	full	\N	\N	\N
120	pages_components	id	\N	\N	\N	\N	\N	f	f	t	\N	full	\N	\N	\N
121	pages_components	pages_id	\N	\N	\N	\N	\N	f	f	t	\N	full	\N	\N	\N
122	pages_components	collection	\N	\N	\N	\N	\N	f	f	t	\N	full	\N	\N	\N
123	pages_components	item	\N	\N	\N	\N	\N	f	f	t	\N	full	\N	\N	\N
98	page_meta_seo	tags	csv	tags	{"presets":[],"allowCustom":true}	labels	{"showAsDot":true,"choices":[{"text":"xd","value":"aaaaaa","foreground":"#F2C94C","background":"#27AE60"}]}	f	f	f	9	full	\N	\N	Only add relevant tags and not too many
125	pages_components	sort	\N	numeric	\N	\N	\N	f	f	t	\N	full	\N	\N	\N
119	pages	components	m2a	m2a-builder	{"sortField":"sort"}	raw	\N	f	f	f	\N	full	\N	\N	\N
83	component_homepage_hero	subline	\N	wysiwyg	{"toolbar":["bold","italic","underline","link","code","strikethrough","removeformat"]}	raw	\N	f	f	f	\N	full	\N	\N	\N
91	page_meta_seo	id	uuid	text-input	\N	\N	\N	f	t	t	1	full	\N	\N	\N
92	page_meta_seo	user_created	user-created	user	{"display":"both"}	user	\N	f	t	t	2	half	\N	\N	\N
93	page_meta_seo	date_created	date-created	datetime	\N	datetime	{"relative":true}	f	t	t	3	half	\N	\N	\N
94	page_meta_seo	user_updated	user-updated	user	{"display":"both"}	user	\N	f	t	t	4	half	\N	\N	\N
113	component_homepage_features_single	date_created	date-created	datetime	\N	datetime	{"relative":true}	f	t	t	3	half	\N	\N	\N
114	component_homepage_features_single	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	f	t	t	4	half	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
4d6194fb-a9f9-4ef8-9146-c734490dda40	local	4d6194fb-a9f9-4ef8-9146-c734490dda40.png	packiro-main-front.png	Packiro Main Front	image/png	\N	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:07.723308+00	\N	2021-02-26 23:20:07.847+00	\N	375471	800	677	\N	\N	\N	\N	\N	{}
206f6912-6bcb-47c3-9872-b129e45c2f97	local	206f6912-6bcb-47c3-9872-b129e45c2f97.svg	pouch-500.svg	Pouch 500.svg	image/svg+xml	\N	\N	2021-02-26 23:54:27.608205+00	\N	2021-02-26 23:54:27.621+00	\N	3965	\N	\N	\N	\N	\N	\N	\N	\N
4da79b14-1c41-4ce6-81cc-83efd0f19682	local	4da79b14-1c41-4ce6-81cc-83efd0f19682.svg	two-leaves.svg	Two Leaves.svg	image/svg+xml	\N	\N	2021-02-26 23:57:08.118776+00	\N	2021-02-26 23:57:08.131+00	\N	974	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2021-02-26 19:40:18.599387+00
20201029A	Remove System Relations	2021-02-26 19:40:18.602728+00
20201029B	Remove System Collections	2021-02-26 19:40:18.605452+00
20201029C	Remove System Fields	2021-02-26 19:40:18.61378+00
20201105A	Add Cascade System Relations	2021-02-26 19:40:18.663302+00
20201105B	Change Webhook URL Type	2021-02-26 19:40:18.668587+00
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields, "limit") FROM stdin;
5	\N	pages	read	\N	\N	\N	*	\N
6	\N	page_meta_seo	read	\N	\N	\N	*	\N
7	\N	component_homepage_hero	read	\N	\N	\N	*	\N
9	\N	component_homepage_features	read	\N	\N	\N	*	\N
10	\N	buttons	read	\N	\N	\N	*	\N
11	\N	pages_components	read	\N	\N	\N	*	\N
8	\N	component_homepage_features_single	read	\N	\N	\N	date_created,date_updated,headline,id,image,sort,text	\N
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, filters, layout, layout_query, layout_options) FROM stdin;
3	\N	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N	directus_activity	\N	[{"key":"VOs-jgRTxWYEq_nbXcfPm","locked":true,"field":"action","operator":"eq","value":"create"}]	tabular	{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}}	{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}
4	\N	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N	component_homepage_features	\N	\N	tabular	{"tabular":{"fields":["features","id"]}}	{"tabular":{"widths":{"id":393}}}
5	\N	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N	pages	\N	[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}]	tabular	{"tabular":{"page":1}}	\N
6	\N	4c402a5f-5c17-4ebd-bff5-474463f54dbe	\N	component_homepage_features_single	\N	\N	tabular	{"tabular":{"page":1,"sort":null}}	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, many_primary, one_collection, one_field, one_primary, one_collection_field, one_allowed_collections, junction_field) FROM stdin;
21	component_homepage_hero	image_left	id	directus_files	\N	id	\N	\N	\N
22	buttons	page	id	pages	buttons	id	\N	\N	\N
23	page_meta_seo	user_created	id	directus_users	\N	id	\N	\N	\N
24	page_meta_seo	user_updated	id	directus_users	\N	id	\N	\N	\N
25	page_meta_seo	image	id	directus_files	\N	id	\N	\N	\N
26	pages	meta_seo	id	page_meta_seo	pages	id	\N	\N	\N
29	component_homepage_features_single	image	id	directus_files	\N	id	\N	\N	\N
32	pages_components	pages_id	id	pages	components	id	\N	\N	item
31	pages_components	item	id	\N	\N	\N	collection	component_homepage_features,component_homepage_hero	pages_id
35	component_homepage_features_single	component_feature	id	component_homepage_features	features	id	\N	\N	\N
19	pages	user_created	id	directus_users	\N	id	\N	\N	\N
20	pages	user_updated	id	directus_users	\N	id	\N	\N	\N
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_collections	posts	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"posts"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"posts"}	\N
2	3	directus_fields	1	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"posts","id":1}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"posts","id":1}	\N
3	4	directus_fields	2	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"field":"status","collection":"posts","id":2}	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"field":"status","collection":"posts","id":2}	\N
4	5	directus_fields	3	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"posts","id":3}	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"posts","id":3}	\N
5	6	directus_fields	4	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"posts","id":4}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"posts","id":4}	\N
6	7	directus_fields	5	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"posts","id":5}	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"posts","id":5}	\N
7	8	directus_fields	6	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"posts","id":6}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"posts","id":6}	\N
8	9	directus_relations	1	{"many_collection":"posts","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":1}	{"many_collection":"posts","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":1}	\N
9	10	directus_relations	2	{"many_collection":"posts","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":2}	{"many_collection":"posts","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":2}	\N
10	11	directus_fields	7	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"readonly":false,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"collection":"posts","field":"title","id":7}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"readonly":false,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"collection":"posts","field":"title","id":7}	\N
11	12	directus_fields	8	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"readonly":false,"special":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"collection":"posts","field":"content","id":8}	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"readonly":false,"special":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"collection":"posts","field":"content","id":8}	\N
12	13	directus_fields	9	{"hidden":false,"interface":"translations","readonly":false,"special":["translations"],"collection":"posts","field":"translations","id":9}	{"hidden":false,"interface":"translations","readonly":false,"special":["translations"],"collection":"posts","field":"translations","id":9}	\N
13	14	directus_collections	languages	{"icon":"translate","collection":"languages"}	{"icon":"translate","collection":"languages"}	\N
14	15	directus_collections	posts_translations	{"hidden":true,"icon":"import_export","collection":"posts_translations"}	{"hidden":true,"icon":"import_export","collection":"posts_translations"}	\N
15	16	directus_fields	10	{"interface":"text-input","options":{"iconLeft":"vpn_key"},"width":"half","field":"code","collection":"languages","id":10}	{"interface":"text-input","options":{"iconLeft":"vpn_key"},"width":"half","field":"code","collection":"languages","id":10}	\N
16	17	directus_fields	11	{"interface":"text-input","options":{"iconLeft":"translate"},"width":"half","field":"name","collection":"languages","id":11}	{"interface":"text-input","options":{"iconLeft":"translate"},"width":"half","field":"name","collection":"languages","id":11}	\N
17	18	directus_fields	12	{"hidden":true,"field":"id","collection":"posts_translations","id":12}	{"hidden":true,"field":"id","collection":"posts_translations","id":12}	\N
18	19	directus_fields	13	{"hidden":true,"collection":"posts_translations","field":"languages_code","id":13}	{"hidden":true,"collection":"posts_translations","field":"languages_code","id":13}	\N
19	20	directus_fields	14	{"hidden":true,"collection":"posts_translations","field":"posts_id","id":14}	{"hidden":true,"collection":"posts_translations","field":"posts_id","id":14}	\N
76	77	directus_fields	5	{"id":5,"collection":"posts","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":6,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_updated","sort":6}	\N
20	21	directus_relations	3	{"many_collection":"posts_translations","many_field":"posts_id","many_primary":"id","one_collection":"posts","one_field":"translations","one_primary":"id","junction_field":"languages_code","id":3}	{"many_collection":"posts_translations","many_field":"posts_id","many_primary":"id","one_collection":"posts","one_field":"translations","one_primary":"id","junction_field":"languages_code","id":3}	\N
21	22	directus_relations	4	{"many_collection":"posts_translations","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"posts_id","id":4}	{"many_collection":"posts_translations","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"posts_id","id":4}	\N
29	30	directus_fields	1	{"id":1,"collection":"posts","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"id","sort":1}	\N
30	31	directus_fields	2	{"id":2,"collection":"posts","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"status","sort":2}	\N
31	32	directus_fields	3	{"id":3,"collection":"posts","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_created","sort":3}	\N
32	33	directus_fields	4	{"id":4,"collection":"posts","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_created","sort":4}	\N
33	34	directus_fields	5	{"id":5,"collection":"posts","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_updated","sort":5}	\N
34	35	directus_fields	6	{"id":6,"collection":"posts","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":6,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_updated","sort":6}	\N
35	36	directus_fields	7	{"id":7,"collection":"posts","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"note":null}	{"collection":"posts","field":"title","sort":7}	\N
36	37	directus_fields	9	{"id":9,"collection":"posts","field":"translations","special":["translations"],"interface":"translations","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"translations","sort":8}	\N
37	38	directus_fields	8	{"id":8,"collection":"posts","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":9,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"note":null}	{"collection":"posts","field":"content","sort":9}	\N
38	39	directus_fields	1	{"id":1,"collection":"posts","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"id","sort":1}	\N
39	40	directus_fields	2	{"id":2,"collection":"posts","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"status","sort":2}	\N
40	41	directus_fields	3	{"id":3,"collection":"posts","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_created","sort":3}	\N
41	42	directus_fields	4	{"id":4,"collection":"posts","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_created","sort":4}	\N
42	43	directus_fields	5	{"id":5,"collection":"posts","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_updated","sort":5}	\N
43	44	directus_fields	6	{"id":6,"collection":"posts","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":6,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_updated","sort":6}	\N
44	45	directus_fields	7	{"id":7,"collection":"posts","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"note":null}	{"collection":"posts","field":"title","sort":7}	\N
45	46	directus_fields	8	{"id":8,"collection":"posts","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"note":null}	{"collection":"posts","field":"content","sort":8}	\N
46	47	directus_fields	9	{"id":9,"collection":"posts","field":"translations","special":["translations"],"interface":"translations","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":9,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"translations","sort":9}	\N
47	48	directus_fields	15	{"collection":"posts_translations","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"note":null,"id":15}	{"collection":"posts_translations","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"note":null,"id":15}	\N
48	49	directus_fields	16	{"collection":"posts_translations","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"note":null,"id":16}	{"collection":"posts_translations","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"note":null,"id":16}	\N
49	50	directus_fields	12	{"id":12,"collection":"posts_translations","field":"id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts_translations","field":"id","sort":1}	\N
50	51	directus_fields	13	{"id":13,"collection":"posts_translations","field":"languages_code","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts_translations","field":"languages_code","sort":2}	\N
51	52	directus_fields	14	{"id":14,"collection":"posts_translations","field":"posts_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":3,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts_translations","field":"posts_id","sort":3}	\N
52	53	directus_fields	16	{"id":16,"collection":"posts_translations","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"sort":4,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Title"},{"language":"de-DE","translation":"Titel"}],"note":null}	{"collection":"posts_translations","field":"title","sort":4}	\N
53	54	directus_fields	15	{"id":15,"collection":"posts_translations","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","hr","code","fullscreen","strikethrough","redo","undo","table","visualaid"]},"display":"formatted-value","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"de-DE","translation":"Inhalt"}],"note":null}	{"collection":"posts_translations","field":"content","sort":5}	\N
54	55	directus_collections	posts_translations	{"collection":"posts_translations","icon":"import_export","note":null,"display_template":"{{languages_code.code}}{{title}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null}	{"display_template":"{{languages_code.code}}{{title}}"}	\N
55	56	directus_presets	1	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"posts","id":1}	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"posts","id":1}	\N
56	57	directus_presets	2	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"languages","id":2}	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"languages","id":2}	\N
59	60	directus_collections	posts	{"collection":"posts","icon":null,"note":null,"display_template":"{{translations.languages_code.code}}{{translations.title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null}	{"display_template":"{{translations.languages_code.code}}{{translations.title}}"}	\N
60	61	directus_fields	17	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"note":"Title for internal usage to reference this specific post","collection":"posts","field":"internal_title","id":17}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"note":"Title for internal usage to reference this specific post","collection":"posts","field":"internal_title","id":17}	\N
61	62	directus_collections	posts	{"collection":"posts","icon":null,"note":null,"display_template":"","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null}	{"display_template":""}	\N
63	64	directus_fields	1	{"id":1,"collection":"posts","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"id","sort":1}	\N
64	65	directus_fields	2	{"id":2,"collection":"posts","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"status","sort":2}	\N
65	66	directus_fields	17	{"id":17,"collection":"posts","field":"internal_title","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":3,"width":"full","group":null,"translations":null,"note":"Title for internal usage to reference this specific post"}	{"collection":"posts","field":"internal_title","sort":3}	\N
66	67	directus_fields	3	{"id":3,"collection":"posts","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_created","sort":4}	\N
67	68	directus_fields	4	{"id":4,"collection":"posts","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_created","sort":5}	\N
68	69	directus_fields	5	{"id":5,"collection":"posts","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":6,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_updated","sort":6}	\N
69	70	directus_fields	6	{"id":6,"collection":"posts","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":7,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_updated","sort":7}	\N
70	71	directus_fields	9	{"id":9,"collection":"posts","field":"translations","special":["translations"],"interface":"translations","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"translations","sort":8}	\N
71	72	directus_fields	1	{"id":1,"collection":"posts","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"id","sort":1}	\N
72	73	directus_fields	17	{"id":17,"collection":"posts","field":"internal_title","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"full","group":null,"translations":null,"note":"Title for internal usage to reference this specific post"}	{"collection":"posts","field":"internal_title","sort":2}	\N
73	74	directus_fields	2	{"id":2,"collection":"posts","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":3,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"status","sort":3}	\N
74	75	directus_fields	3	{"id":3,"collection":"posts","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"user_created","sort":4}	\N
75	76	directus_fields	4	{"id":4,"collection":"posts","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_created","sort":5}	\N
77	78	directus_fields	6	{"id":6,"collection":"posts","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":7,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"date_updated","sort":7}	\N
78	79	directus_fields	9	{"id":9,"collection":"posts","field":"translations","special":["translations"],"interface":"translations","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"collection":"posts","field":"translations","sort":8}	\N
79	80	directus_fields	17	{"id":17,"collection":"posts","field":"internal_title","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":"Title for internal usage to reference this specific post"}	{"collection":"posts","field":"internal_title","width":"half"}	\N
80	81	directus_fields	2	{"id":2,"collection":"posts","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"posts","field":"status","width":"half"}	\N
81	82	directus_collections	posts	{"collection":"posts","icon":null,"note":null,"display_template":"{{internal_title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null}	{"display_template":"{{internal_title}}"}	\N
82	83	directus_fields	17	{"id":17,"collection":"posts","field":"internal_title","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":"Title for internal usage to reference this specific post"}	{"id":17,"collection":"posts","field":"internal_title","special":null,"interface":"text-input","options":"{\\"trim\\":true}","display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":"Title for internal usage to reference this specific post"}	\N
83	84	directus_presets	2	{"id":2,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"languages","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"languages","search":null,"filters":null,"layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1}}","layout_options":null}	\N
84	85	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1}}","layout_options":null}	\N
85	86	directus_fields	18	{"hidden":false,"interface":"many-to-many","display":"related-values","readonly":false,"special":["m2m"],"collection":"posts","field":"i18n","id":18}	{"hidden":false,"interface":"many-to-many","display":"related-values","readonly":false,"special":["m2m"],"collection":"posts","field":"i18n","id":18}	\N
86	87	directus_collections	posts_languages_2	{"hidden":true,"icon":"import_export","collection":"posts_languages_2"}	{"hidden":true,"icon":"import_export","collection":"posts_languages_2"}	\N
87	88	directus_fields	19	{"hidden":true,"field":"id","collection":"posts_languages_2","id":19}	{"hidden":true,"field":"id","collection":"posts_languages_2","id":19}	\N
88	89	directus_fields	20	{"hidden":true,"collection":"posts_languages_2","field":"languages_code","id":20}	{"hidden":true,"collection":"posts_languages_2","field":"languages_code","id":20}	\N
89	90	directus_fields	21	{"hidden":true,"collection":"posts_languages_2","field":"posts_id","id":21}	{"hidden":true,"collection":"posts_languages_2","field":"posts_id","id":21}	\N
90	91	directus_relations	5	{"many_collection":"posts_languages_2","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"posts_id","id":5}	{"many_collection":"posts_languages_2","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"posts_id","id":5}	\N
91	92	directus_relations	6	{"many_collection":"posts_languages_2","many_field":"posts_id","many_primary":"id","one_collection":"posts","one_field":"i18n","one_primary":"id","junction_field":"languages_code","id":6}	{"many_collection":"posts_languages_2","many_field":"posts_id","many_primary":"id","one_collection":"posts","one_field":"i18n","one_primary":"id","junction_field":"languages_code","id":6}	\N
92	94	directus_fields	22	{"hidden":false,"interface":"many-to-many","readonly":false,"special":["m2m"],"collection":"posts","field":"i18n","id":22}	{"hidden":false,"interface":"many-to-many","readonly":false,"special":["m2m"],"collection":"posts","field":"i18n","id":22}	\N
93	95	directus_collections	posts_i18n	{"hidden":true,"icon":"import_export","collection":"posts_i18n"}	{"hidden":true,"icon":"import_export","collection":"posts_i18n"}	\N
94	96	directus_fields	23	{"hidden":true,"field":"id","collection":"posts_i18n","id":23}	{"hidden":true,"field":"id","collection":"posts_i18n","id":23}	\N
95	97	directus_fields	24	{"hidden":true,"collection":"posts_i18n","field":"post","id":24}	{"hidden":true,"collection":"posts_i18n","field":"post","id":24}	\N
96	98	directus_fields	25	{"hidden":true,"collection":"posts_i18n","field":"language_code","id":25}	{"hidden":true,"collection":"posts_i18n","field":"language_code","id":25}	\N
97	99	directus_relations	7	{"many_collection":"posts_i18n","many_field":"language_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"post","id":7}	{"many_collection":"posts_i18n","many_field":"language_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"post","id":7}	\N
167	174	directus_fields	55	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"pages","id":55}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"pages","id":55}	\N
98	100	directus_relations	8	{"many_collection":"posts_i18n","many_field":"post","many_primary":"id","one_collection":"posts","one_field":"i18n","one_primary":"id","junction_field":"language_code","id":8}	{"many_collection":"posts_i18n","many_field":"post","many_primary":"id","one_collection":"posts","one_field":"i18n","one_primary":"id","junction_field":"language_code","id":8}	\N
99	101	directus_fields	26	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"readonly":false,"collection":"posts_i18n","field":"title","id":26}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"readonly":false,"collection":"posts_i18n","field":"title","id":26}	\N
100	102	directus_fields	27	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","code","fullscreen","strikethrough","hr","table"]},"display":"formatted-value","display_options":{"bold":true,"formatTitle":true},"readonly":false,"special":null,"collection":"posts_i18n","field":"content","id":27}	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","code","fullscreen","strikethrough","hr","table"]},"display":"formatted-value","display_options":{"bold":true,"formatTitle":true},"readonly":false,"special":null,"collection":"posts_i18n","field":"content","id":27}	\N
101	103	directus_fields	22	{"id":22,"collection":"posts","field":"i18n","special":["m2m"],"interface":"many-to-many","options":{"fields":["language_code.code","title"]},"display":"related-values","display_options":{"template":"{{language_code.code}}{{post.internal_title}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":22,"collection":"posts","field":"i18n","special":"m2m","interface":"many-to-many","options":"{\\"fields\\":[\\"language_code.code\\",\\"title\\"]}","display":"related-values","display_options":"{\\"template\\":\\"{{language_code.code}}{{post.internal_title}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
102	104	directus_relations	8	{"id":8,"many_collection":"posts_i18n","many_field":"post","many_primary":"id","one_collection":"posts","one_field":"i18n","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"language_code"}	{"id":8,"many_collection":"posts_i18n","many_field":"post","many_primary":"id","one_collection":"posts","one_field":"i18n","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"language_code"}	\N
103	105	directus_relations	7	{"id":7,"many_collection":"posts_i18n","many_field":"language_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","one_collection_field":null,"one_allowed_collections":null,"junction_field":"post"}	{"id":7,"many_collection":"posts_i18n","many_field":"language_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","one_collection_field":null,"one_allowed_collections":null,"junction_field":"post"}	\N
104	108	directus_collections	languages	{"collection":"languages","icon":"translate","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null}	{"singleton":true}	\N
105	109	directus_collections	languages	{"collection":"languages","icon":"translate","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null}	{"singleton":false}	\N
106	110	directus_fields	28	{"hidden":false,"interface":"translations","options":{"template":"{{code}}{{name}}"},"display":"related-values","display_options":{"template":"{{language_code.code}}{{post.internal_title}}"},"readonly":false,"special":["translations"],"collection":"posts","field":"translations","id":28}	{"hidden":false,"interface":"translations","options":{"template":"{{code}}{{name}}"},"display":"related-values","display_options":{"template":"{{language_code.code}}{{post.internal_title}}"},"readonly":false,"special":["translations"],"collection":"posts","field":"translations","id":28}	\N
107	111	directus_relations	9	{"many_collection":"posts_i18n","many_field":"post","many_primary":"id","one_collection":"posts","one_field":"translations","one_primary":"id","junction_field":"language_code","id":9}	{"many_collection":"posts_i18n","many_field":"post","many_primary":"id","one_collection":"posts","one_field":"translations","one_primary":"id","junction_field":"language_code","id":9}	\N
108	112	directus_relations	10	{"many_collection":"posts_i18n","many_field":"language_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"post","id":10}	{"many_collection":"posts_i18n","many_field":"language_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"post","id":10}	\N
109	113	directus_fields	28	{"id":28,"collection":"posts","field":"translations","special":["translations"],"interface":"translations","options":{"template":"{{name}}"},"display":"related-values","display_options":{"template":"{{language_code.code}}{{post.internal_title}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":28,"collection":"posts","field":"translations","special":"translations","interface":"translations","options":"{\\"template\\":\\"{{name}}\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{language_code.code}}{{post.internal_title}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
110	114	directus_collections	posts_translations	{"hidden":true,"icon":"import_export","collection":"posts_translations"}	{"hidden":true,"icon":"import_export","collection":"posts_translations"}	\N
111	115	directus_fields	29	{"hidden":true,"field":"id","collection":"posts_translations","id":29}	{"hidden":true,"field":"id","collection":"posts_translations","id":29}	\N
112	116	directus_fields	31	{"hidden":true,"collection":"posts_translations","field":"languages_code","id":31}	{"hidden":true,"collection":"posts_translations","field":"languages_code","id":31}	\N
113	117	directus_fields	30	{"hidden":true,"collection":"posts_translations","field":"posts_id","id":30}	{"hidden":true,"collection":"posts_translations","field":"posts_id","id":30}	\N
114	118	directus_relations	10	{"id":10,"many_collection":"posts_translations","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","one_collection_field":null,"one_allowed_collections":null,"junction_field":"posts_id"}	{"id":10,"many_collection":"posts_translations","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","one_collection_field":null,"one_allowed_collections":null,"junction_field":"posts_id"}	\N
115	119	directus_relations	9	{"id":9,"many_collection":"posts_translations","many_field":"posts_id","many_primary":"id","one_collection":"posts","one_field":"translations","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"languages_code"}	{"id":9,"many_collection":"posts_translations","many_field":"posts_id","many_primary":"id","one_collection":"posts","one_field":"translations","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"languages_code"}	\N
116	120	directus_fields	32	{"collection":"posts_translations","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":32}	{"collection":"posts_translations","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"formatted-value","display_options":{"bold":true},"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":32}	\N
117	121	directus_fields	33	{"collection":"posts_translations","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","code","fullscreen","strikethrough","hr","table"]},"display":"formatted-value","display_options":{"bold":true,"formatTitle":true},"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":33}	{"collection":"posts_translations","field":"content","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","removeformat","link","bullist","numlist","blockquote","h1","h2","h3","image","media","code","fullscreen","strikethrough","hr","table"]},"display":"formatted-value","display_options":{"bold":true,"formatTitle":true},"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":33}	\N
120	125	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["internal_title","status","translations","id"]}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"internal_title\\",\\"status\\",\\"translations\\",\\"id\\"]}}","layout_options":null}	\N
121	126	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["internal_title","status","id"]}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"internal_title\\",\\"status\\",\\"id\\"]}}","layout_options":null}	\N
122	127	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["id","internal_title","status"]}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"id\\",\\"internal_title\\",\\"status\\"]}}","layout_options":null}	\N
123	128	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["id","internal_title","status"]}},"layout_options":{"tabular":{"widths":{"id":366}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"id\\",\\"internal_title\\",\\"status\\"]}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"id\\":366}}}"}	\N
124	129	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["id","internal_title","status"]}},"layout_options":{"tabular":{"widths":{"id":366,"internal_title":174}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"id\\",\\"internal_title\\",\\"status\\"]}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"id\\":366,\\"internal_title\\":174}}}"}	\N
165	172	directus_relations	12	{"many_collection":"component_2","many_field":"features","many_primary":"id","one_collection":"component_2_feature","one_primary":"id","one_field":"component_2","id":12}	{"many_collection":"component_2","many_field":"features","many_primary":"id","one_collection":"component_2_feature","one_primary":"id","one_field":"component_2","id":12}	\N
194	212	directus_fields	72	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"pages","id":72}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"pages","id":72}	\N
216	234	directus_fields	82	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"component_homepage_hero","field":"headline","id":82}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"component_homepage_hero","field":"headline","id":82}	\N
126	131	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["id","internal_title","status"]}},"layout_options":{"tabular":{"widths":{"id":366,"internal_title":174}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"id\\",\\"internal_title\\",\\"status\\"]}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"id\\":366,\\"internal_title\\":174}}}"}	\N
129	134	directus_presets	1	{"id":1,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":[],"layout":"tabular","layout_query":{"tabular":{"page":1,"fields":["id","internal_title","status"],"sort":"id"}},"layout_options":{"tabular":{"widths":{"id":366,"internal_title":174}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"posts","search":null,"filters":"[]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"fields\\":[\\"id\\",\\"internal_title\\",\\"status\\"],\\"sort\\":\\"id\\"}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"id\\":366,\\"internal_title\\":174}}}"}	\N
130	135	directus_permissions	1	{"role":null,"collection":"posts","action":"read","fields":"*","id":1}	{"role":null,"collection":"posts","action":"read","fields":"*","id":1}	\N
131	136	directus_permissions	2	{"role":null,"collection":"languages","action":"read","fields":"*","id":2}	{"role":null,"collection":"languages","action":"read","fields":"*","id":2}	\N
132	137	directus_permissions	3	{"role":null,"collection":"posts_translations","action":"read","fields":"*","id":3}	{"role":null,"collection":"posts_translations","action":"read","fields":"*","id":3}	\N
133	138	directus_permissions	4	{"role":null,"collection":"posts","action":"create","id":4}	{"role":null,"collection":"posts","action":"create","id":4}	\N
134	139	directus_permissions	4	{"id":4,"role":null,"collection":"posts","action":"create","permissions":null,"validation":null,"presets":null,"fields":null,"limit":null}	{"id":4,"role":null,"collection":"posts","action":"create","permissions":null,"validation":null,"presets":null,"fields":null,"limit":null}	\N
135	141	directus_permissions	1	{"id":1,"role":null,"collection":"posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"limit":null}	{"id":1,"role":null,"collection":"posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":"*","limit":null}	\N
136	142	directus_permissions	1	{"id":1,"role":null,"collection":"posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"limit":null}	{"id":1,"role":null,"collection":"posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":"*","limit":null}	\N
138	144	directus_permissions	1	{"id":1,"role":null,"collection":"posts","action":"read","permissions":{"status":{"_eq":"published"}},"validation":null,"presets":null,"fields":["*"],"limit":null}	{"id":1,"role":null,"collection":"posts","action":"read","permissions":"{\\"status\\":{\\"_eq\\":\\"published\\"}}","validation":null,"presets":null,"fields":"*","limit":null}	\N
139	146	directus_collections	component_1	{"singleton":false,"collection":"component_1"}	{"singleton":false,"collection":"component_1"}	\N
140	147	directus_fields	34	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_1","id":34}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_1","id":34}	\N
141	148	directus_fields	35	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_1","id":35}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_1","id":35}	\N
142	149	directus_fields	36	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_1","id":36}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_1","id":36}	\N
143	150	directus_fields	37	{"hidden":false,"interface":"code","options":{"trim":true,"language":"htmlmixed","lineNumber":true},"display":"raw","readonly":false,"collection":"component_1","field":"title","id":37}	{"hidden":false,"interface":"code","options":{"trim":true,"language":"htmlmixed","lineNumber":true},"display":"raw","readonly":false,"collection":"component_1","field":"title","id":37}	\N
144	151	directus_fields	38	{"hidden":false,"interface":"code","options":{"language":"htmlmixed","lineNumber":true},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_1","field":"title","id":38}	{"hidden":false,"interface":"code","options":{"language":"htmlmixed","lineNumber":true},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_1","field":"title","id":38}	\N
166	173	directus_collections	pages	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	\N
212	230	directus_collections	component_homepage_hero	{"singleton":true,"collection":"component_homepage_hero"}	{"singleton":true,"collection":"component_homepage_hero"}	\N
213	231	directus_fields	79	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_homepage_hero","id":79}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_homepage_hero","id":79}	\N
214	232	directus_fields	80	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_homepage_hero","id":80}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_homepage_hero","id":80}	\N
215	233	directus_fields	81	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_homepage_hero","id":81}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_homepage_hero","id":81}	\N
145	152	directus_fields	39	{"collection":"component_1","field":"subtitle","special":null,"interface":"code","options":{"language":"htmlmixed","lineNumber":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":39}	{"collection":"component_1","field":"subtitle","special":null,"interface":"code","options":{"language":"htmlmixed","lineNumber":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":39}	\N
146	153	directus_collections	buttons	{"singleton":false,"collection":"buttons"}	{"singleton":false,"collection":"buttons"}	\N
147	154	directus_fields	40	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"buttons","id":40}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"buttons","id":40}	\N
148	155	directus_fields	41	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"buttons","id":41}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"buttons","id":41}	\N
149	156	directus_fields	42	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"buttons","id":42}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"buttons","id":42}	\N
150	157	directus_fields	43	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"buttons","field":"text","id":43}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"buttons","field":"text","id":43}	\N
151	158	directus_fields	44	{"hidden":false,"interface":"text-input","options":{},"display":"raw","readonly":false,"collection":"buttons","field":"link","id":44}	{"hidden":false,"interface":"text-input","options":{},"display":"raw","readonly":false,"collection":"buttons","field":"link","id":44}	\N
152	159	directus_fields	45	{"hidden":false,"interface":"many-to-one","options":{"template":"{{text}}"},"display":"related-values","display_options":{"template":"{{text}}"},"readonly":false,"collection":"component_1","field":"buttons","id":45}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{text}}"},"display":"related-values","display_options":{"template":"{{text}}"},"readonly":false,"collection":"component_1","field":"buttons","id":45}	\N
153	160	directus_relations	11	{"many_collection":"component_1","many_field":"buttons","many_primary":"id","one_collection":"buttons","one_primary":"id","one_field":"component_1","id":11}	{"many_collection":"component_1","many_field":"buttons","many_primary":"id","one_collection":"buttons","one_primary":"id","one_field":"component_1","id":11}	\N
154	161	directus_collections	component_2	{"singleton":false,"collection":"component_2"}	{"singleton":false,"collection":"component_2"}	\N
155	162	directus_fields	46	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_2","id":46}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_2","id":46}	\N
156	163	directus_fields	47	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_2","id":47}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_2","id":47}	\N
157	164	directus_fields	48	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_2","id":48}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_2","id":48}	\N
158	165	directus_collections	component_2_feature	{"singleton":false,"collection":"component_2_feature"}	{"singleton":false,"collection":"component_2_feature"}	\N
159	166	directus_fields	49	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_2_feature","id":49}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_2_feature","id":49}	\N
160	167	directus_fields	50	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_2_feature","id":50}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_2_feature","id":50}	\N
161	168	directus_fields	51	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_2_feature","id":51}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_2_feature","id":51}	\N
162	169	directus_fields	52	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"component_2_feature","field":"headline","id":52}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"component_2_feature","field":"headline","id":52}	\N
163	170	directus_fields	53	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code"]},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_2_feature","field":"description","id":53}	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code"]},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_2_feature","field":"description","id":53}	\N
164	171	directus_fields	54	{"hidden":false,"interface":"many-to-one","options":{"template":"{{headline}}"},"display":"related-values","display_options":{"template":"{{headline}}"},"readonly":false,"collection":"component_2","field":"features","id":54}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{headline}}"},"display":"related-values","display_options":{"template":"{{headline}}"},"readonly":false,"collection":"component_2","field":"features","id":54}	\N
168	175	directus_fields	56	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"field":"status","collection":"pages","id":56}	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"field":"status","collection":"pages","id":56}	\N
169	176	directus_fields	57	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages","id":57}	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages","id":57}	\N
170	177	directus_fields	58	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages","id":58}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages","id":58}	\N
171	178	directus_fields	59	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages","id":59}	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages","id":59}	\N
172	179	directus_fields	60	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages","id":60}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages","id":60}	\N
173	180	directus_relations	13	{"many_collection":"pages","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":13}	{"many_collection":"pages","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":13}	\N
174	181	directus_relations	14	{"many_collection":"pages","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":14}	{"many_collection":"pages","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":14}	\N
175	182	directus_fields	61	{"hidden":false,"interface":"m2a-builder","display":"raw","readonly":false,"special":["m2a"],"collection":"pages","field":"components","id":61}	{"hidden":false,"interface":"m2a-builder","display":"raw","readonly":false,"special":["m2a"],"collection":"pages","field":"components","id":61}	\N
176	183	directus_collections	pages_components	{"hidden":true,"icon":"import_export","collection":"pages_components"}	{"hidden":true,"icon":"import_export","collection":"pages_components"}	\N
177	184	directus_fields	62	{"hidden":true,"field":"id","collection":"pages_components","id":62}	{"hidden":true,"field":"id","collection":"pages_components","id":62}	\N
178	185	directus_fields	63	{"hidden":true,"collection":"pages_components","field":"pages_id","id":63}	{"hidden":true,"collection":"pages_components","field":"pages_id","id":63}	\N
179	186	directus_fields	64	{"hidden":true,"collection":"pages_components","field":"item","id":64}	{"hidden":true,"collection":"pages_components","field":"item","id":64}	\N
180	187	directus_fields	65	{"hidden":true,"collection":"pages_components","field":"collection","id":65}	{"hidden":true,"collection":"pages_components","field":"collection","id":65}	\N
181	188	directus_relations	15	{"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","junction_field":"item","id":15}	{"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","junction_field":"item","id":15}	\N
182	189	directus_relations	16	{"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_allowed_collections":["component_1","component_2"],"one_collection_field":"collection","junction_field":"pages_id","id":16}	{"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_allowed_collections":["component_1","component_2"],"one_collection_field":"collection","junction_field":"pages_id","id":16}	\N
183	190	directus_fields	66	{"hidden":false,"interface":"translations","readonly":false,"special":["translations"],"collection":"component_2_feature","field":"translations","id":66}	{"hidden":false,"interface":"translations","readonly":false,"special":["translations"],"collection":"component_2_feature","field":"translations","id":66}	\N
184	191	directus_collections	component_2_feature_translations	{"hidden":true,"icon":"import_export","collection":"component_2_feature_translations"}	{"hidden":true,"icon":"import_export","collection":"component_2_feature_translations"}	\N
185	192	directus_fields	67	{"hidden":true,"field":"id","collection":"component_2_feature_translations","id":67}	{"hidden":true,"field":"id","collection":"component_2_feature_translations","id":67}	\N
186	193	directus_fields	68	{"hidden":true,"collection":"component_2_feature_translations","field":"component_2_feature_id","id":68}	{"hidden":true,"collection":"component_2_feature_translations","field":"component_2_feature_id","id":68}	\N
187	194	directus_fields	69	{"hidden":true,"collection":"component_2_feature_translations","field":"languages_code","id":69}	{"hidden":true,"collection":"component_2_feature_translations","field":"languages_code","id":69}	\N
188	195	directus_relations	17	{"many_collection":"component_2_feature_translations","many_field":"component_2_feature_id","many_primary":"id","one_collection":"component_2_feature","one_field":"translations","one_primary":"id","junction_field":"languages_code","id":17}	{"many_collection":"component_2_feature_translations","many_field":"component_2_feature_id","many_primary":"id","one_collection":"component_2_feature","one_field":"translations","one_primary":"id","junction_field":"languages_code","id":17}	\N
193	211	directus_collections	pages	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	\N
189	196	directus_relations	18	{"many_collection":"component_2_feature_translations","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"component_2_feature_id","id":18}	{"many_collection":"component_2_feature_translations","many_field":"languages_code","many_primary":"id","one_collection":"languages","one_field":null,"one_primary":"code","junction_field":"component_2_feature_id","id":18}	\N
190	197	directus_fields	70	{"collection":"component_2_feature_translations","field":"headline","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":70}	{"collection":"component_2_feature_translations","field":"headline","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":70}	\N
191	198	directus_fields	71	{"collection":"component_2_feature_translations","field":"description","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code"]},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":71}	{"collection":"component_2_feature_translations","field":"description","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code"]},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"width":"full","group":null,"translations":null,"note":null,"id":71}	\N
192	209	directus_collections	pages_components	{"collection":"pages_components"}	{"collection":"pages_components"}	\N
195	213	directus_fields	73	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"field":"status","collection":"pages","id":73}	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"field":"status","collection":"pages","id":73}	\N
196	214	directus_fields	74	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages","id":74}	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages","id":74}	\N
197	215	directus_fields	75	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages","id":75}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages","id":75}	\N
198	216	directus_fields	76	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages","id":76}	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages","id":76}	\N
199	217	directus_fields	77	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages","id":77}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages","id":77}	\N
200	218	directus_relations	19	{"many_collection":"pages","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":19}	{"many_collection":"pages","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":19}	\N
201	219	directus_relations	20	{"many_collection":"pages","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":20}	{"many_collection":"pages","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":20}	\N
202	220	directus_fields	78	{"hidden":false,"interface":"slug","options":{"iconLeft":"insert_link"},"display":"raw","readonly":false,"note":"This slug is used to connect this content to a specific url","collection":"pages","field":"slug","id":78}	{"hidden":false,"interface":"slug","options":{"iconLeft":"insert_link"},"display":"raw","readonly":false,"note":"This slug is used to connect this content to a specific url","collection":"pages","field":"slug","id":78}	\N
203	221	directus_fields	73	{"id":73,"collection":"pages","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null}	{"collection":"pages","field":"status","width":"half"}	\N
204	222	directus_fields	78	{"id":78,"collection":"pages","field":"slug","special":null,"interface":"slug","options":{"iconLeft":"insert_link"},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":"This slug is used to connect this content to a specific url"}	{"collection":"pages","field":"slug","width":"half"}	\N
205	223	directus_fields	72	{"id":72,"collection":"pages","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages","field":"id","sort":1}	\N
206	224	directus_fields	73	{"id":73,"collection":"pages","field":"status","special":null,"interface":"dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#2F80ED","value":"published"},{"background":"#ECEFF1","value":"draft"},{"background":"#F2994A","value":"archived"}]},"locked":false,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":null}	{"collection":"pages","field":"status","sort":2}	\N
207	225	directus_fields	78	{"id":78,"collection":"pages","field":"slug","special":null,"interface":"slug","options":{"iconLeft":"insert_link"},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":"This slug is used to connect this content to a specific url"}	{"collection":"pages","field":"slug","sort":3}	\N
208	226	directus_fields	74	{"id":74,"collection":"pages","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"pages","field":"user_created","sort":4}	\N
209	227	directus_fields	75	{"id":75,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"pages","field":"date_created","sort":5}	\N
210	228	directus_fields	76	{"id":76,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":6,"width":"half","group":null,"translations":null,"note":null}	{"collection":"pages","field":"user_updated","sort":6}	\N
211	229	directus_fields	77	{"id":77,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":7,"width":"half","group":null,"translations":null,"note":null}	{"collection":"pages","field":"date_updated","sort":7}	\N
217	235	directus_fields	83	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code","strikethrough","visualaid"]},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_homepage_hero","field":"subline","id":83}	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code","strikethrough","visualaid"]},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_homepage_hero","field":"subline","id":83}	\N
218	236	directus_fields	84	{"hidden":false,"interface":"image","display":"image","readonly":false,"collection":"component_homepage_hero","field":"image_left","id":84}	{"hidden":false,"interface":"image","display":"image","readonly":false,"collection":"component_homepage_hero","field":"image_left","id":84}	\N
219	237	directus_relations	21	{"many_collection":"component_homepage_hero","many_field":"image_left","many_primary":"id","one_collection":"directus_files","one_primary":"id","id":21}	{"many_collection":"component_homepage_hero","many_field":"image_left","many_primary":"id","one_collection":"directus_files","one_primary":"id","id":21}	\N
220	238	directus_collections	buttons	{"singleton":false,"collection":"buttons"}	{"singleton":false,"collection":"buttons"}	\N
221	239	directus_fields	85	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"buttons","id":85}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"buttons","id":85}	\N
222	240	directus_fields	86	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"buttons","id":86}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"buttons","id":86}	\N
223	241	directus_fields	87	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"buttons","id":87}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"buttons","id":87}	\N
224	242	directus_fields	88	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"buttons","field":"text","id":88}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"buttons","field":"text","id":88}	\N
225	243	directus_fields	89	{"hidden":false,"interface":"text-input","options":{"trim":true,"placeholder":"/subpage/checkout"},"display":"raw","readonly":false,"note":"Use this field in special cases where you can't use a page connection","collection":"buttons","field":"direct_link","id":89}	{"hidden":false,"interface":"text-input","options":{"trim":true,"placeholder":"/subpage/checkout"},"display":"raw","readonly":false,"note":"Use this field in special cases where you can't use a page connection","collection":"buttons","field":"direct_link","id":89}	\N
226	244	directus_fields	90	{"hidden":false,"interface":"many-to-one","options":{"template":"{{slug}}"},"display":"related-values","display_options":{"template":"{{slug}}"},"readonly":false,"collection":"buttons","field":"page","id":90}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{slug}}"},"display":"related-values","display_options":{"template":"{{slug}}"},"readonly":false,"collection":"buttons","field":"page","id":90}	\N
227	245	directus_relations	22	{"many_collection":"buttons","many_field":"page","many_primary":"id","one_collection":"pages","one_primary":"id","one_field":"buttons","id":22}	{"many_collection":"buttons","many_field":"page","many_primary":"id","one_collection":"pages","one_primary":"id","one_field":"buttons","id":22}	\N
228	246	directus_collections	page_meta_seo	{"singleton":false,"collection":"page_meta_seo"}	{"singleton":false,"collection":"page_meta_seo"}	\N
229	247	directus_fields	91	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"page_meta_seo","id":91}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"page_meta_seo","id":91}	\N
230	248	directus_fields	92	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"page_meta_seo","id":92}	{"special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"page_meta_seo","id":92}	\N
231	249	directus_fields	93	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"page_meta_seo","id":93}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"page_meta_seo","id":93}	\N
232	250	directus_fields	94	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"page_meta_seo","id":94}	{"special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"page_meta_seo","id":94}	\N
233	251	directus_fields	95	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"page_meta_seo","id":95}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"page_meta_seo","id":95}	\N
234	252	directus_relations	23	{"many_collection":"page_meta_seo","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":23}	{"many_collection":"page_meta_seo","many_field":"user_created","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":23}	\N
235	253	directus_relations	24	{"many_collection":"page_meta_seo","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":24}	{"many_collection":"page_meta_seo","many_field":"user_updated","many_primary":"id","one_collection":"directus_users","one_primary":"id","id":24}	\N
236	254	directus_fields	96	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"note":null,"collection":"page_meta_seo","field":"title","id":96}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"note":null,"collection":"page_meta_seo","field":"title","id":96}	\N
237	255	directus_fields	97	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"page_meta_seo","field":"description","id":97}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"page_meta_seo","field":"description","id":97}	\N
238	256	directus_fields	98	{"hidden":false,"interface":"tags","options":{"iconLeft":"local_offer"},"display":"labels","display_options":{"showAsDot":true},"readonly":false,"special":["csv"],"collection":"page_meta_seo","field":"tags","id":98}	{"hidden":false,"interface":"tags","options":{"iconLeft":"local_offer"},"display":"labels","display_options":{"showAsDot":true},"readonly":false,"special":["csv"],"collection":"page_meta_seo","field":"tags","id":98}	\N
239	257	directus_fields	99	{"hidden":false,"interface":"image","display":"image","readonly":false,"collection":"page_meta_seo","field":"image","id":99}	{"hidden":false,"interface":"image","display":"image","readonly":false,"collection":"page_meta_seo","field":"image","id":99}	\N
240	258	directus_relations	25	{"many_collection":"page_meta_seo","many_field":"image","many_primary":"id","one_collection":"directus_files","one_primary":"id","id":25}	{"many_collection":"page_meta_seo","many_field":"image","many_primary":"id","one_collection":"directus_files","one_primary":"id","id":25}	\N
241	259	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"iconLeft":"local_offer","allowCustom":true},"display":"labels","display_options":{"showAsDot":true},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":98,"collection":"page_meta_seo","field":"tags","special":"csv","interface":"tags","options":"{\\"iconLeft\\":\\"local_offer\\",\\"allowCustom\\":true}","display":"labels","display_options":"{\\"showAsDot\\":true}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
242	260	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"iconLeft":"local_offer"},"display":"labels","display_options":{"showAsDot":true},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":98,"collection":"page_meta_seo","field":"tags","special":"csv","interface":"tags","options":"{\\"iconLeft\\":\\"local_offer\\"}","display":"labels","display_options":"{\\"showAsDot\\":true}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
243	261	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"iconLeft":"local_offer","presets":["Test","123"]},"display":"labels","display_options":{"showAsDot":true},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":98,"collection":"page_meta_seo","field":"tags","special":"csv","interface":"tags","options":"{\\"iconLeft\\":\\"local_offer\\",\\"presets\\":[\\"Test\\",\\"123\\"]}","display":"labels","display_options":"{\\"showAsDot\\":true}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
244	262	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"iconLeft":"local_offer","presets":["Test","123"],"allowCustom":true},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"xd","value":"aaaaaa","foreground":"#F2C94C","background":"#27AE60"}]},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":98,"collection":"page_meta_seo","field":"tags","special":"csv","interface":"tags","options":"{\\"iconLeft\\":\\"local_offer\\",\\"presets\\":[\\"Test\\",\\"123\\"],\\"allowCustom\\":true}","display":"labels","display_options":"{\\"showAsDot\\":true,\\"choices\\":[{\\"text\\":\\"xd\\",\\"value\\":\\"aaaaaa\\",\\"foreground\\":\\"#F2C94C\\",\\"background\\":\\"#27AE60\\"}]}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
245	263	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"presets":[],"allowCustom":true},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"xd","value":"aaaaaa","foreground":"#F2C94C","background":"#27AE60"}]},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":98,"collection":"page_meta_seo","field":"tags","special":"csv","interface":"tags","options":"{\\"presets\\":[],\\"allowCustom\\":true}","display":"labels","display_options":"{\\"showAsDot\\":true,\\"choices\\":[{\\"text\\":\\"xd\\",\\"value\\":\\"aaaaaa\\",\\"foreground\\":\\"#F2C94C\\",\\"background\\":\\"#27AE60\\"}]}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
246	264	directus_fields	99	{"id":99,"collection":"page_meta_seo","field":"image","special":null,"interface":"image","options":null,"display":"image","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":"If no image is provided a default image will be used"}	{"id":99,"collection":"page_meta_seo","field":"image","special":null,"interface":"image","options":null,"display":"image","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":"If no image is provided a default image will be used"}	\N
247	265	directus_relations	25	{"id":25,"many_collection":"page_meta_seo","many_field":"image","many_primary":"id","one_collection":"directus_files","one_field":null,"one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":25,"many_collection":"page_meta_seo","many_field":"image","many_primary":"id","one_collection":"directus_files","one_field":null,"one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
248	266	directus_fields	100	{"hidden":false,"interface":"notice","options":{"text":"These fields are important for SEO reasons and as such should not change too often and also be relevant to the user","color":"info","icon":"article"},"readonly":true,"special":["alias","no-data"],"collection":"page_meta_seo","field":"hint","id":100}	{"hidden":false,"interface":"notice","options":{"text":"These fields are important for SEO reasons and as such should not change too often and also be relevant to the user","color":"info","icon":"article"},"readonly":true,"special":["alias","no-data"],"collection":"page_meta_seo","field":"hint","id":100}	\N
249	267	directus_fields	91	{"id":91,"collection":"page_meta_seo","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"id","sort":1}	\N
250	268	directus_fields	92	{"id":92,"collection":"page_meta_seo","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":2,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"user_created","sort":2}	\N
251	269	directus_fields	93	{"id":93,"collection":"page_meta_seo","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"date_created","sort":3}	\N
252	270	directus_fields	94	{"id":94,"collection":"page_meta_seo","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"user_updated","sort":4}	\N
253	271	directus_fields	95	{"id":95,"collection":"page_meta_seo","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"date_updated","sort":5}	\N
254	272	directus_fields	100	{"id":100,"collection":"page_meta_seo","field":"hint","special":["alias","no-data"],"interface":"notice","options":{"text":"These fields are important for SEO reasons and as such should not change too often and also be relevant to the user","color":"info","icon":"article"},"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":false,"sort":6,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"hint","sort":6}	\N
255	273	directus_fields	96	{"id":96,"collection":"page_meta_seo","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"title","sort":7}	\N
256	274	directus_fields	97	{"id":97,"collection":"page_meta_seo","field":"description","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"description","sort":8}	\N
257	275	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"presets":[],"allowCustom":true},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"xd","value":"aaaaaa","foreground":"#F2C94C","background":"#27AE60"}]},"locked":false,"readonly":false,"hidden":false,"sort":9,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"tags","sort":9}	\N
258	276	directus_fields	99	{"id":99,"collection":"page_meta_seo","field":"image","special":null,"interface":"image","options":null,"display":"image","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":10,"width":"full","group":null,"translations":null,"note":"If no image is provided a default image will be used"}	{"collection":"page_meta_seo","field":"image","sort":10}	\N
259	277	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"presets":[],"allowCustom":true},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"xd","value":"aaaaaa","foreground":"#F2C94C","background":"#27AE60"}]},"locked":false,"readonly":false,"hidden":false,"sort":9,"width":"full","group":null,"translations":null,"note":"Only add relevant tags and not too many"}	{"id":98,"collection":"page_meta_seo","field":"tags","special":"csv","interface":"tags","options":"{\\"presets\\":[],\\"allowCustom\\":true}","display":"labels","display_options":"{\\"showAsDot\\":true,\\"choices\\":[{\\"text\\":\\"xd\\",\\"value\\":\\"aaaaaa\\",\\"foreground\\":\\"#F2C94C\\",\\"background\\":\\"#27AE60\\"}]}","locked":false,"readonly":false,"hidden":false,"sort":9,"width":"full","group":null,"translations":null,"note":"Only add relevant tags and not too many"}	\N
260	278	directus_fields	101	{"hidden":false,"interface":"many-to-one","options":{"template":"{{title}} // {{tags}}"},"display":"related-values","display_options":{"template":"{{title}} // {{tags}}"},"readonly":false,"collection":"pages","field":"meta_seo","id":101}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{title}} // {{tags}}"},"display":"related-values","display_options":{"template":"{{title}} // {{tags}}"},"readonly":false,"collection":"pages","field":"meta_seo","id":101}	\N
261	279	directus_relations	26	{"many_collection":"pages","many_field":"meta_seo","many_primary":"id","one_collection":"page_meta_seo","one_primary":"id","one_field":"pages","id":26}	{"many_collection":"pages","many_field":"meta_seo","many_primary":"id","one_collection":"page_meta_seo","one_primary":"id","one_field":"pages","id":26}	\N
262	280	directus_fields	102	{"hidden":false,"interface":"m2a-builder","display":"raw","readonly":false,"special":["m2a"],"collection":"pages","field":"components","id":102}	{"hidden":false,"interface":"m2a-builder","display":"raw","readonly":false,"special":["m2a"],"collection":"pages","field":"components","id":102}	\N
263	281	directus_collections	pages_components	{"hidden":true,"icon":"import_export","collection":"pages_components"}	{"hidden":true,"icon":"import_export","collection":"pages_components"}	\N
264	282	directus_fields	103	{"hidden":true,"field":"id","collection":"pages_components","id":103}	{"hidden":true,"field":"id","collection":"pages_components","id":103}	\N
265	283	directus_fields	104	{"hidden":true,"collection":"pages_components","field":"pages_id","id":104}	{"hidden":true,"collection":"pages_components","field":"pages_id","id":104}	\N
266	284	directus_fields	105	{"hidden":true,"collection":"pages_components","field":"item","id":105}	{"hidden":true,"collection":"pages_components","field":"item","id":105}	\N
267	285	directus_fields	106	{"hidden":true,"collection":"pages_components","field":"collection","id":106}	{"hidden":true,"collection":"pages_components","field":"collection","id":106}	\N
268	286	directus_relations	27	{"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","junction_field":"item","id":27}	{"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","junction_field":"item","id":27}	\N
270	288	directus_fields	105	{"id":105,"collection":"pages_components","field":"item","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages_components","field":"item","hidden":false}	\N
269	287	directus_relations	28	{"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_allowed_collections":["component_homepage_hero"],"one_collection_field":"collection","junction_field":"pages_id","id":28}	{"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_allowed_collections":["component_homepage_hero"],"one_collection_field":"collection","junction_field":"pages_id","id":28}	\N
271	289	directus_fields	104	{"id":104,"collection":"pages_components","field":"pages_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages_components","field":"pages_id","hidden":false}	\N
272	290	directus_fields	106	{"id":106,"collection":"pages_components","field":"collection","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages_components","field":"collection","hidden":false}	\N
273	291	directus_files	4d6194fb-a9f9-4ef8-9146-c734490dda40	{"title":"Packiro Main Front","uploaded_by":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","filename_download":"packiro-main-front.png","type":"image/png","storage":"local","id":"4d6194fb-a9f9-4ef8-9146-c734490dda40"}	{"title":"Packiro Main Front","uploaded_by":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","filename_download":"packiro-main-front.png","type":"image/png","storage":"local","id":"4d6194fb-a9f9-4ef8-9146-c734490dda40"}	\N
274	292	page_meta_seo	9552db4f-b942-4b12-aeab-1c06f4d85841	{"title":"Homepage","description":"Sick homepage","tags":["Packaging","Packiro","Standbodenbeutel"],"id":"9552db4f-b942-4b12-aeab-1c06f4d85841"}	{"title":"Homepage","description":"Sick homepage","tags":["Packaging","Packiro","Standbodenbeutel"],"id":"9552db4f-b942-4b12-aeab-1c06f4d85841"}	\N
275	293	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[],"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0"}	{"slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[],"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0"}	\N
276	294	directus_fields	104	{"id":104,"collection":"pages_components","field":"pages_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages_components","field":"pages_id","hidden":true}	\N
277	295	directus_fields	105	{"id":105,"collection":"pages_components","field":"item","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages_components","field":"item","hidden":true}	\N
278	296	directus_fields	106	{"id":106,"collection":"pages_components","field":"collection","special":null,"interface":null,"options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"pages_components","field":"collection","hidden":true}	\N
279	297	directus_fields	101	{"id":101,"collection":"pages","field":"meta_seo","special":null,"interface":"many-to-one","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":101,"collection":"pages","field":"meta_seo","special":null,"interface":"many-to-one","options":"{\\"template\\":\\"{{title}}\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{title}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
280	298	directus_relations	26	{"id":26,"many_collection":"pages","many_field":"meta_seo","many_primary":"id","one_collection":"page_meta_seo","one_field":"pages","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":26,"many_collection":"pages","many_field":"meta_seo","many_primary":"id","one_collection":"page_meta_seo","one_field":"pages","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
281	299	component_homepage_hero	417f36a0-942d-4aba-a2b2-ea4ebd9af82c	{"subline":"<p>Hat dein Produkt schon die Verpackung, die es verdient? Finde den richtigen Pack Hero und mach dein Produkt zum Hingucker in jedem Warenregal. Individuell bedruckt bereits ab 500 St&uuml;ck.</p>","headline":"Bestell bei uns individuell bedruckte nachhaltige Verpackungen","image_left":"4d6194fb-a9f9-4ef8-9146-c734490dda40","id":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c"}	{"subline":"<p>Hat dein Produkt schon die Verpackung, die es verdient? Finde den richtigen Pack Hero und mach dein Produkt zum Hingucker in jedem Warenregal. Individuell bedruckt bereits ab 500 St&uuml;ck.</p>","headline":"Bestell bei uns individuell bedruckte nachhaltige Verpackungen","image_left":"4d6194fb-a9f9-4ef8-9146-c734490dda40","id":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c"}	\N
283	301	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:22:12+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:22:12.812Z"}	\N
284	302	directus_presets	3	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":[{"key":"XJox7iulgM-LJOTD9-RjB","locked":true,"field":"user","operator":"eq","value":"4c402a5f-5c17-4ebd-bff5-474463f54dbe"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}},"collection":"directus_activity","id":3}	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":[{"key":"XJox7iulgM-LJOTD9-RjB","locked":true,"field":"user","operator":"eq","value":"4c402a5f-5c17-4ebd-bff5-474463f54dbe"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}},"collection":"directus_activity","id":3}	\N
285	303	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
286	304	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"1OdsnepgbnQo5s_DjBYd_","locked":true,"field":"action","operator":"eq","value":"create"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"1OdsnepgbnQo5s_DjBYd_\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"create\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
287	305	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"0OUDgsePpQpJH8aDjnUqT","locked":true,"field":"action","operator":"eq","value":"update"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"0OUDgsePpQpJH8aDjnUqT\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"update\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
289	307	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"aMNJZsdK7G2fetDH3GHV0","locked":true,"field":"action","operator":"eq","value":"comment"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"aMNJZsdK7G2fetDH3GHV0\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"comment\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
290	308	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"vYG6wGI-QcmCJ3aeDAMec","locked":true,"field":"action","operator":"eq","value":"delete"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"vYG6wGI-QcmCJ3aeDAMec\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"delete\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
292	310	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"YX7LhhJUw0zURrFvkZ4bZ","locked":true,"field":"action","operator":"eq","value":"delete"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"YX7LhhJUw0zURrFvkZ4bZ\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"delete\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
288	306	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"JGBx7nszRoPHEtEklZ9FK","locked":true,"field":"action","operator":"eq","value":"delete"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"JGBx7nszRoPHEtEklZ9FK\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"delete\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
291	309	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"cpIIFNVAMfpXs-RsF4lhQ","locked":true,"field":"action","operator":"eq","value":"update"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"cpIIFNVAMfpXs-RsF4lhQ\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"update\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
293	311	directus_presets	3	{"id":3,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":[{"key":"VOs-jgRTxWYEq_nbXcfPm","locked":true,"field":"action","operator":"eq","value":"create"}],"layout":"tabular","layout_query":{"tabular":{"sort":"-timestamp","fields":["action","collection","timestamp","user"],"page":1}},"layout_options":{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"directus_activity","search":null,"filters":"[{\\"key\\":\\"VOs-jgRTxWYEq_nbXcfPm\\",\\"locked\\":true,\\"field\\":\\"action\\",\\"operator\\":\\"eq\\",\\"value\\":\\"create\\"}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"sort\\":\\"-timestamp\\",\\"fields\\":[\\"action\\",\\"collection\\",\\"timestamp\\",\\"user\\"],\\"page\\":1}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"action\\":100,\\"collection\\":210,\\"timestamp\\":240,\\"user\\":240}}}"}	\N
294	312	directus_fields	107	{"hidden":false,"interface":"numeric","options":{"min":0},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"pages_components","field":"position","id":107}	{"hidden":false,"interface":"numeric","options":{"min":0},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"pages_components","field":"position","id":107}	\N
295	313	directus_fields	102	{"id":102,"collection":"pages","field":"components","special":["m2a"],"interface":"m2a-builder","options":{"sortField":"position"},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":102,"collection":"pages","field":"components","special":"m2a","interface":"m2a-builder","options":"{\\"sortField\\":\\"position\\"}","display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
296	314	directus_relations	27	{"id":27,"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"item"}	{"id":27,"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"item"}	\N
297	315	directus_relations	28	{"id":28,"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_collection_field":"collection","one_allowed_collections":["component_homepage_hero"],"junction_field":"pages_id"}	{"id":28,"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_collection_field":"collection","one_allowed_collections":"component_homepage_hero","junction_field":"pages_id"}	\N
299	317	component_homepage_hero	6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9	{"headline":"Auch geile Headline","subline":"<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>","image_left":"4d6194fb-a9f9-4ef8-9146-c734490dda40","id":"6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9"}	{"headline":"Auch geile Headline","subline":"<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>","image_left":"4d6194fb-a9f9-4ef8-9146-c734490dda40","id":"6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9"}	\N
301	319	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:44:14+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:44:14.190Z"}	\N
303	321	component_homepage_hero	6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9	{"id":"6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9","date_created":"2021-02-27T00:44:14+01:00","date_updated":"2021-02-27T00:44:44+01:00","headline":"Auch geile Headline","subline":"<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>","image_left":"4d6194fb-a9f9-4ef8-9146-c734490dda40"}	{"id":"6fa2fc2f-3660-4f24-8b0b-b4e484b2a5a9","date_updated":"2021-02-26T23:44:44.013Z"}	\N
305	323	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:44:43+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:44:43.997Z"}	\N
308	326	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:45:13+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:45:13.625Z"}	\N
311	329	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:45:25+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:45:25.815Z"}	\N
312	332	directus_collections	component_homepage_features	{"singleton":false,"collection":"component_homepage_features"}	{"singleton":false,"collection":"component_homepage_features"}	\N
313	333	directus_fields	108	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_homepage_features","id":108}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_homepage_features","id":108}	\N
314	334	directus_fields	109	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_homepage_features","id":109}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_homepage_features","id":109}	\N
315	335	directus_fields	110	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_homepage_features","id":110}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_homepage_features","id":110}	\N
316	336	directus_collections	component_homepage_features_single	{"sort_field":"sort","singleton":false,"collection":"component_homepage_features_single"}	{"sort_field":"sort","singleton":false,"collection":"component_homepage_features_single"}	\N
317	337	directus_fields	111	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_homepage_features_single","id":111}	{"hidden":true,"readonly":true,"interface":"text-input","special":["uuid"],"field":"id","collection":"component_homepage_features_single","id":111}	\N
318	338	directus_fields	112	{"interface":"numeric","hidden":true,"field":"sort","collection":"component_homepage_features_single","id":112}	{"interface":"numeric","hidden":true,"field":"sort","collection":"component_homepage_features_single","id":112}	\N
319	339	directus_fields	113	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_homepage_features_single","id":113}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"component_homepage_features_single","id":113}	\N
320	340	directus_fields	114	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_homepage_features_single","id":114}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"component_homepage_features_single","id":114}	\N
321	341	directus_fields	115	{"hidden":false,"interface":"image","display":"image","readonly":false,"collection":"component_homepage_features_single","field":"image","id":115}	{"hidden":false,"interface":"image","display":"image","readonly":false,"collection":"component_homepage_features_single","field":"image","id":115}	\N
322	342	directus_relations	29	{"many_collection":"component_homepage_features_single","many_field":"image","many_primary":"id","one_collection":"directus_files","one_primary":"id","id":29}	{"many_collection":"component_homepage_features_single","many_field":"image","many_primary":"id","one_collection":"directus_files","one_primary":"id","id":29}	\N
323	343	directus_fields	116	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"component_homepage_features_single","field":"headline","id":116}	{"hidden":false,"interface":"text-input","options":{"trim":true},"display":"raw","readonly":false,"collection":"component_homepage_features_single","field":"headline","id":116}	\N
324	344	directus_fields	117	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["italic","underline","link","code","bold","strikethrough"]},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_homepage_features_single","field":"text","id":117}	{"hidden":false,"interface":"wysiwyg","options":{"toolbar":["italic","underline","link","code","bold","strikethrough"]},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"component_homepage_features_single","field":"text","id":117}	\N
325	345	directus_fields	111	{"id":111,"collection":"component_homepage_features_single","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"id","sort":1}	\N
326	346	directus_fields	112	{"id":112,"collection":"component_homepage_features_single","field":"sort","special":null,"interface":"numeric","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"sort","sort":2}	\N
327	347	directus_fields	113	{"id":113,"collection":"component_homepage_features_single","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"date_created","sort":3}	\N
328	348	directus_fields	114	{"id":114,"collection":"component_homepage_features_single","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"date_updated","sort":4}	\N
329	349	directus_fields	116	{"id":116,"collection":"component_homepage_features_single","field":"headline","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"headline","sort":5}	\N
330	350	directus_fields	117	{"id":117,"collection":"component_homepage_features_single","field":"text","special":null,"interface":"wysiwyg","options":{"toolbar":["italic","underline","link","code","bold","strikethrough"]},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":6,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"text","sort":6}	\N
331	351	directus_fields	115	{"id":115,"collection":"component_homepage_features_single","field":"image","special":null,"interface":"image","options":null,"display":"image","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"image","sort":7}	\N
332	352	directus_fields	118	{"hidden":false,"interface":"many-to-one","options":{"template":"{{headline}}"},"display":"related-values","display_options":{"template":"{{headline}}"},"readonly":false,"collection":"component_homepage_features","field":"features","id":118}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{headline}}"},"display":"related-values","display_options":{"template":"{{headline}}"},"readonly":false,"collection":"component_homepage_features","field":"features","id":118}	\N
333	353	directus_relations	30	{"many_collection":"component_homepage_features","many_field":"features","many_primary":"id","one_collection":"component_homepage_features_single","one_primary":"id","one_field":"component_homepage_features","id":30}	{"many_collection":"component_homepage_features","many_field":"features","many_primary":"id","one_collection":"component_homepage_features_single","one_primary":"id","one_field":"component_homepage_features","id":30}	\N
334	354	directus_fields	119	{"hidden":false,"interface":"m2a-builder","display":"raw","readonly":false,"special":["m2a"],"collection":"pages","field":"components","id":119}	{"hidden":false,"interface":"m2a-builder","display":"raw","readonly":false,"special":["m2a"],"collection":"pages","field":"components","id":119}	\N
335	355	directus_collections	pages_components	{"hidden":true,"icon":"import_export","collection":"pages_components"}	{"hidden":true,"icon":"import_export","collection":"pages_components"}	\N
336	356	directus_fields	120	{"hidden":true,"field":"id","collection":"pages_components","id":120}	{"hidden":true,"field":"id","collection":"pages_components","id":120}	\N
337	357	directus_fields	121	{"hidden":true,"collection":"pages_components","field":"pages_id","id":121}	{"hidden":true,"collection":"pages_components","field":"pages_id","id":121}	\N
338	358	directus_fields	122	{"hidden":true,"collection":"pages_components","field":"collection","id":122}	{"hidden":true,"collection":"pages_components","field":"collection","id":122}	\N
339	359	directus_fields	123	{"hidden":true,"collection":"pages_components","field":"item","id":123}	{"hidden":true,"collection":"pages_components","field":"item","id":123}	\N
340	360	directus_relations	31	{"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_allowed_collections":["component_homepage_features","component_homepage_hero"],"one_collection_field":"collection","junction_field":"pages_id","id":31}	{"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_allowed_collections":["component_homepage_features","component_homepage_hero"],"one_collection_field":"collection","junction_field":"pages_id","id":31}	\N
341	361	directus_relations	32	{"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","junction_field":"item","id":32}	{"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","junction_field":"item","id":32}	\N
342	362	directus_collections	component_homepage_hero	{"collection":"component_homepage_hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null}	{"singleton":false}	\N
343	363	directus_files	206f6912-6bcb-47c3-9872-b129e45c2f97	{"filename_download":"pouch-500.svg","storage":"local","type":"image/svg+xml","title":"Pouch 500.svg","id":"206f6912-6bcb-47c3-9872-b129e45c2f97"}	{"filename_download":"pouch-500.svg","storage":"local","type":"image/svg+xml","title":"Pouch 500.svg","id":"206f6912-6bcb-47c3-9872-b129e45c2f97"}	\N
344	364	pages_components	1	{"collection":"component_homepage_hero","item":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c","pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","id":1}	{"collection":"component_homepage_hero","item":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c","pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","id":1}	\N
345	365	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:55:01+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:55:01.012Z"}	\N
346	366	directus_fields	124	{"hidden":false,"interface":"one-to-many","options":{"fields":["headline","text"],"sortField":"sort"},"display":"related-values","display_options":{"template":"{{headline}} // {{text}}"},"readonly":false,"special":["o2m"],"collection":"component_homepage_features","field":"features","id":124}	{"hidden":false,"interface":"one-to-many","options":{"fields":["headline","text"],"sortField":"sort"},"display":"related-values","display_options":{"template":"{{headline}} // {{text}}"},"readonly":false,"special":["o2m"],"collection":"component_homepage_features","field":"features","id":124}	\N
347	367	directus_relations	33	{"many_collection":"component_homepage_features_single","many_field":"id","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","id":33}	{"many_collection":"component_homepage_features_single","many_field":"id","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","id":33}	\N
348	368	directus_files	4da79b14-1c41-4ce6-81cc-83efd0f19682	{"filename_download":"two-leaves.svg","storage":"local","type":"image/svg+xml","title":"Two Leaves.svg","id":"4da79b14-1c41-4ce6-81cc-83efd0f19682"}	{"filename_download":"two-leaves.svg","storage":"local","type":"image/svg+xml","title":"Two Leaves.svg","id":"4da79b14-1c41-4ce6-81cc-83efd0f19682"}	\N
349	369	pages_components	1	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_hero","item":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c"}	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0"}	\N
350	370	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","sort":0,"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","sort":0,"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	\N
351	371	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T00:57:41+01:00","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","date_updated":"2021-02-26T23:57:41.432Z"}	\N
352	372	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"features":[{"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","sort":0},{"headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","sort":1}],"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"features":[{"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","sort":0},{"headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","sort":1}],"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	\N
353	373	pages_components	2	{"collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","id":2}	{"collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","id":2}	\N
354	374	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:57:41+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-26T23:57:41.414Z"}	\N
355	375	directus_fields	125	{"hidden":true,"interface":"numeric","options":null,"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"pages_components","field":"sort","id":125}	{"hidden":true,"interface":"numeric","options":null,"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"pages_components","field":"sort","id":125}	\N
356	376	directus_fields	125	{"id":125,"collection":"pages_components","field":"sort","special":null,"interface":"numeric","options":null,"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":125,"collection":"pages_components","field":"sort","special":null,"interface":"numeric","options":null,"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
357	377	directus_fields	125	{"id":125,"collection":"pages_components","field":"sort","special":null,"interface":"numeric","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":125,"collection":"pages_components","field":"sort","special":null,"interface":"numeric","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
408	430	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:27:13+01:00","features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"]}	{"date_updated":"2021-02-27T00:27:13.410Z"}	\N
358	378	directus_fields	119	{"id":119,"collection":"pages","field":"components","special":["m2a"],"interface":"m2a-builder","options":{"sortField":"sort"},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":119,"collection":"pages","field":"components","special":"m2a","interface":"m2a-builder","options":"{\\"sortField\\":\\"sort\\"}","display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
359	379	directus_relations	32	{"id":32,"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"item"}	{"id":32,"many_collection":"pages_components","many_field":"pages_id","many_primary":"id","one_collection":"pages","one_field":"components","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":"item"}	\N
360	380	directus_relations	31	{"id":31,"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_collection_field":"collection","one_allowed_collections":["component_homepage_features","component_homepage_hero"],"junction_field":"pages_id"}	{"id":31,"many_collection":"pages_components","many_field":"item","many_primary":"id","one_collection":null,"one_field":null,"one_primary":null,"one_collection_field":"collection","one_allowed_collections":"component_homepage_features,component_homepage_hero","junction_field":"pages_id"}	\N
361	381	directus_fields	83	{"id":83,"collection":"component_homepage_hero","field":"subline","special":null,"interface":"wysiwyg","options":{"toolbar":["bold","italic","underline","link","code","strikethrough","removeformat"]},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":83,"collection":"component_homepage_hero","field":"subline","special":null,"interface":"wysiwyg","options":"{\\"toolbar\\":[\\"bold\\",\\"italic\\",\\"underline\\",\\"link\\",\\"code\\",\\"strikethrough\\",\\"removeformat\\"]}","display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
362	382	directus_fields	126	{"hidden":false,"interface":"textarea","options":{"trim":true},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"page_meta_seo","field":"description","id":126}	{"hidden":false,"interface":"textarea","options":{"trim":true},"display":"raw","display_options":null,"readonly":false,"special":null,"collection":"page_meta_seo","field":"description","id":126}	\N
363	383	page_meta_seo	9552db4f-b942-4b12-aeab-1c06f4d85841	{"id":"9552db4f-b942-4b12-aeab-1c06f4d85841","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T01:00:45+01:00","title":"Homepage","tags":["Packaging","Packiro","Standbodenbeutel"],"image":null,"description":"aaaaaaaaaaa"}	{"description":"aaaaaaaaaaa","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:00:45.882Z"}	\N
364	384	directus_fields	91	{"id":91,"collection":"page_meta_seo","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"id","sort":1}	\N
365	385	directus_fields	92	{"id":92,"collection":"page_meta_seo","field":"user_created","special":["user-created"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":2,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"user_created","sort":2}	\N
366	386	directus_fields	93	{"id":93,"collection":"page_meta_seo","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"date_created","sort":3}	\N
367	387	directus_fields	94	{"id":94,"collection":"page_meta_seo","field":"user_updated","special":["user-updated"],"interface":"user","options":{"display":"both"},"display":"user","display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"user_updated","sort":4}	\N
368	388	directus_fields	95	{"id":95,"collection":"page_meta_seo","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":5,"width":"half","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"date_updated","sort":5}	\N
369	389	directus_fields	100	{"id":100,"collection":"page_meta_seo","field":"hint","special":["alias","no-data"],"interface":"notice","options":{"text":"These fields are important for SEO reasons and as such should not change too often and also be relevant to the user","color":"info","icon":"article"},"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":false,"sort":6,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"hint","sort":6}	\N
370	390	directus_fields	96	{"id":96,"collection":"page_meta_seo","field":"title","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"title","sort":7}	\N
371	391	directus_fields	126	{"id":126,"collection":"page_meta_seo","field":"description","special":null,"interface":"textarea","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"collection":"page_meta_seo","field":"description","sort":8}	\N
372	392	directus_fields	98	{"id":98,"collection":"page_meta_seo","field":"tags","special":["csv"],"interface":"tags","options":{"presets":[],"allowCustom":true},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"xd","value":"aaaaaa","foreground":"#F2C94C","background":"#27AE60"}]},"locked":false,"readonly":false,"hidden":false,"sort":9,"width":"full","group":null,"translations":null,"note":"Only add relevant tags and not too many"}	{"collection":"page_meta_seo","field":"tags","sort":9}	\N
373	393	directus_fields	99	{"id":99,"collection":"page_meta_seo","field":"image","special":null,"interface":"image","options":null,"display":"image","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":10,"width":"full","group":null,"translations":null,"note":"If no image is provided a default image will be used"}	{"collection":"page_meta_seo","field":"image","sort":10}	\N
374	394	directus_fields	126	{"id":126,"collection":"page_meta_seo","field":"description","special":null,"interface":"textarea","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"id":126,"collection":"page_meta_seo","field":"description","special":null,"interface":"textarea","options":"{\\"trim\\":true}","display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	\N
375	395	directus_presets	4	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"fields":["features","id"]}},"layout_options":null,"collection":"component_homepage_features","id":4}	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"fields":["features","id"]}},"layout_options":null,"collection":"component_homepage_features","id":4}	\N
376	396	directus_presets	4	{"id":4,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"component_homepage_features","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"fields":["features","id"]}},"layout_options":{"tabular":{"widths":{"id":393}}}}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"component_homepage_features","search":null,"filters":null,"layout":"tabular","layout_query":"{\\"tabular\\":{\\"fields\\":[\\"features\\",\\"id\\"]}}","layout_options":"{\\"tabular\\":{\\"widths\\":{\\"id\\":393}}}"}	\N
377	399	directus_permissions	5	{"role":null,"collection":"pages","action":"read","fields":"*","id":5}	{"role":null,"collection":"pages","action":"read","fields":"*","id":5}	\N
378	400	directus_permissions	6	{"role":null,"collection":"page_meta_seo","action":"read","fields":"*","id":6}	{"role":null,"collection":"page_meta_seo","action":"read","fields":"*","id":6}	\N
379	401	directus_permissions	7	{"role":null,"collection":"component_homepage_hero","action":"read","fields":"*","id":7}	{"role":null,"collection":"component_homepage_hero","action":"read","fields":"*","id":7}	\N
380	402	directus_permissions	8	{"role":null,"collection":"component_homepage_features_single","action":"read","fields":"*","id":8}	{"role":null,"collection":"component_homepage_features_single","action":"read","fields":"*","id":8}	\N
381	403	directus_permissions	9	{"role":null,"collection":"component_homepage_features","action":"read","fields":"*","id":9}	{"role":null,"collection":"component_homepage_features","action":"read","fields":"*","id":9}	\N
382	404	directus_permissions	10	{"role":null,"collection":"buttons","action":"read","fields":"*","id":10}	{"role":null,"collection":"buttons","action":"read","fields":"*","id":10}	\N
383	405	directus_permissions	11	{"role":null,"collection":"pages_components","action":"read","fields":"*","id":11}	{"role":null,"collection":"pages_components","action":"read","fields":"*","id":11}	\N
384	406	pages_components	1	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_hero","item":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c","sort":0}	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0"}	\N
385	407	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:25:55+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0,"image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","date_updated":"2021-02-27T00:25:55.872Z"}	\N
386	408	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:25:55+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","date_updated":"2021-02-27T00:25:55.886Z"}	\N
387	409	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:25:55+01:00","features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"]}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:25:55.868Z"}	\N
388	410	pages_components	2	{"id":2,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0}	{"id":2,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0}	\N
389	411	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T01:25:55+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:25:55.853Z"}	\N
390	412	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	{"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","id":"eae8de8a-f294-4d01-9867-f99d4cbd1eaf"}	{"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","id":"eae8de8a-f294-4d01-9867-f99d4cbd1eaf"}	\N
391	413	directus_presets	5	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"pages","id":5}	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"pages","id":5}	\N
392	414	pages_components	1	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_hero","item":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c","sort":0}	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0"}	\N
393	415	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:26:31+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:26:31.537Z"}	\N
394	416	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:26:31+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:26:31.544Z"}	\N
395	417	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:26:31+01:00","features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"]}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:26:31.531Z"}	\N
396	418	pages_components	2	{"id":2,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0}	{"id":2,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0}	\N
397	419	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T01:26:31+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:26:31.518Z"}	\N
398	420	directus_presets	6	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"component_homepage_features_single","id":6}	{"bookmark":null,"role":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null,"collection":"component_homepage_features_single","id":6}	\N
399	421	directus_presets	5	{"id":5,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"pages","search":null,"filters":[{"key":"hide-archived","field":"status","operator":"neq","value":"archived","locked":true}],"layout":"tabular","layout_query":{"tabular":{"page":1}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"pages","search":null,"filters":"[{\\"key\\":\\"hide-archived\\",\\"field\\":\\"status\\",\\"operator\\":\\"neq\\",\\"value\\":\\"archived\\",\\"locked\\":true}]","layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1}}","layout_options":null}	\N
400	422	pages_components	1	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_hero","item":"417f36a0-942d-4aba-a2b2-ea4ebd9af82c","sort":0}	{"id":1,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0"}	\N
401	423	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:27:01+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:27:01.561Z"}	\N
402	424	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:27:01+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:27:01.564Z"}	\N
403	425	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:27:01+01:00","features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"]}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:27:01.559Z"}	\N
404	426	pages_components	2	{"id":2,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0}	{"id":2,"pages_id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","collection":"component_homepage_features","item":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0}	\N
405	427	pages	b3780d74-b1e3-4585-bcdf-d99be92598d0	{"id":"b3780d74-b1e3-4585-bcdf-d99be92598d0","status":"draft","user_created":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_created":"2021-02-27T00:20:43+01:00","user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T01:27:01+01:00","slug":"homepage","meta_seo":"9552db4f-b942-4b12-aeab-1c06f4d85841","components":[1,2]}	{"user_updated":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","date_updated":"2021-02-27T00:27:01.551Z"}	\N
406	428	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:27:13+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":0,"headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","date_updated":"2021-02-27T00:27:13.415Z"}	\N
407	429	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:27:13+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","date_updated":"2021-02-27T00:27:13.420Z"}	\N
409	431	directus_fields	127	{"hidden":false,"interface":"many-to-one","options":{"template":"{{headline}}"},"display":"related-values","display_options":{"template":"{{headline}}"},"readonly":false,"collection":"component_homepage_features","field":"features_2","id":127}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{headline}}"},"display":"related-values","display_options":{"template":"{{headline}}"},"readonly":false,"collection":"component_homepage_features","field":"features_2","id":127}	\N
410	432	directus_relations	34	{"many_collection":"component_homepage_features","many_field":"features_2","many_primary":"id","one_collection":"component_homepage_features_single","one_primary":"id","id":34}	{"many_collection":"component_homepage_features","many_field":"features_2","many_primary":"id","one_collection":"component_homepage_features_single","one_primary":"id","id":34}	\N
411	433	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:28:45+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:28:45.378Z"}	\N
412	434	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:28:45+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:28:45.388Z"}	\N
413	435	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:28:45+01:00","features_2":null,"features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"]}	{"date_updated":"2021-02-27T00:28:45.372Z"}	\N
414	436	directus_fields	128	{"hidden":false,"interface":"many-to-one","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":false,"collection":"component_homepage_features_single","field":"component_feature","id":128}	{"hidden":false,"interface":"many-to-one","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":false,"collection":"component_homepage_features_single","field":"component_feature","id":128}	\N
415	437	directus_fields	129	{"special":"o2m","interface":"one-to-many","collection":"component_homepage_features","field":"features","id":129}	{"special":"o2m","interface":"one-to-many","collection":"component_homepage_features","field":"features","id":129}	\N
416	438	directus_relations	35	{"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_primary":"id","one_field":"features","id":35}	{"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_primary":"id","one_field":"features","id":35}	\N
417	439	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:32:17+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:32:17.200Z"}	\N
418	440	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	{"id":"eae8de8a-f294-4d01-9867-f99d4cbd1eaf","sort":null,"date_created":"2021-02-27T01:26:23+01:00","date_updated":"2021-02-27T01:32:17+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eae8de8a-f294-4d01-9867-f99d4cbd1eaf","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:32:17.209Z"}	\N
419	441	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:32:17+01:00","features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","eae8de8a-f294-4d01-9867-f99d4cbd1eaf"]}	{"date_updated":"2021-02-27T00:32:17.195Z"}	\N
420	442	directus_fields	128	{"id":128,"collection":"component_homepage_features_single","field":"component_feature","special":null,"interface":"many-to-one","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":128,"collection":"component_homepage_features_single","field":"component_feature","special":null,"interface":"many-to-one","options":"{\\"template\\":\\"{{id}}\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{id}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
421	443	directus_relations	35	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
422	444	directus_fields	128	{"id":128,"collection":"component_homepage_features_single","field":"component_feature","special":null,"interface":"many-to-one","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"locked":false,"readonly":false,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"component_feature","hidden":true}	\N
423	445	directus_fields	111	{"id":111,"collection":"component_homepage_features_single","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"id","sort":1}	\N
424	446	directus_fields	112	{"id":112,"collection":"component_homepage_features_single","field":"sort","special":null,"interface":"numeric","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"sort","sort":2}	\N
425	447	directus_fields	113	{"id":113,"collection":"component_homepage_features_single","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":3,"width":"half","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"date_created","sort":3}	\N
426	448	directus_fields	114	{"id":114,"collection":"component_homepage_features_single","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"locked":false,"readonly":true,"hidden":true,"sort":4,"width":"half","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"date_updated","sort":4}	\N
427	449	directus_fields	128	{"id":128,"collection":"component_homepage_features_single","field":"component_feature","special":null,"interface":"many-to-one","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"locked":false,"readonly":false,"hidden":true,"sort":5,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"component_feature","sort":5}	\N
428	450	directus_fields	116	{"id":116,"collection":"component_homepage_features_single","field":"headline","special":null,"interface":"text-input","options":{"trim":true},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":6,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"headline","sort":6}	\N
429	451	directus_fields	117	{"id":117,"collection":"component_homepage_features_single","field":"text","special":null,"interface":"wysiwyg","options":{"toolbar":["italic","underline","link","code","bold","strikethrough"]},"display":"raw","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"text","sort":7}	\N
430	452	directus_fields	115	{"id":115,"collection":"component_homepage_features_single","field":"image","special":null,"interface":"image","options":null,"display":"image","display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":8,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"image","sort":8}	\N
431	453	directus_fields	129	{"id":129,"collection":"component_homepage_features","field":"features","special":["o2m"],"interface":"one-to-many","options":{"fields":["headline","text"],"sortField":"sort"},"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":129,"collection":"component_homepage_features","field":"features","special":"o2m","interface":"one-to-many","options":"{\\"fields\\":[\\"headline\\",\\"text\\"],\\"sortField\\":\\"sort\\"}","display":null,"display_options":null,"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
432	454	directus_relations	35	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
433	455	directus_fields	129	{"id":129,"collection":"component_homepage_features","field":"features","special":["o2m"],"interface":"one-to-many","options":{"fields":["headline","text"],"sortField":"sort"},"display":"related-values","display_options":{"template":"{{headline}} // {{text}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":129,"collection":"component_homepage_features","field":"features","special":"o2m","interface":"one-to-many","options":"{\\"fields\\":[\\"headline\\",\\"text\\"],\\"sortField\\":\\"sort\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{headline}} // {{text}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
434	456	directus_relations	35	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
435	457	directus_fields	129	{"id":129,"collection":"component_homepage_features","field":"features","special":["o2m"],"interface":"one-to-many","options":{"fields":["headline","text"],"sortField":"sort"},"display":"related-values","display_options":{"template":"{{headline}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":129,"collection":"component_homepage_features","field":"features","special":"o2m","interface":"one-to-many","options":"{\\"fields\\":[\\"headline\\",\\"text\\"],\\"sortField\\":\\"sort\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{headline}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
436	458	directus_relations	35	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
437	459	directus_fields	129	{"id":129,"collection":"component_homepage_features","field":"features","special":["o2m"],"interface":"one-to-many","options":{"fields":["headline"],"sortField":"sort"},"display":"related-values","display_options":{"template":"{{headline}}"},"locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"id":129,"collection":"component_homepage_features","field":"features","special":"o2m","interface":"one-to-many","options":"{\\"fields\\":[\\"headline\\"],\\"sortField\\":\\"sort\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{headline}}\\"}","locked":false,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	\N
438	460	directus_relations	35	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
443	465	directus_fields	128	{"id":128,"collection":"component_homepage_features_single","field":"component_feature","special":null,"interface":"many-to-one","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"locked":false,"readonly":false,"hidden":true,"sort":5,"width":"full","group":null,"translations":null,"note":null}	{"id":128,"collection":"component_homepage_features_single","field":"component_feature","special":null,"interface":"many-to-one","options":"{\\"template\\":\\"{{id}}\\"}","display":"related-values","display_options":"{\\"template\\":\\"{{id}}\\"}","locked":false,"readonly":false,"hidden":true,"sort":5,"width":"full","group":null,"translations":null,"note":null}	\N
444	466	directus_relations	35	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	{"id":35,"many_collection":"component_homepage_features_single","many_field":"component_feature","many_primary":"id","one_collection":"component_homepage_features","one_field":"features","one_primary":"id","one_collection_field":null,"one_allowed_collections":null,"junction_field":null}	\N
448	470	directus_permissions	8	{"id":8,"role":null,"collection":"component_homepage_features_single","action":"read","permissions":null,"validation":null,"presets":null,"fields":["date_created","date_updated","headline","id","image","sort","text"],"limit":null}	{"id":8,"role":null,"collection":"component_homepage_features_single","action":"read","permissions":null,"validation":null,"presets":null,"fields":"date_created,date_updated,headline,id,image,sort,text","limit":null}	\N
445	467	component_homepage_features_single	eae8de8a-f294-4d01-9867-f99d4cbd1eaf	{"id":"eae8de8a-f294-4d01-9867-f99d4cbd1eaf","sort":0,"date_created":"2021-02-27T01:26:23+01:00","date_updated":"2021-02-27T01:34:31+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eae8de8a-f294-4d01-9867-f99d4cbd1eaf","sort":0,"headline":"Kleine Auflagen möglich","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:34:31.467Z"}	\N
446	468	component_homepage_features_single	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:34:31+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recylebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","sort":1,"headline":"Nachhaltige Optionen","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:34:31.477Z"}	\N
447	469	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:34:31+01:00","features":["9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","eae8de8a-f294-4d01-9867-f99d4cbd1eaf"]}	{"date_updated":"2021-02-27T00:34:31.463Z"}	\N
449	473	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	{"headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","id":"0de6097b-be71-4806-bd07-40355120ab26"}	{"headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","id":"0de6097b-be71-4806-bd07-40355120ab26"}	\N
450	474	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	{"text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","headline":"Kleine Auflagen möglich","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","id":"eec75cc9-bb77-4300-b2df-4a06a86470a8"}	{"text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","headline":"Kleine Auflagen möglich","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","id":"eec75cc9-bb77-4300-b2df-4a06a86470a8"}	\N
451	475	directus_presets	6	{"id":6,"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"component_homepage_features_single","search":null,"filters":null,"layout":"tabular","layout_query":{"tabular":{"page":1,"sort":null}},"layout_options":null}	{"bookmark":null,"user":"4c402a5f-5c17-4ebd-bff5-474463f54dbe","role":null,"collection":"component_homepage_features_single","search":null,"filters":null,"layout":"tabular","layout_query":"{\\"tabular\\":{\\"page\\":1,\\"sort\\":null}}","layout_options":null}	\N
452	476	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":null,"date_created":"2021-02-27T01:36:16+01:00","date_updated":"2021-02-27T01:36:42+01:00","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"0de6097b-be71-4806-bd07-40355120ab26","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:36:42.475Z"}	\N
453	477	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":null,"date_created":"2021-02-27T01:36:28+01:00","date_updated":"2021-02-27T01:36:42+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:36:42.483Z"}	\N
454	478	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:36:42+01:00","features":["0de6097b-be71-4806-bd07-40355120ab26","eec75cc9-bb77-4300-b2df-4a06a86470a8"]}	{"date_updated":"2021-02-27T00:36:42.470Z"}	\N
455	479	directus_permissions	8	{"id":8,"role":null,"collection":"component_homepage_features_single","action":"read","permissions":null,"validation":null,"presets":null,"fields":["date_created","date_updated","headline","id","image","sort","text"],"limit":null}	{"id":8,"role":null,"collection":"component_homepage_features_single","action":"read","permissions":null,"validation":null,"presets":null,"fields":"date_created,date_updated,headline,id,image,sort,text","limit":null}	\N
456	480	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":0,"date_created":"2021-02-27T01:36:28+01:00","date_updated":"2021-02-27T01:37:30+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":0,"headline":"Kleine Auflagen möglich","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:37:30.823Z"}	\N
457	481	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":1,"date_created":"2021-02-27T01:36:16+01:00","date_updated":"2021-02-27T01:37:30+01:00","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":1,"headline":"Nachhaltige Optionen","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:37:30.832Z"}	\N
458	482	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:37:30+01:00","features":["0de6097b-be71-4806-bd07-40355120ab26","eec75cc9-bb77-4300-b2df-4a06a86470a8"]}	{"date_updated":"2021-02-27T00:37:30.820Z"}	\N
459	483	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":0,"date_created":"2021-02-27T01:36:16+01:00","date_updated":"2021-02-27T01:37:39+01:00","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":0,"headline":"Nachhaltige Optionen","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:37:39.675Z"}	\N
460	484	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":1,"date_created":"2021-02-27T01:36:28+01:00","date_updated":"2021-02-27T01:37:39+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":1,"headline":"Kleine Auflagen möglich","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:37:39.690Z"}	\N
461	485	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:37:39+01:00","features":["0de6097b-be71-4806-bd07-40355120ab26","eec75cc9-bb77-4300-b2df-4a06a86470a8"]}	{"date_updated":"2021-02-27T00:37:39.670Z"}	\N
462	486	directus_fields	112	{"id":112,"collection":"component_homepage_features_single","field":"sort","special":null,"interface":"numeric","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":2,"width":"full","group":null,"translations":null,"note":null}	{"id":112,"collection":"component_homepage_features_single","field":"sort","special":null,"interface":"numeric","options":null,"display":null,"display_options":null,"locked":false,"readonly":false,"hidden":true,"sort":2,"width":"full","group":null,"translations":null,"note":null}	\N
463	487	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":0,"date_created":"2021-02-27T01:36:28+01:00","date_updated":"2021-02-27T01:38:21+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":0,"headline":"Kleine Auflagen möglich","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:38:21.697Z"}	\N
464	488	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":1,"date_created":"2021-02-27T01:36:16+01:00","date_updated":"2021-02-27T01:38:21+01:00","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":1,"headline":"Nachhaltige Optionen","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:38:21.708Z"}	\N
465	489	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:38:21+01:00","features":["0de6097b-be71-4806-bd07-40355120ab26","eec75cc9-bb77-4300-b2df-4a06a86470a8"]}	{"date_updated":"2021-02-27T00:38:21.691Z"}	\N
466	490	component_homepage_features_single	0de6097b-be71-4806-bd07-40355120ab26	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":0,"date_created":"2021-02-27T01:36:16+01:00","date_updated":"2021-02-27T01:38:30+01:00","image":"4da79b14-1c41-4ce6-81cc-83efd0f19682","headline":"Nachhaltige Optionen","text":"<p>Entdecke unsere <a href=\\"/informationen/made-for-recycling/\\">recyclebaren</a> oder bio-basierten Verpackungen f&uuml;r einen sauberen Planeten.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"0de6097b-be71-4806-bd07-40355120ab26","sort":0,"headline":"Nachhaltige Optionen","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:38:30.385Z"}	\N
467	491	component_homepage_features_single	eec75cc9-bb77-4300-b2df-4a06a86470a8	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":1,"date_created":"2021-02-27T01:36:28+01:00","date_updated":"2021-02-27T01:38:30+01:00","image":"206f6912-6bcb-47c3-9872-b129e45c2f97","headline":"Kleine Auflagen möglich","text":"<p>Bedruckte nachhaltige Standbodenbeutel bereits ab einer Auflage von 500 St&uuml;ck.</p>","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc"}	{"id":"eec75cc9-bb77-4300-b2df-4a06a86470a8","sort":1,"headline":"Kleine Auflagen möglich","component_feature":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_updated":"2021-02-27T00:38:30.393Z"}	\N
468	492	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	{"id":"9b48e9a3-038f-4c8c-9512-39f6ea1d03bc","date_created":"2021-02-27T00:57:41+01:00","date_updated":"2021-02-27T01:38:30+01:00","features":["0de6097b-be71-4806-bd07-40355120ab26","eec75cc9-bb77-4300-b2df-4a06a86470a8"]}	{"date_updated":"2021-02-27T00:38:30.381Z"}	\N
469	493	directus_fields	111	{"id":111,"collection":"component_homepage_features_single","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":false,"sort":1,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features_single","field":"id","hidden":false}	\N
470	494	directus_fields	108	{"id":108,"collection":"component_homepage_features","field":"id","special":["uuid"],"interface":"text-input","options":null,"display":null,"display_options":null,"locked":false,"readonly":true,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null}	{"collection":"component_homepage_features","field":"id","hidden":false}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, module_list, collection_list, admin_access, app_access) FROM stdin;
bfa95fd1-37ea-4a66-b630-c349504bf505	Administrator	verified	Initial administrative role with unrestricted App/API access	\N	f	\N	\N	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent) FROM stdin;
mNmbKfzL8T-czc6KSV1m6KQPElmcAT-5MQ0L8d9FgYzSA6gmdtlI3LRWaGK6f6U4	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-03-05 20:25:08.021+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36
sP7jK41juTnAa-AKmZaDRzdgE3N9MRB9D3tF1nX5SbsheKHfQbN8R9tF6Spw432i	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-03-06 00:07:51.863+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36
PY8UF-UaQfVwMGx6bYwou9oCX5kZnvf5aqsk58IfoSJDoiXXyBfwLD0eoLbcVJ5R	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-03-06 00:08:17.31+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36
KuSWx5TzpHRiXI-YyWPBOMA7B9V6uKyDJhxIC1q4rlM61cflgCJCjbCd7O9Au5jA	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-03-06 00:27:20.162+00	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page) FROM stdin;
4c402a5f-5c17-4ebd-bff5-474463f54dbe	Admin	User	firat.oezcan@gmail.com	$argon2i$v=19$m=4096,t=3,p=1$9fc8CjeCh1NvtukYIp+mvQ$37dwfHItvxawWfJQDGdpMMQ0ojegJjQr4r1Q/Kct/kw	\N	\N	\N	\N	\N	en-US	auto	\N	active	bfa95fd1-37ea-4a66-b630-c349504bf505	\N	2021-02-27 00:41:31.834+00	/collections/
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections) FROM stdin;
\.


--
-- Data for Name: page_meta_seo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_meta_seo (id, user_created, date_created, user_updated, date_updated, title, tags, image, description) FROM stdin;
9552db4f-b942-4b12-aeab-1c06f4d85841	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:43.157+00	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:00:45.882+00	Homepage	Packaging,Packiro,Standbodenbeutel	\N	aaaaaaaaaaa
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, status, user_created, date_created, user_updated, date_updated, slug, meta_seo) FROM stdin;
b3780d74-b1e3-4585-bcdf-d99be92598d0	draft	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-26 23:20:43.16+00	4c402a5f-5c17-4ebd-bff5-474463f54dbe	2021-02-27 00:27:01.551+00	homepage	9552db4f-b942-4b12-aeab-1c06f4d85841
\.


--
-- Data for Name: pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_components (id, pages_id, collection, item, sort) FROM stdin;
1	b3780d74-b1e3-4585-bcdf-d99be92598d0	component_homepage_hero	417f36a0-942d-4aba-a2b2-ea4ebd9af82c	0
2	b3780d74-b1e3-4585-bcdf-d99be92598d0	component_homepage_features	9b48e9a3-038f-4c8c-9512-39f6ea1d03bc	0
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 494, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 129, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 11, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 6, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 35, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 470, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_components_id_seq', 2, true);


--
-- Name: buttons buttons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buttons
    ADD CONSTRAINT buttons_pkey PRIMARY KEY (id);


--
-- Name: component_homepage_features component_homepage_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_homepage_features
    ADD CONSTRAINT component_homepage_features_pkey PRIMARY KEY (id);


--
-- Name: component_homepage_features_single component_homepage_features_single_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_homepage_features_single
    ADD CONSTRAINT component_homepage_features_single_pkey PRIMARY KEY (id);


--
-- Name: component_homepage_hero component_homepage_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_homepage_hero
    ADD CONSTRAINT component_homepage_hero_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: page_meta_seo page_meta_seo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_meta_seo
    ADD CONSTRAINT page_meta_seo_pkey PRIMARY KEY (id);


--
-- Name: pages_components pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_components
    ADD CONSTRAINT pages_components_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_fields(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

