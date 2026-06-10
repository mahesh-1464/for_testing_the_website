--
-- PostgreSQL database cluster dump
--

-- Started on 2026-05-27 19:23:05

\restrict b3S1u1SUOJpu7HH8ESMAkOXoGMR2LS12JVB3WlLlW5Q7h652Dt74wSyqsxzq7Ex

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:c6xjVuyXIz+OK6xZgILm7w==$1AXZFmZ39qFaP84AM/zI15CmtdzSNnLr/CsC22Pzje0=:QWnDiCBkP6JXsAftpVv6/dff6vIDzpUC3d7oAGIuSdI=';

--
-- User Configurations
--








\unrestrict b3S1u1SUOJpu7HH8ESMAkOXoGMR2LS12JVB3WlLlW5Q7h652Dt74wSyqsxzq7Ex

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict tzO4Lrvocdtn2V7whYBBUM9JhTIBIm6ZhHoez0eNeTSxs47iNem0Rvjlvl1Rk7D

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-27 19:23:05

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

-- Completed on 2026-05-27 19:23:05

--
-- PostgreSQL database dump complete
--

\unrestrict tzO4Lrvocdtn2V7whYBBUM9JhTIBIm6ZhHoez0eNeTSxs47iNem0Rvjlvl1Rk7D

--
-- Database "dc_hms" dump
--

--
-- PostgreSQL database dump
--

\restrict 77h6xLH55E8byG6CUEjvEqc7UdJA4tvqEysGgXwIVl5E4HcUIirHofvOZY00bDt

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-27 19:23:05

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

--
-- TOC entry 4956 (class 1262 OID 16912)
-- Name: dc_hms; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dc_hms WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE dc_hms OWNER TO postgres;

\unrestrict 77h6xLH55E8byG6CUEjvEqc7UdJA4tvqEysGgXwIVl5E4HcUIirHofvOZY00bDt
\connect dc_hms
\restrict 77h6xLH55E8byG6CUEjvEqc7UdJA4tvqEysGgXwIVl5E4HcUIirHofvOZY00bDt

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

-- Completed on 2026-05-27 19:23:05

--
-- PostgreSQL database dump complete
--

\unrestrict 77h6xLH55E8byG6CUEjvEqc7UdJA4tvqEysGgXwIVl5E4HcUIirHofvOZY00bDt

--
-- Database "mydatabase" dump
--

--
-- PostgreSQL database dump
--

\restrict NmgdivpU4K5OxPfRbipC0fYKad9dgzJWMQbyQhORsuAccikS8czQb8vJvdQtgHU

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-27 19:23:05

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

--
-- TOC entry 5545 (class 1262 OID 16388)
-- Name: mydatabase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mydatabase WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE mydatabase OWNER TO postgres;

\unrestrict NmgdivpU4K5OxPfRbipC0fYKad9dgzJWMQbyQhORsuAccikS8czQb8vJvdQtgHU
\connect mydatabase
\restrict NmgdivpU4K5OxPfRbipC0fYKad9dgzJWMQbyQhORsuAccikS8czQb8vJvdQtgHU

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
-- TOC entry 219 (class 1259 OID 16389)
-- Name: alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alerts (
    alert_id integer NOT NULL,
    title character varying(150) NOT NULL,
    message text NOT NULL,
    severity character varying(20),
    status character varying(20) DEFAULT 'active'::character varying,
    created_by character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT alerts_severity_check CHECK (((severity)::text = ANY (ARRAY[('info'::character varying)::text, ('warning'::character varying)::text, ('critical'::character varying)::text])))
);


ALTER TABLE public.alerts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16400)
-- Name: alerts_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alerts_alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alerts_alert_id_seq OWNER TO postgres;

--
-- TOC entry 5546 (class 0 OID 0)
-- Dependencies: 220
-- Name: alerts_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alerts_alert_id_seq OWNED BY public.alerts.alert_id;


--
-- TOC entry 221 (class 1259 OID 16401)
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    id integer NOT NULL,
    employee_id character varying(50) NOT NULL,
    name character varying(100),
    role character varying(50),
    colo character varying(50),
    hall character varying(50),
    date date NOT NULL,
    shift_start time without time zone,
    shift_end time without time zone,
    clock_in time without time zone,
    clock_out time without time zone,
    gps_lat numeric(10,6),
    gps_long numeric(10,6),
    gps_valid boolean DEFAULT false,
    in_photo text,
    out_photo text,
    in_photo_time time without time zone,
    out_photo_time time without time zone,
    status character varying(20) DEFAULT 'Absent'::character varying,
    remarks text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    task_id integer
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16412)
-- Name: attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.attendance ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16413)
-- Name: client_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_history (
    id integer NOT NULL,
    location_id integer,
    client character varying(50),
    from_location character varying(50),
    to_location character varying(50),
    moved_at date
);


ALTER TABLE public.client_history OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16417)
-- Name: client_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_history_id_seq OWNER TO postgres;

--
-- TOC entry 5547 (class 0 OID 0)
-- Dependencies: 224
-- Name: client_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_history_id_seq OWNED BY public.client_history.id;


--
-- TOC entry 296 (class 1259 OID 25213)
-- Name: consumption_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumption_logs (
    id integer NOT NULL,
    inventory_id integer,
    qty integer,
    issued_to text,
    issued_by text,
    issued_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.consumption_logs OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 25212)
-- Name: consumption_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumption_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consumption_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5548 (class 0 OID 0)
-- Dependencies: 295
-- Name: consumption_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consumption_logs_id_seq OWNED BY public.consumption_logs.id;


--
-- TOC entry 225 (class 1259 OID 16418)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id text NOT NULL,
    name text NOT NULL,
    role text,
    vendor text,
    base_rate numeric NOT NULL,
    ot_rate numeric NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 16950)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    worker_name character varying(100),
    task character varying(200),
    rating integer,
    comment text,
    given_by character varying(100),
    date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16949)
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_id_seq OWNER TO postgres;

--
-- TOC entry 5549 (class 0 OID 0)
-- Dependencies: 283
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
-- TOC entry 226 (class 1259 OID 16436)
-- Name: feedback_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_seq
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_seq OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16437)
-- Name: helper_inventory_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helper_inventory_assignment (
    assignment_id integer NOT NULL,
    emp_id character varying(20) NOT NULL,
    inventory_id integer NOT NULL,
    task_id integer,
    checkout_time timestamp without time zone,
    checkin_time timestamp without time zone
);


ALTER TABLE public.helper_inventory_assignment OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16443)
-- Name: helper_inventory_assignment_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helper_inventory_assignment_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.helper_inventory_assignment_assignment_id_seq OWNER TO postgres;

--
-- TOC entry 5550 (class 0 OID 0)
-- Dependencies: 228
-- Name: helper_inventory_assignment_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helper_inventory_assignment_assignment_id_seq OWNED BY public.helper_inventory_assignment.assignment_id;


--
-- TOC entry 229 (class 1259 OID 16444)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    item_name character varying(100) NOT NULL,
    current_stock integer NOT NULL,
    min_stock_level integer,
    location_id integer,
    category character varying(100),
    updated_at timestamp without time zone
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 41597)
-- Name: inventory_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_history (
    history_id integer NOT NULL,
    inventory_id integer,
    item_name character varying(255),
    quantity_used integer,
    used_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.inventory_history OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 41596)
-- Name: inventory_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_history_history_id_seq OWNER TO postgres;

--
-- TOC entry 5551 (class 0 OID 0)
-- Dependencies: 305
-- Name: inventory_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_history_history_id_seq OWNED BY public.inventory_history.history_id;


--
-- TOC entry 230 (class 1259 OID 16450)
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5552 (class 0 OID 0)
-- Dependencies: 230
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;


--
-- TOC entry 298 (class 1259 OID 25229)
-- Name: inventory_serials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_serials (
    id integer NOT NULL,
    inventory_id integer,
    serial_number text
);


ALTER TABLE public.inventory_serials OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 25228)
-- Name: inventory_serials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_serials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_serials_id_seq OWNER TO postgres;

--
-- TOC entry 5553 (class 0 OID 0)
-- Dependencies: 297
-- Name: inventory_serials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_serials_id_seq OWNED BY public.inventory_serials.id;


--
-- TOC entry 231 (class 1259 OID 16451)
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    invoice_id character varying(30) NOT NULL,
    vendor_id integer,
    service_description text,
    invoice_amount numeric(10,2),
    invoice_date date,
    due_date date,
    status character varying(30),
    settlement_status character varying(30),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    task_id integer
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 41606)
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
    issue_id integer NOT NULL,
    issue_code character varying(20),
    type character varying(50),
    title character varying(255),
    colo character varying(100),
    priority character varying(20),
    status character varying(30) DEFAULT 'Pending'::character varying,
    description text,
    related_task character varying(255),
    related_worker character varying(100),
    supervisor_response text,
    created_by integer,
    assigned_manager integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 41605)
-- Name: issues_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_issue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issues_issue_id_seq OWNER TO postgres;

--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 307
-- Name: issues_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_issue_id_seq OWNED BY public.issues.issue_id;


--
-- TOC entry 232 (class 1259 OID 16458)
-- Name: joining_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joining_access (
    joining_id character varying(20) NOT NULL,
    id_card boolean,
    access_card boolean,
    app_login boolean
);


ALTER TABLE public.joining_access OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16462)
-- Name: joining_audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joining_audit_logs (
    audit_id integer NOT NULL,
    joining_id character varying(20),
    action_type character varying(50),
    field_name character varying(50),
    old_value text,
    new_value text,
    performed_by character varying(50),
    performed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.joining_audit_logs OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16469)
-- Name: joining_audit_logs_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.joining_audit_logs_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.joining_audit_logs_audit_id_seq OWNER TO postgres;

--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 234
-- Name: joining_audit_logs_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.joining_audit_logs_audit_id_seq OWNED BY public.joining_audit_logs.audit_id;


--
-- TOC entry 235 (class 1259 OID 16470)
-- Name: joining_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joining_documents (
    joining_id character varying(20) NOT NULL,
    aadhaar boolean,
    pan boolean,
    medical boolean,
    police boolean,
    contract boolean
);


ALTER TABLE public.joining_documents OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16474)
-- Name: joining_formalities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joining_formalities (
    joining_id character varying(20) NOT NULL,
    employee_id character varying(20),
    name character varying(100),
    role character varying(50),
    vendor character varying(100),
    join_date date,
    status character varying(30),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.joining_formalities OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16479)
-- Name: joining_training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joining_training (
    joining_id character varying(20) NOT NULL,
    safety boolean,
    colo_rules boolean,
    fire boolean,
    hygiene boolean
);


ALTER TABLE public.joining_training OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16483)
-- Name: location_client_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_client_history (
    id integer NOT NULL,
    location_detail_id integer NOT NULL,
    client character varying(50) NOT NULL,
    from_location character varying(50),
    to_location character varying(50),
    moved_at date NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.location_client_history OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16491)
-- Name: location_client_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_client_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_client_history_id_seq OWNER TO postgres;

--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 239
-- Name: location_client_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_client_history_id_seq OWNED BY public.location_client_history.id;


--
-- TOC entry 240 (class 1259 OID 16492)
-- Name: location_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_details (
    id integer NOT NULL,
    location_id integer,
    data_center character varying(50),
    colo character varying(50),
    hall character varying(50),
    zone character varying(50),
    rack_start integer,
    rack_end integer,
    status character varying(30),
    latitude numeric(10,6),
    longitude numeric(10,6),
    movement_notification boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.location_details OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16498)
-- Name: location_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_details_id_seq OWNER TO postgres;

--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 241
-- Name: location_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_details_id_seq OWNED BY public.location_details.id;


--
-- TOC entry 242 (class 1259 OID 16499)
-- Name: location_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_inventory (
    id integer NOT NULL,
    location_detail_id integer NOT NULL,
    item character varying(50) NOT NULL,
    quantity_required integer NOT NULL,
    available boolean DEFAULT true,
    pending_return boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.location_inventory OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16509)
-- Name: location_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 243
-- Name: location_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_inventory_id_seq OWNED BY public.location_inventory.id;


--
-- TOC entry 244 (class 1259 OID 16510)
-- Name: location_racks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_racks (
    id integer NOT NULL,
    location_detail_id integer NOT NULL,
    rack_number integer NOT NULL,
    status character varying(30),
    client character varying(50),
    task_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.location_racks OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16518)
-- Name: location_racks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_racks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_racks_id_seq OWNER TO postgres;

--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 245
-- Name: location_racks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_racks_id_seq OWNED BY public.location_racks.id;


--
-- TOC entry 246 (class 1259 OID 16519)
-- Name: location_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_tasks (
    id integer NOT NULL,
    location_detail_id integer,
    title character varying(100),
    status character varying(30),
    priority character varying(20),
    assigned_to character varying(50),
    gps_valid boolean DEFAULT false,
    rack_number integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.location_tasks OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16525)
-- Name: location_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_tasks_id_seq OWNER TO postgres;

--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 247
-- Name: location_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_tasks_id_seq OWNED BY public.location_tasks.id;


--
-- TOC entry 248 (class 1259 OID 16526)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    data_center character varying(50),
    colo character varying(50),
    hall character varying(50),
    zone character varying(50),
    rack_start integer,
    rack_end integer,
    status character varying(30),
    latitude numeric(10,6),
    longitude numeric(10,6),
    movement_notification boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16532)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 249
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 250 (class 1259 OID 16533)
-- Name: monthly_attendance_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.monthly_attendance_summary AS
 SELECT employee_id,
    name,
    (date_trunc('month'::text, (date)::timestamp with time zone))::date AS month,
    count(DISTINCT date) AS attendance_days,
    round(sum((EXTRACT(epoch FROM (clock_out - clock_in)) / (3600)::numeric)), 2) AS total_hours
   FROM public.attendance a
  WHERE (((status)::text = 'Present'::text) AND (clock_in IS NOT NULL) AND (clock_out IS NOT NULL))
  GROUP BY employee_id, name, (date_trunc('month'::text, (date)::timestamp with time zone));


ALTER VIEW public.monthly_attendance_summary OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16538)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    title text,
    message text,
    recipient_role character varying(30),
    joining_id character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_read boolean DEFAULT false,
    redirect_url text,
    sender_id integer
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16546)
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO postgres;

--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 252
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- TOC entry 310 (class 1259 OID 41621)
-- Name: payment_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_management (
    id integer NOT NULL,
    invoice_id character varying(50),
    vendor character varying(255),
    service character varying(255),
    contract_code character varying(50),
    total_amount numeric(10,2),
    paid_amount numeric(10,2) DEFAULT 0,
    status character varying(30),
    settlement character varying(50),
    due_date date,
    reminders integer DEFAULT 0,
    notes text,
    payment_type character varying(30),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_management OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 41620)
-- Name: payment_management_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_management_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_management_id_seq OWNER TO postgres;

--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 309
-- Name: payment_management_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_management_id_seq OWNED BY public.payment_management.id;


--
-- TOC entry 253 (class 1259 OID 16547)
-- Name: payment_reminders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_reminders (
    reminder_id integer NOT NULL,
    invoice_id character varying(30),
    reminder_count integer DEFAULT 0,
    last_reminder_date date
);


ALTER TABLE public.payment_reminders OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16552)
-- Name: payment_reminders_reminder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_reminders_reminder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_reminders_reminder_id_seq OWNER TO postgres;

--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 254
-- Name: payment_reminders_reminder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_reminders_reminder_id_seq OWNED BY public.payment_reminders.reminder_id;


--
-- TOC entry 255 (class 1259 OID 16553)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    invoice_id character varying(30),
    paid_amount numeric(10,2),
    payment_date date,
    payment_mode character varying(50),
    remarks text
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16559)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 256
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


--
-- TOC entry 257 (class 1259 OID 16560)
-- Name: payroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payroll (
    payroll_id integer NOT NULL,
    employee_id text,
    month date NOT NULL,
    attendance_days integer,
    total_hours numeric,
    overtime_hours numeric,
    gross_salary numeric,
    deductions numeric DEFAULT 0,
    net_salary numeric,
    status text DEFAULT 'Pending'::text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.payroll OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16570)
-- Name: payroll_payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payroll_payroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payroll_payroll_id_seq OWNER TO postgres;

--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 258
-- Name: payroll_payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payroll_payroll_id_seq OWNED BY public.payroll.payroll_id;


--
-- TOC entry 259 (class 1259 OID 16571)
-- Name: purge_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purge_logs (
    log_id character varying(30) NOT NULL,
    policy_id character varying(20),
    action character varying(20) NOT NULL,
    records_affected integer NOT NULL,
    run_date date NOT NULL,
    status character varying(20) NOT NULL,
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT purge_logs_status_check CHECK (((status)::text = ANY (ARRAY[('Success'::character varying)::text, ('Failed'::character varying)::text])))
);


ALTER TABLE public.purge_logs OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16583)
-- Name: purge_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purge_policies (
    policy_id character varying(20) NOT NULL,
    policy_name text NOT NULL,
    module character varying(50) NOT NULL,
    duration_years integer NOT NULL,
    action character varying(20) NOT NULL,
    schedule character varying(20) NOT NULL,
    status character varying(20) DEFAULT 'Active'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT purge_policies_action_check CHECK (((action)::text = ANY (ARRAY[('Archive'::character varying)::text, ('Delete'::character varying)::text]))),
    CONSTRAINT purge_policies_duration_years_check CHECK ((duration_years > 0)),
    CONSTRAINT purge_policies_schedule_check CHECK (((schedule)::text = ANY (ARRAY[('Monthly'::character varying)::text, ('Annual'::character varying)::text, ('Manual'::character varying)::text])))
);


ALTER TABLE public.purge_policies OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16600)
-- Name: racks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.racks (
    id integer NOT NULL,
    location_id integer,
    rack_number integer,
    status character varying(30),
    client character varying(50),
    task_count integer
);


ALTER TABLE public.racks OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16604)
-- Name: racks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.racks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.racks_id_seq OWNER TO postgres;

--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 262
-- Name: racks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.racks_id_seq OWNED BY public.racks.id;


--
-- TOC entry 263 (class 1259 OID 16605)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 16610)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_role_id_seq OWNER TO postgres;

--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 264
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- TOC entry 303 (class 1259 OID 33406)
-- Name: serial_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serial_numbers (
    id integer NOT NULL,
    inventory_id integer,
    serial character varying(100)
);


ALTER TABLE public.serial_numbers OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 33405)
-- Name: serial_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serial_numbers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serial_numbers_id_seq OWNER TO postgres;

--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 302
-- Name: serial_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serial_numbers_id_seq OWNED BY public.serial_numbers.id;


--
-- TOC entry 265 (class 1259 OID 16611)
-- Name: suggestion_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suggestion_audit (
    id integer NOT NULL,
    suggestion_id character varying(20),
    old_status character varying(50),
    new_status character varying(50),
    changed_by character varying(50),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.suggestion_audit OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 16616)
-- Name: suggestion_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suggestion_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suggestion_audit_id_seq OWNER TO postgres;

--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 266
-- Name: suggestion_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suggestion_audit_id_seq OWNED BY public.suggestion_audit.id;


--
-- TOC entry 286 (class 1259 OID 16962)
-- Name: suggestions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suggestions (
    id integer NOT NULL,
    title text,
    description text,
    source character varying(50),
    status character varying(50),
    impact text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.suggestions OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 16961)
-- Name: suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suggestions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suggestions_id_seq OWNER TO postgres;

--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 285
-- Name: suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suggestions_id_seq OWNED BY public.suggestions.id;


--
-- TOC entry 294 (class 1259 OID 25196)
-- Name: task_checklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_checklist (
    id integer NOT NULL,
    task_id integer,
    item text
);


ALTER TABLE public.task_checklist OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 25195)
-- Name: task_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_checklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_checklist_id_seq OWNER TO postgres;

--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 293
-- Name: task_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_checklist_id_seq OWNED BY public.task_checklist.id;


--
-- TOC entry 290 (class 1259 OID 25160)
-- Name: task_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_history (
    id integer NOT NULL,
    task_id integer,
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.task_history OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 25159)
-- Name: task_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_history_id_seq OWNER TO postgres;

--
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 289
-- Name: task_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_history_id_seq OWNED BY public.task_history.id;


--
-- TOC entry 292 (class 1259 OID 25171)
-- Name: task_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_inventory (
    id integer NOT NULL,
    task_id integer,
    item_name text,
    quantity integer
);


ALTER TABLE public.task_inventory OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 25170)
-- Name: task_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 291
-- Name: task_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_inventory_id_seq OWNED BY public.task_inventory.id;


--
-- TOC entry 267 (class 1259 OID 16627)
-- Name: task_workers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_workers (
    task_id integer NOT NULL,
    employee_id character varying(20) NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'Pending'::character varying,
    worker_id character varying(20)
);


ALTER TABLE public.task_workers OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 16633)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    task_id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    location_id integer NOT NULL,
    priority integer,
    status character varying(30) DEFAULT 'Created'::character varying,
    assigned_to_emp_id character varying(20),
    created_by_emp_id character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    scheduled_datetime timestamp without time zone,
    required_inventory jsonb,
    checklist jsonb
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16643)
-- Name: tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_task_id_seq OWNER TO postgres;

--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 269
-- Name: tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_task_id_seq OWNED BY public.tasks.task_id;


--
-- TOC entry 270 (class 1259 OID 16644)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    emp_id character varying(20) NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    role character varying(50),
    phone text,
    location text,
    colo text,
    shift text,
    joined_on date,
    supervisor_id character varying(20),
    new_emp_id integer NOT NULL,
    reset_token character varying(255),
    reset_token_expiry bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 33426)
-- Name: users_new_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_new_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_new_emp_id_seq OWNER TO postgres;

--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 304
-- Name: users_new_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_new_emp_id_seq OWNED BY public.users.new_emp_id;


--
-- TOC entry 271 (class 1259 OID 16655)
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendors (
    vendor_id integer NOT NULL,
    vendor_name character varying(100) NOT NULL,
    contact_info text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.vendors OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 16663)
-- Name: vendors_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendors_vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendors_vendor_id_seq OWNER TO postgres;

--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 272
-- Name: vendors_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendors_vendor_id_seq OWNED BY public.vendors.vendor_id;


--
-- TOC entry 273 (class 1259 OID 16664)
-- Name: worker_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_applications (
    application_id character varying(20) NOT NULL,
    name character varying(100),
    role character varying(50),
    experience_years integer,
    preferred_vendor character varying(100),
    preferred_colo character varying(50),
    phone character varying(15),
    stage character varying(20) DEFAULT 'Applied'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    stage_updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    sla_hours integer DEFAULT 24,
    sla_alert_sent boolean DEFAULT false
);


ALTER TABLE public.worker_applications OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16673)
-- Name: worker_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_feedback (
    feedback_id character varying(20) NOT NULL,
    worker_emp_id character varying(20),
    worker_name character varying(100),
    task_title character varying(150),
    rating integer,
    given_by_role character varying(50),
    given_by_emp_id character varying(20),
    feedback_notes text,
    created_at date DEFAULT CURRENT_DATE,
    CONSTRAINT feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5))),
    CONSTRAINT worker_feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.worker_feedback OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16914)
-- Name: worker_live_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_live_location (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.worker_live_location OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16913)
-- Name: worker_live_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_live_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.worker_live_location_id_seq OWNER TO postgres;

--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 277
-- Name: worker_live_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_live_location_id_seq OWNED BY public.worker_live_location.id;


--
-- TOC entry 299 (class 1259 OID 25261)
-- Name: worker_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_location (
    worker_id integer NOT NULL,
    location_id integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.worker_location OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 16926)
-- Name: worker_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_locations (
    id integer NOT NULL,
    worker_id character varying(50),
    latitude double precision,
    longitude double precision,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.worker_locations OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16925)
-- Name: worker_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.worker_locations_id_seq OWNER TO postgres;

--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 279
-- Name: worker_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_locations_id_seq OWNED BY public.worker_locations.id;


--
-- TOC entry 275 (class 1259 OID 16682)
-- Name: worker_pipeline_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_pipeline_audit (
    audit_id integer NOT NULL,
    application_id character varying(20) NOT NULL,
    old_stage character varying(30),
    new_stage character varying(30),
    changed_by character varying(50),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.worker_pipeline_audit OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 16688)
-- Name: worker_pipeline_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_pipeline_audit_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.worker_pipeline_audit_audit_id_seq OWNER TO postgres;

--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 276
-- Name: worker_pipeline_audit_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_pipeline_audit_audit_id_seq OWNED BY public.worker_pipeline_audit.audit_id;


--
-- TOC entry 288 (class 1259 OID 16974)
-- Name: worker_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_users (
    id integer NOT NULL,
    name text,
    role text,
    email text,
    phone text,
    employeeid text,
    location text,
    colo text,
    shift text,
    joinedon text,
    password text
);


ALTER TABLE public.worker_users OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 16973)
-- Name: worker_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.worker_users_id_seq OWNER TO postgres;

--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 287
-- Name: worker_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_users_id_seq OWNED BY public.worker_users.id;


--
-- TOC entry 301 (class 1259 OID 25274)
-- Name: worker_violations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_violations (
    id integer NOT NULL,
    worker_id integer,
    lat double precision,
    lng double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.worker_violations OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 25273)
-- Name: worker_violations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_violations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.worker_violations_id_seq OWNER TO postgres;

--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 300
-- Name: worker_violations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_violations_id_seq OWNED BY public.worker_violations.id;


--
-- TOC entry 282 (class 1259 OID 16936)
-- Name: workers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workers (
    id integer NOT NULL,
    emp_id character varying(50),
    name character varying(100),
    role character varying(50),
    vendor character varying(100),
    colo character varying(50),
    hall character varying(50),
    status boolean DEFAULT true,
    rating double precision DEFAULT 3,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    supervisor_id integer
);


ALTER TABLE public.workers OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16935)
-- Name: workers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.workers_id_seq OWNER TO postgres;

--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 281
-- Name: workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workers_id_seq OWNED BY public.workers.id;


--
-- TOC entry 5052 (class 2604 OID 16689)
-- Name: alerts alert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts ALTER COLUMN alert_id SET DEFAULT nextval('public.alerts_alert_id_seq'::regclass);


--
-- TOC entry 5058 (class 2604 OID 16690)
-- Name: client_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_history ALTER COLUMN id SET DEFAULT nextval('public.client_history_id_seq'::regclass);


--
-- TOC entry 5135 (class 2604 OID 25216)
-- Name: consumption_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption_logs ALTER COLUMN id SET DEFAULT nextval('public.consumption_logs_id_seq'::regclass);


--
-- TOC entry 5126 (class 2604 OID 16953)
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- TOC entry 5059 (class 2604 OID 16692)
-- Name: helper_inventory_assignment assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_inventory_assignment ALTER COLUMN assignment_id SET DEFAULT nextval('public.helper_inventory_assignment_assignment_id_seq'::regclass);


--
-- TOC entry 5060 (class 2604 OID 16693)
-- Name: inventory inventory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);


--
-- TOC entry 5142 (class 2604 OID 41600)
-- Name: inventory_history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_history ALTER COLUMN history_id SET DEFAULT nextval('public.inventory_history_history_id_seq'::regclass);


--
-- TOC entry 5137 (class 2604 OID 25232)
-- Name: inventory_serials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_serials ALTER COLUMN id SET DEFAULT nextval('public.inventory_serials_id_seq'::regclass);


--
-- TOC entry 5144 (class 2604 OID 41609)
-- Name: issues issue_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues ALTER COLUMN issue_id SET DEFAULT nextval('public.issues_issue_id_seq'::regclass);


--
-- TOC entry 5062 (class 2604 OID 16694)
-- Name: joining_audit_logs audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_audit_logs ALTER COLUMN audit_id SET DEFAULT nextval('public.joining_audit_logs_audit_id_seq'::regclass);


--
-- TOC entry 5065 (class 2604 OID 16695)
-- Name: location_client_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_client_history ALTER COLUMN id SET DEFAULT nextval('public.location_client_history_id_seq'::regclass);


--
-- TOC entry 5067 (class 2604 OID 16696)
-- Name: location_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_details ALTER COLUMN id SET DEFAULT nextval('public.location_details_id_seq'::regclass);


--
-- TOC entry 5070 (class 2604 OID 16697)
-- Name: location_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_inventory ALTER COLUMN id SET DEFAULT nextval('public.location_inventory_id_seq'::regclass);


--
-- TOC entry 5074 (class 2604 OID 16698)
-- Name: location_racks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_racks ALTER COLUMN id SET DEFAULT nextval('public.location_racks_id_seq'::regclass);


--
-- TOC entry 5077 (class 2604 OID 16699)
-- Name: location_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_tasks ALTER COLUMN id SET DEFAULT nextval('public.location_tasks_id_seq'::regclass);


--
-- TOC entry 5080 (class 2604 OID 16700)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 5083 (class 2604 OID 16701)
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- TOC entry 5148 (class 2604 OID 41624)
-- Name: payment_management id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_management ALTER COLUMN id SET DEFAULT nextval('public.payment_management_id_seq'::regclass);


--
-- TOC entry 5086 (class 2604 OID 16702)
-- Name: payment_reminders reminder_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_reminders ALTER COLUMN reminder_id SET DEFAULT nextval('public.payment_reminders_reminder_id_seq'::regclass);


--
-- TOC entry 5088 (class 2604 OID 16703)
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- TOC entry 5089 (class 2604 OID 16704)
-- Name: payroll payroll_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll ALTER COLUMN payroll_id SET DEFAULT nextval('public.payroll_payroll_id_seq'::regclass);


--
-- TOC entry 5096 (class 2604 OID 16705)
-- Name: racks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks ALTER COLUMN id SET DEFAULT nextval('public.racks_id_seq'::regclass);


--
-- TOC entry 5097 (class 2604 OID 16706)
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- TOC entry 5141 (class 2604 OID 33409)
-- Name: serial_numbers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serial_numbers ALTER COLUMN id SET DEFAULT nextval('public.serial_numbers_id_seq'::regclass);


--
-- TOC entry 5098 (class 2604 OID 16707)
-- Name: suggestion_audit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggestion_audit ALTER COLUMN id SET DEFAULT nextval('public.suggestion_audit_id_seq'::regclass);


--
-- TOC entry 5128 (class 2604 OID 16965)
-- Name: suggestions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggestions ALTER COLUMN id SET DEFAULT nextval('public.suggestions_id_seq'::regclass);


--
-- TOC entry 5134 (class 2604 OID 25199)
-- Name: task_checklist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_checklist ALTER COLUMN id SET DEFAULT nextval('public.task_checklist_id_seq'::regclass);


--
-- TOC entry 5131 (class 2604 OID 25163)
-- Name: task_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_history ALTER COLUMN id SET DEFAULT nextval('public.task_history_id_seq'::regclass);


--
-- TOC entry 5133 (class 2604 OID 25174)
-- Name: task_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_inventory ALTER COLUMN id SET DEFAULT nextval('public.task_inventory_id_seq'::regclass);


--
-- TOC entry 5102 (class 2604 OID 16708)
-- Name: tasks task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN task_id SET DEFAULT nextval('public.tasks_task_id_seq'::regclass);


--
-- TOC entry 5107 (class 2604 OID 33427)
-- Name: users new_emp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN new_emp_id SET DEFAULT nextval('public.users_new_emp_id_seq'::regclass);


--
-- TOC entry 5108 (class 2604 OID 16709)
-- Name: vendors vendor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors ALTER COLUMN vendor_id SET DEFAULT nextval('public.vendors_vendor_id_seq'::regclass);


--
-- TOC entry 5118 (class 2604 OID 16917)
-- Name: worker_live_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_live_location ALTER COLUMN id SET DEFAULT nextval('public.worker_live_location_id_seq'::regclass);


--
-- TOC entry 5120 (class 2604 OID 16929)
-- Name: worker_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_locations ALTER COLUMN id SET DEFAULT nextval('public.worker_locations_id_seq'::regclass);


--
-- TOC entry 5116 (class 2604 OID 16710)
-- Name: worker_pipeline_audit audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_pipeline_audit ALTER COLUMN audit_id SET DEFAULT nextval('public.worker_pipeline_audit_audit_id_seq'::regclass);


--
-- TOC entry 5130 (class 2604 OID 16977)
-- Name: worker_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_users ALTER COLUMN id SET DEFAULT nextval('public.worker_users_id_seq'::regclass);


--
-- TOC entry 5139 (class 2604 OID 25277)
-- Name: worker_violations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_violations ALTER COLUMN id SET DEFAULT nextval('public.worker_violations_id_seq'::regclass);


--
-- TOC entry 5122 (class 2604 OID 16939)
-- Name: workers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workers ALTER COLUMN id SET DEFAULT nextval('public.workers_id_seq'::regclass);


--
-- TOC entry 5449 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alerts (alert_id, title, message, severity, status, created_by, created_at) FROM stdin;
1	abc	abc	info	read	manager@test.com	2025-12-26 13:19:23.600329
\.


--
-- TOC entry 5451 (class 0 OID 16401)
-- Dependencies: 221
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (id, employee_id, name, role, colo, hall, date, shift_start, shift_end, clock_in, clock_out, gps_lat, gps_long, gps_valid, in_photo, out_photo, in_photo_time, out_photo_time, status, remarks, created_at, task_id) FROM stdin;
1	EMP001	Ravi Kumar	Helper	COLO A	Hall 1	2025-12-05	09:00:00	18:00:00	09:05:00	18:02:00	\N	\N	t	data:image/jpeg;base64,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	TEST_OUT_IMAGE_BASE64	14:36:49.445452	18:02:00	Present	Slightly late due to traffic	2025-12-26 15:43:20.602312	\N
3	1	Ravi Kumar	Helper	COLO A	Hall 1	2026-04-24	09:00:00	18:00:00	10:19:54.764032	13:31:52.283261	\N	\N	t	\N	\N	13:31:52.283261	\N	Present	On time	2026-04-24 13:27:43.104535	\N
2	1	Ravi Kumar	Helper	COLO A	Hall 1	2026-04-24	09:00:00	18:00:00	13:23:06.728069	13:31:56.839333	\N	\N	t	\N	\N	13:31:56.839333	\N	Present	On time	2026-04-24 13:21:53.00754	\N
\.


--
-- TOC entry 5453 (class 0 OID 16413)
-- Dependencies: 223
-- Data for Name: client_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_history (id, location_id, client, from_location, to_location, moved_at) FROM stdin;
\.


--
-- TOC entry 5525 (class 0 OID 25213)
-- Dependencies: 296
-- Data for Name: consumption_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumption_logs (id, inventory_id, qty, issued_to, issued_by, issued_at) FROM stdin;
\.


--
-- TOC entry 5455 (class 0 OID 16418)
-- Dependencies: 225
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, name, role, vendor, base_rate, ot_rate) FROM stdin;
EMP001	Ravi Kumar	Helper	Delightech Vendor	400	80
\.


--
-- TOC entry 5513 (class 0 OID 16950)
-- Dependencies: 284
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (id, worker_name, task, rating, comment, given_by, date) FROM stdin;
1	Ravi Kumar	Daily Cleaning - COLO A	4	Good work	Site Engineer	2026-04-10
2	Ram	Daily Cleaning - COLO A	3	Good work	Site Engineer	2026-04-10
\.


--
-- TOC entry 5457 (class 0 OID 16437)
-- Dependencies: 227
-- Data for Name: helper_inventory_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helper_inventory_assignment (assignment_id, emp_id, inventory_id, task_id, checkout_time, checkin_time) FROM stdin;
\.


--
-- TOC entry 5459 (class 0 OID 16444)
-- Dependencies: 229
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (inventory_id, item_name, current_stock, min_stock_level, location_id, category, updated_at) FROM stdin;
8	qwer1	24	2	1	General	\N
7	asd	0	1	1	General	\N
9	abc	0	10	1	\N	\N
6	Gloves (Disposable)	0	20	1	Safety	\N
11	Trash Bags	4	10	2	Consumables	\N
5	Trash Bags (Large)	1	10	1	Consumables	\N
10	Floor Cleaner 5L	11	5	1	Cleaning	\N
4	Floor Cleaner 5L	16	5	1	Cleaning Liquid	\N
12	room cleaner	10	2	1	\N	\N
\.


--
-- TOC entry 5535 (class 0 OID 41597)
-- Dependencies: 306
-- Data for Name: inventory_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_history (history_id, inventory_id, item_name, quantity_used, used_at) FROM stdin;
1	4	Floor Cleaner 5L	1	2026-05-07 12:00:03.506729
2	5	Trash Bags (Large)	1	2026-05-07 12:00:55.368644
3	10	Floor Cleaner 5L	1	2026-05-07 12:01:00.409864
\.


--
-- TOC entry 5527 (class 0 OID 25229)
-- Dependencies: 298
-- Data for Name: inventory_serials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_serials (id, inventory_id, serial_number) FROM stdin;
1	4	SN-A-001
2	4	SN-A-002
3	4	SN-A-003
\.


--
-- TOC entry 5461 (class 0 OID 16451)
-- Dependencies: 231
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (invoice_id, vendor_id, service_description, invoice_amount, invoice_date, due_date, status, settlement_status, created_at, task_id) FROM stdin;
INV-2025-002	2	Server Room Deep Cleaning – Quarterly	18000.00	2025-11-28	2025-12-05	Processing	Partially Paid	2026-01-06 14:06:49.610865	\N
INV-2025-001	1	Facility Cleaning – Monthly	12000.00	2025-12-01	2025-12-10	Processing	Partially Paid	2026-01-06 14:06:49.610865	\N
\.


--
-- TOC entry 5537 (class 0 OID 41606)
-- Dependencies: 308
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues (issue_id, issue_code, type, title, colo, priority, status, description, related_task, related_worker, supervisor_response, created_by, assigned_manager, created_at, updated_at) FROM stdin;
1	ISS-101	Inventory	Inventory Not Submitted	COLO B	High	Resolved	Inventory not submitted for 2 days	Monthly Inventory Audit	Ramesh	Awaiting update from team	\N	\N	2026-05-11 12:23:05.765139	2026-05-11 12:23:05.765139
\.


--
-- TOC entry 5462 (class 0 OID 16458)
-- Dependencies: 232
-- Data for Name: joining_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joining_access (joining_id, id_card, access_card, app_login) FROM stdin;
JF-101	f	f	t
JF-102	f	f	f
\.


--
-- TOC entry 5463 (class 0 OID 16462)
-- Dependencies: 233
-- Data for Name: joining_audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joining_audit_logs (audit_id, joining_id, action_type, field_name, old_value, new_value, performed_by, performed_at) FROM stdin;
\.


--
-- TOC entry 5465 (class 0 OID 16470)
-- Dependencies: 235
-- Data for Name: joining_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joining_documents (joining_id, aadhaar, pan, medical, police, contract) FROM stdin;
JF-101	t	f	t	f	t
JF-102	t	f	t	f	t
\.


--
-- TOC entry 5466 (class 0 OID 16474)
-- Dependencies: 236
-- Data for Name: joining_formalities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joining_formalities (joining_id, employee_id, name, role, vendor, join_date, status, created_at) FROM stdin;
JF-104	EMP004	Kiran Rao	Supervisor	MetroClean Services	2025-12-04	Pending	2026-01-09 16:15:00.129358
JF-103	EMP003	Suresh Naik	Helper	CleanPro Pvt Ltd	2025-12-03	In Progress	2026-01-09 16:15:19.869391
JF-102	EMP002	Anita Sharma	Supervisor	MetroClean Services	2025-12-02	Completed	2026-01-09 15:20:39.153317
JF-101	EMP001	Ravi Kumar	Helper	CleanPro Pvt Ltd	2025-12-01	Completed	2026-01-09 15:20:39.153317
JF-105	EMP005	Asha Devi	Helper	CleanPro Pvt Ltd	2025-12-05	Completed	2026-01-09 16:15:00.129358
APP-002	\N	Anita Sharma	Supervisor	TechCare Pvt Ltd	2026-01-12	In Progress	2026-01-12 13:57:14.97704
APP-003	\N	Manoj Singh	Helper	Star Maintenance	2026-01-12	In Progress	2026-01-12 13:58:10.291056
APP-001	\N	Ravi Kumar	Helper	Delightech Vendor Services	2026-01-12	Completed	2026-01-12 13:57:06.219283
\.


--
-- TOC entry 5467 (class 0 OID 16479)
-- Dependencies: 237
-- Data for Name: joining_training; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joining_training (joining_id, safety, colo_rules, fire, hygiene) FROM stdin;
JF-101	t	t	f	f
JF-102	f	f	f	f
\.


--
-- TOC entry 5468 (class 0 OID 16483)
-- Dependencies: 238
-- Data for Name: location_client_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_client_history (id, location_detail_id, client, from_location, to_location, moved_at, created_at) FROM stdin;
1	2	AWS	Rack 5	Rack 10	2025-11-02	2026-01-23 20:58:01.838381
2	2	NETMAGIC	Rack 10	Rack 15	2025-12-01	2026-01-23 20:58:01.838381
\.


--
-- TOC entry 5470 (class 0 OID 16492)
-- Dependencies: 240
-- Data for Name: location_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_details (id, location_id, data_center, colo, hall, zone, rack_start, rack_end, status, latitude, longitude, movement_notification, created_at) FROM stdin;
2	7	DC-01	COLO 4	Cell 3	Zone A	1	20	Active	17.231900	78.193400	f	2026-01-23 20:37:52.164314
\.


--
-- TOC entry 5472 (class 0 OID 16499)
-- Dependencies: 242
-- Data for Name: location_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_inventory (id, location_detail_id, item, quantity_required, available, pending_return, created_at) FROM stdin;
1	2	Floor Cleaner	2	t	f	2026-01-23 20:52:11.515194
2	2	Gloves	4	t	f	2026-01-23 20:52:11.515194
3	2	Dusting Cloth	5	t	f	2026-01-23 20:52:11.515194
4	2	Cable Tie	10	f	t	2026-01-23 20:52:20.316669
\.


--
-- TOC entry 5474 (class 0 OID 16510)
-- Dependencies: 244
-- Data for Name: location_racks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_racks (id, location_detail_id, rack_number, status, client, task_count, created_at) FROM stdin;
1	2	1	Active	Amazon	2	2026-01-23 20:47:54.240946
2	2	2	Busy	NetMagic	3	2026-01-23 20:47:54.240946
3	2	3	Active	Amazon	1	2026-01-23 20:47:54.240946
4	2	4	Maintenance	NetMagic	0	2026-01-23 20:47:54.240946
5	2	5	Active	Amazon	4	2026-01-23 20:47:54.240946
6	2	6	Busy	NetMagic	2	2026-01-23 20:47:54.240946
7	2	7	Active	Amazon	1	2026-01-23 20:47:54.240946
8	2	8	Active	Amazon	0	2026-01-23 20:47:54.240946
9	2	9	Busy	NetMagic	2	2026-01-23 20:47:54.240946
10	2	10	Maintenance	Amazon	0	2026-01-23 20:47:54.240946
\.


--
-- TOC entry 5476 (class 0 OID 16519)
-- Dependencies: 246
-- Data for Name: location_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_tasks (id, location_detail_id, title, status, priority, assigned_to, gps_valid, rack_number, created_at) FROM stdin;
7	2	Rack Dusting	Completed	High	Ravi Kumar	t	5	2026-01-23 20:46:15.789663
8	2	Cable Inspection	Pending	Medium	Anita Sharma	f	8	2026-01-23 20:46:15.789663
\.


--
-- TOC entry 5478 (class 0 OID 16526)
-- Dependencies: 248
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, data_center, colo, hall, zone, rack_start, rack_end, status, latitude, longitude, movement_notification, created_at) FROM stdin;
1	\N	\N	COLO A	Zone 1	\N	\N	Active	\N	\N	f	2026-04-16 11:15:25.87369
2	\N	\N	COLO B	Zone 2	\N	\N	Active	\N	\N	f	2026-04-16 11:15:25.87369
\.


--
-- TOC entry 5480 (class 0 OID 16538)
-- Dependencies: 251
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (notification_id, title, message, recipient_role, joining_id, created_at, is_read, redirect_url, sender_id) FROM stdin;
1	Task Overdue	Task #87 is overdue by 2 days	Admin	TASK-87	2026-01-21 23:23:04.026351	t	\N	\N
2	Attendance Drop	Attendance dropped below 80% in COLO A	Manager	COLO-A	2026-01-21 23:23:04.026351	t	\N	\N
4	Message from Worker	hey\n	SUPERVISOR	\N	2026-04-10 15:47:19.378358	t	\N	\N
6	Message from Worker	hi\n	SUPERVISOR	\N	2026-05-08 16:16:53.981633	t	\N	\N
5	Test Alert	This is test message	SUPERVISOR	\N	2026-04-25 00:56:10.062683	t	\N	\N
3	Inventory Alert	Inventory not submitted for COLO B	Admin	COLO-B	2026-01-21 23:23:04.026351	t	\N	\N
7	Message from Worker	hello\n	SUPERVISOR	\N	2026-05-19 13:46:44.726641	f	\N	\N
8	Message from Worker	hi	SUPERVISOR	\N	2026-05-22 12:56:51.047811	f	\N	\N
\.


--
-- TOC entry 5539 (class 0 OID 41621)
-- Dependencies: 310
-- Data for Name: payment_management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_management (id, invoice_id, vendor, service, contract_code, total_amount, paid_amount, status, settlement, due_date, reminders, notes, payment_type, created_at) FROM stdin;
1	INV-2025-002	TechCare Pvt Ltd	Supervisor Operations – Quarterly	CON-101	18000.00	8000.00	Processing	Partially Paid	2025-12-05	2	Checklist verification pending	Supervisor	2026-05-11 12:55:16.542548
2	INV-2025-001	CleanPro Services	Emergency Call-out	CON-102	10000.00	10000.00	Paid	Completed	2025-11-15	1	Fully settled	Manager	2026-05-11 12:55:16.542548
\.


--
-- TOC entry 5482 (class 0 OID 16547)
-- Dependencies: 253
-- Data for Name: payment_reminders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_reminders (reminder_id, invoice_id, reminder_count, last_reminder_date) FROM stdin;
\.


--
-- TOC entry 5484 (class 0 OID 16553)
-- Dependencies: 255
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, invoice_id, paid_amount, payment_date, payment_mode, remarks) FROM stdin;
1	INV-2025-002	8000.00	\N	\N	\N
2	INV-2025-001	5000.00	\N	Bank Transfer	First partial payment
3	INV-2025-001	5000.00	\N	Bank Transfer	First partial payment
\.


--
-- TOC entry 5486 (class 0 OID 16560)
-- Dependencies: 257
-- Data for Name: payroll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payroll (payroll_id, employee_id, month, attendance_days, total_hours, overtime_hours, gross_salary, deductions, net_salary, status, created_at) FROM stdin;
3	EMP001	2025-12-01	24	192	12	10560	200	10360	Paid	2026-01-08 11:20:00.844137
\.


--
-- TOC entry 5488 (class 0 OID 16571)
-- Dependencies: 259
-- Data for Name: purge_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purge_logs (log_id, policy_id, action, records_affected, run_date, status, message, created_at) FROM stdin;
LOG-101	POL-001	Archive	1243	2025-12-01	Success	Demo purge execution	2026-01-08 13:32:07.172735
LOG-1767939229896	POL-001	Archive	3211	2026-01-09	Success	\N	2026-01-09 11:43:49.911695
LOG-1767942195924	POL-001	Archive	2294	2026-01-09	Success	\N	2026-01-09 12:33:15.925961
LOG-1767942228288	POL-002	Delete	1129	2026-01-09	Success	\N	2026-01-09 12:33:48.289958
LOG-1768198969539	POL-001	Archive	2296	2026-01-12	Success	\N	2026-01-12 11:52:49.551989
LOG-1768928130515	POL-001	Archive	784	2026-01-20	Success	\N	2026-01-20 22:25:30.516059
\.


--
-- TOC entry 5489 (class 0 OID 16583)
-- Dependencies: 260
-- Data for Name: purge_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purge_policies (policy_id, policy_name, module, duration_years, action, schedule, status, created_at) FROM stdin;
POL-001	Archive tasks older than 3 years	Tasks	3	Archive	Monthly	Active	2026-01-08 13:31:55.727414
POL-002	Delete attendance older than 5 years	Attendance	5	Delete	Annual	Active	2026-01-08 13:31:55.727414
\.


--
-- TOC entry 5490 (class 0 OID 16600)
-- Dependencies: 261
-- Data for Name: racks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.racks (id, location_id, rack_number, status, client, task_count) FROM stdin;
\.


--
-- TOC entry 5492 (class 0 OID 16605)
-- Dependencies: 263
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name) FROM stdin;
1	Client
2	Admin
3	manager
4	Supervisor
5	worker
\.


--
-- TOC entry 5532 (class 0 OID 33406)
-- Dependencies: 303
-- Data for Name: serial_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serial_numbers (id, inventory_id, serial) FROM stdin;
\.


--
-- TOC entry 5494 (class 0 OID 16611)
-- Dependencies: 265
-- Data for Name: suggestion_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suggestion_audit (id, suggestion_id, old_status, new_status, changed_by, changed_at) FROM stdin;
\.


--
-- TOC entry 5515 (class 0 OID 16962)
-- Dependencies: 286
-- Data for Name: suggestions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suggestions (id, title, description, source, status, impact, created_at) FROM stdin;
1	Use microfiber cloths	\N	AI Generated	Under Review	Pending	2026-04-10 12:02:25.904693
2	Clean every 3 hours	\N	System	Approved	Better hygiene	2026-04-10 12:02:25.904693
3	Use microfiber cloths	\N	AI Generated	Under Review	Pending	2026-04-10 12:04:58.498292
4	Clean every 3 hours	\N	System	Approved	Better hygiene	2026-04-10 12:04:58.498292
\.


--
-- TOC entry 5523 (class 0 OID 25196)
-- Dependencies: 294
-- Data for Name: task_checklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_checklist (id, task_id, item) FROM stdin;
\.


--
-- TOC entry 5519 (class 0 OID 25160)
-- Dependencies: 290
-- Data for Name: task_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_history (id, task_id, message, created_at) FROM stdin;
\.


--
-- TOC entry 5521 (class 0 OID 25171)
-- Dependencies: 292
-- Data for Name: task_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_inventory (id, task_id, item_name, quantity) FROM stdin;
\.


--
-- TOC entry 5496 (class 0 OID 16627)
-- Dependencies: 267
-- Data for Name: task_workers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_workers (task_id, employee_id, assigned_at, status, worker_id) FROM stdin;
51	emp123	2026-04-23 15:28:52.515158	Assigned	emp123
101	WRK-101	2026-04-23 15:28:52.515158	Completed	EMP1778239444885
102	WRK-101	2026-04-23 15:28:52.515158	Completed	EMP1778239444885
\.


--
-- TOC entry 5497 (class 0 OID 16633)
-- Dependencies: 268
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (task_id, title, description, location_id, priority, status, assigned_to_emp_id, created_by_emp_id, created_at, scheduled_datetime, required_inventory, checklist) FROM stdin;
15	xyz	xyz	1	2	Completed	emp123	EMP002	2025-12-18 18:28:58.403894	2025-12-19 00:00:00	\N	\N
2	Site Inspection	Site Inspection	1	3	Completed	EMP002	EMP002	2025-12-16 12:57:06.182212	2025-01-11 00:00:00	\N	\N
1	Check Equipment	Check server racks	1	2	Completed	WRK-101	EMP001	2026-04-08 11:12:27.048837	2026-04-08 11:12:27.048837	\N	\N
101	Daily Cleaning - Lobby	Cleaning	1	3	In_Progress	EMP002	EMP001	2026-04-19 16:47:12.938807	2026-04-19 16:47:12.938807	\N	\N
102	Garbage Collection	Waste	1	2	Pending	EMP002	EMP001	2026-04-19 16:47:12.938807	2026-04-19 16:47:12.938807	\N	\N
51	adc	adc	1	1	Pending	emp123	EMP001	2026-04-22 18:42:34.158641	2026-04-23 00:00:00	\N	\N
\.


--
-- TOC entry 5499 (class 0 OID 16644)
-- Dependencies: 270
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (emp_id, username, email, password_hash, is_active, created_at, role, phone, location, colo, shift, joined_on, supervisor_id, new_emp_id, reset_token, reset_token_expiry) FROM stdin;
EMP301	Client Manager	manager@client.com	$2b$10$CwTycUXWue0Thq9StjUM0uJ8k7xK5Y8R8Z0wZ7nYp6J2qfX3z9m2a	t	2025-12-24 16:00:20.09832	manager	\N	\N	\N	\N	\N	\N	2	\N	\N
EMP302	Client Supervisor	supervisor@client.com	$2b$10$CwTycUXWue0Thq9StjUM0uJ8k7xK5Y8R8Z0wZ7nYp6J2qfX3z9m2a	t	2025-12-24 16:00:20.09832	Supervisor	\N	\N	\N	\N	\N	\N	3	\N	\N
EMP002	Manager Updated	manager@test.com	$2b$10$qyhIVdZB9MvPP.YSC616k.s4sgie/EWyBKs53JpkQk69RJgyDl98O	t	2025-12-13 17:59:50.914263	manager	\N	\N	\N	\N	\N	\N	4	\N	\N
EMP001	Admin User	admin@test.com	$2b$10$O4W48pYvK/SUlcZ3ZTZLgueflvPW1Jl2w1vyjCn.dvAnIIbAEHCWG	t	2025-12-13 17:22:41.881388	Admin	\N	\N	COLO B	\N	\N	\N	1	\N	\N
emp123	abc	abc@test.com	$2b$10$.MX9xGP0rel1Sjb7HyfQueJrqyZu347htuMUJJL4M6wnS49rKpXeC	t	2025-12-15 17:10:45.780638	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	5	\N	\N
EMP777	Updated Worker	emp777@test.com	$2b$10$UQj.Y/fDqxv1kLCRAUDLCey1uRUjJjjmLsLqrGmE88NwyMiSRrkrC	f	2026-01-02 17:43:47.16741	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	7	\N	\N
WRK-1767356674749	1wd	WRK-1767356674749@company.com	$2b$10$CaA0xVneo.KXjPgLWKnarOHPZiTWt7m8CmE8p9JFPepD7EojaS2ze	t	2026-01-02 17:54:38.388581	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	8	\N	\N
WRK-1767870942451	ram	WRK-1767870942451@company.com	$2b$10$y5Pg23VYPCwB5JsPDRKMduP5ClZERV6NFPmhgR4CHKAlB0TiKbAqW	t	2026-01-08 16:45:53.854215	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	9	\N	\N
WRK-1768927933377	`qwq	WRK-1768927933377@company.com	$2b$10$pdPDdhI6DP71hrCmqJAyPeCnRvhZGJI0v/E01UsHXq4k.am.B9lfy	t	2026-01-20 22:22:28.980726	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	10	\N	\N
WRK-101	Ravi Kumar	wrk101@test.com	dummyhash	t	2026-04-08 11:12:16.01566	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	11	\N	\N
EMP1777530869863	ram	ram@gmail.com	$2b$10$ULBQK9/n67EFvN0LnLAdjOJz7O9xmsAIKDYDLaMxS2/t93B0XWYiq	t	2026-04-30 12:04:29.891793	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	16	\N	\N
EMP1777957903389	test12	kodammahesh1464@gmail.com	$2b$10$mD21eaZy0Y/KNSAM7egznup.XbojZN3Mu/w8sLRCbcT6WipE4VIDO	t	2026-05-05 10:41:43.417195	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	17	9ae3b36d25c03038f1f94d3762b23d4674065a2e06c928d35d7f8a2eb8e33fda	1778046899204
EMP1778239444885	worker	worker@test.com	$2b$10$bV3dV8WkGzXndV1DfCIhG.fpOZeeIAwP0PASf58G3MUJNoJ.HAGHm	t	2026-05-08 16:54:05.031553	worker	\N	\N	COLO A	\N	\N	EMP1778239444885	18	\N	\N
\.


--
-- TOC entry 5500 (class 0 OID 16655)
-- Dependencies: 271
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendors (vendor_id, vendor_name, contact_info, created_at) FROM stdin;
1	Delightech Vendor Services	\N	2026-01-06 14:06:26.05088
2	TechCare Pvt Ltd	\N	2026-01-06 14:06:26.05088
\.


--
-- TOC entry 5502 (class 0 OID 16664)
-- Dependencies: 273
-- Data for Name: worker_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_applications (application_id, name, role, experience_years, preferred_vendor, preferred_colo, phone, stage, created_at, stage_updated_at, sla_hours, sla_alert_sent) FROM stdin;
APP-001	Ravi Kumar	Helper	2	Delightech Vendor Services	COLO A	9876543210	Onboarded	2026-01-10 13:36:13.522841	2026-01-12 14:13:22.597998	24	f
APP-002	Anita Sharma	Supervisor	4	TechCare Pvt Ltd	COLO B	9876011223	Onboarded	2026-01-10 13:36:13.522841	2026-01-12 14:13:22.597998	24	f
APP-003	Manoj Singh	Helper	1	Star Maintenance	COLO A	9876009988	Onboarded	2026-01-10 13:36:13.522841	2026-01-12 14:13:22.597998	24	f
\.


--
-- TOC entry 5503 (class 0 OID 16673)
-- Dependencies: 274
-- Data for Name: worker_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_feedback (feedback_id, worker_emp_id, worker_name, task_title, rating, given_by_role, given_by_emp_id, feedback_notes, created_at) FROM stdin;
FB-102	\N	Anita Sharma	Dusting - Hall 2	5	Site Manager	\N	\N	2025-12-03
FB-101	EMP001	Ravi Kumar	Daily Cleaning - COLO A	4	Site Engineer	\N	\N	2025-12-02
\.


--
-- TOC entry 5507 (class 0 OID 16914)
-- Dependencies: 278
-- Data for Name: worker_live_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_live_location (id, worker_id, latitude, longitude, updated_at) FROM stdin;
1	1	\N	\N	2026-04-20 17:10:58.10045
\.


--
-- TOC entry 5528 (class 0 OID 25261)
-- Dependencies: 299
-- Data for Name: worker_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_location (worker_id, location_id, updated_at) FROM stdin;
1	1	2026-04-20 12:41:59.557617
\.


--
-- TOC entry 5509 (class 0 OID 16926)
-- Dependencies: 280
-- Data for Name: worker_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_locations (id, worker_id, latitude, longitude, updated_at) FROM stdin;
6	EMP1778239444885	17.50657537288674	78.47707182526153	2026-05-27 12:53:37.996107
7	EMP1778239444885	17.50657537288674	78.47707182526153	2026-05-27 12:53:37.996107
8	EMP1778239444885	17.50657537288674	78.47707182526153	2026-05-27 12:53:37.996107
9	EMP1778239444885	17.50657537288674	78.47707182526153	2026-05-27 12:53:37.996107
\.


--
-- TOC entry 5504 (class 0 OID 16682)
-- Dependencies: 275
-- Data for Name: worker_pipeline_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_pipeline_audit (audit_id, application_id, old_stage, new_stage, changed_by, changed_at) FROM stdin;
1	APP-001	Shortlisted	Selected	Admin	2026-01-12 12:46:17.853583
2	APP-002	Shortlisted	Selected	Admin	2026-01-12 12:46:20.197284
3	APP-003	Shortlisted	Selected	Admin	2026-01-12 12:54:26.011974
4	APP-001	Selected	Onboarded	Admin	2026-01-12 13:57:06.200107
5	APP-001	Onboarded	Onboarded	Admin	2026-01-12 13:57:10.869198
6	APP-002	Selected	Onboarded	Admin	2026-01-12 13:57:14.97599
7	APP-002	Onboarded	Onboarded	Admin	2026-01-12 13:57:55.595957
8	APP-003	Selected	Onboarded	Admin	2026-01-12 13:58:10.28775
\.


--
-- TOC entry 5517 (class 0 OID 16974)
-- Dependencies: 288
-- Data for Name: worker_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_users (id, name, role, email, phone, employeeid, location, colo, shift, joinedon, password) FROM stdin;
\.


--
-- TOC entry 5530 (class 0 OID 25274)
-- Dependencies: 301
-- Data for Name: worker_violations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_violations (id, worker_id, lat, lng, created_at) FROM stdin;
1	1	0	0	2026-04-22 17:37:10.269257
2	1	0	0	2026-04-22 17:37:18.253069
3	1	0	0	2026-04-22 17:37:26.247501
4	1	0	0	2026-04-22 17:37:34.677005
5	1	0	0	2026-04-22 17:37:46.427142
6	1	0	0	2026-04-22 17:37:50.248522
7	1	0	0	2026-04-22 17:39:10.861124
8	1	0	0	2026-04-22 17:39:18.858294
9	1	0	0	2026-04-22 17:41:14.892342
10	1	0	0	2026-04-22 17:41:28.963524
11	1	0	0	2026-04-22 17:41:30.879783
12	1	0	0	2026-04-22 17:41:38.894221
13	1	0	0	2026-04-22 17:41:55.36225
14	1	0	0	2026-04-22 17:42:02.884483
15	1	0	0	2026-04-22 17:45:52.118529
16	1	0	0	2026-04-22 17:47:40.064699
17	1	0	0	2026-04-22 17:47:50.948359
18	1	0	0	2026-04-22 17:47:56.68267
19	1	0	0	2026-04-22 17:48:04.681427
20	1	0	0	2026-04-22 17:48:12.676517
21	1	0	0	2026-04-22 17:48:20.686659
22	1	0	0	2026-04-22 17:48:28.68771
23	1	0	0	2026-04-22 17:48:36.695861
24	1	0	0	2026-04-22 17:48:44.051751
25	1	0	0	2026-04-22 17:48:51.613375
26	1	0	0	2026-04-22 17:48:59.90841
27	1	0	0	2026-04-22 17:49:07.598866
28	1	0	0	2026-04-22 17:49:19.423716
29	1	0	0	2026-04-22 17:49:23.603948
30	1	0	0	2026-04-22 17:49:39.475596
31	1	0	0	2026-04-22 17:49:47.613273
32	1	0	0	2026-04-22 17:49:55.603531
33	1	0	0	2026-04-22 17:50:03.604548
34	1	0	0	2026-04-22 17:50:11.612129
35	1	0	0	2026-04-22 17:50:19.60947
36	1	0	0	2026-04-22 17:50:27.603269
37	1	0	0	2026-04-22 17:50:35.606298
38	1	0	0	2026-04-22 17:50:43.605721
39	1	0	0	2026-04-22 17:50:51.698051
40	1	0	0	2026-04-22 17:53:50.798533
41	1	0	0	2026-04-22 17:53:55.678623
42	1	0	0	2026-04-22 17:54:03.683295
43	1	0	0	2026-04-22 17:54:11.681632
44	1	0	0	2026-04-22 17:54:19.704886
45	1	0	0	2026-04-22 17:54:27.675213
46	1	0	0	2026-04-22 17:54:35.691951
47	1	0	0	2026-04-22 17:54:43.685324
48	1	0	0	2026-04-22 17:55:21.709387
49	1	0	0	2026-04-22 17:56:21.701959
50	1	0	0	2026-04-22 17:57:21.702365
51	1	0	0	2026-04-22 17:58:21.715333
52	1	0	0	2026-04-22 17:59:21.722208
53	1	0	0	2026-04-22 17:59:26.90939
54	1	0	0	2026-04-22 17:59:31.601324
55	1	0	0	2026-04-22 17:59:39.614924
56	1	0	0	2026-04-22 18:20:57.071101
57	1	0	0	2026-04-23 13:42:27.49417
58	1	0	0	2026-04-23 13:42:39.570745
59	1	0	0	2026-04-23 13:42:43.442076
60	1	0	0	2026-04-23 13:42:54.180787
61	1	0	0	2026-04-23 13:42:59.456016
62	1	0	0	2026-04-23 13:43:11.114049
63	1	0	0	2026-04-23 13:43:15.47078
64	1	0	0	2026-04-23 13:43:25.567282
65	1	0	0	2026-04-23 13:49:32.882717
66	1	0	0	2026-04-23 13:49:40.833408
67	1	0	0	2026-04-25 14:04:07.920062
68	1	0	0	2026-04-25 14:04:15.908193
69	1	0	0	2026-04-25 15:21:00.470647
\.


--
-- TOC entry 5511 (class 0 OID 16936)
-- Dependencies: 282
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workers (id, emp_id, name, role, vendor, colo, hall, status, rating, created_at, supervisor_id) FROM stdin;
2	WRK-102	Suresh Das	Supervisor	Delightech	COLO A	Hall 2	t	3.8	2026-04-08 11:03:03.741105	\N
1	WRK-101	Ravi Kumar	Helper	Delightech	COLO A	Hall 1	t	4.2	2026-04-08 11:03:03.741105	2
\.


--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 220
-- Name: alerts_alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alerts_alert_id_seq', 1, true);


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 222
-- Name: attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_id_seq', 3, true);


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 224
-- Name: client_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_history_id_seq', 1, false);


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 295
-- Name: consumption_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumption_logs_id_seq', 1, false);


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 283
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 2, true);


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 226
-- Name: feedback_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_seq', 101, false);


--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 228
-- Name: helper_inventory_assignment_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helper_inventory_assignment_assignment_id_seq', 1, false);


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 305
-- Name: inventory_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_history_history_id_seq', 3, true);


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 230
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 12, true);


--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 297
-- Name: inventory_serials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_serials_id_seq', 3, true);


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 307
-- Name: issues_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_issue_id_seq', 1, true);


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 234
-- Name: joining_audit_logs_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.joining_audit_logs_audit_id_seq', 1, false);


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 239
-- Name: location_client_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_client_history_id_seq', 2, true);


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 241
-- Name: location_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_details_id_seq', 2, true);


--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 243
-- Name: location_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_inventory_id_seq', 4, true);


--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 245
-- Name: location_racks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_racks_id_seq', 10, true);


--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 247
-- Name: location_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_tasks_id_seq', 8, true);


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 249
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 2, true);


--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 252
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 8, true);


--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 309
-- Name: payment_management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_management_id_seq', 2, true);


--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 254
-- Name: payment_reminders_reminder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_reminders_reminder_id_seq', 1, false);


--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 256
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 3, true);


--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 258
-- Name: payroll_payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payroll_payroll_id_seq', 3, true);


--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 262
-- Name: racks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.racks_id_seq', 1, false);


--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 264
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 5, true);


--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 302
-- Name: serial_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serial_numbers_id_seq', 1, false);


--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 266
-- Name: suggestion_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suggestion_audit_id_seq', 1, false);


--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 285
-- Name: suggestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suggestions_id_seq', 4, true);


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 293
-- Name: task_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_checklist_id_seq', 1, false);


--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 289
-- Name: task_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_history_id_seq', 1, false);


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 291
-- Name: task_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_inventory_id_seq', 1, false);


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 269
-- Name: tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_task_id_seq', 51, true);


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 304
-- Name: users_new_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_new_emp_id_seq', 19, true);


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 272
-- Name: vendors_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendors_vendor_id_seq', 2, true);


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 277
-- Name: worker_live_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_live_location_id_seq', 7, true);


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 279
-- Name: worker_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_locations_id_seq', 9, true);


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 276
-- Name: worker_pipeline_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_pipeline_audit_audit_id_seq', 8, true);


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 287
-- Name: worker_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_users_id_seq', 1, false);


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 300
-- Name: worker_violations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_violations_id_seq', 69, true);


--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 281
-- Name: workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workers_id_seq', 2, true);


--
-- TOC entry 5160 (class 2606 OID 16712)
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 5162 (class 2606 OID 16714)
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- TOC entry 5164 (class 2606 OID 16716)
-- Name: client_history client_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_history
    ADD CONSTRAINT client_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5256 (class 2606 OID 25222)
-- Name: consumption_logs consumption_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption_logs
    ADD CONSTRAINT consumption_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 5166 (class 2606 OID 16718)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 5244 (class 2606 OID 16959)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 5168 (class 2606 OID 16722)
-- Name: helper_inventory_assignment helper_inventory_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_inventory_assignment
    ADD CONSTRAINT helper_inventory_assignment_pkey PRIMARY KEY (assignment_id);


--
-- TOC entry 5266 (class 2606 OID 41604)
-- Name: inventory_history inventory_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_history
    ADD CONSTRAINT inventory_history_pkey PRIMARY KEY (history_id);


--
-- TOC entry 5170 (class 2606 OID 16724)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 5258 (class 2606 OID 25237)
-- Name: inventory_serials inventory_serials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_serials
    ADD CONSTRAINT inventory_serials_pkey PRIMARY KEY (id);


--
-- TOC entry 5172 (class 2606 OID 16726)
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (invoice_id);


--
-- TOC entry 5268 (class 2606 OID 41619)
-- Name: issues issues_issue_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_issue_code_key UNIQUE (issue_code);


--
-- TOC entry 5270 (class 2606 OID 41617)
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (issue_id);


--
-- TOC entry 5174 (class 2606 OID 16728)
-- Name: joining_access joining_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_access
    ADD CONSTRAINT joining_access_pkey PRIMARY KEY (joining_id);


--
-- TOC entry 5176 (class 2606 OID 16730)
-- Name: joining_audit_logs joining_audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_audit_logs
    ADD CONSTRAINT joining_audit_logs_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 5178 (class 2606 OID 16732)
-- Name: joining_documents joining_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_documents
    ADD CONSTRAINT joining_documents_pkey PRIMARY KEY (joining_id);


--
-- TOC entry 5180 (class 2606 OID 16734)
-- Name: joining_formalities joining_formalities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_formalities
    ADD CONSTRAINT joining_formalities_pkey PRIMARY KEY (joining_id);


--
-- TOC entry 5182 (class 2606 OID 16736)
-- Name: joining_training joining_training_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_training
    ADD CONSTRAINT joining_training_pkey PRIMARY KEY (joining_id);


--
-- TOC entry 5184 (class 2606 OID 16738)
-- Name: location_client_history location_client_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_client_history
    ADD CONSTRAINT location_client_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5186 (class 2606 OID 16740)
-- Name: location_details location_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_details
    ADD CONSTRAINT location_details_pkey PRIMARY KEY (id);


--
-- TOC entry 5188 (class 2606 OID 16742)
-- Name: location_inventory location_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_inventory
    ADD CONSTRAINT location_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 5190 (class 2606 OID 16744)
-- Name: location_racks location_racks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_racks
    ADD CONSTRAINT location_racks_pkey PRIMARY KEY (id);


--
-- TOC entry 5192 (class 2606 OID 16746)
-- Name: location_tasks location_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_tasks
    ADD CONSTRAINT location_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 5194 (class 2606 OID 16748)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 5196 (class 2606 OID 16750)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 5272 (class 2606 OID 41632)
-- Name: payment_management payment_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_management
    ADD CONSTRAINT payment_management_pkey PRIMARY KEY (id);


--
-- TOC entry 5198 (class 2606 OID 16752)
-- Name: payment_reminders payment_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_reminders
    ADD CONSTRAINT payment_reminders_pkey PRIMARY KEY (reminder_id);


--
-- TOC entry 5200 (class 2606 OID 16754)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 5202 (class 2606 OID 16756)
-- Name: payroll payroll_employee_month_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_employee_month_unique UNIQUE (employee_id, month);


--
-- TOC entry 5204 (class 2606 OID 16758)
-- Name: payroll payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (payroll_id);


--
-- TOC entry 5206 (class 2606 OID 16760)
-- Name: payroll payroll_unique_employee_month; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_unique_employee_month UNIQUE (employee_id, month);


--
-- TOC entry 5220 (class 2606 OID 16762)
-- Name: task_workers pk_task_worker; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_workers
    ADD CONSTRAINT pk_task_worker PRIMARY KEY (task_id, employee_id);


--
-- TOC entry 5208 (class 2606 OID 16764)
-- Name: purge_logs purge_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purge_logs
    ADD CONSTRAINT purge_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5210 (class 2606 OID 16766)
-- Name: purge_policies purge_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purge_policies
    ADD CONSTRAINT purge_policies_pkey PRIMARY KEY (policy_id);


--
-- TOC entry 5212 (class 2606 OID 16768)
-- Name: racks racks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks
    ADD CONSTRAINT racks_pkey PRIMARY KEY (id);


--
-- TOC entry 5214 (class 2606 OID 16770)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5216 (class 2606 OID 16772)
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- TOC entry 5264 (class 2606 OID 33412)
-- Name: serial_numbers serial_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serial_numbers
    ADD CONSTRAINT serial_numbers_pkey PRIMARY KEY (id);


--
-- TOC entry 5218 (class 2606 OID 16774)
-- Name: suggestion_audit suggestion_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggestion_audit
    ADD CONSTRAINT suggestion_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 5246 (class 2606 OID 16971)
-- Name: suggestions suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggestions
    ADD CONSTRAINT suggestions_pkey PRIMARY KEY (id);


--
-- TOC entry 5254 (class 2606 OID 25204)
-- Name: task_checklist task_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_checklist
    ADD CONSTRAINT task_checklist_pkey PRIMARY KEY (id);


--
-- TOC entry 5250 (class 2606 OID 25169)
-- Name: task_history task_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5252 (class 2606 OID 25179)
-- Name: task_inventory task_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_inventory
    ADD CONSTRAINT task_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 5222 (class 2606 OID 16778)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (task_id);


--
-- TOC entry 5236 (class 2606 OID 16924)
-- Name: worker_live_location unique_worker; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_live_location
    ADD CONSTRAINT unique_worker UNIQUE (worker_id);


--
-- TOC entry 5224 (class 2606 OID 16780)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5226 (class 2606 OID 16782)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 5228 (class 2606 OID 16784)
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (vendor_id);


--
-- TOC entry 5230 (class 2606 OID 16786)
-- Name: worker_applications worker_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_applications
    ADD CONSTRAINT worker_applications_pkey PRIMARY KEY (application_id);


--
-- TOC entry 5232 (class 2606 OID 16788)
-- Name: worker_feedback worker_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_feedback
    ADD CONSTRAINT worker_feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 5238 (class 2606 OID 16922)
-- Name: worker_live_location worker_live_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_live_location
    ADD CONSTRAINT worker_live_location_pkey PRIMARY KEY (id);


--
-- TOC entry 5260 (class 2606 OID 25267)
-- Name: worker_location worker_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_location
    ADD CONSTRAINT worker_location_pkey PRIMARY KEY (worker_id);


--
-- TOC entry 5240 (class 2606 OID 16933)
-- Name: worker_locations worker_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_locations
    ADD CONSTRAINT worker_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 5234 (class 2606 OID 16790)
-- Name: worker_pipeline_audit worker_pipeline_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_pipeline_audit
    ADD CONSTRAINT worker_pipeline_audit_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 5248 (class 2606 OID 16982)
-- Name: worker_users worker_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_users
    ADD CONSTRAINT worker_users_pkey PRIMARY KEY (id);


--
-- TOC entry 5262 (class 2606 OID 25281)
-- Name: worker_violations worker_violations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_violations
    ADD CONSTRAINT worker_violations_pkey PRIMARY KEY (id);


--
-- TOC entry 5242 (class 2606 OID 16945)
-- Name: workers workers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);


--
-- TOC entry 5273 (class 2606 OID 16791)
-- Name: client_history client_history_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_history
    ADD CONSTRAINT client_history_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 5297 (class 2606 OID 25223)
-- Name: consumption_logs consumption_logs_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption_logs
    ADD CONSTRAINT consumption_logs_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id);


--
-- TOC entry 5274 (class 2606 OID 16796)
-- Name: helper_inventory_assignment fk_assign_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_inventory_assignment
    ADD CONSTRAINT fk_assign_inventory FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id);


--
-- TOC entry 5275 (class 2606 OID 16801)
-- Name: helper_inventory_assignment fk_assign_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_inventory_assignment
    ADD CONSTRAINT fk_assign_task FOREIGN KEY (task_id) REFERENCES public.tasks(task_id);


--
-- TOC entry 5276 (class 2606 OID 16806)
-- Name: helper_inventory_assignment fk_assign_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_inventory_assignment
    ADD CONSTRAINT fk_assign_user FOREIGN KEY (emp_id) REFERENCES public.users(emp_id);


--
-- TOC entry 5281 (class 2606 OID 16821)
-- Name: location_client_history fk_location_client_history_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_client_history
    ADD CONSTRAINT fk_location_client_history_location FOREIGN KEY (location_detail_id) REFERENCES public.location_details(id) ON DELETE CASCADE;


--
-- TOC entry 5282 (class 2606 OID 16826)
-- Name: location_inventory fk_location_inventory_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_inventory
    ADD CONSTRAINT fk_location_inventory_location FOREIGN KEY (location_detail_id) REFERENCES public.location_details(id) ON DELETE CASCADE;


--
-- TOC entry 5283 (class 2606 OID 16831)
-- Name: location_racks fk_location_racks_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_racks
    ADD CONSTRAINT fk_location_racks_location FOREIGN KEY (location_detail_id) REFERENCES public.location_details(id) ON DELETE CASCADE;


--
-- TOC entry 5290 (class 2606 OID 16836)
-- Name: task_workers fk_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_workers
    ADD CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES public.tasks(task_id) ON DELETE CASCADE;


--
-- TOC entry 5292 (class 2606 OID 16841)
-- Name: tasks fk_task_assigned_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_task_assigned_user FOREIGN KEY (assigned_to_emp_id) REFERENCES public.users(emp_id);


--
-- TOC entry 5293 (class 2606 OID 16846)
-- Name: tasks fk_task_created_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_task_created_user FOREIGN KEY (created_by_emp_id) REFERENCES public.users(emp_id);


--
-- TOC entry 5294 (class 2606 OID 16851)
-- Name: users fk_users_role_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role_name FOREIGN KEY (role) REFERENCES public.roles(role_name);


--
-- TOC entry 5291 (class 2606 OID 16856)
-- Name: task_workers fk_worker; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_workers
    ADD CONSTRAINT fk_worker FOREIGN KEY (employee_id) REFERENCES public.users(emp_id) ON DELETE CASCADE;


--
-- TOC entry 5298 (class 2606 OID 25238)
-- Name: inventory_serials inventory_serials_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_serials
    ADD CONSTRAINT inventory_serials_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id);


--
-- TOC entry 5277 (class 2606 OID 16861)
-- Name: invoices invoices_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(vendor_id);


--
-- TOC entry 5278 (class 2606 OID 16866)
-- Name: joining_access joining_access_joining_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_access
    ADD CONSTRAINT joining_access_joining_id_fkey FOREIGN KEY (joining_id) REFERENCES public.joining_formalities(joining_id);


--
-- TOC entry 5279 (class 2606 OID 16871)
-- Name: joining_documents joining_documents_joining_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_documents
    ADD CONSTRAINT joining_documents_joining_id_fkey FOREIGN KEY (joining_id) REFERENCES public.joining_formalities(joining_id);


--
-- TOC entry 5280 (class 2606 OID 16876)
-- Name: joining_training joining_training_joining_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joining_training
    ADD CONSTRAINT joining_training_joining_id_fkey FOREIGN KEY (joining_id) REFERENCES public.joining_formalities(joining_id);


--
-- TOC entry 5284 (class 2606 OID 16881)
-- Name: location_tasks location_tasks_location_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_tasks
    ADD CONSTRAINT location_tasks_location_detail_id_fkey FOREIGN KEY (location_detail_id) REFERENCES public.location_details(id) ON DELETE CASCADE;


--
-- TOC entry 5285 (class 2606 OID 16886)
-- Name: payment_reminders payment_reminders_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_reminders
    ADD CONSTRAINT payment_reminders_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(invoice_id);


--
-- TOC entry 5286 (class 2606 OID 16891)
-- Name: payments payments_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(invoice_id);


--
-- TOC entry 5287 (class 2606 OID 16896)
-- Name: payroll payroll_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 5288 (class 2606 OID 16901)
-- Name: purge_logs purge_logs_policy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purge_logs
    ADD CONSTRAINT purge_logs_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES public.purge_policies(policy_id) ON DELETE CASCADE;


--
-- TOC entry 5289 (class 2606 OID 16906)
-- Name: racks racks_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks
    ADD CONSTRAINT racks_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 5300 (class 2606 OID 33413)
-- Name: serial_numbers serial_numbers_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serial_numbers
    ADD CONSTRAINT serial_numbers_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id);


--
-- TOC entry 5296 (class 2606 OID 25205)
-- Name: task_checklist task_checklist_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_checklist
    ADD CONSTRAINT task_checklist_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tasks(task_id) ON DELETE CASCADE;


--
-- TOC entry 5295 (class 2606 OID 25180)
-- Name: task_inventory task_inventory_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_inventory
    ADD CONSTRAINT task_inventory_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tasks(task_id) ON DELETE CASCADE;


--
-- TOC entry 5299 (class 2606 OID 25268)
-- Name: worker_location worker_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_location
    ADD CONSTRAINT worker_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


-- Completed on 2026-05-27 19:23:05

--
-- PostgreSQL database dump complete
--

\unrestrict NmgdivpU4K5OxPfRbipC0fYKad9dgzJWMQbyQhORsuAccikS8czQb8vJvdQtgHU

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict GqzVTPN4cVW5OpUjeOYG9vJaRsYYdKlbsDfHcyICb7wCa8om2x46WiuPDNnF2Jj

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-27 19:23:05

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

-- Completed on 2026-05-27 19:23:05

--
-- PostgreSQL database dump complete
--

\unrestrict GqzVTPN4cVW5OpUjeOYG9vJaRsYYdKlbsDfHcyICb7wCa8om2x46WiuPDNnF2Jj

--
-- Database "tracking" dump
--

--
-- PostgreSQL database dump
--

\restrict 1xK2CmiUcelzRuurytywvGat5noNX8PLG6imIzn1ItQSr3GcCgVdBjGdB3N08p4

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-27 19:23:06

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

--
-- TOC entry 4979 (class 1262 OID 41634)
-- Name: tracking; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tracking WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE tracking OWNER TO postgres;

\unrestrict 1xK2CmiUcelzRuurytywvGat5noNX8PLG6imIzn1ItQSr3GcCgVdBjGdB3N08p4
\connect tracking
\restrict 1xK2CmiUcelzRuurytywvGat5noNX8PLG6imIzn1ItQSr3GcCgVdBjGdB3N08p4

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
-- TOC entry 219 (class 1259 OID 41635)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    employee_id character varying(50),
    name character varying(100),
    role character varying(20)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41639)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 220
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- TOC entry 221 (class 1259 OID 41640)
-- Name: presence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presence (
    id integer NOT NULL,
    employee_id character varying(50),
    lat double precision,
    lng double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20)
);


ALTER TABLE public.presence OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 41645)
-- Name: presence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presence_id_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 222
-- Name: presence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presence_id_seq OWNED BY public.presence.id;


--
-- TOC entry 4814 (class 2604 OID 41646)
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 41647)
-- Name: presence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presence ALTER COLUMN id SET DEFAULT nextval('public.presence_id_seq'::regclass);


--
-- TOC entry 4970 (class 0 OID 41635)
-- Dependencies: 219
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, employee_id, name, role) FROM stdin;
13	E001	Admin	admin
14	E002	Worker1	employee
15	E003	Mom	employee
16	E004	Worker2	employee
\.


--
-- TOC entry 4972 (class 0 OID 41640)
-- Dependencies: 221
-- Data for Name: presence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presence (id, employee_id, lat, lng, created_at, status) FROM stdin;
1	E002	17.452005	78.417381	2026-04-23 16:56:47.944942	\N
2	E002	17.451752567912493	78.41738333606807	2026-04-23 16:57:41.163976	\N
3	E002	17.45179123333333	78.41737539999998	2026-04-23 17:12:06.176936	\N
4	E002	17.45179123333333	78.41737539999998	2026-04-23 17:12:29.483608	\N
5	E002	17.4517377	78.4173522	2026-04-23 17:14:14.544943	\N
6	E002	17.45179961480687	78.41737790665236	2026-04-23 17:32:41.76618	\N
7	E002	17.45179961480687	78.41737790665236	2026-04-23 17:32:41.81274	\N
8	E002	17.451752567912493	78.41738333606807	2026-04-23 17:32:53.177507	\N
9	E002	17.451752567912493	78.41738333606807	2026-04-23 17:32:53.184255	\N
10	E002	17.451814651704144	78.41738082068733	2026-04-23 17:33:04.612946	\N
11	E002	17.451814651704144	78.41738082068733	2026-04-23 17:33:04.629962	\N
12	E002	17.451765715538198	78.41738104156946	2026-04-23 17:34:58.274838	\N
13	E002	17.451765715538198	78.41738104156946	2026-04-23 17:34:58.292734	\N
14	E002	17.4517110526132	78.417374812085	2026-04-23 17:35:25.031012	\N
15	E002	17.4517110526132	78.417374812085	2026-04-23 17:35:25.055609	\N
16	E002	17.451686145924693	78.4173822573598	2026-04-23 17:36:23.393541	\N
17	E002	17.451686145924693	78.4173822573598	2026-04-23 17:36:23.413705	\N
18	E002	17.45167343005922	78.41738192485195	2026-04-23 17:37:23.139285	\N
19	E002	17.45167343005922	78.41738192485195	2026-04-23 17:37:23.156329	\N
20	E002	17.451686145924693	78.4173822573598	2026-04-23 17:37:34.178569	\N
21	E002	17.451686145924693	78.4173822573598	2026-04-23 17:37:34.194501	\N
22	E002	17.451675286832618	78.41739559688627	2026-04-23 17:37:45.242987	\N
23	E002	17.451675286832618	78.41739559688627	2026-04-23 17:37:45.259046	\N
24	E002	17.45162554803688	78.41738525625907	2026-04-23 17:38:08.326377	\N
25	E002	17.45162554803688	78.41738525625907	2026-04-23 17:38:08.343667	\N
26	E002	17.451744121138706	78.41738278367178	2026-04-23 17:39:37.653921	\N
27	E002	17.451744121138706	78.41738278367178	2026-04-23 17:39:37.67265	\N
28	E002	17.45182607216061	78.41738712812953	2026-04-23 17:40:15.716538	\N
29	E002	17.45182607216061	78.41738712812953	2026-04-23 17:40:15.730218	\N
30	E002	17.451675286832618	78.41739559688627	2026-04-23 17:41:36.804528	\N
31	E002	17.451675286832618	78.41739559688627	2026-04-23 17:41:36.818082	\N
32	E002	17.451744059184684	78.41737494525287	2026-04-23 17:42:13.644549	\N
33	E002	17.451744059184684	78.41737494525287	2026-04-23 17:42:13.660979	\N
34	E002	17.45180882849179	78.41737559814378	2026-04-23 17:43:17.984469	\N
35	E002	17.45180882849179	78.41737559814378	2026-04-23 17:43:17.99316	\N
36	E002	17.45180392790872	78.4173751122654	2026-04-23 17:43:33.413601	\N
37	E002	17.45179123333333	78.41737539999998	2026-04-23 17:44:16.441073	\N
38	E002	17.45179123333333	78.41737539999998	2026-04-23 17:44:16.454841	\N
39	E002	17.45179123333333	78.41737539999998	2026-04-23 17:44:22.337364	\N
40	E002	17.45179123333333	78.41737539999998	2026-04-23 17:44:24.602423	\N
41	E002	17.451735675	78.41737492499999	2026-04-23 17:44:27.629426	\N
42	E002	17.451735675	78.41737492499999	2026-04-23 17:44:27.644887	\N
43	E002	17.451735675	78.41737492499999	2026-04-23 17:44:29.119639	\N
44	E002	17.45160375	78.417385	2026-04-23 17:45:35.484879	\N
45	E002	17.451569	78.4173735	2026-04-23 17:46:06.434862	\N
46	E002	17.4517377	78.4173522	2026-04-23 17:54:06.414855	\N
47	E002	17.451708	78.417366	2026-04-23 17:56:14.024616	\N
48	E002	17.4516385	78.4173965	2026-04-23 17:56:29.849894	\N
49	E002	17.451732228215768	78.41738666836896	2026-04-23 17:56:39.094174	\N
50	E002	17.4516385	78.4173965	2026-04-23 17:58:43.276916	\N
51	E002	17.4516881	78.41737434999999	2026-04-23 17:59:02.007062	\N
52	E002	17.4517377	78.4173522	2026-04-23 17:59:48.771577	\N
53	E002	17.4516881	78.41737434999999	2026-04-23 17:59:58.311537	\N
54	E002	17.451828279828327	78.41738739291846	2026-04-23 18:01:00.578133	\N
55	E002	17.45187769355819	78.4173845041021	2026-04-23 18:02:02.902081	\N
56	E002	17.451818	78.41738699999999	2026-04-23 18:03:05.855708	\N
57	E002	17.45187769355819	78.4173845041021	2026-04-23 18:04:38.986008	\N
58	E002	17.451801829747797	78.41737711628686	2026-04-23 18:05:25.892053	\N
59	E002	17.45181128357138	78.41737654054558	2026-04-23 18:05:41.491452	\N
60	E002	17.45186526772749	78.41737030445324	2026-04-23 18:06:12.521735	\N
61	E002	17.451734199264855	78.41737425215437	2026-04-23 18:06:43.950197	\N
62	E002	17.451734199264855	78.41737425215437	2026-04-23 18:07:08.667029	\N
63	E002	17.4516881	78.41737434999999	2026-04-23 18:07:47.899024	\N
64	E002	17.4516385	78.4173965	2026-04-23 18:09:26.534146	\N
65	E002	17.451734199264855	78.41737425215437	2026-04-23 18:09:46.814932	\N
66	E002	17.451863518439865	78.41736740796405	2026-04-23 18:10:02.273348	\N
67	E002	17.451797900347476	78.41737599352865	2026-04-23 18:11:51.111283	\N
68	E002	17.451704494173804	78.41737528854884	2026-04-23 18:12:02.188618	\N
69	E002	17.451704494173804	78.41737528854884	2026-04-23 18:12:26.462691	\N
70	E002	17.4516385	78.4173965	2026-04-23 18:14:23.457818	\N
71	E002	17.4516385	78.4173965	2026-04-23 18:14:24.969325	\N
72	E002	17.4516385	78.4173965	2026-04-23 18:15:56.26144	\N
73	E002	17.4516385	78.4173965	2026-04-23 18:16:23.666061	\N
74	E002	17.4516385	78.4173965	2026-04-23 18:16:23.66664	\N
75	E002	17.451675286832618	78.41739559688627	2026-04-23 18:20:54.585431	\N
76	E002	17.451944	78.417389	2026-04-23 18:23:00.762502	\N
77	E002	17.451675286832618	78.41739559688627	2026-04-23 18:23:32.635575	\N
78	E002	17.451704494173804	78.41737528854884	2026-04-23 18:24:18.585496	\N
79	E002	17.451744059184684	78.41737494525287	2026-04-23 18:25:23.444414	\N
80	E002	17.4517473834193	78.41738683522945	2026-04-23 18:26:13.327011	\N
81	E002	17.451675286832618	78.41739559688627	2026-04-23 18:27:27.556425	\N
82	E002	17.451675286832618	78.41739559688627	2026-04-23 18:28:39.130952	\N
83	E002	17.451675286832618	78.41739559688627	2026-04-23 18:28:39.15224	\N
84	E002	17.451675286832618	78.41739559688627	2026-04-23 18:29:22.377559	\N
85	E002	17.451675286832618	78.41739559688627	2026-04-23 18:29:22.378348	\N
86	E002	17.451675286832618	78.41739559688627	2026-04-23 18:29:23.22213	\N
87	E002	17.4517473834193	78.41738683522945	2026-04-23 18:30:01.07352	\N
88	E002	17.451763434696584	78.41738745999515	2026-04-23 18:30:44.052014	\N
89	E002	17.451750162761485	78.41738674605683	2026-04-23 18:32:49.562047	\N
90	E002	17.4517473834193	78.41738683522945	2026-04-23 18:33:31.192704	\N
91	E002	17.451687508007538	78.41739451173652	2026-04-23 18:33:43.416594	outside
92	E002	17.451687508007538	78.41739451173652	2026-04-23 18:33:58.761374	outside
93	E002	17.451750162761485	78.41738674605683	2026-04-23 18:34:23.30842	outside
94	E002	17.451750162761485	78.41738674605683	2026-04-23 18:34:44.472161	outside
95	E002	17.451750162761485	78.41738674605683	2026-04-23 18:34:47.68847	outside
96	E002	17.451675286832618	78.41739559688627	2026-04-23 18:39:44.77564	outside
97	E002	17.451675286832618	78.41739559688627	2026-04-23 18:39:44.800526	outside
98	E002	17.451675286832618	78.41739559688627	2026-04-23 18:39:49.244819	outside
99	E002	17.451750162761485	78.41738674605683	2026-04-23 18:39:56.616976	outside
100	E002	17.451750162761485	78.41738674605683	2026-04-23 18:40:18.949681	outside
101	E002	17.451746076445517	78.41737541902438	2026-04-23 18:40:33.966077	outside
102	E002	17.451746076445517	78.41737541902438	2026-04-23 18:40:34.045765	outside
103	E002	17.451808158219468	78.41737593286112	2026-04-23 18:41:01.60615	outside
104	E002	17.451832584374056	78.41738387154533	2026-04-23 18:42:32.128713	outside
105	E002	17.45175213290399	78.41738697980256	2026-04-23 18:42:58.959967	outside
106	E002	17.4517473834193	78.41738683522945	2026-04-23 18:44:03.802829	outside
107	E002	17.5065008	78.4772565	2026-04-23 18:56:11.340007	outside
108	E002	17.5064915	78.4772709	2026-04-23 18:56:16.843165	outside
109	E002	17.50661	78.4772324	2026-04-23 18:56:30.405888	outside
110	E002	17.506489	78.4772603	2026-04-23 18:56:36.375478	outside
111	E002	17.5065488	78.477287	2026-04-23 18:56:42.33454	outside
112	E002	17.5064899	78.4772708	2026-04-23 18:56:48.395044	outside
113	E002	17.5064773	78.4772717	2026-04-23 18:56:54.461967	outside
114	E002	17.5065905	78.4773323	2026-04-23 18:57:00.050549	outside
115	E002	17.5065385	78.477311	2026-04-23 18:57:06.376955	outside
116	E002	17.5065752	78.477309	2026-04-23 18:57:12.065313	outside
117	E002	17.5065137	78.4772829	2026-04-23 18:57:18.15064	outside
118	E002	17.5065571	78.4773264	2026-04-23 18:57:23.911281	outside
119	E002	17.5065234	78.4772865	2026-04-23 18:57:29.659712	outside
120	E002	17.5065937	78.4773597	2026-04-23 18:57:35.377227	outside
121	E002	17.5064738	78.4772676	2026-04-23 18:57:41.31122	outside
122	E002	17.5065344	78.4772496	2026-04-23 18:57:47.372037	outside
123	E002	17.5064806	78.4772737	2026-04-23 18:57:53.336464	outside
124	E002	17.5064889	78.4772948	2026-04-23 18:57:59.10728	outside
125	E002	17.5065058	78.4772807	2026-04-23 18:58:05.278446	outside
126	E002	17.5065244	78.477263	2026-04-23 18:58:11.316525	outside
127	E002	17.5065901	78.4773019	2026-04-23 18:58:17.086169	outside
128	E002	17.5065712	78.4772187	2026-04-23 18:58:22.701574	outside
129	E002	17.5064932	78.4772685	2026-04-23 18:58:28.652097	outside
130	E002	17.5066165	78.4772218	2026-04-23 18:58:34.315911	outside
131	E002	17.5064875	78.4772761	2026-04-23 18:58:40.31214	outside
132	E002	17.5066065	78.4772802	2026-04-23 18:58:46.47444	outside
133	E002	17.5065178	78.4773008	2026-04-23 18:58:52.542465	outside
134	E002	17.506527	78.477275	2026-04-23 18:58:54.664474	outside
135	E002	17.5064659	78.477269	2026-04-23 18:58:55.742572	outside
136	E002	17.5064226	78.4773827	2026-04-23 18:58:56.697881	outside
137	E002	17.5064831	78.4773155	2026-04-23 18:58:57.671631	outside
138	E002	17.5064868	78.4773069	2026-04-23 18:58:58.677966	outside
139	E002	17.5064905	78.4773029	2026-04-23 18:58:59.98678	outside
140	E002	17.5064945	78.4773024	2026-04-23 18:59:00.732669	outside
141	E002	17.5065007	78.4773022	2026-04-23 18:59:01.90699	outside
142	E002	17.5065051	78.4772995	2026-04-23 18:59:02.803271	outside
143	E002	17.5065077	78.4772967	2026-04-23 18:59:03.81338	outside
144	E002	17.5065096	78.4772945	2026-04-23 18:59:04.700871	outside
145	E002	17.506508	78.4772953	2026-04-23 18:59:06.032192	outside
146	E002	17.5065122	78.4772942	2026-04-23 18:59:06.696579	outside
147	E002	17.5065129	78.4772943	2026-04-23 18:59:07.905329	outside
148	E002	17.5065172	78.4772962	2026-04-23 18:59:08.908763	outside
149	E002	17.5065216	78.4772947	2026-04-23 18:59:09.818266	outside
150	E002	17.5065214	78.4772954	2026-04-23 18:59:10.782855	outside
151	E002	17.5065241	78.4772941	2026-04-23 18:59:11.792547	outside
152	E002	17.506525	78.4772941	2026-04-23 18:59:12.699349	outside
153	E002	17.5065252	78.4772939	2026-04-23 18:59:14.048423	outside
154	E002	17.5065254	78.4772937	2026-04-23 18:59:14.993275	outside
155	E002	17.5065254	78.4772936	2026-04-23 18:59:15.946045	outside
156	E002	17.5064967	78.4772692	2026-04-23 19:00:30.695364	outside
157	E002	17.5065804	78.4772923	2026-04-23 19:00:48.052814	outside
158	E002	17.5065403	78.4772934	2026-04-23 19:01:00.526669	outside
159	E002	17.5065382	78.477296	2026-04-23 19:01:06.617893	outside
160	E002	17.5064985	78.4772638	2026-04-23 19:01:12.451341	outside
161	E002	17.5064905	78.4772603	2026-04-23 19:01:24.84635	outside
162	E002	17.5065312	78.4772189	2026-04-23 19:01:30.540546	outside
163	E002	17.5064835	78.4772635	2026-04-23 19:01:36.383303	outside
164	E002	17.5064748	78.4771363	2026-04-23 19:01:41.931585	inside
165	E002	17.5066065	78.4773613	2026-04-23 19:01:47.662073	outside
166	E002	17.5064998	78.4772903	2026-04-23 19:01:53.643842	outside
167	E002	17.5065078	78.4772593	2026-04-23 19:01:57.892382	outside
168	E002	17.5065141	78.4772272	2026-04-23 19:01:58.7116	outside
169	E002	17.5065019	78.4772253	2026-04-23 19:01:59.736854	outside
170	E002	17.5065124	78.47721	2026-04-23 19:02:00.68099	outside
171	E002	17.5065323	78.4772479	2026-04-23 19:02:02.03181	outside
172	E002	17.5065394	78.4772292	2026-04-23 19:02:03.070517	outside
173	E002	17.5065529	78.4772147	2026-04-23 19:02:03.94951	outside
174	E002	17.5065644	78.4771943	2026-04-23 19:02:04.682655	outside
175	E002	17.5065547	78.4772046	2026-04-23 19:02:05.689641	outside
176	E002	17.5065573	78.4772006	2026-04-23 19:02:06.818112	outside
177	E002	17.5063444	78.4773664	2026-04-23 19:10:58.561449	inside
178	E002	17.506345	78.4773641	2026-04-23 19:10:58.637584	inside
179	E002	17.5063452	78.4773625	2026-04-23 19:10:59.897894	inside
180	E002	17.5063445	78.4773613	2026-04-23 19:11:00.667272	inside
181	E002	17.506344	78.4773592	2026-04-23 19:11:01.663786	inside
182	E002	17.5063428	78.477357	2026-04-23 19:11:02.708921	inside
183	E002	17.506342	78.4773555	2026-04-23 19:11:03.721811	inside
184	E002	17.5063409	78.4773533	2026-04-23 19:11:04.693654	inside
185	E002	17.5063406	78.4773513	2026-04-23 19:11:05.673495	inside
186	E002	17.5063404	78.4773465	2026-04-23 19:11:06.658712	inside
187	E002	17.5063406	78.4773432	2026-04-23 19:11:07.654308	inside
188	E002	17.5063406	78.4773408	2026-04-23 19:11:08.88322	inside
189	E002	17.5063404	78.47734	2026-04-23 19:11:09.811723	inside
190	E002	17.5063403	78.4773397	2026-04-23 19:11:10.761846	inside
191	E002	17.5063403	78.4773396	2026-04-23 19:11:11.727885	inside
192	E002	17.5063322	78.477337	2026-04-23 19:11:12.694244	inside
193	E002	17.5063555	78.477325	2026-04-23 19:11:18.770117	inside
194	E002	17.5063582	78.4773325	2026-04-23 19:11:19.653808	inside
195	E002	17.5063569	78.4773439	2026-04-23 19:11:20.676435	inside
196	E002	17.506353	78.4773535	2026-04-23 19:11:22.026426	inside
197	E002	17.50635	78.4773623	2026-04-23 19:11:22.703364	inside
198	E002	17.506349	78.4773701	2026-04-23 19:11:24.088129	outside
199	E002	17.5063544	78.4773695	2026-04-23 19:11:24.912364	outside
200	E002	17.5063576	78.4773619	2026-04-23 19:11:25.852572	inside
201	E002	17.5063545	78.4773585	2026-04-23 19:11:26.821555	inside
202	E002	17.5063494	78.4773621	2026-04-23 19:11:27.793503	inside
203	E002	17.5063469	78.4773685	2026-04-23 19:11:28.678716	outside
204	E002	17.5063446	78.4773725	2026-04-23 19:11:30.038822	outside
205	E002	17.5063423	78.4773747	2026-04-23 19:11:30.929124	outside
206	E002	17.5063392	78.4773757	2026-04-23 19:11:31.935886	outside
207	E002	17.5063368	78.4773756	2026-04-23 19:11:32.924584	outside
208	E002	17.5063356	78.4773733	2026-04-23 19:11:33.853606	outside
209	E002	17.5063352	78.4773703	2026-04-23 19:11:34.804539	outside
210	E002	17.5063341	78.4773668	2026-04-23 19:11:35.731068	inside
211	E002	17.5063329	78.477364	2026-04-23 19:11:36.699944	inside
212	E002	17.506334	78.4773637	2026-04-23 19:11:37.678573	inside
213	E002	17.5063343	78.4773637	2026-04-23 19:11:38.972538	inside
214	E002	17.5063344	78.4773637	2026-04-23 19:11:39.998244	inside
215	E002	17.5063345	78.4773636	2026-04-23 19:11:40.929589	inside
216	E002	17.5063339	78.4773607	2026-04-23 19:11:41.803413	inside
217	E002	17.5063305	78.4773618	2026-04-23 19:11:42.853684	inside
218	E002	17.5063297	78.4773692	2026-04-23 19:11:43.739561	outside
219	E002	17.5063319	78.4773763	2026-04-23 19:11:44.706482	outside
220	E002	17.506333	78.477382	2026-04-23 19:11:45.729963	outside
221	E002	17.5063327	78.4773826	2026-04-23 19:11:46.929016	outside
222	E002	17.5063326	78.4773825	2026-04-23 19:11:47.694456	outside
223	E002	17.5063347	78.47738	2026-04-23 19:11:48.845306	outside
224	E002	17.5063374	78.4773751	2026-04-23 19:11:49.813701	outside
225	E002	17.5063387	78.4773729	2026-04-23 19:11:50.655302	outside
226	E002	17.5063406	78.477368	2026-04-23 19:11:51.73278	outside
227	E002	17.5063428	78.4773611	2026-04-23 19:11:52.688337	inside
228	E002	17.5063452	78.4773519	2026-04-23 19:11:53.739079	inside
229	E002	17.5063469	78.47734	2026-04-23 19:11:54.957416	inside
230	E002	17.506349	78.4773288	2026-04-23 19:11:55.907723	inside
231	E002	17.5063521	78.4773171	2026-04-23 19:11:56.862139	inside
232	E002	17.506354	78.4773017	2026-04-23 19:11:57.745125	inside
233	E002	17.5063549	78.47729	2026-04-23 19:11:58.778127	inside
234	E002	17.5063572	78.4772793	2026-04-23 19:11:59.721179	inside
235	E002	17.5063607	78.4772698	2026-04-23 19:12:01.008585	inside
236	E002	17.5063666	78.4772616	2026-04-23 19:12:01.660701	inside
237	E002	17.5063722	78.4772552	2026-04-23 19:12:02.680806	inside
238	E002	17.5063776	78.47725	2026-04-23 19:12:03.950586	inside
239	E002	17.5063841	78.4772451	2026-04-23 19:12:04.840111	inside
240	E002	17.5063911	78.4772375	2026-04-23 19:12:05.721825	inside
241	E002	17.5064004	78.4772325	2026-04-23 19:12:06.781332	inside
242	E002	17.5064061	78.4772213	2026-04-23 19:12:07.724011	inside
243	E002	17.5064097	78.4772208	2026-04-23 19:12:08.044851	inside
244	E002	17.5064158	78.4772214	2026-04-23 19:12:08.691097	inside
245	E002	17.5064231	78.4772238	2026-04-23 19:12:09.496702	inside
246	E002	17.5064249	78.4772253	2026-04-23 19:12:09.674499	inside
247	E002	17.5064286	78.4772266	2026-04-23 19:12:10.286706	inside
248	E002	17.5064326	78.4772276	2026-04-23 19:12:10.786443	inside
249	E002	17.5064401	78.4772275	2026-04-23 19:12:11.96634	inside
250	E002	17.5064452	78.4772277	2026-04-23 19:12:12.528732	inside
251	E002	17.5064501	78.4772311	2026-04-23 19:12:12.702869	inside
252	E002	17.5064527	78.4772324	2026-04-23 19:12:13.242274	inside
253	E002	17.5064565	78.4772335	2026-04-23 19:12:13.798047	inside
254	E002	17.5064618	78.4772353	2026-04-23 19:12:14.472555	inside
255	E002	17.506464	78.4772364	2026-04-23 19:12:14.748067	inside
256	E002	17.5064663	78.4772373	2026-04-23 19:12:14.968071	inside
257	E002	17.5064714	78.4772382	2026-04-23 19:12:15.649024	inside
258	E002	17.5064755	78.4772397	2026-04-23 19:12:16.368611	inside
259	E002	17.506479	78.4772417	2026-04-23 19:12:16.678557	inside
260	E002	17.5064797	78.4772422	2026-04-23 19:12:16.733375	inside
261	E002	17.5064862	78.4772453	2026-04-23 19:12:17.708665	inside
262	E002	17.5064887	78.4772462	2026-04-23 19:12:17.970179	inside
263	E002	17.5064897	78.4772463	2026-04-23 19:12:18.562376	inside
264	E002	17.5064979	78.4772484	2026-04-23 19:12:18.615376	inside
265	E002	17.5065005	78.4772483	2026-04-23 19:12:19.236052	inside
266	E002	17.5065033	78.4772485	2026-04-23 19:12:19.76327	inside
267	E002	17.5065047	78.4772486	2026-04-23 19:12:19.89616	inside
268	E002	17.5065102	78.4772488	2026-04-23 19:12:20.54099	inside
269	E002	17.5065122	78.477249	2026-04-23 19:12:20.681746	inside
270	E002	17.5065161	78.477249	2026-04-23 19:12:21.173881	inside
271	E002	17.506522	78.4772496	2026-04-23 19:12:21.800045	inside
272	E002	17.5065277	78.4772502	2026-04-23 19:12:22.300168	inside
273	E002	17.5065311	78.4772505	2026-04-23 19:12:22.773989	inside
274	E002	17.5065333	78.4772509	2026-04-23 19:12:22.921503	inside
275	E002	17.5065394	78.4772512	2026-04-23 19:12:23.754926	inside
276	E002	17.5065407	78.4772512	2026-04-23 19:12:23.787724	inside
277	E002	17.5065451	78.4772508	2026-04-23 19:12:24.198314	inside
278	E002	17.5065468	78.4772505	2026-04-23 19:12:24.346828	inside
279	E002	17.5065523	78.477255	2026-04-23 19:12:24.680351	inside
280	E002	17.5065516	78.4772553	2026-04-23 19:12:24.79877	inside
281	E002	17.5065579	78.4772556	2026-04-23 19:12:25.653733	inside
282	E002	17.5065591	78.4772555	2026-04-23 19:12:25.715131	inside
283	E002	17.5065651	78.4772557	2026-04-23 19:12:26.694778	inside
284	E002	17.5065676	78.4772559	2026-04-23 19:12:26.757624	inside
285	E002	17.5065744	78.4772562	2026-04-23 19:12:27.658936	inside
286	E002	17.5065757	78.4772558	2026-04-23 19:12:28.070183	inside
287	E002	17.5065788	78.4772566	2026-04-23 19:12:28.738461	inside
288	E002	17.5065828	78.477258	2026-04-23 19:12:29.701795	inside
289	E002	17.5065841	78.4772578	2026-04-23 19:12:29.978478	inside
290	E002	17.5065826	78.4772608	2026-04-23 19:12:30.78862	inside
291	E002	17.506585	78.4772607	2026-04-23 19:12:31.734996	inside
292	E002	17.5065866	78.47726	2026-04-23 19:12:32.685141	inside
293	E002	17.5065901	78.4772583	2026-04-23 19:12:33.976694	inside
294	E002	17.5065898	78.4772557	2026-04-23 19:12:34.343777	inside
295	E002	17.5065886	78.4772549	2026-04-23 19:12:34.660919	inside
296	E002	17.5065875	78.4772548	2026-04-23 19:12:34.916231	inside
297	E002	17.506585	78.477255	2026-04-23 19:12:35.612977	inside
298	E002	17.5065834	78.4772549	2026-04-23 19:12:36.002426	inside
299	E002	17.5065787	78.477256	2026-04-23 19:12:36.165213	inside
300	E002	17.5065779	78.4772562	2026-04-23 19:12:36.684009	inside
301	E002	17.5065774	78.4772563	2026-04-23 19:12:36.793855	inside
302	E002	17.506573	78.4772556	2026-04-23 19:12:37.427504	inside
303	E002	17.5065716	78.4772556	2026-04-23 19:12:37.680255	inside
304	E002	17.506569	78.4772558	2026-04-23 19:12:38.133718	inside
305	E002	17.5065614	78.4772561	2026-04-23 19:12:38.688484	inside
306	E002	17.506555	78.477257	2026-04-23 19:12:39.264363	inside
307	E002	17.5065518	78.4772576	2026-04-23 19:12:39.728845	inside
308	E002	17.5065504	78.4772579	2026-04-23 19:12:39.838702	inside
309	E002	17.5065445	78.4772582	2026-04-23 19:12:40.692463	inside
310	E002	17.5065442	78.4772583	2026-04-23 19:12:40.73338	inside
311	E002	17.5065405	78.4772587	2026-04-23 19:12:41.359306	inside
312	E002	17.506538	78.4772594	2026-04-23 19:12:41.692217	inside
313	E002	17.5065377	78.4772596	2026-04-23 19:12:41.775114	inside
314	E002	17.5065364	78.4772604	2026-04-23 19:12:42.12937	inside
315	E002	17.5065236	78.4772631	2026-04-23 19:12:42.531765	inside
316	E002	17.5065233	78.4772634	2026-04-23 19:12:42.674841	inside
317	E002	17.5065214	78.4772642	2026-04-23 19:12:43.281483	inside
318	E002	17.506518	78.4772644	2026-04-23 19:12:43.763273	inside
319	E002	17.5065192	78.4772645	2026-04-23 19:12:43.821181	inside
320	E002	17.5065149	78.4772642	2026-04-23 19:12:44.541831	inside
321	E002	17.5065148	78.4772639	2026-04-23 19:12:44.714395	inside
322	E002	17.5065129	78.4772635	2026-04-23 19:12:44.999677	inside
323	E002	17.5065073	78.4772634	2026-04-23 19:12:45.797566	inside
324	E002	17.5065052	78.4772633	2026-04-23 19:12:46.276776	inside
325	E002	17.5065044	78.4772624	2026-04-23 19:12:46.674073	inside
326	E002	17.5065041	78.477262	2026-04-23 19:12:46.857898	inside
327	E002	17.5064993	78.4772628	2026-04-23 19:12:47.471414	inside
328	E002	17.5064988	78.4772641	2026-04-23 19:12:47.698169	inside
329	E002	17.5065022	78.4772624	2026-04-23 19:12:48.04828	inside
330	E002	17.5064976	78.4772631	2026-04-23 19:12:48.7019	inside
331	E002	17.5064952	78.4772631	2026-04-23 19:12:49.328494	inside
332	E002	17.5064952	78.477261	2026-04-23 19:12:49.995574	inside
333	E002	17.5064949	78.4772599	2026-04-23 19:12:50.031591	inside
334	E002	17.5064906	78.4772585	2026-04-23 19:12:50.597747	inside
335	E002	17.5064909	78.4772554	2026-04-23 19:12:50.689821	inside
336	E002	17.5064885	78.4772534	2026-04-23 19:12:51.251569	inside
337	E002	17.5064835	78.4772521	2026-04-23 19:12:51.896893	inside
338	E002	17.506481	78.4772498	2026-04-23 19:12:52.624972	inside
339	E002	17.5064791	78.4772494	2026-04-23 19:12:52.675673	inside
340	E002	17.5064805	78.4772476	2026-04-23 19:12:52.798405	inside
341	E002	17.5064769	78.4772488	2026-04-23 19:12:53.590183	inside
342	E002	17.5064787	78.4772477	2026-04-23 19:12:53.663832	inside
343	E002	17.5064756	78.4772485	2026-04-23 19:12:54.128049	inside
344	E002	17.5064773	78.4772504	2026-04-23 19:12:54.774725	inside
345	E002	17.5064784	78.4772511	2026-04-23 19:12:54.818607	inside
346	E002	17.5064818	78.4772562	2026-04-23 19:12:55.730662	inside
347	E002	17.5064837	78.4772566	2026-04-23 19:12:56.039502	inside
348	E002	17.5064845	78.4772576	2026-04-23 19:12:56.779516	inside
349	E002	17.5064848	78.4772578	2026-04-23 19:12:56.864072	inside
350	E002	17.5064848	78.47726	2026-04-23 19:12:57.686791	inside
351	E002	17.5064859	78.4772581	2026-04-23 19:12:58.980919	inside
352	E002	17.5064863	78.4772569	2026-04-23 19:12:59.333619	inside
353	E002	17.5064866	78.4772563	2026-04-23 19:12:59.885135	inside
354	E002	17.5064848	78.4772502	2026-04-23 19:12:59.950103	inside
355	E002	17.5064833	78.4772464	2026-04-23 19:13:00.68222	inside
356	E002	17.5064829	78.4772448	2026-04-23 19:13:00.761821	inside
357	E002	17.5064814	78.4772432	2026-04-23 19:13:01.571087	inside
358	E002	17.5064813	78.4772427	2026-04-23 19:13:01.719137	inside
359	E002	17.5064805	78.4772423	2026-04-23 19:13:02.030034	inside
360	E002	17.506479	78.4772419	2026-04-23 19:13:02.833695	inside
361	E002	17.5064793	78.4772419	2026-04-23 19:13:02.834209	inside
362	E002	17.5064774	78.4772426	2026-04-23 19:13:03.066476	inside
363	E002	17.5064754	78.4772437	2026-04-23 19:13:03.729355	inside
364	E002	17.5064708	78.4772456	2026-04-23 19:13:04.429418	inside
365	E002	17.5064664	78.4772483	2026-04-23 19:13:04.743721	inside
366	E002	17.5064604	78.4772522	2026-04-23 19:13:05.327321	inside
367	E002	17.5064559	78.477257	2026-04-23 19:13:05.991859	inside
368	E002	17.5064469	78.4772721	2026-04-23 19:13:06.607393	inside
369	E002	17.5064456	78.4772727	2026-04-23 19:13:06.680359	inside
370	E002	17.5064447	78.4772746	2026-04-23 19:13:06.872681	inside
371	E002	17.5064426	78.4772809	2026-04-23 19:13:07.558033	inside
372	E002	17.5064413	78.4772829	2026-04-23 19:13:07.6908	inside
373	E002	17.5064396	78.4772881	2026-04-23 19:13:08.194738	inside
374	E002	17.5064371	78.477295	2026-04-23 19:13:08.850391	inside
375	E002	17.5064311	78.4773064	2026-04-23 19:13:09.815666	inside
376	E002	17.5064302	78.4773085	2026-04-23 19:13:09.853282	inside
377	E002	17.5064292	78.4773147	2026-04-23 19:13:10.452331	inside
378	E002	17.5064288	78.4773191	2026-04-23 19:13:10.672135	inside
379	E002	17.5064291	78.4773231	2026-04-23 19:13:11.01827	inside
380	E002	17.506429	78.4773269	2026-04-23 19:13:11.396224	inside
381	E002	17.5064341	78.4773399	2026-04-23 19:13:11.560684	inside
382	E002	17.5064339	78.4773391	2026-04-23 19:13:11.700993	inside
383	E002	17.5064339	78.4773422	2026-04-23 19:13:12.056742	inside
384	E002	17.5064353	78.4773479	2026-04-23 19:13:12.765699	inside
385	E002	17.5064348	78.4773538	2026-04-23 19:13:13.259214	inside
386	E002	17.5064335	78.4773574	2026-04-23 19:13:13.873297	inside
387	E002	17.5064325	78.4773588	2026-04-23 19:13:13.930708	inside
388	E002	17.5064319	78.4773645	2026-04-23 19:13:14.615456	inside
389	E002	17.5064301	78.4773684	2026-04-23 19:13:14.681388	inside
390	E002	17.506429	78.4773709	2026-04-23 19:13:14.893359	inside
391	E002	17.5064278	78.4773785	2026-04-23 19:13:15.48407	outside
392	E002	17.506425	78.4773803	2026-04-23 19:13:15.699281	outside
393	E002	17.5064219	78.4773857	2026-04-23 19:13:16.223518	outside
394	E002	17.5064192	78.4773905	2026-04-23 19:13:16.548487	outside
395	E002	17.5064163	78.4773913	2026-04-23 19:13:16.647628	outside
396	E002	17.5064076	78.4773953	2026-04-23 19:13:17.010689	outside
397	E002	17.5064123	78.4774177	2026-04-23 19:13:17.275878	outside
398	E002	17.5063388	78.4774652	2026-04-23 19:13:25.969229	outside
399	E002	17.5063321	78.4774751	2026-04-23 19:13:26.672543	outside
400	E002	17.5063353	78.4774864	2026-04-23 19:13:27.728738	outside
401	E002	17.5063381	78.4774864	2026-04-23 19:13:28.082364	outside
402	E002	17.5063403	78.4774841	2026-04-23 19:13:28.699563	outside
403	E002	17.5063415	78.4774827	2026-04-23 19:13:28.782604	outside
404	E002	17.5063412	78.4774797	2026-04-23 19:13:29.223242	outside
405	E002	17.5063395	78.4774801	2026-04-23 19:13:29.801801	outside
406	E002	17.506339	78.4774803	2026-04-23 19:13:29.824993	outside
407	E002	17.506336	78.4774788	2026-04-23 19:13:30.603628	outside
408	E002	17.5063347	78.4774802	2026-04-23 19:13:30.667658	outside
409	E002	17.5063336	78.4774811	2026-04-23 19:13:30.803988	outside
410	E002	17.506328	78.4774812	2026-04-23 19:13:31.569052	outside
411	E002	17.5063277	78.477484	2026-04-23 19:13:31.689509	outside
412	E002	17.5063239	78.4774865	2026-04-23 19:13:32.217462	outside
413	E002	17.5063227	78.4774949	2026-04-23 19:13:32.847257	outside
414	E002	17.5063214	78.4775024	2026-04-23 19:13:33.253675	outside
415	E002	17.5063241	78.4775074	2026-04-23 19:13:33.636955	outside
416	E002	17.5063325	78.4775243	2026-04-23 19:13:33.67213	outside
417	E002	17.5063337	78.4775257	2026-04-23 19:13:33.83116	outside
418	E002	17.5063331	78.4775301	2026-04-23 19:13:34.454065	outside
419	E002	17.5063349	78.4775355	2026-04-23 19:13:34.68404	outside
420	E002	17.5063357	78.47754	2026-04-23 19:13:34.992947	outside
421	E002	17.5063374	78.4775456	2026-04-23 19:13:35.736551	outside
422	E002	17.5063414	78.4775507	2026-04-23 19:13:35.784823	outside
423	E002	17.5063444	78.4775561	2026-04-23 19:13:36.026363	outside
424	E002	17.5063514	78.4775665	2026-04-23 19:13:36.696743	outside
425	E002	17.506357	78.4775747	2026-04-23 19:13:37.24983	outside
426	E002	17.506361	78.4775843	2026-04-23 19:13:37.971601	outside
427	E002	17.5063594	78.4775805	2026-04-23 19:13:37.972348	outside
428	E002	17.5063639	78.4775916	2026-04-23 19:13:38.569741	outside
429	E002	17.5063647	78.4775975	2026-04-23 19:13:38.701194	outside
430	E002	17.5063654	78.4776023	2026-04-23 19:13:38.983257	outside
431	E002	17.5063666	78.4776093	2026-04-23 19:13:39.569653	outside
432	E002	17.5063667	78.4776095	2026-04-23 19:13:39.673442	outside
433	E002	17.5063667	78.4776134	2026-04-23 19:13:40.2228	outside
434	E002	17.5063652	78.47762	2026-04-23 19:13:40.84717	outside
435	E002	17.5063562	78.4776318	2026-04-23 19:13:41.62991	outside
436	E002	17.5063411	78.4776442	2026-04-23 19:13:42.768218	outside
437	E002	17.5063377	78.4776466	2026-04-23 19:13:42.86574	outside
438	E002	17.5063325	78.477652	2026-04-23 19:13:43.726797	outside
440	E002	17.451678	78.417359	2026-04-23 19:51:49.460176	outside
439	E002	17.451678	78.417359	2026-04-23 19:51:49.453383	outside
441	E002	17.4516385	78.4173965	2026-04-23 19:52:17.977075	outside
442	E002	17.451675286832618	78.41739559688627	2026-04-23 19:52:36.33085	outside
443	E002	17.45182607216061	78.41738712812953	2026-04-23 19:52:52.006502	outside
444	E002	17.451818	78.41738699999999	2026-04-23 19:54:41.447661	outside
445	E002	17.4516385	78.4173965	2026-04-23 19:54:56.846104	outside
446	E002	17.4516385	78.4173965	2026-04-23 19:56:01.532041	outside
447	E002	17.4516385	78.4173965	2026-04-23 19:56:57.874793	outside
448	E002	17.451675286832618	78.41739559688627	2026-04-23 19:57:06.982961	outside
449	E002	17.4517473834193	78.41738683522945	2026-04-23 19:57:38.176166	outside
450	E002	17.45162554803688	78.41738174650195	2026-04-23 19:59:46.597766	outside
451	E002	17.4517473834193	78.41738683522945	2026-04-23 20:01:46.607038	outside
452	E002	17.451732228215768	78.41738666836896	2026-04-23 20:02:33.733596	outside
453	E002	17.4516385	78.4173965	2026-04-23 20:03:51.932812	outside
454	E002	17.4517377	78.4173522	2026-04-23 20:07:56.122227	outside
455	E002	17.4517377	78.4173522	2026-04-23 20:07:56.126352	outside
456	E002	17.45179123333333	78.41737539999998	2026-04-23 20:08:14.910963	outside
457	E002	17.45179123333333	78.41737539999998	2026-04-23 20:08:14.917946	outside
458	E002	17.45179123333333	78.41737539999998	2026-04-23 20:09:18.541154	outside
459	E002	17.45180882849179	78.41737559814378	2026-04-23 20:09:32.568489	outside
460	E002	17.45180882849179	78.41737559814378	2026-04-23 20:09:57.754327	outside
461	E002	17.451744059184684	78.41737494525287	2026-04-23 20:10:18.625632	outside
462	E002	17.451734199264855	78.41737425215437	2026-04-23 20:10:34.380213	outside
463	E002	17.451734199264855	78.41737425215437	2026-04-23 20:10:56.891742	outside
464	E002	17.45180392790872	78.4173751122654	2026-04-23 20:11:05.065003	outside
465	E002	17.45180392790872	78.4173751122654	2026-04-23 20:11:05.151115	outside
466	E002	17.45179123333333	78.41737539999998	2026-04-23 20:11:36.061454	outside
467	E002	17.45179123333333	78.41737539999998	2026-04-23 20:11:36.064279	outside
468	E002	17.45179123333333	78.41737539999998	2026-04-23 20:12:09.397006	outside
469	E002	17.4516385	78.4173965	2026-04-23 20:13:09.227051	outside
470	E002	17.4516385	78.4173965	2026-04-23 20:13:09.236999	outside
471	E002	17.4516881	78.41737434999999	2026-04-23 20:13:27.89858	outside
472	E002	17.4516881	78.41737434999999	2026-04-23 20:13:27.903047	outside
473	E002	17.451648399999996	78.41737406666667	2026-04-23 20:14:30.138917	outside
474	E002	17.45178325	78.41737549999999	2026-04-23 20:15:32.149533	outside
475	E002	17.451735000000003	78.41738249999999	2026-04-23 20:15:47.87129	outside
476	E002	17.451818	78.41738699999999	2026-04-23 20:16:34.856903	outside
477	E002	17.4516385	78.4173965	2026-04-23 20:17:36.722943	outside
478	E002	17.4516385	78.4173965	2026-04-23 20:17:56.435426	outside
479	E002	17.4516385	78.4173965	2026-04-23 20:18:44.301768	outside
480	E002	17.451818	78.41738699999999	2026-04-23 20:19:02.550229	outside
481	E002	17.451765	78.417381	2026-04-23 20:23:21.875195	outside
482	E002	17.451765	78.417381	2026-04-23 20:23:25.225442	outside
483	E002	17.451765	78.417381	2026-04-23 20:23:28.521518	outside
484	E002	17.451853	78.417374	2026-04-23 20:24:08.837386	outside
485	E002	17.451853	78.417374	2026-04-23 20:24:36.106256	outside
486	E002	17.451732228215768	78.41738666836896	2026-04-23 20:24:54.350215	outside
487	E002	17.451732228215768	78.41738666836896	2026-04-23 20:26:29.094974	outside
488	E002	17.451732228215768	78.41738666836896	2026-04-23 20:26:29.203989	outside
489	E002	17.451853	78.417374	2026-04-23 20:27:00.023045	outside
490	E002	17.451853	78.417374	2026-04-23 20:27:00.128379	outside
491	E002	17.451934359080752	78.41737597063518	2026-04-23 20:27:09.327994	outside
492	E002	17.451934359080752	78.41737597063518	2026-04-23 20:27:09.330419	outside
493	E002	17.4519975	78.4173775	2026-04-23 20:27:24.655808	outside
494	E002	17.4519975	78.4173775	2026-04-23 20:27:24.658893	outside
495	E002	17.451934359080752	78.41737597063518	2026-04-23 20:27:33.553409	outside
496	E002	17.451934359080752	78.41737597063518	2026-04-23 20:27:33.557648	outside
497	E002	17.451827784561978	78.41738336573411	2026-04-23 20:29:22.014874	outside
498	E002	17.451827784561978	78.41738336573411	2026-04-23 20:29:22.095018	outside
499	E002	17.451732228215768	78.41738666836896	2026-04-23 20:30:08.461304	outside
500	E002	17.451732228215768	78.41738666836896	2026-04-23 20:30:08.46492	outside
501	E002	17.4516385	78.4173965	2026-04-23 20:30:39.255773	outside
502	E002	17.4516385	78.4173965	2026-04-23 20:30:39.262017	outside
503	E002	17.451818	78.41738699999999	2026-04-23 20:30:48.367543	outside
504	E002	17.451818	78.41738699999999	2026-04-23 20:30:48.368596	outside
505	E002	17.451827784561978	78.41738336573411	2026-04-23 20:31:04.109914	outside
506	E002	17.451827784561978	78.41738336573411	2026-04-23 20:31:04.124019	outside
507	E002	17.5064957	78.4773113	2026-04-24 17:43:32.941786	inside
508	E002	17.506496	78.477308	2026-04-24 17:43:35.497828	inside
509	E002	17.5065134	78.4772857	2026-04-24 17:43:37.786994	inside
510	E002	17.5065356	78.477375	2026-04-24 17:43:38.474257	inside
511	E002	17.5065049	78.4772866	2026-04-24 17:43:40.596836	inside
512	E002	17.5065093	78.4772637	2026-04-24 17:43:41.538083	inside
513	E002	17.506508	78.4772512	2026-04-24 17:43:42.651641	inside
514	E002	17.5065064	78.4772442	2026-04-24 17:43:43.707716	inside
515	E002	17.5065088	78.4772463	2026-04-24 17:43:44.453365	inside
516	E002	17.5065068	78.4772415	2026-04-24 17:43:45.585612	inside
517	E002	17.506506	78.4772382	2026-04-24 17:43:46.489261	inside
518	E002	17.5065053	78.4772352	2026-04-24 17:43:47.657786	inside
519	E002	17.5065063	78.477234	2026-04-24 17:43:48.517541	inside
520	E002	17.506506	78.4772313	2026-04-24 17:43:49.517127	inside
521	E002	17.5065055	78.4772308	2026-04-24 17:43:50.668657	inside
522	E002	17.5065059	78.4772315	2026-04-24 17:43:51.547171	inside
523	E002	17.5065104	78.4772331	2026-04-24 17:43:52.523711	inside
524	E002	17.5065102	78.4772329	2026-04-24 17:43:53.554827	inside
525	E002	17.5065124	78.477234	2026-04-24 17:43:54.551903	inside
526	E002	17.5065155	78.4772349	2026-04-24 17:43:55.542168	inside
527	E002	17.5065191	78.4772392	2026-04-24 17:43:56.615043	inside
528	E002	17.5065194	78.4772389	2026-04-24 17:43:57.511212	inside
529	E002	17.5065196	78.4772388	2026-04-24 17:43:58.655321	inside
530	E002	17.5065194	78.4772386	2026-04-24 17:43:59.513721	inside
531	E002	17.5065197	78.4772384	2026-04-24 17:44:00.740815	inside
532	E002	17.5065199	78.4772372	2026-04-24 17:44:01.548488	inside
533	E002	17.5065198	78.4772371	2026-04-24 17:44:03.70514	inside
534	E002	17.5065203	78.4772369	2026-04-24 17:44:03.706	inside
535	E002	17.5065202	78.4772367	2026-04-24 17:44:04.510987	inside
536	E002	17.506522	78.4772373	2026-04-24 17:44:05.439047	inside
537	E002	17.5065221	78.4772373	2026-04-24 17:44:06.656842	inside
538	E002	17.5065226	78.4772399	2026-04-24 17:44:07.46334	inside
539	E002	17.5065226	78.4772396	2026-04-24 17:44:08.608599	inside
540	E002	17.5065222	78.4772394	2026-04-24 17:44:09.496536	inside
541	E002	17.5065229	78.4772389	2026-04-24 17:44:10.469885	inside
542	E002	17.5065229	78.4772389	2026-04-24 17:44:11.478505	inside
543	E002	17.5065227	78.4772388	2026-04-24 17:44:12.451862	inside
544	E002	17.5065228	78.4772388	2026-04-24 17:44:13.503313	inside
545	E002	17.5065232	78.477239	2026-04-24 17:44:14.547198	inside
546	E002	17.506523	78.4772388	2026-04-24 17:44:15.877557	inside
547	E002	17.506523	78.4772387	2026-04-24 17:44:16.49229	inside
548	E002	17.506523	78.4772392	2026-04-24 17:44:17.575339	inside
549	E002	17.5065238	78.4772407	2026-04-24 17:44:18.824548	inside
550	E002	17.5065239	78.4772408	2026-04-24 17:44:19.495688	inside
551	E002	17.5065238	78.4772406	2026-04-24 17:44:20.512708	inside
1232	E003	17.451565265841268	78.4173727880531	2026-04-24 20:23:44.160881	outside
1245	E004	17.4517379	78.417386	2026-04-24 20:27:53.068992	outside
1246	E004	17.4517379	78.417386	2026-04-24 20:28:02.957713	outside
1247	E004	17.4515494	78.4175115	2026-04-24 20:28:07.604992	outside
1248	E004	17.4515261	78.4175271	2026-04-24 20:28:17.580784	outside
1249	E004	17.4515347	78.4175214	2026-04-24 20:28:22.814928	outside
1250	E004	17.4517044	78.4174093	2026-04-24 20:28:24.130738	outside
1251	E004	17.4517614	78.4173716	2026-04-24 20:28:35.170169	outside
1252	E004	17.4515212	78.4174978	2026-04-24 20:28:36.160884	outside
1253	E004	17.4514903	78.4175143	2026-04-24 20:28:46.235543	outside
1254	E004	17.4514934	78.417513	2026-04-24 20:28:51.217535	outside
1255	E004	17.4515166	78.41752	2026-04-24 20:28:54.675403	outside
1256	E004	17.4515172	78.4175202	2026-04-24 20:29:04.65707	outside
1257	E004	17.4515675	78.4173969	2026-04-24 20:29:06.340725	outside
1287	E002	17.5065258	78.4772937	2026-04-25 13:49:00.351301	inside
1288	E002	17.5065258	78.4772937	2026-04-25 13:49:09.666753	inside
1289	E002	17.5063626	78.4773714	2026-04-25 13:49:20.720986	outside
1290	E002	17.5064109	78.4773803	2026-04-25 13:49:31.323275	outside
1291	E002	17.5064182	78.4773849	2026-04-25 13:49:42.186768	outside
1292	E002	17.506424	78.4773818	2026-04-25 13:49:53.165838	outside
1293	E002	17.5064706	78.4772854	2026-04-25 13:49:54.193117	inside
1326	E002	17.5064832	78.4772618	2026-04-25 13:52:38.386995	inside
1327	E004	17.5064864	78.4772489	2026-04-25 13:52:41.132295	inside
1328	E004	17.5064876	78.4772602	2026-04-25 13:52:44.394348	inside
1329	E004	17.5064882	78.4772603	2026-04-25 13:52:45.594147	inside
1330	E004	17.5064883	78.4772597	2026-04-25 13:52:46.325154	inside
1331	E004	17.5064886	78.4772593	2026-04-25 13:52:46.951265	inside
1354	E003	17.5064851	78.477263	2026-04-25 13:53:36.858382	inside
1355	E004	17.5064854	78.4772667	2026-04-25 13:53:38.207958	inside
1356	E002	17.5064966	78.4772746	2026-04-25 13:53:41.008974	inside
1378	E004	17.5064854	78.4772667	2026-04-25 13:54:25.264011	inside
1379	E003	17.5064853	78.477268	2026-04-25 13:54:28.527359	inside
1380	E003	17.506488	78.4772733	2026-04-25 13:54:34.144557	inside
1381	E004	17.5064746	78.477277	2026-04-25 13:54:34.672681	inside
1382	E002	17.5065303	78.4772976	2026-04-25 13:54:35.869909	inside
1395	E003	17.5064907	78.4772757	2026-04-25 13:55:04.82008	inside
1396	E002	17.5065001	78.4772491	2026-04-25 13:55:08.452401	inside
1397	E003	17.5064916	78.4772765	2026-04-25 13:55:10.049032	inside
1398	E004	17.5064762	78.47725	2026-04-25 13:55:10.808031	inside
1406	E004	17.5064881	78.477277	2026-04-25 13:55:20.05956	inside
1407	E003	17.506491	78.4772671	2026-04-25 13:55:20.308213	inside
1408	E004	17.5064877	78.4772755	2026-04-25 13:55:20.439252	inside
1409	E004	17.5064862	78.4772752	2026-04-25 13:55:21.574982	inside
1410	E004	17.5064853	78.4772608	2026-04-25 13:55:21.92184	inside
1411	E004	17.5064846	78.4772622	2026-04-25 13:55:22.790799	inside
1412	E004	17.506485	78.4772601	2026-04-25 13:55:23.272485	inside
1413	E004	17.5064854	78.4772609	2026-04-25 13:55:24.008582	inside
1414	E004	17.506486	78.4772617	2026-04-25 13:55:24.550403	inside
1415	E004	17.506487	78.4772621	2026-04-25 13:55:25.147745	inside
1416	E003	17.5065209	78.4772284	2026-04-25 13:55:25.339584	inside
1417	E004	17.5064895	78.4772631	2026-04-25 13:55:25.764918	inside
1418	E004	17.506491	78.4772632	2026-04-25 13:55:26.274517	inside
1424	E004	17.5064882	78.4772575	2026-04-25 13:55:35.996257	inside
1425	E004	17.506484	78.4772591	2026-04-25 13:55:36.154799	inside
1426	E004	17.5064807	78.4772632	2026-04-25 13:55:37.536923	inside
1427	E004	17.5064788	78.4772656	2026-04-25 13:55:38.470647	inside
1428	E002	17.5064845	78.4772638	2026-04-25 13:55:40.6628	inside
1429	E003	17.5065306	78.477289	2026-04-25 13:55:40.779523	inside
1431	E003	17.5065393	78.4772916	2026-04-25 13:55:45.878982	inside
1432	E004	17.5064843	78.4772651	2026-04-25 13:55:50.542094	inside
1433	E002	17.5065366	78.4772946	2026-04-25 13:55:51.598078	inside
1438	E004	17.5064915	78.477283	2026-04-25 13:55:59.980431	inside
1440	E004	17.5064915	78.4772843	2026-04-25 13:56:01.226581	inside
1441	E003	17.5064868	78.4772568	2026-04-25 13:56:01.321708	inside
1442	E004	17.5064911	78.4772851	2026-04-25 13:56:01.833451	inside
1443	E002	17.5065337	78.4772918	2026-04-25 13:56:02.33352	inside
1444	E004	17.5064912	78.4772857	2026-04-25 13:56:03.345759	inside
1445	E002	17.506494	78.4772757	2026-04-25 13:56:03.549594	inside
1446	E004	17.5064907	78.4772868	2026-04-25 13:56:04.063951	inside
1447	E004	17.5064904	78.4772877	2026-04-25 13:56:04.568229	inside
1448	E004	17.5064901	78.4772883	2026-04-25 13:56:05.293647	inside
1449	E004	17.5064902	78.4772891	2026-04-25 13:56:06.007993	inside
1450	E003	17.5065304	78.4772891	2026-04-25 13:56:06.628761	inside
1451	E004	17.5064902	78.4772897	2026-04-25 13:56:06.698691	inside
1452	E003	17.5066144	78.4772599	2026-04-25 13:56:08.566279	inside
1453	E003	17.5066257	78.4772561	2026-04-25 13:56:09.386545	inside
1454	E003	17.5066294	78.4772746	2026-04-25 13:56:11.038708	outside
1455	E003	17.5066298	78.4772772	2026-04-25 13:56:11.783126	outside
1456	E003	17.5066185	78.4772738	2026-04-25 13:56:12.047105	inside
1457	E003	17.5066105	78.4772722	2026-04-25 13:56:13.001994	inside
1477	E002	17.5064847	78.4772675	2026-04-25 13:56:25.668993	inside
1478	E003	17.5067081	78.477367	2026-04-25 13:56:26.179698	outside
1479	E003	17.5067083	78.477368	2026-04-25 13:56:27.003848	outside
1480	E003	17.5067111	78.4774291	2026-04-25 13:56:28.015887	outside
1481	E004	17.5064902	78.4773127	2026-04-25 13:56:28.544741	inside
1482	E003	17.5067116	78.4774738	2026-04-25 13:56:29.153801	outside
1483	E003	17.506709	78.4775018	2026-04-25 13:56:30.172899	outside
1484	E003	17.5067059	78.4775324	2026-04-25 13:56:31.023886	outside
1485	E003	17.5067052	78.4775598	2026-04-25 13:56:32.127256	outside
1486	E003	17.5067051	78.4775646	2026-04-25 13:56:32.181791	outside
1487	E003	17.5067098	78.4775814	2026-04-25 13:56:32.98394	outside
1488	E003	17.5067087	78.4775991	2026-04-25 13:56:34.110706	outside
1496	E003	17.5067246	78.4775603	2026-04-25 13:56:37.107369	outside
1497	E003	17.5066884	78.477504	2026-04-25 13:56:37.190175	outside
1498	E003	17.5066538	78.4774477	2026-04-25 13:56:38.057492	outside
1499	E003	17.5066318	78.4774087	2026-04-25 13:56:39.027757	outside
1500	E003	17.5066175	78.4773945	2026-04-25 13:56:40.023196	outside
1501	E003	17.5066126	78.4773991	2026-04-25 13:56:41.028207	outside
1502	E003	17.5066081	78.4774035	2026-04-25 13:56:42.012446	outside
1503	E003	17.5066806	78.4775394	2026-04-25 13:56:42.578352	outside
552	E002	17.5065238	78.4772403	2026-04-24 17:44:21.479711	inside
553	E002	17.5065241	78.4772415	2026-04-24 17:44:22.538177	inside
554	E002	17.5065241	78.4772414	2026-04-24 17:44:23.457896	inside
555	E002	17.5065241	78.4772414	2026-04-24 17:44:25.039214	inside
556	E002	17.5065243	78.4772414	2026-04-24 17:44:25.533967	inside
557	E002	17.5065245	78.477241	2026-04-24 17:44:26.690648	inside
558	E002	17.5065247	78.4772413	2026-04-24 17:44:27.586539	inside
559	E002	17.5065253	78.4772418	2026-04-24 17:44:28.546703	inside
560	E002	17.506526	78.4772447	2026-04-24 17:44:29.456406	inside
561	E002	17.506526	78.4772449	2026-04-24 17:44:30.469459	inside
562	E002	17.506526	78.4772449	2026-04-24 17:44:31.539326	inside
563	E002	17.506526	78.4772449	2026-04-24 17:44:32.9808	inside
564	E002	17.506526	78.4772449	2026-04-24 17:44:33.505832	inside
565	E002	17.506526	78.4772449	2026-04-24 17:44:34.536917	inside
566	E002	17.506526	78.4772449	2026-04-24 17:44:36.24748	inside
567	E002	17.506526	78.4772449	2026-04-24 17:44:36.840328	inside
568	E002	17.5065175	78.4772416	2026-04-24 17:44:37.456897	inside
569	E002	17.5065172	78.4772426	2026-04-24 17:44:37.66475	inside
570	E002	17.5065155	78.4772431	2026-04-24 17:44:38.03812	inside
571	E002	17.5065149	78.4772444	2026-04-24 17:44:38.706669	inside
572	E002	17.5065169	78.4772485	2026-04-24 17:44:38.876549	inside
573	E002	17.5065162	78.4772422	2026-04-24 17:44:38.87728	inside
574	E002	17.5065175	78.4772471	2026-04-24 17:44:39.562628	inside
575	E002	17.5065177	78.4772466	2026-04-24 17:44:39.790921	inside
576	E002	17.5065185	78.4772474	2026-04-24 17:44:40.573704	inside
577	E002	17.5065193	78.477247	2026-04-24 17:44:40.70994	inside
578	E002	17.5065203	78.4772474	2026-04-24 17:44:41.612185	inside
579	E002	17.5065202	78.4772466	2026-04-24 17:44:41.638563	inside
580	E002	17.5065199	78.4772445	2026-04-24 17:44:42.595407	inside
581	E002	17.5065214	78.477246	2026-04-24 17:44:42.608909	inside
582	E002	17.5065215	78.477245	2026-04-24 17:44:42.690963	inside
583	E002	17.5065228	78.4772448	2026-04-24 17:44:43.6672	inside
584	E002	17.506524	78.4772439	2026-04-24 17:44:44.180459	inside
585	E002	17.5065247	78.4772435	2026-04-24 17:44:44.610184	inside
586	E002	17.5065257	78.4772429	2026-04-24 17:44:45.557181	inside
587	E002	17.5065265	78.4772419	2026-04-24 17:44:46.61937	inside
588	E002	17.5065269	78.4772416	2026-04-24 17:44:46.620344	inside
589	E002	17.5065265	78.4772412	2026-04-24 17:44:47.498757	inside
590	E002	17.5065262	78.477241	2026-04-24 17:44:48.500237	inside
591	E002	17.5065263	78.4772409	2026-04-24 17:44:48.645375	inside
592	E002	17.5065258	78.4772408	2026-04-24 17:44:48.963363	inside
593	E002	17.5065254	78.4772408	2026-04-24 17:44:49.862887	inside
594	E002	17.5065252	78.4772407	2026-04-24 17:44:49.864065	inside
595	E002	17.5065242	78.4772415	2026-04-24 17:44:50.523453	inside
596	E002	17.5065236	78.4772412	2026-04-24 17:44:51.652685	inside
597	E002	17.5065244	78.4772403	2026-04-24 17:44:52.433931	inside
598	E002	17.5065243	78.4772405	2026-04-24 17:44:53.040003	inside
599	E002	17.5065232	78.4772414	2026-04-24 17:44:53.096118	inside
600	E002	17.5065258	78.4772486	2026-04-24 17:44:53.872288	inside
601	E002	17.5065251	78.4772499	2026-04-24 17:44:54.577676	inside
602	E002	17.5065246	78.47725	2026-04-24 17:44:55.473498	inside
603	E002	17.5065254	78.4772502	2026-04-24 17:44:56.77737	inside
604	E002	17.5065265	78.4772496	2026-04-24 17:44:57.502891	inside
605	E002	17.5065267	78.4772494	2026-04-24 17:44:57.791565	inside
606	E002	17.5065273	78.4772494	2026-04-24 17:44:58.582384	inside
607	E002	17.5065268	78.4772497	2026-04-24 17:45:00.009084	inside
608	E002	17.5065272	78.4772492	2026-04-24 17:45:01.014378	inside
609	E002	17.5065275	78.4772492	2026-04-24 17:45:01.46064	inside
610	E002	17.506528	78.4772482	2026-04-24 17:45:02.466942	inside
611	E002	17.506528	78.4772481	2026-04-24 17:45:02.787233	inside
612	E002	17.5065291	78.4772484	2026-04-24 17:45:04.479472	inside
613	E002	17.5065283	78.4772484	2026-04-24 17:45:04.668052	inside
614	E002	17.5065277	78.4772483	2026-04-24 17:45:04.834426	inside
615	E002	17.5065293	78.4772485	2026-04-24 17:45:04.834945	inside
616	E002	17.5065275	78.4772482	2026-04-24 17:45:04.85863	inside
617	E002	17.5065268	78.4772482	2026-04-24 17:45:05.670266	inside
618	E002	17.5065268	78.4772482	2026-04-24 17:45:05.672341	inside
619	E002	17.5065224	78.477251	2026-04-24 17:45:06.479577	inside
620	E002	17.5065219	78.4772509	2026-04-24 17:45:06.550589	inside
621	E002	17.5065173	78.4772492	2026-04-24 17:45:07.228317	inside
622	E002	17.5065159	78.4772486	2026-04-24 17:45:07.582584	inside
623	E002	17.5065143	78.4772479	2026-04-24 17:45:07.8028	inside
624	E002	17.5065095	78.4772448	2026-04-24 17:45:08.519012	inside
625	E002	17.5065031	78.4772403	2026-04-24 17:45:09.159882	inside
626	E002	17.5065004	78.4772385	2026-04-24 17:45:09.505505	inside
627	E002	17.5064982	78.4772366	2026-04-24 17:45:09.911283	inside
628	E002	17.5064911	78.477234	2026-04-24 17:45:10.36147	inside
629	E002	17.5064873	78.4772347	2026-04-24 17:45:10.542871	inside
630	E002	17.5064756	78.4772338	2026-04-24 17:45:11.514209	inside
631	E002	17.5064742	78.4772338	2026-04-24 17:45:11.584113	inside
632	E002	17.5064687	78.4772301	2026-04-24 17:45:12.376882	inside
633	E002	17.5064668	78.4772316	2026-04-24 17:45:12.525332	inside
634	E002	17.5064644	78.4772315	2026-04-24 17:45:12.737869	inside
635	E002	17.5064588	78.4772284	2026-04-24 17:45:13.896345	inside
636	E002	17.5064553	78.4772278	2026-04-24 17:45:14.091456	inside
637	E002	17.5064517	78.4772281	2026-04-24 17:45:14.532945	inside
638	E002	17.5064497	78.4772281	2026-04-24 17:45:14.722323	inside
639	E002	17.5064461	78.4772273	2026-04-24 17:45:15.352764	inside
640	E002	17.5064453	78.4772278	2026-04-24 17:45:15.366358	inside
641	E002	17.5064406	78.4772284	2026-04-24 17:45:15.649391	inside
642	E002	17.5064386	78.4772286	2026-04-24 17:45:15.994229	inside
643	E002	17.5064366	78.4772286	2026-04-24 17:45:16.431137	inside
644	E002	17.506434	78.477229	2026-04-24 17:45:16.532734	inside
645	E002	17.5064349	78.4772294	2026-04-24 17:45:16.61809	inside
646	E002	17.506431	78.477228	2026-04-24 17:45:17.315639	inside
647	E002	17.5064303	78.4772279	2026-04-24 17:45:17.592218	inside
648	E002	17.5064263	78.477226	2026-04-24 17:45:18.169447	inside
649	E002	17.5064244	78.4772251	2026-04-24 17:45:18.514717	inside
650	E002	17.5064223	78.4772239	2026-04-24 17:45:18.845833	inside
651	E002	17.5064192	78.4772217	2026-04-24 17:45:19.871275	inside
652	E002	17.5064145	78.4772172	2026-04-24 17:45:20.553173	inside
653	E002	17.5064098	78.4772151	2026-04-24 17:45:21.616825	inside
654	E002	17.5064057	78.4772157	2026-04-24 17:45:22.627236	inside
655	E002	17.5064042	78.477222	2026-04-24 17:45:23.556755	inside
656	E002	17.5064039	78.4772234	2026-04-24 17:45:24.053931	inside
657	E002	17.5064037	78.4772254	2026-04-24 17:45:25.211485	inside
658	E002	17.5064038	78.477226	2026-04-24 17:45:25.28146	inside
659	E002	17.5064019	78.4772268	2026-04-24 17:45:25.622175	inside
660	E002	17.5064006	78.477227	2026-04-24 17:45:26.13859	inside
661	E002	17.5063963	78.4772256	2026-04-24 17:45:27.27045	inside
664	E002	17.506395	78.4772254	2026-04-24 17:45:27.438791	inside
665	E002	17.451889	78.417381	2026-04-24 17:45:27.477526	outside
666	E002	17.5063928	78.4772244	2026-04-24 17:45:27.504763	inside
667	E002	17.5063914	78.4772237	2026-04-24 17:45:27.820156	inside
668	E002	17.5063867	78.4772199	2026-04-24 17:45:28.520331	inside
681	E002	17.50638	78.4771719	2026-04-24 17:45:33.917004	inside
682	E002	17.5063813	78.4771684	2026-04-24 17:45:34.466653	inside
683	E002	17.5063829	78.4771623	2026-04-24 17:45:35.246884	inside
684	E002	17.5063825	78.4771609	2026-04-24 17:45:35.543597	inside
1233	E002	17.451565636458742	78.41738270025067	2026-04-24 20:25:18.644965	outside
1234	E002	17.451554273637967	78.4173794616279	2026-04-24 20:26:00.24288	outside
1235	E003	17.451554273637967	78.4173794616279	2026-04-24 20:26:03.293562	outside
1236	E004	17.451666	78.4174974	2026-04-24 20:26:04.87107	outside
1258	E004	17.4515799	78.4173658	2026-04-24 20:29:16.325941	outside
1294	E002	17.5065236	78.4772913	2026-04-25 13:50:36.248029	inside
1297	E004	17.5064848	78.4772647	2026-04-25 13:50:56.245167	inside
1298	E002	17.5064679	78.4774034	2026-04-25 13:50:57.267447	outside
1299	E002	17.5064832	78.4772739	2026-04-25 13:50:58.193736	inside
1302	E004	17.5064852	78.4772693	2026-04-25 13:51:04.608403	inside
1310	E002	17.5064884	78.4772602	2026-04-25 13:51:08.957498	inside
1311	E002	17.506504	78.4772762	2026-04-25 13:51:11.958735	inside
1312	E002	17.5065054	78.4772779	2026-04-25 13:51:13.202938	inside
1313	E004	17.5064824	78.4772732	2026-04-25 13:51:15.51865	inside
1314	E002	17.5065056	78.4772783	2026-04-25 13:51:18.675734	inside
1315	E002	17.5065057	78.4772783	2026-04-25 13:51:19.618684	inside
1316	E004	17.506483	78.4772636	2026-04-25 13:51:22.495565	inside
1317	E004	17.5064832	78.4772631	2026-04-25 13:51:23.175765	inside
1318	E002	17.5064614	78.4773695	2026-04-25 13:51:29.540392	inside
1319	E002	17.5064853	78.4772606	2026-04-25 13:51:34.051349	inside
1320	E004	17.5064786	78.4772716	2026-04-25 13:51:34.258861	inside
1321	E002	17.506487	78.4772648	2026-04-25 13:51:34.874233	inside
1322	E002	17.5064933	78.4772635	2026-04-25 13:51:40.388109	inside
1323	E002	17.5064954	78.477258	2026-04-25 13:51:41.3012	inside
1324	E004	17.5064824	78.4772633	2026-04-25 13:51:43.842711	inside
1336	E002	17.5065365	78.4772995	2026-04-25 13:52:58.409433	inside
1337	E002	17.506523	78.4772865	2026-04-25 13:52:59.776982	inside
1338	E004	17.506481	78.4772606	2026-04-25 13:53:00.068328	inside
1339	E003	17.5064931	78.4772607	2026-04-25 13:53:04.405872	inside
1340	E002	17.5065215	78.4772881	2026-04-25 13:53:08.243172	inside
1341	E004	17.5064856	78.4772662	2026-04-25 13:53:09.372962	inside
1342	E002	17.5065208	78.4772863	2026-04-25 13:53:09.460155	inside
1370	E003	17.5064971	78.4772729	2026-04-25 13:54:07.734787	inside
1372	E002	17.5065405	78.4772955	2026-04-25 13:54:13.956532	inside
1373	E002	17.5065016	78.4772747	2026-04-25 13:54:14.93414	inside
1374	E004	17.5064857	78.4772576	2026-04-25 13:54:17.713875	inside
1375	E003	17.5064913	78.4772706	2026-04-25 13:54:17.903856	inside
1376	E002	17.5064917	78.477277	2026-04-25 13:54:21.051583	inside
1377	E003	17.5064913	78.4772727	2026-04-25 13:54:22.939207	inside
1383	E003	17.5064928	78.4772752	2026-04-25 13:54:39.28391	inside
1384	E004	17.5064865	78.4772677	2026-04-25 13:54:44.19445	inside
1385	E003	17.5064863	78.4772769	2026-04-25 13:54:44.287635	inside
1386	E002	17.5065384	78.4772885	2026-04-25 13:54:47.059767	inside
1387	E002	17.5064946	78.4772641	2026-04-25 13:54:47.772317	inside
1388	E003	17.5064884	78.477269	2026-04-25 13:54:49.520652	inside
1391	E002	17.5064854	78.477259	2026-04-25 13:54:57.709841	inside
1392	E002	17.5064973	78.4772509	2026-04-25 13:54:58.525316	inside
1399	E004	17.5064835	78.4772633	2026-04-25 13:55:12.346377	inside
1400	E003	17.5064947	78.4772754	2026-04-25 13:55:15.078667	inside
1401	E004	17.5064889	78.4772735	2026-04-25 13:55:18.252167	inside
1402	E004	17.5064892	78.4772747	2026-04-25 13:55:18.89977	inside
1403	E002	17.5065025	78.4772517	2026-04-25 13:55:19.101366	inside
1404	E004	17.5064892	78.4772759	2026-04-25 13:55:19.517694	inside
1405	E002	17.5065041	78.4772528	2026-04-25 13:55:20.058868	inside
1419	E002	17.506526	78.4772797	2026-04-25 13:55:29.801391	inside
1420	E003	17.5064896	78.4772704	2026-04-25 13:55:30.58949	inside
1421	E002	17.5064931	78.4772671	2026-04-25 13:55:30.714442	inside
1422	E004	17.5064937	78.4772609	2026-04-25 13:55:31.307031	inside
1423	E003	17.5064873	78.4772743	2026-04-25 13:55:35.823565	inside
1430	E002	17.5065288	78.47729	2026-04-25 13:55:41.849044	inside
1434	E003	17.5065007	78.4772729	2026-04-25 13:55:51.598977	inside
1435	E004	17.5064895	78.4772773	2026-04-25 13:55:55.775102	inside
1436	E003	17.5065314	78.4772874	2026-04-25 13:55:56.286795	inside
1437	E004	17.5064895	78.4772788	2026-04-25 13:55:56.915275	inside
1439	E004	17.5064896	78.477279	2026-04-25 13:55:59.980913	inside
1458	E002	17.5064877	78.4772732	2026-04-25 13:56:13.439421	inside
1459	E003	17.5066167	78.4772888	2026-04-25 13:56:14.09346	inside
1460	E002	17.5064843	78.4772686	2026-04-25 13:56:14.706636	inside
1461	E003	17.506614	78.4772911	2026-04-25 13:56:15.119723	inside
1462	E004	17.5064907	78.4772983	2026-04-25 13:56:15.324145	inside
1463	E004	17.5064911	78.4772954	2026-04-25 13:56:15.959332	inside
1464	E003	17.5066148	78.4772916	2026-04-25 13:56:16.046284	inside
1465	E003	17.506615	78.4772917	2026-04-25 13:56:16.664962	inside
1466	E003	17.5066118	78.477298	2026-04-25 13:56:17.172722	inside
1467	E003	17.5066077	78.4773036	2026-04-25 13:56:18.011598	inside
1468	E003	17.5066976	78.4773343	2026-04-25 13:56:19.025625	outside
1469	E003	17.5067145	78.4773469	2026-04-25 13:56:20.032488	outside
1470	E003	17.5067176	78.4773574	2026-04-25 13:56:20.999215	outside
1471	E003	17.5067182	78.4773594	2026-04-25 13:56:21.870307	outside
1472	E003	17.5067174	78.4773632	2026-04-25 13:56:21.961098	outside
1473	E003	17.5067141	78.4773672	2026-04-25 13:56:22.993509	outside
1474	E003	17.5067094	78.4773641	2026-04-25 13:56:23.997416	outside
1475	E002	17.5064838	78.4772679	2026-04-25 13:56:24.260493	inside
1476	E003	17.5067072	78.4773622	2026-04-25 13:56:25.201146	outside
1489	E004	17.5064913	78.4772697	2026-04-25 13:56:34.225259	inside
1490	E004	17.5064917	78.4772621	2026-04-25 13:56:34.779013	inside
1491	E003	17.5067033	78.477596	2026-04-25 13:56:35.010137	outside
1492	E002	17.506485	78.4772674	2026-04-25 13:56:35.500855	inside
1493	E004	17.5064923	78.4772586	2026-04-25 13:56:35.70979	inside
1494	E003	17.5066956	78.4776065	2026-04-25 13:56:36.234674	outside
1495	E002	17.5064876	78.477274	2026-04-25 13:56:36.250543	inside
1504	E003	17.506693	78.4775763	2026-04-25 13:56:43.020596	outside
1505	E003	17.5066859	78.4775837	2026-04-25 13:56:43.984954	outside
1506	E003	17.5066718	78.4775668	2026-04-25 13:56:45.119632	outside
1507	E002	17.506488	78.477275	2026-04-25 13:56:45.988547	inside
662	E002	17.5064	78.4772267	2026-04-24 17:45:27.271417	inside
663	E002	17.5063961	78.4772254	2026-04-24 17:45:27.323224	inside
669	E002	17.5063881	78.4772212	2026-04-24 17:45:28.52214	inside
670	E002	17.5063838	78.477217	2026-04-24 17:45:28.944292	inside
671	E002	17.5063804	78.4772102	2026-04-24 17:45:29.448982	inside
672	E002	17.506378	78.477202	2026-04-24 17:45:30.231139	inside
673	E002	17.5063773	78.4771985	2026-04-24 17:45:30.544913	inside
674	E002	17.5063775	78.4771949	2026-04-24 17:45:30.898985	inside
675	E002	17.5063794	78.4771861	2026-04-24 17:45:31.491627	inside
676	E002	17.5063784	78.4771901	2026-04-24 17:45:32.284336	inside
677	E002	17.5063793	78.4771824	2026-04-24 17:45:32.446213	inside
678	E002	17.5063787	78.4771809	2026-04-24 17:45:32.534913	inside
679	E002	17.5063793	78.4771778	2026-04-24 17:45:32.997688	inside
680	E002	17.5063794	78.4771745	2026-04-24 17:45:33.915733	inside
685	E002	17.5063833	78.4771578	2026-04-24 17:45:35.959573	inside
686	E002	17.5063831	78.4771542	2026-04-24 17:45:36.584697	inside
687	E002	17.5063831	78.4771524	2026-04-24 17:45:36.887812	inside
688	E002	17.506385	78.4771469	2026-04-24 17:45:37.576	inside
689	E002	17.5063851	78.4771406	2026-04-24 17:45:38.548848	inside
690	E002	17.5063842	78.4771362	2026-04-24 17:45:39.675917	inside
691	E002	17.5063824	78.4771368	2026-04-24 17:45:40.537262	inside
692	E002	17.5063795	78.4771407	2026-04-24 17:45:41.485853	inside
693	E002	17.5063777	78.4771422	2026-04-24 17:45:42.639007	inside
694	E002	17.5063773	78.4771425	2026-04-24 17:45:42.682924	inside
695	E002	17.5063775	78.4771419	2026-04-24 17:45:43.352134	inside
696	E002	17.5063771	78.4771413	2026-04-24 17:45:43.531748	inside
697	E002	17.5063769	78.4771406	2026-04-24 17:45:44.341863	inside
698	E002	17.5063766	78.4771394	2026-04-24 17:45:44.460639	inside
699	E002	17.5063765	78.4771384	2026-04-24 17:45:44.759253	inside
700	E002	17.5063761	78.4771311	2026-04-24 17:45:45.835969	inside
701	E002	17.5063762	78.477133	2026-04-24 17:45:45.928221	inside
702	E002	17.5063767	78.477125	2026-04-24 17:45:46.335735	inside
703	E002	17.5063762	78.4771217	2026-04-24 17:45:47.180527	inside
704	E002	17.5063761	78.477118	2026-04-24 17:45:47.382769	inside
705	E002	17.5063745	78.477111	2026-04-24 17:45:48.135102	inside
706	E002	17.5063749	78.4771124	2026-04-24 17:45:48.136374	inside
707	E002	17.5063753	78.4771048	2026-04-24 17:45:48.592039	inside
708	E002	17.5063744	78.4770994	2026-04-24 17:45:49.510161	inside
709	E002	17.5063715	78.4770934	2026-04-24 17:45:49.590044	inside
710	E002	17.5063735	78.4770978	2026-04-24 17:45:49.591263	inside
711	E002	17.5063715	78.4770923	2026-04-24 17:45:50.014286	outside
712	E002	17.5063717	78.477091	2026-04-24 17:45:50.544792	outside
713	E002	17.5063703	78.477089	2026-04-24 17:45:51.018112	outside
714	E002	17.506368	78.4770857	2026-04-24 17:45:51.775289	outside
715	E002	17.5064179	78.4767194	2026-04-24 17:47:11.107023	outside
716	E002	17.5064799	78.47669	2026-04-24 17:47:14.587346	outside
717	E002	17.5064721	78.476655	2026-04-24 17:47:15.473566	outside
718	E002	17.5064735	78.4766539	2026-04-24 17:47:16.608876	outside
719	E002	17.5064702	78.4766454	2026-04-24 17:47:17.579991	outside
720	E002	17.5064649	78.4766367	2026-04-24 17:47:18.660743	outside
721	E002	17.5064598	78.4766288	2026-04-24 17:47:19.457799	outside
722	E002	17.5064547	78.4766214	2026-04-24 17:47:20.525733	outside
723	E002	17.5064522	78.4766179	2026-04-24 17:47:21.529636	outside
724	E002	17.5064461	78.4766086	2026-04-24 17:47:22.385508	outside
725	E002	17.5064448	78.4766143	2026-04-24 17:47:22.435806	outside
726	E002	17.5064429	78.4766126	2026-04-24 17:47:23.592645	outside
727	E002	17.5064423	78.4766122	2026-04-24 17:47:24.600222	outside
728	E002	17.5064398	78.4766089	2026-04-24 17:47:25.469491	outside
729	E002	17.5064385	78.4766066	2026-04-24 17:47:26.500794	outside
730	E002	17.5064378	78.4766048	2026-04-24 17:47:27.673319	outside
731	E002	17.5064374	78.4766037	2026-04-24 17:47:28.483746	outside
732	E002	17.5064372	78.4766026	2026-04-24 17:47:28.796135	outside
733	E002	17.5064408	78.4766123	2026-04-24 17:47:28.835103	outside
734	E002	17.5064408	78.4766126	2026-04-24 17:47:29.508452	outside
735	E002	17.5064409	78.4766123	2026-04-24 17:47:29.926559	outside
736	E002	17.5064408	78.4766124	2026-04-24 17:47:30.532292	outside
737	E002	17.5064407	78.4766122	2026-04-24 17:47:30.589357	outside
738	E002	17.5064407	78.4766129	2026-04-24 17:47:31.352519	outside
739	E002	17.5064406	78.4766127	2026-04-24 17:47:31.468013	outside
740	E002	17.5064406	78.4766137	2026-04-24 17:47:32.497406	outside
741	E002	17.5064406	78.4766138	2026-04-24 17:47:32.894488	outside
742	E002	17.5064414	78.4766145	2026-04-24 17:47:33.604769	outside
743	E002	17.5064416	78.4766144	2026-04-24 17:47:33.913459	outside
744	E002	17.5064421	78.4766139	2026-04-24 17:47:34.625637	outside
745	E002	17.506443	78.4766145	2026-04-24 17:47:34.756973	outside
746	E002	17.5064442	78.4766148	2026-04-24 17:47:35.045741	outside
747	E002	17.5064452	78.476621	2026-04-24 17:47:35.150453	outside
748	E002	17.5064457	78.4766218	2026-04-24 17:47:35.47826	outside
749	E002	17.5064459	78.4766221	2026-04-24 17:47:35.586971	outside
750	E002	17.5064465	78.476623	2026-04-24 17:47:36.681481	outside
751	E002	17.5064463	78.4766228	2026-04-24 17:47:36.682027	outside
752	E002	17.5064464	78.476623	2026-04-24 17:47:37.188021	outside
753	E002	17.5064473	78.4766238	2026-04-24 17:47:37.526776	outside
754	E002	17.5064497	78.4766238	2026-04-24 17:47:38.587422	outside
755	E002	17.5064512	78.4766234	2026-04-24 17:47:39.547273	outside
756	E002	17.5064534	78.476623	2026-04-24 17:47:40.564989	outside
757	E002	17.5064545	78.4766229	2026-04-24 17:47:41.181316	outside
758	E002	17.5064569	78.4766267	2026-04-24 17:47:41.474919	outside
759	E002	17.5064587	78.4766272	2026-04-24 17:47:42.634274	outside
760	E002	17.5064613	78.4766274	2026-04-24 17:47:43.426516	outside
761	E002	17.5064627	78.476627	2026-04-24 17:47:44.47827	outside
762	E002	17.506463	78.4766269	2026-04-24 17:47:45.468193	outside
763	E002	17.5064636	78.4766273	2026-04-24 17:47:46.483355	outside
764	E002	17.5064635	78.4766271	2026-04-24 17:47:47.268199	outside
765	E002	17.5064654	78.4766309	2026-04-24 17:47:47.460005	outside
766	E002	17.5064663	78.4766306	2026-04-24 17:47:48.5618	outside
767	E002	17.5064675	78.4766313	2026-04-24 17:47:49.593298	outside
768	E002	17.5064691	78.4766317	2026-04-24 17:47:50.514265	outside
769	E002	17.5064702	78.4766328	2026-04-24 17:47:51.634353	outside
770	E002	17.5064709	78.4766329	2026-04-24 17:47:52.54968	outside
771	E002	17.5064721	78.4766319	2026-04-24 17:47:53.475458	outside
772	E002	17.5064736	78.4766335	2026-04-24 17:47:54.513523	outside
773	E002	17.5064737	78.4766332	2026-04-24 17:47:55.543927	outside
774	E002	17.506474	78.4766319	2026-04-24 17:47:56.499112	outside
775	E002	17.5064744	78.4766311	2026-04-24 17:47:57.434702	outside
776	E002	17.5064745	78.4766305	2026-04-24 17:47:58.488869	outside
777	E002	17.5064746	78.4766301	2026-04-24 17:47:59.57624	outside
778	E002	17.5064746	78.47663	2026-04-24 17:47:59.745585	outside
779	E002	17.5064755	78.4766317	2026-04-24 17:48:00.53506	outside
780	E002	17.5064755	78.4766317	2026-04-24 17:48:01.564421	outside
781	E002	17.5064754	78.4766306	2026-04-24 17:48:02.491903	outside
782	E002	17.5064748	78.476629	2026-04-24 17:48:03.30455	outside
783	E002	17.5064746	78.4766279	2026-04-24 17:48:03.445209	outside
784	E002	17.5064739	78.4766261	2026-04-24 17:48:04.258119	outside
785	E002	17.5064738	78.4766254	2026-04-24 17:48:04.492261	outside
786	E002	17.5064735	78.4766239	2026-04-24 17:48:05.357045	outside
787	E002	17.5064737	78.4766231	2026-04-24 17:48:05.459158	outside
794	E002	17.5064707	78.476623	2026-04-24 17:48:09.448403	outside
795	E002	17.5064707	78.476623	2026-04-24 17:48:09.862663	outside
796	E002	17.5064705	78.4766244	2026-04-24 17:48:10.475651	outside
797	E002	17.5064706	78.4766247	2026-04-24 17:48:10.783168	outside
798	E002	17.5064708	78.4766265	2026-04-24 17:48:11.523445	outside
799	E002	17.5064708	78.4766269	2026-04-24 17:48:11.616272	outside
800	E002	17.5064707	78.4766272	2026-04-24 17:48:12.318598	outside
801	E002	17.5064703	78.4766313	2026-04-24 17:48:12.436192	outside
802	E002	17.50647	78.4766313	2026-04-24 17:48:12.501184	outside
803	E002	17.5064702	78.4766319	2026-04-24 17:48:13.544988	outside
804	E002	17.5064691	78.4766336	2026-04-24 17:48:14.357771	outside
805	E002	17.5064681	78.476635	2026-04-24 17:48:14.454555	outside
806	E002	17.5064675	78.4766367	2026-04-24 17:48:15.197097	outside
807	E002	17.506467	78.4766384	2026-04-24 17:48:15.488624	outside
808	E002	17.5064668	78.4766394	2026-04-24 17:48:15.791244	outside
809	E002	17.5064656	78.476642	2026-04-24 17:48:16.46493	outside
810	E002	17.5064651	78.4766427	2026-04-24 17:48:16.720164	outside
811	E002	17.5064646	78.4766439	2026-04-24 17:48:17.442506	outside
812	E002	17.5064615	78.4766475	2026-04-24 17:48:18.2713	outside
818	E002	17.5064514	78.476667	2026-04-24 17:48:20.72455	outside
819	E002	17.5064509	78.4766688	2026-04-24 17:48:20.742542	outside
820	E002	17.5064476	78.4766752	2026-04-24 17:48:21.532924	outside
824	E002	17.5064439	78.4766867	2026-04-24 17:48:23.468558	outside
825	E002	17.5064438	78.4766925	2026-04-24 17:48:24.493875	outside
826	E002	17.5064436	78.4766972	2026-04-24 17:48:25.213703	outside
827	E002	17.5064437	78.4766996	2026-04-24 17:48:25.532513	outside
828	E002	17.5064436	78.4767013	2026-04-24 17:48:25.853152	outside
829	E002	17.5064434	78.4767035	2026-04-24 17:48:26.349417	outside
830	E002	17.5064439	78.4767046	2026-04-24 17:48:26.49601	outside
831	E002	17.506444	78.4767067	2026-04-24 17:48:26.964758	outside
832	E002	17.5064438	78.4767105	2026-04-24 17:48:27.462152	outside
833	E002	17.5064435	78.4767135	2026-04-24 17:48:28.089857	outside
834	E002	17.5064433	78.4767166	2026-04-24 17:48:28.503702	outside
835	E002	17.5064432	78.4767176	2026-04-24 17:48:28.586945	outside
836	E002	17.5064422	78.4767222	2026-04-24 17:48:29.523946	outside
837	E002	17.506442	78.4767234	2026-04-24 17:48:29.649164	outside
838	E002	17.5064406	78.4767259	2026-04-24 17:48:30.309949	outside
839	E002	17.5064405	78.476726	2026-04-24 17:48:30.467451	outside
840	E002	17.5064402	78.4767264	2026-04-24 17:48:30.869043	outside
841	E002	17.5064423	78.4767256	2026-04-24 17:48:31.562108	outside
842	E002	17.5064388	78.4767275	2026-04-24 17:48:32.625149	outside
843	E002	17.5064331	78.4767294	2026-04-24 17:48:33.613442	outside
844	E002	17.5064307	78.476729	2026-04-24 17:48:33.928658	outside
845	E002	17.5064289	78.4767286	2026-04-24 17:48:34.637232	outside
846	E002	17.5064277	78.4767282	2026-04-24 17:48:35.250839	outside
1237	E004	17.4516176	78.417416	2026-04-24 20:26:14.741483	outside
1241	E004	17.4516248	78.4175721	2026-04-24 20:26:31.814583	outside
1242	E004	17.4516011	78.4174951	2026-04-24 20:26:33.573184	outside
1243	E004	17.4515918	78.4174794	2026-04-24 20:26:43.955623	outside
1244	E002	17.451555920268866	78.41739038818086	2026-04-24 20:26:47.3252	outside
1259	E004	17.4515796	78.4173664	2026-04-24 20:29:21.453803	outside
1260	E004	17.4516361	78.4173869	2026-04-24 20:29:25.049835	outside
1261	E004	17.4516433	78.4173906	2026-04-24 20:29:35.115996	outside
1262	E004	17.4515053	78.4175042	2026-04-24 20:29:36.697826	outside
1263	E004	17.4514996	78.4175088	2026-04-24 20:29:46.706369	outside
1264	E004	17.4515201	78.4175403	2026-04-24 20:29:48.597673	outside
1265	E004	17.4515236	78.4175437	2026-04-24 20:29:58.616726	outside
1266	E004	17.4514889	78.4175583	2026-04-24 20:30:00.670013	outside
1267	E004	17.4514876	78.4175588	2026-04-24 20:30:10.607636	outside
1268	E004	17.4515072	78.4175294	2026-04-24 20:30:12.674482	outside
1269	E004	17.45151	78.4175255	2026-04-24 20:30:22.548331	outside
1270	E004	17.4514996	78.4175139	2026-04-24 20:30:24.226546	outside
1271	E004	17.4514992	78.4175136	2026-04-24 20:30:34.250587	outside
1272	E004	17.4514993	78.4175138	2026-04-24 20:30:36.21703	outside
1273	E004	17.4514994	78.4175139	2026-04-24 20:30:46.186444	outside
1274	E004	17.4515011	78.4175357	2026-04-24 20:30:48.182688	outside
1275	E004	17.4515013	78.4175386	2026-04-24 20:30:58.125327	outside
1276	E004	17.4517036	78.4173562	2026-04-24 20:31:00.144941	outside
1277	E004	17.4517163	78.4173447	2026-04-24 20:31:10.13638	outside
1278	E004	17.4517116	78.4173488	2026-04-24 20:31:11.684253	outside
1279	E004	17.4517088	78.4173513	2026-04-24 20:31:21.639642	outside
1280	E004	17.4514888	78.41753	2026-04-24 20:31:23.626959	outside
1281	E004	17.4514807	78.4175366	2026-04-24 20:31:33.923219	outside
1282	E004	17.4514911	78.4175268	2026-04-24 20:31:35.771466	outside
1295	E002	17.5065333	78.4772912	2026-04-25 13:50:46.092552	inside
1296	E002	17.5065312	78.4772896	2026-04-25 13:50:47.269079	inside
1300	E004	17.5064852	78.477269	2026-04-25 13:51:04.18293	inside
1301	E002	17.5064834	78.4772599	2026-04-25 13:51:04.551809	inside
1303	E004	17.5064851	78.4772695	2026-04-25 13:51:05.941494	inside
1304	E004	17.5064819	78.477267	2026-04-25 13:51:06.179722	inside
1305	E004	17.5064819	78.4772672	2026-04-25 13:51:06.634836	inside
1306	E004	17.5064818	78.4772682	2026-04-25 13:51:07.309099	inside
1307	E004	17.5064817	78.4772687	2026-04-25 13:51:07.830271	inside
1308	E002	17.506487	78.4772601	2026-04-25 13:51:08.18291	inside
1309	E004	17.5064819	78.47727	2026-04-25 13:51:08.235248	inside
1343	E003	17.5064931	78.4772607	2026-04-25 13:53:09.477306	inside
1344	E002	17.5065104	78.4772843	2026-04-25 13:53:15.710174	inside
1345	E003	17.5064876	78.4772638	2026-04-25 13:53:16.33209	inside
1346	E004	17.5064839	78.4772585	2026-04-25 13:53:18.724629	inside
1347	E002	17.5065094	78.4772791	2026-04-25 13:53:19.400956	inside
1348	E002	17.5065089	78.4772778	2026-04-25 13:53:20.540398	inside
1349	E003	17.5064915	78.4772606	2026-04-25 13:53:21.723882	inside
1371	E003	17.5064894	78.4772726	2026-04-25 13:54:12.59299	inside
1389	E004	17.5064856	78.4772571	2026-04-25 13:54:53.915301	inside
1390	E003	17.5065365	78.4772936	2026-04-25 13:54:54.53644	inside
1393	E003	17.5064898	78.4772645	2026-04-25 13:54:59.778521	inside
1394	E004	17.5064863	78.4772525	2026-04-25 13:55:00.265466	inside
788	E002	17.5064738	78.4766221	2026-04-24 17:48:05.973816	outside
789	E002	17.5064708	78.4766224	2026-04-24 17:48:06.470534	outside
790	E002	17.506471	78.4766235	2026-04-24 17:48:07.601302	outside
791	E002	17.506471	78.476624	2026-04-24 17:48:08.018292	outside
792	E002	17.5064706	78.4766237	2026-04-24 17:48:08.528759	outside
793	E002	17.5064702	78.4766232	2026-04-24 17:48:09.447905	outside
813	E002	17.5064581	78.4766525	2026-04-24 17:48:18.397302	outside
814	E002	17.5064581	78.4766518	2026-04-24 17:48:18.452274	outside
815	E002	17.5064563	78.4766557	2026-04-24 17:48:18.908391	outside
816	E002	17.506455	78.4766574	2026-04-24 17:48:19.486985	outside
817	E002	17.5064535	78.4766609	2026-04-24 17:48:19.660209	outside
821	E002	17.5064481	78.4766742	2026-04-24 17:48:21.533408	outside
822	E002	17.5064451	78.4766791	2026-04-24 17:48:22.502253	outside
823	E002	17.5064436	78.4766855	2026-04-24 17:48:23.370075	outside
847	E002	17.506426	78.4767294	2026-04-24 17:48:35.458985	outside
848	E002	17.5064223	78.4767305	2026-04-24 17:48:36.282012	outside
849	E002	17.5064198	78.4767323	2026-04-24 17:48:36.438946	outside
850	E002	17.5064145	78.4767346	2026-04-24 17:48:37.278251	outside
851	E002	17.5064131	78.476736	2026-04-24 17:48:37.336423	outside
852	E002	17.5064123	78.4767372	2026-04-24 17:48:37.473565	outside
853	E002	17.5064089	78.4767383	2026-04-24 17:48:38.025111	outside
854	E002	17.506406	78.4767382	2026-04-24 17:48:38.60367	outside
855	E002	17.5064001	78.476739	2026-04-24 17:48:39.139512	outside
856	E002	17.5063954	78.4767406	2026-04-24 17:48:39.549114	outside
857	E002	17.5063935	78.4767415	2026-04-24 17:48:39.576502	outside
858	E002	17.5063901	78.4767427	2026-04-24 17:48:40.061232	outside
859	E002	17.5063873	78.4767443	2026-04-24 17:48:40.481649	outside
860	E002	17.5063861	78.4767455	2026-04-24 17:48:40.634021	outside
861	E002	17.5063827	78.4767499	2026-04-24 17:48:41.460303	outside
862	E002	17.5063824	78.4767508	2026-04-24 17:48:41.563799	outside
863	E002	17.5063792	78.476753	2026-04-24 17:48:42.211761	outside
864	E002	17.5063787	78.4767521	2026-04-24 17:48:42.513638	outside
865	E002	17.5063764	78.4767501	2026-04-24 17:48:43.246025	outside
866	E002	17.5063756	78.4767493	2026-04-24 17:48:43.366411	outside
867	E002	17.5063788	78.4767448	2026-04-24 17:48:43.444979	outside
868	E002	17.506379	78.4767449	2026-04-24 17:48:43.85684	outside
869	E002	17.5063794	78.4767471	2026-04-24 17:48:44.482277	outside
870	E002	17.5063805	78.4767486	2026-04-24 17:48:44.753489	outside
871	E002	17.5063817	78.4767516	2026-04-24 17:48:45.48595	outside
872	E002	17.5063821	78.4767568	2026-04-24 17:48:46.316577	outside
873	E002	17.5063822	78.4767583	2026-04-24 17:48:46.452569	outside
874	E002	17.5063823	78.4767621	2026-04-24 17:48:47.150151	outside
875	E002	17.5063819	78.4767647	2026-04-24 17:48:47.543333	outside
876	E002	17.5063817	78.4767681	2026-04-24 17:48:47.740574	outside
877	E002	17.506382	78.4767738	2026-04-24 17:48:48.558824	outside
878	E002	17.5063863	78.4767803	2026-04-24 17:48:49.605386	outside
879	E002	17.5063821	78.4767761	2026-04-24 17:48:49.606352	outside
880	E002	17.5063872	78.4767845	2026-04-24 17:48:50.277075	outside
881	E002	17.5063874	78.4767852	2026-04-24 17:48:50.432778	outside
882	E002	17.5063873	78.4767894	2026-04-24 17:48:51.265344	outside
883	E002	17.5063875	78.4767921	2026-04-24 17:48:51.453867	outside
884	E002	17.5063872	78.4767956	2026-04-24 17:48:51.798186	outside
885	E002	17.5063865	78.4768004	2026-04-24 17:48:52.484985	outside
886	E002	17.5063863	78.4768024	2026-04-24 17:48:52.674394	outside
887	E002	17.5063863	78.476805	2026-04-24 17:48:53.479826	outside
888	E002	17.5063863	78.4768076	2026-04-24 17:48:54.296388	outside
889	E002	17.5063869	78.4768084	2026-04-24 17:48:54.442117	outside
890	E002	17.5063871	78.4768111	2026-04-24 17:48:55.234625	outside
891	E002	17.5063876	78.4768117	2026-04-24 17:48:55.492111	outside
892	E002	17.5063885	78.4768114	2026-04-24 17:48:55.644582	outside
893	E002	17.5063986	78.4768318	2026-04-24 17:48:56.147958	outside
894	E002	17.5063985	78.4768334	2026-04-24 17:48:56.478404	outside
895	E002	17.5063984	78.4768347	2026-04-24 17:48:56.829133	outside
896	E002	17.5063979	78.4768357	2026-04-24 17:48:57.474497	outside
897	E002	17.5063979	78.4768372	2026-04-24 17:48:57.752069	outside
898	E002	17.5063978	78.4768397	2026-04-24 17:48:58.498367	outside
899	E002	17.5063978	78.4768406	2026-04-24 17:48:58.647176	outside
900	E002	17.5063981	78.476843	2026-04-24 17:48:59.374291	outside
901	E002	17.5063983	78.4768441	2026-04-24 17:48:59.454412	outside
902	E002	17.5063987	78.4768469	2026-04-24 17:49:00.204701	outside
903	E002	17.5063981	78.4768475	2026-04-24 17:49:00.453389	outside
904	E002	17.5063979	78.4768486	2026-04-24 17:49:01.060538	outside
905	E002	17.5063971	78.4768485	2026-04-24 17:49:01.469184	outside
906	E002	17.506396	78.4768484	2026-04-24 17:49:01.891245	outside
907	E002	17.5064053	78.476858	2026-04-24 17:49:02.494813	outside
908	E002	17.5064056	78.4768587	2026-04-24 17:49:02.832336	outside
909	E002	17.5064059	78.4768597	2026-04-24 17:49:03.42614	outside
910	E002	17.5064056	78.4768599	2026-04-24 17:49:03.443474	outside
911	E002	17.5064056	78.4768606	2026-04-24 17:49:04.436266	outside
912	E002	17.5064052	78.4768635	2026-04-24 17:49:05.368432	outside
913	E002	17.5064049	78.4768657	2026-04-24 17:49:05.667716	outside
914	E002	17.5064045	78.4768687	2026-04-24 17:49:06.066459	outside
915	E002	17.506404	78.4768727	2026-04-24 17:49:06.578935	outside
916	E002	17.5064038	78.4768754	2026-04-24 17:49:06.896964	outside
917	E002	17.5064034	78.4768805	2026-04-24 17:49:07.445558	outside
918	E002	17.5064033	78.4768819	2026-04-24 17:49:07.629772	outside
919	E002	17.5064032	78.4768858	2026-04-24 17:49:08.347695	outside
920	E002	17.5064091	78.4769037	2026-04-24 17:49:08.365575	outside
921	E002	17.5064094	78.4769078	2026-04-24 17:49:09.344417	outside
922	E002	17.5064093	78.4769081	2026-04-24 17:49:09.437623	outside
923	E002	17.5064093	78.4769102	2026-04-24 17:49:10.473317	outside
924	E002	17.5064093	78.4769109	2026-04-24 17:49:10.9633	outside
925	E002	17.5064094	78.4769113	2026-04-24 17:49:11.506041	outside
926	E002	17.5064094	78.4769117	2026-04-24 17:49:12.051024	outside
927	E002	17.5064093	78.4769128	2026-04-24 17:49:12.521979	outside
928	E002	17.5064089	78.4769153	2026-04-24 17:49:13.548651	outside
929	E002	17.5064088	78.4769163	2026-04-24 17:49:13.764261	outside
930	E002	17.5064087	78.4769189	2026-04-24 17:49:14.681426	outside
931	E002	17.5064116	78.4769215	2026-04-24 17:49:14.75487	outside
932	E002	17.5064134	78.4769246	2026-04-24 17:49:15.491401	outside
933	E002	17.5064138	78.4769288	2026-04-24 17:49:16.207513	outside
934	E002	17.5064139	78.4769299	2026-04-24 17:49:16.480259	outside
935	E002	17.5064134	78.4769371	2026-04-24 17:49:23.198742	outside
936	E002	17.506413	78.4769412	2026-04-24 17:49:23.260215	outside
937	E002	17.5064118	78.4769448	2026-04-24 17:49:23.273364	outside
938	E002	17.5064115	78.4769457	2026-04-24 17:49:23.278603	outside
939	E002	17.5064091	78.4769593	2026-04-24 17:49:23.312382	outside
940	E002	17.5064136	78.4769344	2026-04-24 17:49:23.319473	outside
942	E002	17.5064088	78.4769609	2026-04-24 17:49:23.355292	outside
941	E002	17.5064137	78.4769331	2026-04-24 17:49:23.353088	outside
943	E002	17.5064133	78.4769388	2026-04-24 17:49:23.393638	outside
944	E002	17.5064108	78.4769547	2026-04-24 17:49:23.416079	outside
945	E002	17.5064099	78.4769578	2026-04-24 17:49:23.443131	outside
946	E002	17.5064088	78.4769601	2026-04-24 17:49:23.446388	outside
947	E002	17.5064083	78.4769622	2026-04-24 17:49:23.453626	outside
948	E002	17.5064101	78.4769562	2026-04-24 17:49:23.5092	outside
949	E002	17.506408	78.4769639	2026-04-24 17:49:23.992996	outside
950	E002	17.5064072	78.4769657	2026-04-24 17:49:24.451571	outside
951	E002	17.5064919	78.4772683	2026-04-24 18:15:51.769942	inside
952	E002	17.5064919	78.4772683	2026-04-24 18:16:01.677878	inside
953	E002	17.5065356	78.4772857	2026-04-24 18:16:02.321053	inside
954	E002	17.5089282	78.4785687	2026-04-24 18:16:12.369885	outside
955	E002	17.5064992	78.4772586	2026-04-24 18:16:12.483061	inside
956	E002	17.5089282	78.4785687	2026-04-24 18:16:22.286559	outside
957	E002	17.50649	78.4772687	2026-04-24 18:16:22.941993	inside
958	E002	17.5089282	78.4785687	2026-04-24 18:16:32.736953	outside
959	E002	17.5065355	78.4772841	2026-04-24 18:16:33.430191	inside
960	E002	17.5089282	78.4785687	2026-04-24 18:16:42.876452	outside
961	E002	17.5064924	78.4772658	2026-04-24 18:16:43.626176	inside
962	E002	17.5089282	78.4785687	2026-04-24 18:16:53.461053	outside
963	E002	17.5065407	78.4772885	2026-04-24 18:16:54.584452	inside
964	E002	17.5089282	78.4785687	2026-04-24 18:17:03.846001	outside
965	E002	17.5065376	78.4772923	2026-04-24 18:17:04.6522	inside
966	E002	17.5089282	78.4785687	2026-04-24 18:17:14.525799	outside
967	E002	17.5064805	78.4772649	2026-04-24 18:17:15.389776	inside
968	E002	17.5089282	78.4785687	2026-04-24 18:17:25.04141	outside
969	E002	17.5065348	78.4772869	2026-04-24 18:17:25.87665	inside
970	E002	17.5089282	78.4785687	2026-04-24 18:17:35.824841	outside
971	E002	17.5065415	78.4772722	2026-04-24 18:17:36.24654	inside
972	E002	17.5059944	78.4782136	2026-04-24 18:17:46.105494	outside
973	E002	17.5065439	78.477274	2026-04-24 18:17:46.933348	inside
974	E002	17.5059944	78.4782136	2026-04-24 18:17:56.571559	outside
975	E002	17.5065416	78.4772969	2026-04-24 18:17:56.915979	inside
976	E002	17.5059944	78.4782136	2026-04-24 18:18:06.682962	outside
977	E002	17.5065369	78.4773015	2026-04-24 18:18:07.330734	inside
978	E002	17.5059944	78.4782136	2026-04-24 18:18:17.280049	outside
979	E002	17.5065381	78.4772754	2026-04-24 18:18:17.869608	inside
980	E002	17.5059944	78.4782136	2026-04-24 18:18:27.696628	outside
981	E002	17.5064979	78.4772712	2026-04-24 18:18:28.295046	inside
982	E002	17.5059944	78.4782136	2026-04-24 18:18:38.126585	outside
983	E002	17.5064856	78.4772616	2026-04-24 18:18:38.830702	inside
984	E002	17.5059944	78.4782136	2026-04-24 18:18:48.579925	outside
985	E002	17.5064938	78.4772713	2026-04-24 18:18:49.52151	inside
986	E002	17.5059944	78.4782136	2026-04-24 18:18:59.559902	outside
987	E002	17.5065369	78.4773021	2026-04-24 18:19:00.05725	inside
988	E002	17.5059944	78.4782136	2026-04-24 18:19:10.00277	outside
989	E002	17.5065372	78.4772822	2026-04-24 18:19:10.52675	inside
990	E002	17.5059944	78.4782136	2026-04-24 18:19:20.394494	outside
991	E002	17.5065361	78.4772886	2026-04-24 18:19:21.036539	inside
992	E002	17.5059944	78.4782136	2026-04-24 18:19:30.898087	outside
993	E002	17.5064948	78.4772731	2026-04-24 18:19:31.660928	inside
994	E002	17.5059944	78.4782136	2026-04-24 18:19:41.595873	outside
995	E002	17.5064924	78.4772678	2026-04-24 18:19:42.406228	inside
996	E002	17.5059944	78.4782136	2026-04-24 18:19:52.238275	outside
997	E002	17.5064965	78.4772698	2026-04-24 18:19:52.994742	inside
998	E002	17.5059944	78.4782136	2026-04-24 18:20:02.943284	outside
999	E002	17.5064938	78.4772684	2026-04-24 18:20:03.759753	inside
1000	E002	17.4517061	78.4173686	2026-04-24 18:43:51.148138	outside
1001	E002	17.4517032	78.4173836	2026-04-24 18:44:35.452999	outside
1002	E002	17.4517032	78.4173836	2026-04-24 18:44:45.510286	outside
1003	E002	17.4515797	78.4174112	2026-04-24 18:44:47.712308	outside
1004	E002	17.4515812	78.4173186	2026-04-24 18:44:57.803872	outside
1005	E002	17.4517766	78.4173259	2026-04-24 18:45:00.24937	outside
1006	E002	17.451817	78.4173129	2026-04-24 18:45:11.167726	outside
1007	E002	17.4516404	78.4173748	2026-04-24 18:45:12.087175	outside
1008	E002	17.4517381	78.4174155	2026-04-24 18:45:22.177481	outside
1009	E002	17.4516949	78.4174286	2026-04-24 18:45:23.960925	outside
1010	E002	17.4516819	78.4174388	2026-04-24 18:45:34.769402	outside
1011	E002	17.4517352	78.4174332	2026-04-24 18:45:35.940579	outside
1012	E002	17.4517509	78.4174364	2026-04-24 18:45:46.822876	outside
1013	E002	17.4516698	78.4174077	2026-04-24 18:45:49.378111	outside
1014	E002	17.4516542	78.4174035	2026-04-24 18:45:58.371271	outside
1015	E002	17.4517117	78.4173913	2026-04-24 18:45:59.702952	outside
1016	E002	17.4517211	78.4173872	2026-04-24 18:46:10.215615	outside
1017	E002	17.4517375	78.4174137	2026-04-24 18:46:11.889816	outside
1018	E002	17.4517449	78.4174195	2026-04-24 18:46:22.121578	outside
1019	E002	17.4517758	78.4174143	2026-04-24 18:46:23.303113	outside
1020	E002	17.4517887	78.4174144	2026-04-24 18:46:33.347925	outside
1021	E002	17.4517718	78.417398	2026-04-24 18:46:35.955557	outside
1022	E002	17.4517719	78.4173936	2026-04-24 18:46:45.878227	outside
1023	E002	17.4517591	78.4173879	2026-04-24 18:46:47.265228	outside
1024	E002	17.4517573	78.4173849	2026-04-24 18:46:58.537147	outside
1025	E002	17.4517437	78.417437	2026-04-24 18:46:58.809894	outside
1026	E002	17.4517398	78.4174495	2026-04-24 18:47:09.631091	outside
1027	E002	17.4517716	78.4174278	2026-04-24 18:47:11.225726	outside
1028	E002	17.45178	78.4174251	2026-04-24 18:47:20.799015	outside
1029	E002	17.4519954	78.4174423	2026-04-24 18:47:22.594631	outside
1030	E002	17.4521299	78.417453	2026-04-24 18:47:32.69956	outside
1031	E002	17.4518283	78.4174118	2026-04-24 18:47:34.26983	outside
1032	E002	17.4517759	78.4174029	2026-04-24 18:47:45.622223	outside
1033	E002	17.451743	78.4173886	2026-04-24 18:47:46.2326	outside
1034	E002	17.4517217	78.4173815	2026-04-24 18:47:56.375093	outside
1035	E002	17.4517234	78.4173788	2026-04-24 18:47:58.120053	outside
1036	E002	17.4516086	78.4173791	2026-04-24 18:48:20.412871	outside
1037	E002	17.4516666	78.4173802	2026-04-24 18:48:22.341647	outside
1038	E002	17.4516767	78.4173798	2026-04-24 18:48:32.364765	outside
1039	E002	17.4517237	78.4173997	2026-04-24 18:48:34.64584	outside
1040	E002	17.4517324	78.417403	2026-04-24 18:48:44.369144	outside
1041	E003	17.4519975	78.4173775	2026-04-24 19:59:01.635619	outside
1042	E003	17.451873131365655	78.4173825634447	2026-04-24 19:59:19.497929	outside
1043	E003	17.4516993	78.4173917	2026-04-24 19:59:52.318842	outside
1044	E003	17.4516993	78.4173917	2026-04-24 20:00:02.186326	outside
1045	E003	17.4515993	78.4174056	2026-04-24 20:00:04.570587	outside
1046	E004	17.4517239	78.4174278	2026-04-24 20:00:21.867501	outside
1047	E004	17.4517023	78.4174797	2026-04-24 20:00:22.043299	outside
1048	E004	17.4517049	78.4175016	2026-04-24 20:00:30.792139	outside
1049	E004	17.4516021	78.4174777	2026-04-24 20:00:32.785666	outside
1050	E004	17.4515842	78.4174843	2026-04-24 20:00:42.795014	outside
1051	E004	17.451697	78.4173912	2026-04-24 20:00:44.972711	outside
1052	E004	17.4517182	78.4173697	2026-04-24 20:00:54.780265	outside
1053	E003	17.45183427387638	78.41738414545732	2026-04-24 20:01:01.531061	outside
1054	E003	17.451732228215768	78.41738666836896	2026-04-24 20:01:20.459497	outside
1055	E003	17.4516385	78.4173965	2026-04-24 20:02:18.732745	outside
1056	E003	17.451616	78.417683	2026-04-24 20:05:56.915365	outside
1057	E003	17.451465	78.417368	2026-04-24 20:06:29.306943	outside
1058	E003	17.45145013273894	78.41736948642682	2026-04-24 20:07:00.213267	outside
1059	E003	17.451471487488956	78.41736908448631	2026-04-24 20:09:08.739437	outside
1060	E003	17.451540483720777	78.41735519579059	2026-04-24 20:09:44.091236	outside
1061	E003	17.451547462198704	78.41735333338924	2026-04-24 20:10:46.869975	outside
1062	E003	17.451518789579037	78.41736633829849	2026-04-24 20:11:50.151147	outside
1063	E003	17.45150351910717	78.41736458262606	2026-04-24 20:12:59.565504	outside
1064	E003	17.45151712776188	78.41736402384707	2026-04-24 20:13:30.584575	outside
1065	E004	17.4515369	78.4175149	2026-04-24 20:14:36.981146	outside
1066	E003	17.451447374999997	78.41736612499999	2026-04-24 20:14:41.53056	outside
1067	E004	17.4515369	78.4175149	2026-04-24 20:14:47.176398	outside
1068	E004	17.4514948	78.4173501	2026-04-24 20:14:51.767248	outside
1069	E004	17.451483	78.4173038	2026-04-24 20:15:01.832572	outside
1070	E004	17.4516847	78.4173142	2026-04-24 20:15:06.855913	outside
1071	E004	17.4519233	78.4173527	2026-04-24 20:15:11.934795	outside
1072	E003	17.451630393461897	78.41737433266698	2026-04-24 20:15:13.04488	outside
1073	E004	17.4516514	78.4174439	2026-04-24 20:15:13.92072	outside
1074	E004	17.4516535	78.4174619	2026-04-24 20:15:23.945118	outside
1075	E004	17.4517073	78.4174066	2026-04-24 20:15:25.919842	outside
1076	E004	17.4517258	78.4174004	2026-04-24 20:15:35.825495	outside
1077	E004	17.4517254	78.4173778	2026-04-24 20:15:37.452901	outside
1078	E004	17.4517345	78.417368	2026-04-24 20:15:47.849592	outside
1079	E003	17.451605563002026	78.41737189538593	2026-04-24 20:15:48.890977	outside
1080	E004	17.4516662	78.417429	2026-04-24 20:15:49.472466	outside
1081	E004	17.4515365	78.4175204	2026-04-24 20:15:57.752009	outside
1082	E004	17.4515416	78.4175312	2026-04-24 20:15:59.06033	outside
1083	E004	17.4515499	78.417544	2026-04-24 20:15:59.518394	outside
1084	E004	17.4517444	78.4175619	2026-04-24 20:16:00.715823	outside
1085	E004	17.4518263	78.417585	2026-04-24 20:16:01.512528	outside
1086	E004	17.4518537	78.417588	2026-04-24 20:16:04.512564	outside
1087	E004	17.451859	78.4175915	2026-04-24 20:16:05.590779	outside
1088	E004	17.4518641	78.4175962	2026-04-24 20:16:06.469008	outside
1089	E004	17.4516502	78.4178378	2026-04-24 20:16:07.522924	outside
1090	E004	17.4516302	78.417882	2026-04-24 20:16:08.599554	outside
1091	E004	17.4516281	78.4179106	2026-04-24 20:16:09.520027	outside
1092	E004	17.4516314	78.4179385	2026-04-24 20:16:10.486533	outside
1093	E004	17.4516303	78.4179395	2026-04-24 20:16:11.530344	outside
1094	E004	17.4516298	78.4179418	2026-04-24 20:16:12.483489	outside
1095	E004	17.4516294	78.4179457	2026-04-24 20:16:13.460508	outside
1096	E004	17.4516289	78.4179516	2026-04-24 20:16:14.573438	outside
1097	E004	17.4516277	78.4179581	2026-04-24 20:16:15.543482	outside
1098	E004	17.4516259	78.4179656	2026-04-24 20:16:16.49977	outside
1099	E004	17.4516233	78.4179745	2026-04-24 20:16:17.499972	outside
1100	E004	17.4516203	78.4179841	2026-04-24 20:16:18.450143	outside
1101	E004	17.4516167	78.4179944	2026-04-24 20:16:19.511828	outside
1102	E004	17.4516129	78.4180053	2026-04-24 20:16:20.475652	outside
1103	E004	17.4516086	78.4180163	2026-04-24 20:16:21.518297	outside
1104	E004	17.4516041	78.4180277	2026-04-24 20:16:22.503282	outside
1105	E004	17.4516009	78.4180353	2026-04-24 20:16:23.390017	outside
1106	E004	17.4515968	78.4180461	2026-04-24 20:16:23.596604	outside
1107	E004	17.4515919	78.4180569	2026-04-24 20:16:24.498923	outside
1108	E004	17.4515865	78.4180667	2026-04-24 20:16:25.474247	outside
1109	E004	17.4515807	78.4180756	2026-04-24 20:16:26.577298	outside
1110	E004	17.4515737	78.4180822	2026-04-24 20:16:27.473034	outside
1111	E004	17.4515651	78.4180861	2026-04-24 20:16:28.463966	outside
1112	E004	17.4515558	78.4180879	2026-04-24 20:16:29.49077	outside
1113	E004	17.4515459	78.4180879	2026-04-24 20:16:31.470746	outside
1114	E004	17.451539	78.4180869	2026-04-24 20:16:31.832605	outside
1115	E004	17.4515336	78.4180854	2026-04-24 20:16:32.492234	outside
1116	E004	17.4515289	78.4180819	2026-04-24 20:16:33.499082	outside
1117	E004	17.4515245	78.4180764	2026-04-24 20:16:34.492024	outside
1118	E004	17.4515209	78.4180684	2026-04-24 20:16:35.442339	outside
1119	E004	17.4515174	78.4180575	2026-04-24 20:16:36.564939	outside
1120	E004	17.4515141	78.4180434	2026-04-24 20:16:37.569334	outside
1121	E004	17.4515113	78.4180282	2026-04-24 20:16:38.43718	outside
1122	E004	17.4515089	78.4180118	2026-04-24 20:16:39.623962	outside
1123	E004	17.4515065	78.4179943	2026-04-24 20:16:40.465277	outside
1124	E004	17.4515044	78.4179759	2026-04-24 20:16:41.450902	outside
1125	E004	17.4515026	78.4179582	2026-04-24 20:16:42.461525	outside
1126	E004	17.4515012	78.4179417	2026-04-24 20:16:43.491577	outside
1127	E004	17.4515	78.4179261	2026-04-24 20:16:44.595025	outside
1128	E004	17.4514988	78.4179108	2026-04-24 20:16:45.470119	outside
1129	E004	17.4514976	78.4178969	2026-04-24 20:16:46.512133	outside
1130	E004	17.4514959	78.4178837	2026-04-24 20:16:47.524254	outside
1131	E004	17.4514941	78.4178713	2026-04-24 20:16:48.482303	outside
1132	E004	17.4514923	78.4178597	2026-04-24 20:16:49.438153	outside
1133	E004	17.4514905	78.4178493	2026-04-24 20:16:50.452639	outside
1134	E004	17.4514886	78.4178396	2026-04-24 20:16:51.682881	outside
1135	E002	17.451610874877147	78.41737586346576	2026-04-24 20:16:51.770595	outside
1136	E004	17.4514866	78.4178304	2026-04-24 20:16:52.609122	outside
1137	E004	17.4514847	78.4178223	2026-04-24 20:16:53.498726	outside
1138	E004	17.4514827	78.4178149	2026-04-24 20:16:54.696415	outside
1139	E004	17.4514815	78.4178088	2026-04-24 20:16:55.500562	outside
1140	E004	17.4514795	78.4178023	2026-04-24 20:16:56.509299	outside
1141	E004	17.4514778	78.4177973	2026-04-24 20:16:57.234306	outside
1142	E004	17.4514752	78.4177943	2026-04-24 20:16:57.479312	outside
1143	E004	17.4514725	78.4177898	2026-04-24 20:16:58.50277	outside
1144	E004	17.4514709	78.4177833	2026-04-24 20:16:59.454558	outside
1145	E004	17.4514707	78.4177757	2026-04-24 20:17:00.54553	outside
1146	E004	17.4514706	78.4177674	2026-04-24 20:17:01.516648	outside
1147	E004	17.4514691	78.4177605	2026-04-24 20:17:02.515323	outside
1148	E004	17.4514666	78.417755	2026-04-24 20:17:03.462726	outside
1149	E004	17.4514658	78.4177471	2026-04-24 20:17:04.521725	outside
1150	E004	17.4514651	78.4177388	2026-04-24 20:17:06.02846	outside
1151	E004	17.4516184	78.4176072	2026-04-24 20:17:17.275998	outside
1152	E003	17.45150629412463	78.41737433139465	2026-04-24 20:17:27.223767	outside
1153	E004	17.4516516	78.4175924	2026-04-24 20:17:27.251348	outside
1154	E004	17.4516265	78.4174961	2026-04-24 20:17:29.29355	outside
1155	E004	17.4516332	78.4174656	2026-04-24 20:17:40.394647	outside
1156	E004	17.4517044	78.4173807	2026-04-24 20:17:41.304899	outside
1157	E004	17.4517293	78.4173401	2026-04-24 20:17:51.208914	outside
1158	E004	17.451742	78.4173582	2026-04-24 20:17:53.323909	outside
1159	E003	17.451491709485108	78.41737217474059	2026-04-24 20:17:53.70074	outside
1160	E002	17.451491709485108	78.41737217474059	2026-04-24 20:17:53.707793	outside
1161	E004	17.4517569	78.4173464	2026-04-24 20:18:03.191504	outside
1162	E004	17.451658	78.4174257	2026-04-24 20:18:04.93665	outside
1163	E004	17.4516416	78.4174376	2026-04-24 20:18:14.823707	outside
1164	E004	17.4517098	78.4174011	2026-04-24 20:18:16.469306	outside
1165	E004	17.4517248	78.4173944	2026-04-24 20:18:26.697849	outside
1166	E004	17.4516121	78.4173833	2026-04-24 20:18:28.794719	outside
1167	E004	17.4515874	78.417378	2026-04-24 20:18:38.770072	outside
1168	E004	17.4516776	78.4173708	2026-04-24 20:18:40.912347	outside
1169	E003	17.451478015577948	78.41737321918635	2026-04-24 20:18:44.542034	outside
1170	E004	17.4517106	78.4173664	2026-04-24 20:18:50.760988	outside
1171	E004	17.4517922	78.4173769	2026-04-24 20:18:52.368326	outside
1172	E004	17.4518185	78.4173759	2026-04-24 20:19:02.349954	outside
1173	E004	17.4516249	78.4174712	2026-04-24 20:19:04.384111	outside
1174	E004	17.4515833	78.4174979	2026-04-24 20:19:14.739228	outside
1175	E004	17.4515195	78.4175287	2026-04-24 20:19:16.332623	outside
1176	E003	17.451547767766172	78.41737434172258	2026-04-24 20:19:19.619087	outside
1177	E004	17.4513033	78.4199267	2026-04-24 20:19:20.501208	outside
1178	E004	17.451301	78.419929	2026-04-24 20:19:21.468041	outside
1179	E004	17.4512984	78.4199302	2026-04-24 20:19:22.462408	outside
1180	E004	17.4512946	78.4199312	2026-04-24 20:19:23.458228	outside
1181	E004	17.4512917	78.4199326	2026-04-24 20:19:24.58485	outside
1182	E004	17.4512886	78.4199342	2026-04-24 20:19:25.503479	outside
1183	E004	17.4512858	78.4199357	2026-04-24 20:19:26.530243	outside
1184	E004	17.451284	78.4199377	2026-04-24 20:19:27.51567	outside
1185	E004	17.4512815	78.4199395	2026-04-24 20:19:28.513005	outside
1186	E004	17.4512783	78.4199412	2026-04-24 20:19:29.519325	outside
1187	E004	17.4512756	78.4199435	2026-04-24 20:19:30.567463	outside
1188	E004	17.4512744	78.4199456	2026-04-24 20:19:31.537516	outside
1189	E004	17.4512729	78.4199474	2026-04-24 20:19:32.520197	outside
1190	E004	17.4512712	78.4199493	2026-04-24 20:19:33.524882	outside
1191	E004	17.4512698	78.4199513	2026-04-24 20:19:34.567544	outside
1192	E004	17.451268	78.4199536	2026-04-24 20:19:35.519016	outside
1193	E004	17.4512651	78.419955	2026-04-24 20:19:36.506196	outside
1194	E004	17.4512614	78.4199567	2026-04-24 20:19:37.636671	outside
1195	E004	17.4512567	78.4199587	2026-04-24 20:19:38.486014	outside
1196	E004	17.4512515	78.4199611	2026-04-24 20:19:39.485638	outside
1197	E004	17.451246	78.4199638	2026-04-24 20:19:40.579998	outside
1198	E004	17.4512429	78.4199675	2026-04-24 20:19:41.533865	outside
1199	E004	17.4512398	78.4199722	2026-04-24 20:19:42.498849	outside
1200	E004	17.4512364	78.4199772	2026-04-24 20:19:43.467742	outside
1201	E004	17.4512336	78.4199827	2026-04-24 20:19:44.751565	outside
1202	E004	17.4512318	78.4199862	2026-04-24 20:19:45.242134	outside
1203	E004	17.4512294	78.4199914	2026-04-24 20:19:45.520191	outside
1204	E004	17.4512268	78.419997	2026-04-24 20:19:46.508293	outside
1205	E003	17.451592058228055	78.41737882086167	2026-04-24 20:19:54.648146	outside
1206	E004	17.4512226	78.419998	2026-04-24 20:19:59.600216	outside
1207	E004	17.4514988	78.417529	2026-04-24 20:20:01.581267	outside
1208	E004	17.4514988	78.417529	2026-04-24 20:20:11.584377	outside
1209	E004	17.4516706	78.4174314	2026-04-24 20:20:13.59476	outside
1210	E004	17.4517189	78.4174039	2026-04-24 20:20:23.551205	outside
1211	E004	17.4513503	78.4187593	2026-04-24 20:20:25.550863	outside
1212	E004	17.4513522	78.4187512	2026-04-24 20:20:25.640835	outside
1213	E004	17.4513724	78.4186073	2026-04-24 20:20:26.67622	outside
1214	E004	17.4513721	78.4186054	2026-04-24 20:20:27.540056	outside
1215	E004	17.4513726	78.418603	2026-04-24 20:20:28.494015	outside
1216	E004	17.4513734	78.4186004	2026-04-24 20:20:29.554956	outside
1217	E003	17.451583362999298	78.41739514225647	2026-04-24 20:20:29.847265	outside
1218	E004	17.451394	78.4185626	2026-04-24 20:20:30.883953	outside
1219	E004	17.4513987	78.4185533	2026-04-24 20:20:31.664592	outside
1220	E004	17.4514091	78.418545	2026-04-24 20:20:32.52747	outside
1221	E004	17.4514201	78.4185413	2026-04-24 20:20:33.687455	outside
1222	E004	17.4514306	78.4185388	2026-04-24 20:20:34.452521	outside
1223	E004	17.451439	78.4185303	2026-04-24 20:20:35.523532	outside
1224	E004	17.4514437	78.4185156	2026-04-24 20:20:36.450833	outside
1225	E004	17.4514409	78.4185116	2026-04-24 20:20:37.464168	outside
1226	E004	17.4514824	78.4184247	2026-04-24 20:20:48.815843	outside
1227	E004	17.4515045	78.4183892	2026-04-24 20:20:58.84265	outside
1228	E004	17.4515385	78.4180502	2026-04-24 20:21:00.498416	outside
1229	E003	17.451615639617753	78.41739734353742	2026-04-24 20:21:05.304753	outside
1230	E003	17.45153245054378	78.41738670989861	2026-04-24 20:21:36.254656	outside
1231	E003	17.451515671053276	78.41736628215075	2026-04-24 20:22:38.479111	outside
1238	E002	17.451538130763474	78.4173818608525	2026-04-24 20:26:16.322103	outside
1239	E004	17.4517207	78.4175894	2026-04-24 20:26:19.781797	outside
1240	E004	17.4515948	78.4175138	2026-04-24 20:26:21.872851	outside
1283	E004	17.4514918	78.4175262	2026-04-24 20:31:45.676517	outside
1284	E004	17.4514843	78.4175302	2026-04-24 20:31:47.682073	outside
1285	E004	17.4514839	78.4175304	2026-04-24 20:31:58.06837	outside
1286	E004	17.451484	78.4175303	2026-04-24 20:31:59.220739	outside
1325	E004	17.5064854	78.4772589	2026-04-25 13:52:31.426377	inside
1332	E002	17.5064857	78.4772569	2026-04-25 13:52:46.952139	inside
1333	E002	17.5065307	78.4772916	2026-04-25 13:52:47.894516	inside
1334	E004	17.5064854	78.4772662	2026-04-25 13:52:50.739552	inside
1335	E002	17.5065382	78.4773038	2026-04-25 13:52:57.904669	inside
1350	E003	17.5064859	78.4772649	2026-04-25 13:53:26.388918	inside
1351	E004	17.5064854	78.4772666	2026-04-25 13:53:28.324777	inside
1352	E002	17.5065033	78.4772731	2026-04-25 13:53:30.200329	inside
1353	E003	17.5064927	78.4772607	2026-04-25 13:53:31.502754	inside
1357	E003	17.5064849	78.477265	2026-04-25 13:53:41.761072	inside
1358	E002	17.5064886	78.4772596	2026-04-25 13:53:41.925638	inside
1359	E003	17.5064856	78.4772678	2026-04-25 13:53:47.062406	inside
1360	E004	17.5064866	78.4772667	2026-04-25 13:53:47.471626	inside
1361	E002	17.5064867	78.4772558	2026-04-25 13:53:51.765527	inside
1362	E003	17.5064852	78.4772668	2026-04-25 13:53:51.902966	inside
1363	E002	17.5065245	78.4772876	2026-04-25 13:53:53.106274	inside
1364	E004	17.506485	78.4772669	2026-04-25 13:53:56.806051	inside
1365	E003	17.5065331	78.4772917	2026-04-25 13:53:57.287213	inside
1366	E003	17.5065368	78.4772948	2026-04-25 13:54:02.723926	inside
1367	E002	17.5065306	78.4772928	2026-04-25 13:54:03.022324	inside
1368	E002	17.5065394	78.4772952	2026-04-25 13:54:04.101234	inside
1369	E004	17.5064857	78.4772663	2026-04-25 13:54:06.167835	inside
1508	E003	17.5066593	78.4775628	2026-04-25 13:56:45.989264	outside
1509	E003	17.5066317	78.4775192	2026-04-25 13:56:47.176799	outside
1510	E003	17.506598	78.4774621	2026-04-25 13:56:47.656791	outside
1511	E004	17.5064869	78.4772602	2026-04-25 13:56:47.662518	inside
1513	E003	17.5065446	78.4773902	2026-04-25 13:56:52.818221	inside
1514	E004	17.5064829	78.4772867	2026-04-25 13:56:53.413618	inside
1515	E004	17.5064823	78.4772826	2026-04-25 13:56:54.339255	inside
1512	E002	17.5064805	78.4772608	2026-04-25 13:56:47.666006	inside
1516	E002	17.5064791	78.4772582	2026-04-25 13:56:57.619507	inside
1517	E003	17.5064997	78.4773149	2026-04-25 13:56:57.753113	inside
1518	E002	17.5064839	78.4772645	2026-04-25 13:56:58.54744	inside
1519	E003	17.5064867	78.4772786	2026-04-25 13:57:02.983091	inside
1520	E004	17.5064841	78.4772938	2026-04-25 13:57:03.043218	inside
1521	E004	17.5064843	78.4772871	2026-04-25 13:57:04.13675	inside
1522	E004	17.5064795	78.4772781	2026-04-25 13:57:06.301625	inside
1523	E004	17.5064694	78.4772706	2026-04-25 13:57:07.667306	inside
1524	E004	17.5064682	78.4772654	2026-04-25 13:57:08.015926	inside
1525	E003	17.5064947	78.4772673	2026-04-25 13:57:08.120853	inside
1526	E002	17.5064852	78.4772662	2026-04-25 13:57:08.215301	inside
1527	E002	17.5065334	78.4772893	2026-04-25 13:57:08.979887	inside
1528	E003	17.5064862	78.4772623	2026-04-25 13:57:13.485883	inside
1529	E004	17.5064643	78.4772619	2026-04-25 13:57:15.847203	inside
1530	E004	17.5064627	78.4772583	2026-04-25 13:57:18.309163	inside
1531	E003	17.5064916	78.4772689	2026-04-25 13:57:18.343387	inside
1532	E004	17.5064622	78.4772577	2026-04-25 13:57:18.809243	inside
1533	E002	17.5065397	78.4772923	2026-04-25 13:57:18.830226	inside
1534	E004	17.5064619	78.4772575	2026-04-25 13:57:19.16359	inside
1535	E004	17.5064623	78.4772566	2026-04-25 13:57:19.892047	inside
1536	E002	17.5064964	78.4772752	2026-04-25 13:57:20.023957	inside
1537	E004	17.5064623	78.4772553	2026-04-25 13:57:20.859412	inside
1538	E003	17.5064868	78.4772642	2026-04-25 13:57:23.763836	inside
1539	E004	17.5064636	78.4772516	2026-04-25 13:57:25.67742	inside
1540	E003	17.506488	78.4772645	2026-04-25 13:57:28.764758	inside
1541	E004	17.5064786	78.4772611	2026-04-25 13:57:30.283629	inside
1542	E002	17.5064861	78.4772628	2026-04-25 13:57:31.037431	inside
1543	E004	17.5064858	78.4772567	2026-04-25 13:57:40.124442	inside
1544	E002	17.5064868	78.477263	2026-04-25 13:57:40.84501	inside
1545	E004	17.5064864	78.4772655	2026-04-25 13:57:49.536504	inside
1546	E002	17.5064878	78.4772755	2026-04-25 13:57:51.894927	inside
1547	E002	17.5065298	78.4772923	2026-04-25 13:57:53.021962	inside
1548	E004	17.5064861	78.4772655	2026-04-25 13:57:58.9574	inside
1549	E002	17.5065382	78.4772956	2026-04-25 13:58:03.060985	inside
1550	E004	17.5065328	78.4772938	2026-04-25 13:58:08.897672	inside
1551	E002	17.5064896	78.4772747	2026-04-25 13:58:17.188302	inside
1552	E002	17.5064848	78.4772589	2026-04-25 13:58:17.217131	inside
1553	E004	17.5064867	78.4772657	2026-04-25 13:58:17.920546	inside
1554	E002	17.5064836	78.4772551	2026-04-25 13:58:24.832454	inside
1555	E002	17.5064874	78.4772578	2026-04-25 13:58:25.975899	inside
1556	E004	17.5064863	78.4772654	2026-04-25 13:58:27.635252	inside
1557	E002	17.5064938	78.4772614	2026-04-25 13:58:35.713915	inside
1558	E004	17.5064948	78.4772755	2026-04-25 13:58:36.411351	inside
1559	E002	17.5065351	78.4772934	2026-04-25 13:58:36.709144	inside
1560	E004	17.5064862	78.4772656	2026-04-25 13:58:45.982197	inside
1561	E002	17.506551	78.4773053	2026-04-25 13:58:46.773845	inside
1562	E002	17.5065327	78.4772893	2026-04-25 13:58:47.589809	inside
1563	E004	17.5064861	78.4772655	2026-04-25 13:58:55.551177	inside
1564	E002	17.5065309	78.4772872	2026-04-25 13:58:57.648499	inside
1565	E002	17.5065362	78.4772947	2026-04-25 13:58:58.129567	inside
1566	E004	17.5064864	78.4772655	2026-04-25 13:59:04.896531	inside
1567	E002	17.5065373	78.4772964	2026-04-25 13:59:08.182641	inside
1568	E002	17.5065351	78.4772952	2026-04-25 13:59:09.000111	inside
1569	E004	17.5064854	78.4772667	2026-04-25 13:59:14.348733	inside
1570	E002	17.5065347	78.4772953	2026-04-25 13:59:18.814309	inside
1571	E002	17.5064854	78.4772599	2026-04-25 13:59:19.708191	inside
1572	E004	17.5064854	78.4772667	2026-04-25 13:59:23.622451	inside
1573	E002	17.5064687	78.477248	2026-04-25 13:59:29.582511	inside
1574	E002	17.5064844	78.4772601	2026-04-25 13:59:30.511767	inside
1575	E004	17.5064857	78.4772663	2026-04-25 13:59:32.860127	inside
1576	E002	17.5064851	78.4772608	2026-04-25 13:59:40.064126	inside
1577	E002	17.5065313	78.4772907	2026-04-25 13:59:41.075572	inside
1578	E004	17.5064859	78.4772657	2026-04-25 13:59:42.535924	inside
1579	E002	17.5065483	78.4773017	2026-04-25 13:59:50.882922	inside
1580	E004	17.5064864	78.4772655	2026-04-25 13:59:51.859595	inside
1581	E002	17.5065337	78.477293	2026-04-25 13:59:51.911743	inside
1582	E004	17.5064859	78.4772657	2026-04-25 14:00:01.158478	inside
1583	E002	17.5065334	78.477293	2026-04-25 14:00:01.860553	inside
1584	E002	17.5064874	78.4772621	2026-04-25 14:00:02.753997	inside
1585	E004	17.5064861	78.4772655	2026-04-25 14:00:10.311589	inside
1586	E002	17.5064729	78.4772524	2026-04-25 14:00:12.481564	inside
1587	E002	17.5064861	78.4772616	2026-04-25 14:00:13.247004	inside
1588	E004	17.5064866	78.4772655	2026-04-25 14:00:20.108449	inside
1589	E002	17.5064864	78.477262	2026-04-25 14:00:23.343892	inside
1590	E004	17.5064865	78.4772656	2026-04-25 14:00:29.481288	inside
1591	E002	17.5064895	78.47728	2026-04-25 14:00:34.113566	inside
1592	E002	17.5064857	78.4772674	2026-04-25 14:00:35.320154	inside
1593	E004	17.5064864	78.4772655	2026-04-25 14:00:38.800768	inside
1594	E002	17.5064848	78.4772647	2026-04-25 14:00:45.146523	inside
1595	E004	17.5064865	78.4772656	2026-04-25 14:00:48.233349	inside
1596	E002	17.5064888	78.4772769	2026-04-25 14:00:55.550012	inside
1597	E002	17.5065346	78.4772936	2026-04-25 14:00:56.525177	inside
1598	E004	17.5064866	78.4772655	2026-04-25 14:00:58.013802	inside
1599	E002	17.5065487	78.4772992	2026-04-25 14:01:06.362863	inside
1600	E004	17.5064866	78.4772655	2026-04-25 14:01:07.777514	inside
1601	E004	17.5064865	78.4772656	2026-04-25 14:01:17.204613	inside
1602	E002	17.506476	78.4772514	2026-04-25 14:01:17.307202	inside
1603	E002	17.506535	78.4772911	2026-04-25 14:01:18.332929	inside
1604	E004	17.5064889	78.4772649	2026-04-25 14:01:26.305903	inside
1605	E004	17.5064908	78.4772639	2026-04-25 14:01:36.043723	inside
1606	E004	17.5064865	78.4772656	2026-04-25 14:01:45.262251	inside
1607	E004	17.5064867	78.4772655	2026-04-25 14:01:54.364316	inside
1608	E004	17.5064842	78.4772672	2026-04-25 14:02:03.684516	inside
1609	E002	17.5064847	78.4772637	2026-04-25 14:09:22.156687	inside
1610	E002	17.5065326	78.4772902	2026-04-25 14:09:55.506688	inside
1611	E002	17.5064906	78.47727	2026-04-25 14:09:56.479696	inside
1612	E002	17.5064804	78.4772651	2026-04-25 14:10:06.200733	inside
1613	E002	17.5065004	78.47727	2026-04-25 14:10:17.375951	inside
1614	E002	17.5065005	78.47727	2026-04-25 14:10:18.494732	inside
1615	E002	17.5065292	78.4772917	2026-04-25 14:10:28.325695	inside
1616	E002	17.5064955	78.4772745	2026-04-25 14:10:29.55465	inside
1617	E002	17.5064874	78.4772704	2026-04-25 14:10:39.287633	inside
1618	E002	17.5065258	78.4772917	2026-04-25 14:10:40.28997	inside
1619	E002	17.506534	78.4772962	2026-04-25 14:10:50.205994	inside
1620	E002	17.5064886	78.477268	2026-04-25 14:10:51.284197	inside
1621	E002	17.5064817	78.4772638	2026-04-25 14:11:00.5807	inside
1622	E002	17.5065224	78.477284	2026-04-25 14:11:01.817514	inside
1623	E002	17.506534	78.4772898	2026-04-25 14:11:11.844102	inside
1624	E002	17.5065378	78.4772909	2026-04-25 14:11:12.381006	inside
1625	E002	17.5065386	78.4772911	2026-04-25 14:11:22.200011	inside
1626	E002	17.506485	78.4772643	2026-04-25 14:27:36.768928	inside
1627	E002	17.506481	78.4772615	2026-04-25 14:27:46.469157	inside
1628	E002	17.5064806	78.4772612	2026-04-25 14:27:47.117316	inside
1629	E002	17.5065234	78.4772873	2026-04-25 14:27:56.675572	inside
1630	E002	17.5064802	78.4772636	2026-04-25 14:28:00.790288	inside
1631	E002	17.5064795	78.4772628	2026-04-25 14:28:01.912047	inside
1632	E002	17.5064827	78.4772644	2026-04-25 14:28:07.111418	inside
1633	E002	17.50654	78.4772938	2026-04-25 14:28:13.883155	inside
1634	E002	17.5065403	78.4772999	2026-04-25 14:28:24.643672	inside
1635	E002	17.5065869	78.4772883	2026-04-25 14:28:28.150325	inside
1636	E002	17.5065218	78.4772553	2026-04-25 14:28:28.970822	inside
1637	E002	17.5065121	78.4772547	2026-04-25 14:28:29.700662	inside
1638	E002	17.5065111	78.4772578	2026-04-25 14:28:30.018731	inside
1639	E002	17.5065078	78.4772603	2026-04-25 14:28:30.884042	inside
1640	E002	17.5065073	78.4772727	2026-04-25 14:28:31.656092	inside
1641	E002	17.5065121	78.4772799	2026-04-25 14:28:31.977555	inside
1642	E002	17.5065144	78.4772834	2026-04-25 14:28:32.180122	inside
1643	E002	17.506522	78.4772996	2026-04-25 14:28:32.999361	inside
1644	E002	17.5065255	78.477307	2026-04-25 14:28:33.200066	inside
1645	E002	17.5065325	78.4772972	2026-04-25 14:28:33.799702	inside
1646	E002	17.5065357	78.4772922	2026-04-25 14:28:33.991244	inside
1647	E002	17.5065382	78.4772886	2026-04-25 14:28:34.825319	inside
1648	E002	17.5065367	78.477287	2026-04-25 14:28:35.918798	inside
1649	E002	17.5065316	78.4772896	2026-04-25 14:28:36.871633	inside
1650	E002	17.5065296	78.4772902	2026-04-25 14:28:37.367549	inside
1651	E002	17.5065283	78.4772904	2026-04-25 14:28:37.894122	inside
1652	E002	17.5065247	78.477285	2026-04-25 14:28:38.962414	inside
1653	E002	17.5065242	78.4772839	2026-04-25 14:28:39.045397	inside
1654	E002	17.5065236	78.4772825	2026-04-25 14:28:39.249321	inside
1655	E002	17.506527	78.4772784	2026-04-25 14:28:39.875851	inside
1656	E002	17.506527	78.4772776	2026-04-25 14:28:40.152744	inside
1657	E002	17.5065272	78.477277	2026-04-25 14:28:40.628018	inside
1658	E002	17.5065257	78.4772782	2026-04-25 14:28:40.864518	inside
1659	E002	17.5065258	78.4772784	2026-04-25 14:28:41.473126	inside
1660	E002	17.5065279	78.4772763	2026-04-25 14:28:41.901826	inside
1661	E002	17.5065303	78.4772748	2026-04-25 14:28:42.241861	inside
1662	E002	17.5065316	78.4772741	2026-04-25 14:28:42.510372	inside
1663	E002	17.5065366	78.4772674	2026-04-25 14:28:42.927002	inside
1664	E002	17.5065411	78.4772614	2026-04-25 14:28:43.412743	inside
1665	E002	17.5065416	78.4772579	2026-04-25 14:28:43.875687	inside
1666	E002	17.5065412	78.4772572	2026-04-25 14:28:43.96023	inside
1667	E002	17.5065427	78.4772521	2026-04-25 14:28:44.772617	inside
1668	E002	17.5065423	78.4772527	2026-04-25 14:28:44.913419	inside
1669	E002	17.5065441	78.4772484	2026-04-25 14:28:45.64317	inside
1670	E002	17.5065449	78.4772474	2026-04-25 14:28:45.871445	inside
1671	E002	17.506546	78.4772445	2026-04-25 14:28:46.629886	inside
1672	E002	17.5065455	78.4772443	2026-04-25 14:28:46.94981	inside
1673	E002	17.5065455	78.4772435	2026-04-25 14:28:47.109899	inside
1674	E002	17.5065456	78.4772403	2026-04-25 14:28:48.222022	inside
1675	E002	17.5065461	78.4772363	2026-04-25 14:28:48.804698	inside
1676	E002	17.5065468	78.4772355	2026-04-25 14:28:48.923668	inside
1677	E002	17.5065475	78.4772346	2026-04-25 14:28:49.395115	inside
1678	E002	17.5065492	78.4772268	2026-04-25 14:28:49.86159	inside
1679	E002	17.5065507	78.4772257	2026-04-25 14:28:50.482368	inside
1680	E002	17.5065536	78.4772247	2026-04-25 14:28:50.854131	inside
1681	E002	17.5065508	78.477223	2026-04-25 14:28:51.733801	inside
1682	E002	17.5065523	78.4772247	2026-04-25 14:28:51.87937	inside
1683	E002	17.5065503	78.4772271	2026-04-25 14:28:52.456817	inside
1684	E002	17.5065506	78.4772292	2026-04-25 14:28:52.883496	inside
1685	E002	17.5065506	78.4772301	2026-04-25 14:28:52.977986	inside
1686	E002	17.5065441	78.4772348	2026-04-25 14:28:53.847772	inside
1687	E002	17.5065455	78.4772369	2026-04-25 14:28:54.157491	inside
1688	E002	17.5065425	78.4772396	2026-04-25 14:28:54.655601	inside
1689	E002	17.5065396	78.4772407	2026-04-25 14:28:54.862524	inside
1690	E002	17.5065386	78.4772418	2026-04-25 14:28:55.277351	inside
1691	E002	17.5065392	78.4772439	2026-04-25 14:28:55.862196	inside
1692	E002	17.5065397	78.4772444	2026-04-25 14:28:55.973188	inside
1693	E002	17.5065354	78.4772484	2026-04-25 14:28:56.988936	inside
1694	E002	17.5065407	78.4772529	2026-04-25 14:28:57.256258	inside
1695	E002	17.506553	78.4772622	2026-04-25 14:28:57.958006	inside
1696	E002	17.5065575	78.4772657	2026-04-25 14:28:58.188674	inside
1697	E002	17.5065703	78.4772713	2026-04-25 14:28:58.99637	inside
1698	E002	17.5065776	78.4772727	2026-04-25 14:28:59.178334	inside
1699	E002	17.506576	78.4772771	2026-04-25 14:28:59.574306	inside
1700	E002	17.5065825	78.4772767	2026-04-25 14:28:59.965603	inside
1701	E002	17.5065847	78.4772771	2026-04-25 14:29:00.259469	inside
1702	E002	17.5065872	78.4772771	2026-04-25 14:29:00.298791	inside
1703	E002	17.5065818	78.4772789	2026-04-25 14:29:00.510802	inside
1704	E002	17.5065819	78.4772784	2026-04-25 14:29:00.911034	inside
1705	E002	17.5065815	78.4772792	2026-04-25 14:29:01.250124	inside
1706	E002	17.5065801	78.4772803	2026-04-25 14:29:01.967626	inside
1707	E002	17.5065786	78.4772825	2026-04-25 14:29:02.604064	inside
1708	E002	17.506577	78.4772828	2026-04-25 14:29:02.892391	inside
1709	E002	17.5065746	78.4772842	2026-04-25 14:29:03.32872	inside
1710	E002	17.5065684	78.4772824	2026-04-25 14:29:03.901245	inside
1711	E002	17.5065662	78.4772809	2026-04-25 14:29:03.930469	inside
1712	E002	17.5065616	78.4772812	2026-04-25 14:29:04.563857	inside
1713	E002	17.5065586	78.4772808	2026-04-25 14:29:04.888511	inside
1714	E002	17.5065508	78.4772756	2026-04-25 14:29:05.39326	inside
1715	E002	17.5065449	78.477272	2026-04-25 14:29:05.877099	inside
1716	E002	17.5065315	78.4772593	2026-04-25 14:29:06.668725	inside
1717	E002	17.5065231	78.4772486	2026-04-25 14:29:07.03986	inside
1718	E002	17.506518	78.4772437	2026-04-25 14:29:07.194854	inside
1719	E002	17.5065101	78.4772384	2026-04-25 14:29:07.868858	inside
1720	E002	17.5065077	78.4772367	2026-04-25 14:29:08.10174	inside
1721	E002	17.506503	78.4772345	2026-04-25 14:29:08.565344	inside
1722	E002	17.506499	78.4772329	2026-04-25 14:29:08.994994	inside
1723	E002	17.5064908	78.4772301	2026-04-25 14:29:09.999464	inside
1724	E002	17.5064837	78.4772294	2026-04-25 14:29:10.20322	inside
1725	E002	17.5064776	78.4772279	2026-04-25 14:29:10.680948	inside
1726	E002	17.5064758	78.4772286	2026-04-25 14:29:10.958109	inside
1727	E002	17.5064702	78.4772277	2026-04-25 14:29:11.750625	inside
1728	E002	17.5064679	78.4772283	2026-04-25 14:29:11.883537	inside
1729	E002	17.5064629	78.4772278	2026-04-25 14:29:12.488404	inside
1730	E002	17.506461	78.477228	2026-04-25 14:29:12.565436	inside
1731	E002	17.5064563	78.4772278	2026-04-25 14:29:12.870942	inside
1732	E002	17.5064568	78.477228	2026-04-25 14:29:13.04564	inside
1733	E002	17.5064538	78.4772267	2026-04-25 14:29:13.673975	inside
1734	E002	17.5064526	78.477226	2026-04-25 14:29:13.881074	inside
1735	E002	17.506448	78.4772242	2026-04-25 14:29:14.509203	inside
1736	E002	17.5064454	78.4772229	2026-04-25 14:29:14.87956	inside
1737	E002	17.5064426	78.4772218	2026-04-25 14:29:15.186032	inside
1738	E002	17.5064383	78.4772196	2026-04-25 14:29:15.820003	inside
1739	E002	17.5064329	78.4772171	2026-04-25 14:29:16.470906	inside
1740	E002	17.5064301	78.4772158	2026-04-25 14:29:16.891592	inside
1741	E002	17.5064292	78.4772153	2026-04-25 14:29:17.021605	inside
1742	E002	17.5064206	78.4772106	2026-04-25 14:29:17.880677	inside
1743	E002	17.5064093	78.477208	2026-04-25 14:29:18.923499	inside
1744	E002	17.5063961	78.4772094	2026-04-25 14:29:19.953113	inside
1745	E002	17.5063846	78.4772138	2026-04-25 14:29:20.88455	inside
1746	E002	17.5063801	78.4772166	2026-04-25 14:29:21.828469	inside
1747	E002	17.5063742	78.4772181	2026-04-25 14:29:21.885296	inside
1748	E002	17.5063684	78.4772194	2026-04-25 14:29:22.334375	inside
1749	E002	17.5063608	78.4772184	2026-04-25 14:29:22.90989	inside
1750	E002	17.5063615	78.4772178	2026-04-25 14:29:22.980371	inside
1751	E002	17.50636	78.4772161	2026-04-25 14:29:23.77602	inside
1752	E002	17.5063609	78.4772164	2026-04-25 14:29:23.902626	inside
1753	E002	17.5063579	78.4772155	2026-04-25 14:29:24.887272	inside
1754	E002	17.5063539	78.4772139	2026-04-25 14:29:25.803298	inside
1755	E002	17.5063518	78.477213	2026-04-25 14:29:25.872331	inside
1756	E002	17.5063494	78.4772115	2026-04-25 14:29:26.467433	inside
1757	E002	17.5063466	78.4772102	2026-04-25 14:29:26.887378	inside
1758	E002	17.5063448	78.4772091	2026-04-25 14:29:27.207157	inside
1759	E002	17.5063432	78.4772083	2026-04-25 14:29:27.399752	inside
1760	E002	17.5063371	78.4772061	2026-04-25 14:29:27.896952	inside
1761	E002	17.506337	78.4772062	2026-04-25 14:29:28.018086	inside
1762	E002	17.5063351	78.4772054	2026-04-25 14:29:28.418214	inside
1763	E002	17.5063327	78.4772059	2026-04-25 14:29:28.888531	inside
1764	E002	17.5063282	78.4772088	2026-04-25 14:29:29.875534	inside
1765	E002	17.5063247	78.4772151	2026-04-25 14:29:30.735956	inside
1766	E002	17.5063256	78.4772183	2026-04-25 14:29:31.021275	inside
1767	E002	17.5063253	78.4772211	2026-04-25 14:29:31.125672	inside
1768	E002	17.506323	78.4772265	2026-04-25 14:29:31.909139	inside
1769	E002	17.5063238	78.4772325	2026-04-25 14:29:32.510894	inside
1770	E002	17.5063263	78.4772371	2026-04-25 14:29:32.909162	inside
1771	E002	17.5063271	78.4772414	2026-04-25 14:29:33.324057	inside
1772	E002	17.5063267	78.4772462	2026-04-25 14:29:33.935345	inside
1773	E002	17.506329	78.4772477	2026-04-25 14:29:33.957665	inside
1774	E002	17.5063301	78.4772532	2026-04-25 14:29:34.601922	inside
1775	E002	17.5063331	78.4772556	2026-04-25 14:29:34.933381	inside
1776	E002	17.5063345	78.4772598	2026-04-25 14:29:35.417368	inside
1777	E002	17.5063377	78.4772633	2026-04-25 14:29:35.959417	inside
1778	E002	17.5063391	78.4772652	2026-04-25 14:29:36.202251	inside
1779	E002	17.5063399	78.4772703	2026-04-25 14:29:36.837574	inside
1780	E002	17.5063458	78.4772748	2026-04-25 14:29:37.519576	inside
1781	E002	17.5063464	78.4772794	2026-04-25 14:29:37.609099	inside
1782	E002	17.5063481	78.4772786	2026-04-25 14:29:37.885544	inside
1783	E002	17.5063495	78.477281	2026-04-25 14:29:38.367278	inside
1784	E002	17.5063521	78.4772841	2026-04-25 14:29:38.953253	inside
1785	E002	17.5063515	78.4772837	2026-04-25 14:29:39.048658	inside
1786	E002	17.5063543	78.4772896	2026-04-25 14:29:39.803825	inside
1787	E002	17.5063568	78.4772898	2026-04-25 14:29:39.88877	inside
1788	E002	17.5063584	78.4772941	2026-04-25 14:29:40.516736	inside
1789	E002	17.5063587	78.4772951	2026-04-25 14:29:40.892806	inside
1790	E002	17.5063596	78.4772982	2026-04-25 14:29:41.45892	inside
1791	E002	17.5063601	78.4772996	2026-04-25 14:29:42.164712	inside
1792	E002	17.5063599	78.4772992	2026-04-25 14:29:42.165357	inside
1793	E002	17.506361	78.4773024	2026-04-25 14:29:42.885556	inside
1794	E002	17.506362	78.477304	2026-04-25 14:29:43.408635	inside
1795	E002	17.506362	78.477304	2026-04-25 14:29:43.893616	inside
1796	E002	17.506362	78.4773053	2026-04-25 14:29:44.186749	inside
1797	E002	17.5063628	78.4773076	2026-04-25 14:29:44.555714	inside
1798	E002	17.5063626	78.4773083	2026-04-25 14:29:44.884966	inside
1799	E002	17.5063629	78.4773112	2026-04-25 14:29:45.45822	inside
1800	E002	17.506363	78.4773143	2026-04-25 14:29:45.919543	inside
1801	E002	17.5063635	78.4773166	2026-04-25 14:29:46.326202	inside
1802	E002	17.5063643	78.477321	2026-04-25 14:29:46.867333	inside
1803	E002	17.5063661	78.4773251	2026-04-25 14:29:47.544075	inside
1804	E002	17.506369	78.4773271	2026-04-25 14:29:47.89424	inside
1805	E002	17.5063688	78.4773266	2026-04-25 14:29:49.235679	inside
1806	E002	17.5063671	78.4773255	2026-04-25 14:29:50.056223	inside
1807	E002	17.5063658	78.4773241	2026-04-25 14:29:50.898847	inside
1808	E002	17.5063653	78.4773236	2026-04-25 14:29:51.891051	inside
1809	E002	17.5063658	78.4773242	2026-04-25 14:29:52.870894	inside
1810	E002	17.5063648	78.4773253	2026-04-25 14:29:53.936751	inside
1811	E002	17.5063644	78.4773257	2026-04-25 14:29:54.958977	inside
1812	E002	17.5063641	78.4773263	2026-04-25 14:29:55.88625	inside
1813	E002	17.5063637	78.477327	2026-04-25 14:29:56.870363	inside
1814	E002	17.5063635	78.4773272	2026-04-25 14:29:58.072903	inside
1815	E002	17.5063634	78.4773271	2026-04-25 14:29:58.175643	inside
1816	E002	17.5063635	78.4773266	2026-04-25 14:29:58.945019	inside
1817	E002	17.5063634	78.4773257	2026-04-25 14:29:59.889662	inside
1818	E002	17.5063648	78.4773279	2026-04-25 14:30:07.300272	inside
1819	E002	17.5063651	78.4773293	2026-04-25 14:30:07.954793	inside
1820	E002	17.5063653	78.4773304	2026-04-25 14:30:08.885371	inside
1821	E002	17.5063666	78.4773305	2026-04-25 14:30:09.889462	inside
1822	E002	17.5063661	78.477331	2026-04-25 14:30:10.880258	inside
1823	E002	17.5063659	78.4773317	2026-04-25 14:30:11.88589	inside
1824	E002	17.5063651	78.4773313	2026-04-25 14:30:17.282274	inside
1825	E002	17.506364	78.4773305	2026-04-25 14:30:17.892563	inside
1826	E002	17.5063626	78.4773296	2026-04-25 14:30:19.044676	inside
1827	E002	17.5063614	78.4773284	2026-04-25 14:30:19.968224	inside
1828	E002	17.5063608	78.4773274	2026-04-25 14:30:20.958757	inside
1829	E002	17.5063603	78.4773277	2026-04-25 14:30:21.17942	inside
1830	E002	17.5063602	78.4773271	2026-04-25 14:30:22.101862	inside
1831	E002	17.506359	78.4773271	2026-04-25 14:30:22.900946	inside
1832	E002	17.5063575	78.4773268	2026-04-25 14:30:23.919	inside
1833	E002	17.506357	78.477327	2026-04-25 14:30:25.225147	inside
1834	E002	17.5063582	78.4773343	2026-04-25 14:30:31.884879	inside
1835	E002	17.5063599	78.4773415	2026-04-25 14:30:32.986772	inside
1836	E002	17.5063616	78.4773487	2026-04-25 14:30:33.93127	inside
1837	E002	17.5063559	78.4773761	2026-04-25 14:30:34.906408	outside
1838	E002	17.5063541	78.477383	2026-04-25 14:30:35.753542	outside
1839	E002	17.5063523	78.477396	2026-04-25 14:30:35.94922	outside
1840	E002	17.5063484	78.477403	2026-04-25 14:30:36.901433	outside
1841	E002	17.5063479	78.4774043	2026-04-25 14:30:37.909688	outside
1842	E002	17.5063469	78.4774065	2026-04-25 14:30:38.882279	outside
1843	E002	17.5063461	78.4774083	2026-04-25 14:30:39.919093	outside
1844	E002	17.5063459	78.4774093	2026-04-25 14:30:40.882374	outside
1845	E002	17.5063458	78.4774102	2026-04-25 14:30:41.9109	outside
1846	E002	17.5063458	78.477411	2026-04-25 14:30:42.928206	outside
1847	E002	17.5063458	78.4774116	2026-04-25 14:30:43.864217	outside
1848	E002	17.5063457	78.477412	2026-04-25 14:30:44.972443	outside
1849	E002	17.5063457	78.4774121	2026-04-25 14:30:45.293366	outside
1850	E002	17.5063457	78.4774126	2026-04-25 14:30:45.925296	outside
1851	E002	17.5063457	78.4774124	2026-04-25 14:30:46.223539	outside
1852	E002	17.506348	78.477413	2026-04-25 14:30:46.911085	outside
1853	E002	17.5063482	78.4774133	2026-04-25 14:30:47.881211	outside
1854	E002	17.5063484	78.4774136	2026-04-25 14:30:48.891854	outside
1855	E002	17.5063484	78.4774139	2026-04-25 14:30:49.896373	outside
1856	E002	17.5063485	78.477414	2026-04-25 14:30:50.869928	outside
1857	E002	17.5063485	78.4774143	2026-04-25 14:30:51.888683	outside
1858	E002	17.5063483	78.4774145	2026-04-25 14:30:52.907468	outside
1859	E002	17.5063482	78.4774149	2026-04-25 14:30:53.913949	outside
1860	E002	17.5063482	78.4774152	2026-04-25 14:30:54.881774	outside
1861	E003	17.5064818	78.4772708	2026-04-25 14:30:55.392457	inside
1862	E002	17.5063482	78.4774156	2026-04-25 14:30:56.215215	outside
1863	E002	17.5063483	78.4774155	2026-04-25 14:30:56.305599	outside
1864	E002	17.5063486	78.4774159	2026-04-25 14:30:56.906583	outside
1865	E002	17.5063494	78.4774164	2026-04-25 14:30:57.944108	outside
1866	E002	17.5063488	78.4774161	2026-04-25 14:30:58.158442	outside
1867	E002	17.5063507	78.4774154	2026-04-25 14:30:58.887927	outside
1868	E002	17.5063508	78.4774151	2026-04-25 14:30:59.898305	outside
1869	E002	17.5063511	78.477415	2026-04-25 14:31:00.922048	outside
1870	E003	17.5064818	78.4772708	2026-04-25 14:31:01.612395	inside
1871	E002	17.5063512	78.4774146	2026-04-25 14:31:01.887882	outside
1872	E002	17.5063517	78.4774138	2026-04-25 14:31:02.877169	outside
1873	E002	17.5063518	78.4774115	2026-04-25 14:31:03.870149	outside
1874	E002	17.5063513	78.47741	2026-04-25 14:31:04.88097	outside
1875	E002	17.5063508	78.4774085	2026-04-25 14:31:05.896925	outside
1876	E003	17.5064961	78.477264	2026-04-25 14:31:06.432303	inside
1877	E002	17.5063508	78.477408	2026-04-25 14:31:06.909293	outside
1878	E002	17.5063503	78.4774069	2026-04-25 14:31:07.933081	outside
1879	E002	17.5063496	78.4774057	2026-04-25 14:31:08.160629	outside
1880	E002	17.5063493	78.4774045	2026-04-25 14:31:08.887782	outside
1881	E002	17.5063493	78.4774044	2026-04-25 14:31:09.497107	outside
1882	E002	17.5063492	78.4774038	2026-04-25 14:31:09.952425	outside
1883	E002	17.506349	78.4774032	2026-04-25 14:31:10.719731	outside
1884	E002	17.5063502	78.4774029	2026-04-25 14:31:10.878044	outside
1885	E002	17.5063505	78.4774021	2026-04-25 14:31:11.884011	outside
1886	E003	17.5064942	78.4772702	2026-04-25 14:31:12.146154	inside
1887	E002	17.5063506	78.4774011	2026-04-25 14:31:12.949217	outside
1888	E002	17.5063505	78.4773994	2026-04-25 14:31:13.869695	outside
1889	E002	17.5063501	78.477397	2026-04-25 14:31:14.951924	outside
1890	E002	17.5063495	78.477392	2026-04-25 14:31:15.874386	outside
1891	E002	17.5063491	78.477389	2026-04-25 14:31:16.881439	outside
1892	E003	17.5065401	78.4772928	2026-04-25 14:31:17.923843	inside
1893	E002	17.5063486	78.4773829	2026-04-25 14:31:17.98348	outside
1894	E002	17.5063485	78.4773758	2026-04-25 14:31:18.928011	outside
1895	E002	17.5063487	78.4773728	2026-04-25 14:31:19.87408	outside
1896	E002	17.5063488	78.4773716	2026-04-25 14:31:20.557188	outside
1897	E002	17.5063489	78.47737	2026-04-25 14:31:21.005461	outside
1898	E002	17.5063489	78.47737	2026-04-25 14:31:21.252446	outside
1899	E003	17.506539	78.4772876	2026-04-25 14:31:21.580902	inside
1900	E002	17.5063496	78.4773693	2026-04-25 14:31:21.923862	outside
1901	E002	17.5063497	78.4773691	2026-04-25 14:31:22.887162	outside
1902	E002	17.5063497	78.4773687	2026-04-25 14:31:23.987045	outside
1903	E002	17.5063499	78.4773682	2026-04-25 14:31:24.882105	outside
1904	E002	17.50635	78.4773673	2026-04-25 14:31:25.895526	inside
1905	E003	17.5064873	78.4772635	2026-04-25 14:31:26.804662	inside
1906	E002	17.5063504	78.4773653	2026-04-25 14:31:26.956582	inside
1907	E002	17.5063505	78.4773615	2026-04-25 14:31:27.870167	inside
1908	E002	17.5063501	78.4773597	2026-04-25 14:31:29.019333	inside
1909	E002	17.5063493	78.4773583	2026-04-25 14:31:29.877073	inside
1910	E003	17.5064871	78.4772733	2026-04-25 14:31:29.908986	inside
1911	E003	17.5064879	78.4772714	2026-04-25 14:31:30.862872	inside
1912	E002	17.5063492	78.477356	2026-04-25 14:31:30.883885	inside
1913	E003	17.5065033	78.4772776	2026-04-25 14:31:31.806932	inside
1914	E002	17.5063474	78.4773525	2026-04-25 14:31:31.893737	inside
1915	E002	17.506347	78.4773522	2026-04-25 14:31:32.853041	inside
1916	E003	17.5065266	78.4772819	2026-04-25 14:31:32.861469	inside
1917	E003	17.5065389	78.4772849	2026-04-25 14:31:33.857815	inside
1918	E002	17.5063483	78.4773507	2026-04-25 14:31:33.87503	inside
1919	E003	17.5065494	78.4772893	2026-04-25 14:31:34.851808	inside
1920	E002	17.5063483	78.4773504	2026-04-25 14:31:34.888475	inside
1921	E003	17.5065574	78.4772939	2026-04-25 14:31:35.850795	inside
1922	E002	17.5063482	78.47735	2026-04-25 14:31:35.907371	inside
1923	E002	17.5063481	78.4773497	2026-04-25 14:31:36.880598	inside
1924	E003	17.5065654	78.477298	2026-04-25 14:31:36.931355	inside
1925	E003	17.5065617	78.4772965	2026-04-25 14:31:37.113938	inside
1926	E003	17.5066011	78.4773006	2026-04-25 14:31:37.893416	inside
1927	E002	17.5063477	78.4773497	2026-04-25 14:31:37.985066	inside
1928	E002	17.5063473	78.4773493	2026-04-25 14:31:38.972563	inside
1929	E003	17.5066209	78.4773052	2026-04-25 14:31:38.974875	inside
1931	E002	17.5063468	78.4773464	2026-04-25 14:31:39.907182	inside
1930	E003	17.5067281	78.4773409	2026-04-25 14:31:39.905391	outside
1932	E002	17.5063464	78.4773443	2026-04-25 14:31:40.640915	inside
1933	E002	17.506346	78.4773434	2026-04-25 14:31:40.959968	inside
1934	E003	17.5067851	78.4773681	2026-04-25 14:31:40.989818	outside
1935	E002	17.5063456	78.4773412	2026-04-25 14:31:41.460254	inside
1936	E002	17.5063462	78.4773386	2026-04-25 14:31:41.889017	inside
1937	E002	17.5063463	78.477336	2026-04-25 14:31:42.530171	inside
1938	E002	17.5063464	78.4773342	2026-04-25 14:31:42.764874	inside
1939	E002	17.506346	78.4773307	2026-04-25 14:31:42.962538	inside
1940	E002	17.5063476	78.4773256	2026-04-25 14:31:43.675441	inside
1941	E002	17.5063501	78.4773219	2026-04-25 14:31:43.855037	inside
1942	E002	17.506352	78.4773187	2026-04-25 14:31:44.275071	inside
1943	E002	17.506355	78.4773112	2026-04-25 14:31:45.045415	inside
1944	E002	17.5063556	78.4773101	2026-04-25 14:31:45.046773	inside
1945	E002	17.5063613	78.4773014	2026-04-25 14:31:45.419533	inside
1946	E002	17.5063619	78.4773003	2026-04-25 14:31:45.994308	inside
1947	E002	17.5063623	78.4772972	2026-04-25 14:31:46.193923	inside
1948	E002	17.5063634	78.4772925	2026-04-25 14:31:46.745069	inside
1949	E002	17.5063635	78.4772915	2026-04-25 14:31:46.960033	inside
1950	E002	17.5063638	78.4772882	2026-04-25 14:31:47.236439	inside
1951	E002	17.5063644	78.4772817	2026-04-25 14:31:47.860375	inside
1952	E002	17.5063644	78.4772807	2026-04-25 14:31:47.969236	inside
1953	E002	17.5063645	78.4772765	2026-04-25 14:31:48.373231	inside
1954	E002	17.5063654	78.4772718	2026-04-25 14:31:48.993643	inside
1955	E002	17.5063657	78.4772694	2026-04-25 14:31:49.147389	inside
1956	E002	17.5063668	78.477265	2026-04-25 14:31:49.589961	inside
1957	E002	17.5063668	78.4772619	2026-04-25 14:31:49.900805	inside
1958	E002	17.5063683	78.4772526	2026-04-25 14:31:50.891868	inside
1959	E002	17.5063699	78.4772473	2026-04-25 14:31:51.628462	inside
1960	E002	17.506371	78.4772429	2026-04-25 14:31:51.864218	inside
1961	E002	17.5063717	78.4772406	2026-04-25 14:31:52.084651	inside
1962	E002	17.506374	78.4772349	2026-04-25 14:31:52.809405	inside
1963	E002	17.5063748	78.477233	2026-04-25 14:31:53.036846	inside
1964	E002	17.5063766	78.4772283	2026-04-25 14:31:53.458871	inside
1965	E002	17.5063784	78.4772247	2026-04-25 14:31:53.910609	inside
1966	E002	17.5063789	78.4772239	2026-04-25 14:31:53.977612	inside
1967	E002	17.5063805	78.4772222	2026-04-25 14:31:54.180728	inside
1968	E002	17.5063872	78.4772138	2026-04-25 14:31:54.520625	inside
1969	E002	17.5063877	78.477214	2026-04-25 14:31:54.850022	inside
1970	E002	17.5063895	78.4772129	2026-04-25 14:31:55.202247	inside
1971	E002	17.506394	78.4772106	2026-04-25 14:31:55.770614	inside
1972	E002	17.5063955	78.4772106	2026-04-25 14:31:55.852267	inside
1973	E002	17.5064003	78.4772102	2026-04-25 14:31:56.28573	inside
1974	E002	17.5064058	78.4772109	2026-04-25 14:31:56.873242	inside
1975	E002	17.5064069	78.4772113	2026-04-25 14:31:56.929681	inside
1976	E002	17.5064133	78.4772128	2026-04-25 14:31:57.666344	inside
1977	E002	17.506415	78.4772133	2026-04-25 14:31:57.890521	inside
1978	E002	17.5064205	78.477215	2026-04-25 14:31:58.505732	inside
1979	E002	17.5064227	78.4772156	2026-04-25 14:31:58.876214	inside
1980	E002	17.506425	78.4772162	2026-04-25 14:31:59.163644	inside
1981	E002	17.5064277	78.4772133	2026-04-25 14:31:59.950306	inside
1982	E002	17.5064311	78.4772116	2026-04-25 14:32:00.482147	inside
1983	E002	17.506432	78.4772103	2026-04-25 14:32:00.885716	inside
1984	E002	17.5064314	78.4772128	2026-04-25 14:32:01.947267	inside
1985	E002	17.5064266	78.4772143	2026-04-25 14:32:02.890513	inside
1986	E002	17.5064239	78.4772129	2026-04-25 14:32:03.860631	inside
1987	E002	17.5064246	78.4772111	2026-04-25 14:32:04.07343	inside
1988	E002	17.5064236	78.4772125	2026-04-25 14:32:04.697517	inside
1989	E002	17.5064244	78.4772123	2026-04-25 14:32:04.9271	inside
1990	E002	17.506426	78.4772129	2026-04-25 14:32:05.343357	inside
1991	E002	17.5064275	78.4772137	2026-04-25 14:32:05.85485	inside
1992	E002	17.5064288	78.4772143	2026-04-25 14:32:06.058448	inside
1993	E002	17.5064312	78.477215	2026-04-25 14:32:06.744682	inside
1994	E002	17.5064327	78.4772159	2026-04-25 14:32:06.975638	inside
1995	E002	17.5064353	78.4772166	2026-04-25 14:32:07.312134	inside
1996	E002	17.5064368	78.4772168	2026-04-25 14:32:07.50515	inside
1997	E002	17.5064429	78.477218	2026-04-25 14:32:07.866696	inside
1998	E002	17.5064431	78.477218	2026-04-25 14:32:08.048065	inside
1999	E002	17.5064473	78.4772182	2026-04-25 14:32:08.674373	inside
2000	E002	17.5064489	78.4772183	2026-04-25 14:32:08.966178	inside
2001	E002	17.5064518	78.4772183	2026-04-25 14:32:09.435915	inside
2002	E002	17.5064569	78.4772168	2026-04-25 14:32:12.249226	inside
2003	E002	17.5064376	78.4772257	2026-04-25 14:32:12.43046	inside
2004	E002	17.5064258	78.4772315	2026-04-25 14:32:12.90567	inside
2005	E002	17.5064202	78.4772342	2026-04-25 14:32:13.137088	inside
2006	E002	17.5064154	78.4772367	2026-04-25 14:32:13.740117	inside
2007	E002	17.5064145	78.4772372	2026-04-25 14:32:13.845577	inside
2008	E002	17.5064103	78.4772398	2026-04-25 14:32:14.265932	inside
2009	E002	17.5064054	78.477242	2026-04-25 14:32:14.92693	inside
2010	E002	17.5064004	78.4772438	2026-04-25 14:32:15.464379	inside
2011	E002	17.5064005	78.4772442	2026-04-25 14:32:15.843112	inside
2012	E002	17.5064005	78.4772445	2026-04-25 14:32:16.023451	inside
2013	E002	17.5063959	78.4772463	2026-04-25 14:32:16.68393	inside
2014	E002	17.5063944	78.477247	2026-04-25 14:32:16.923969	inside
2015	E002	17.506392	78.477248	2026-04-25 14:32:17.261559	inside
2016	E002	17.5063857	78.4772486	2026-04-25 14:32:17.895983	inside
2017	E002	17.5063787	78.4772508	2026-04-25 14:32:17.919264	inside
2018	E002	17.5063785	78.477251	2026-04-25 14:32:18.422115	inside
2019	E002	17.5063766	78.4772508	2026-04-25 14:32:18.890336	inside
2020	E002	17.5063752	78.4772506	2026-04-25 14:32:19.153277	inside
2021	E002	17.5063707	78.4772512	2026-04-25 14:32:19.698278	inside
2022	E002	17.5063704	78.4772519	2026-04-25 14:32:19.930795	inside
2023	E002	17.5063694	78.4772534	2026-04-25 14:32:20.235986	inside
2024	E002	17.5063741	78.4772653	2026-04-25 14:32:20.485111	inside
2025	E002	17.5063917	78.47728	2026-04-25 14:32:20.900892	inside
2026	E002	17.5063992	78.4772867	2026-04-25 14:32:21.116366	inside
2027	E002	17.5064081	78.4772962	2026-04-25 14:32:21.748398	inside
2028	E002	17.5064228	78.477305	2026-04-25 14:32:22.002837	inside
2029	E002	17.5064369	78.4773131	2026-04-25 14:32:22.605155	inside
2030	E002	17.5064452	78.4773168	2026-04-25 14:32:22.92797	inside
2031	E002	17.50646	78.477321	2026-04-25 14:32:23.878899	inside
2032	E002	17.5064636	78.4773216	2026-04-25 14:32:24.020294	inside
2033	E002	17.5064665	78.4773199	2026-04-25 14:32:24.645026	inside
2034	E002	17.5064669	78.4773187	2026-04-25 14:32:24.954483	inside
2035	E002	17.5064717	78.477318	2026-04-25 14:32:25.516871	inside
2036	E002	17.5064752	78.4773148	2026-04-25 14:32:25.904337	inside
2037	E002	17.5064772	78.477312	2026-04-25 14:32:26.893053	inside
2038	E002	17.506484	78.4773091	2026-04-25 14:32:27.908464	inside
2039	E002	17.5064919	78.4773037	2026-04-25 14:32:28.929991	inside
2040	E002	17.506496	78.477301	2026-04-25 14:32:29.889126	inside
2041	E002	17.5065065	78.4772925	2026-04-25 14:32:31.073712	inside
2042	E002	17.5065087	78.4772906	2026-04-25 14:32:31.303322	inside
2043	E002	17.506509	78.4772911	2026-04-25 14:32:31.820906	inside
2044	E002	17.5065094	78.4772905	2026-04-25 14:32:31.883255	inside
2045	E002	17.5065096	78.4772905	2026-04-25 14:32:32.871498	inside
2046	E002	17.5065098	78.4772897	2026-04-25 14:32:33.307482	inside
2047	E002	17.5065099	78.4772888	2026-04-25 14:32:33.929601	inside
2048	E002	17.5065102	78.477288	2026-04-25 14:32:34.244456	inside
2049	E002	17.5065105	78.4772868	2026-04-25 14:32:34.920055	inside
2050	E002	17.5065107	78.4772863	2026-04-25 14:32:35.286799	inside
2051	E002	17.5065116	78.4772844	2026-04-25 14:32:35.882592	inside
2052	E002	17.5065119	78.4772839	2026-04-25 14:32:36.160067	inside
2053	E002	17.5065124	78.4772803	2026-04-25 14:32:36.958075	inside
2054	E003	17.5064878	78.4772648	2026-04-25 14:32:40.767752	inside
2055	E003	17.5064878	78.4772648	2026-04-25 14:32:45.494669	inside
2056	E002	17.5065439	78.4772333	2026-04-25 14:32:46.893369	inside
2057	E002	17.506546	78.477238	2026-04-25 14:32:47.963898	inside
2058	E002	17.5065461	78.4772373	2026-04-25 14:32:48.877997	inside
2059	E002	17.506549	78.4772346	2026-04-25 14:32:49.89588	inside
2060	E002	17.5065491	78.4772414	2026-04-25 14:32:50.579048	inside
2061	E003	17.5064908	78.4772613	2026-04-25 14:32:50.889997	inside
2062	E002	17.5065487	78.4772386	2026-04-25 14:32:51.012247	inside
2063	E002	17.5065487	78.4772361	2026-04-25 14:32:51.072654	inside
2064	E002	17.5065408	78.4772432	2026-04-25 14:32:51.49675	inside
2065	E002	17.50654	78.4772434	2026-04-25 14:32:51.882613	inside
2066	E002	17.5065409	78.4772436	2026-04-25 14:32:51.97623	inside
2067	E002	17.5065391	78.4772449	2026-04-25 14:32:52.860569	inside
2068	E002	17.5065395	78.4772486	2026-04-25 14:32:54.001037	inside
2069	E002	17.5065387	78.4772477	2026-04-25 14:32:54.029684	inside
2070	E002	17.5065395	78.4772495	2026-04-25 14:32:54.177267	inside
2071	E002	17.5065373	78.477252	2026-04-25 14:32:54.849316	inside
2072	E003	17.5064904	78.4772621	2026-04-25 14:32:55.903204	inside
2073	E002	17.5065355	78.4772573	2026-04-25 14:32:55.919976	inside
2074	E002	17.5065353	78.4772581	2026-04-25 14:32:56.086991	inside
2075	E002	17.5065412	78.4772593	2026-04-25 14:32:56.943495	inside
2076	E002	17.5065435	78.4772594	2026-04-25 14:32:57.022674	inside
2077	E002	17.5065443	78.4772602	2026-04-25 14:32:57.607933	inside
2078	E002	17.5065476	78.47726	2026-04-25 14:32:57.894373	inside
2079	E002	17.5065493	78.4772602	2026-04-25 14:32:58.219512	inside
2080	E002	17.5065498	78.4772599	2026-04-25 14:32:58.882669	inside
2081	E002	17.50655	78.4772594	2026-04-25 14:32:59.103562	inside
2082	E002	17.5065501	78.4772597	2026-04-25 14:32:59.953495	inside
2083	E002	17.5065495	78.4772595	2026-04-25 14:33:00.586906	inside
2084	E002	17.5065491	78.4772575	2026-04-25 14:33:00.98791	inside
2085	E003	17.5064917	78.4772603	2026-04-25 14:33:01.10611	inside
2086	E002	17.5065492	78.47726	2026-04-25 14:33:01.270227	inside
2087	E002	17.5065489	78.4772597	2026-04-25 14:33:01.942301	inside
2088	E002	17.5065477	78.4772596	2026-04-25 14:33:02.356615	inside
2089	E002	17.5065464	78.477258	2026-04-25 14:33:03.005648	inside
2090	E002	17.5065461	78.4772578	2026-04-25 14:33:03.318824	inside
2091	E002	17.5065427	78.4772545	2026-04-25 14:33:03.695842	inside
2092	E002	17.5065417	78.4772526	2026-04-25 14:33:05.621229	inside
2093	E003	17.5064908	78.4772611	2026-04-25 14:33:06.096913	inside
2094	E002	17.5065423	78.4772524	2026-04-25 14:33:06.316229	inside
2095	E002	17.5065431	78.4772502	2026-04-25 14:33:07.571834	inside
2096	E002	17.506544	78.4772496	2026-04-25 14:33:08.27064	inside
2097	E002	17.5065447	78.4772481	2026-04-25 14:33:08.99177	inside
2098	E002	17.5065423	78.4772424	2026-04-25 14:33:11.124759	inside
2099	E003	17.5064855	78.4772666	2026-04-25 14:33:11.276667	inside
2100	E003	17.5064908	78.4772606	2026-04-25 14:33:16.389945	inside
2101	E003	17.5064878	78.4772672	2026-04-25 14:33:21.580759	inside
2102	E002	17.5065175	78.4772668	2026-04-25 14:33:23.975378	inside
2103	E002	17.5065199	78.4772782	2026-04-25 14:33:25.004625	inside
2104	E003	17.5064888	78.4772647	2026-04-25 14:33:26.669944	inside
2105	E003	17.5064882	78.4772759	2026-04-25 14:33:31.894319	inside
2106	E002	17.5065026	78.477279	2026-04-25 14:33:34.878137	inside
2107	E002	17.5065269	78.4772895	2026-04-25 14:33:36.007196	inside
2108	E003	17.5064882	78.4772761	2026-04-25 14:33:36.900892	inside
2109	E003	17.5064904	78.4772653	2026-04-25 14:33:42.16359	inside
2110	E002	17.5065345	78.4772928	2026-04-25 14:33:45.986991	inside
2111	E002	17.5064955	78.4772688	2026-04-25 14:33:46.699165	inside
2112	E003	17.5064965	78.4772779	2026-04-25 14:33:47.144183	inside
2113	E003	17.5064853	78.477276	2026-04-25 14:33:52.403088	inside
2114	E002	17.5064826	78.4772609	2026-04-25 14:33:56.512944	inside
2115	E003	17.5064879	78.4772748	2026-04-25 14:33:57.492634	inside
2116	E002	17.5064893	78.4772701	2026-04-25 14:33:57.706615	inside
2117	E002	17.5064906	78.477272	2026-04-25 14:34:07.535617	inside
2118	E002	17.5065233	78.4772877	2026-04-25 14:34:08.80145	inside
2119	E003	17.5064877	78.4772749	2026-04-25 14:34:11.214302	inside
2120	E003	17.5064877	78.4772749	2026-04-25 14:34:16.136777	inside
2121	E002	17.5065304	78.4772911	2026-04-25 14:34:18.662594	inside
2122	E002	17.5064987	78.4772773	2026-04-25 14:34:19.648484	inside
2123	E003	17.5064854	78.4772628	2026-04-25 14:34:21.503867	inside
2124	E003	17.5065355	78.47729	2026-04-25 14:34:26.466276	inside
2125	E002	17.5064915	78.4772742	2026-04-25 14:34:29.474626	inside
2126	E002	17.5064852	78.477264	2026-04-25 14:34:30.497957	inside
2127	E003	17.5064986	78.4772689	2026-04-25 14:34:31.747344	inside
2128	E003	17.5064905	78.4772695	2026-04-25 14:34:36.852525	inside
2129	E003	17.5064969	78.4772711	2026-04-25 14:34:42.102371	inside
2130	E003	17.5064969	78.4772711	2026-04-25 14:34:47.139744	inside
2131	E003	17.5064908	78.4772633	2026-04-25 14:34:52.547071	inside
2132	E003	17.506536	78.4772911	2026-04-25 14:34:57.420473	inside
2133	E002	17.5064845	78.4772628	2026-04-25 14:35:00.19343	inside
2134	E002	17.5064933	78.4772687	2026-04-25 14:35:01.471472	inside
2135	E003	17.5064871	78.4772657	2026-04-25 14:35:02.624877	inside
2136	E003	17.5065356	78.4772925	2026-04-25 14:35:07.669805	inside
2137	E003	17.5064873	78.4772647	2026-04-25 14:35:12.934355	inside
2138	E003	17.5064874	78.4772634	2026-04-25 14:35:18.328433	inside
2139	E002	17.5064871	78.4772639	2026-04-25 14:35:46.560733	inside
2140	E002	17.5064998	78.4772615	2026-04-25 14:35:55.906581	inside
2141	E002	17.5065007	78.4772613	2026-04-25 14:35:56.551314	inside
2142	E002	17.5064897	78.4772764	2026-04-25 14:36:07.56854	inside
2143	E002	17.5064893	78.4772769	2026-04-25 14:36:08.272624	inside
2144	E002	17.5064964	78.4772692	2026-04-25 14:36:18.148979	inside
2145	E002	17.5064881	78.4772602	2026-04-25 14:36:19.057611	inside
2146	E002	17.5064855	78.4772574	2026-04-25 14:36:28.960614	inside
2147	E002	17.5064874	78.4772605	2026-04-25 14:36:29.958024	inside
2148	E002	17.5064878	78.4772613	2026-04-25 14:36:39.832183	inside
2149	E002	17.506486	78.4772649	2026-04-25 14:36:40.894242	inside
2150	E002	17.5064857	78.4772655	2026-04-25 14:36:50.723064	inside
2151	E002	17.5064832	78.477265	2026-04-25 14:36:51.337469	inside
2152	E002	17.5064825	78.4772649	2026-04-25 14:37:01.134462	inside
2153	E002	17.5064892	78.4772735	2026-04-25 14:37:02.326393	inside
2154	E002	17.5064908	78.4772756	2026-04-25 14:37:12.202549	inside
2155	E002	17.5064838	78.4772673	2026-04-25 14:37:12.985986	inside
2156	E002	17.5064821	78.4772652	2026-04-25 14:37:22.902382	inside
2157	E002	17.5064843	78.477265	2026-04-25 14:37:23.767563	inside
2158	E002	17.5064847	78.477265	2026-04-25 14:37:33.611313	inside
2159	E002	17.5064917	78.4772636	2026-04-25 14:37:34.844425	inside
2160	E002	17.5064935	78.4772633	2026-04-25 14:37:44.774902	inside
2161	E002	17.5065344	78.4772911	2026-04-25 14:37:45.81604	inside
2162	E002	17.5065397	78.4772947	2026-04-25 14:37:55.665008	inside
2163	E002	17.5065342	78.4772915	2026-04-25 14:37:56.34315	inside
2164	E002	17.5065331	78.4772909	2026-04-25 14:38:06.176184	inside
2165	E002	17.5065341	78.4772905	2026-04-25 14:38:07.307835	inside
2166	E003	17.5064856	78.4772646	2026-04-25 14:38:08.569533	inside
2167	E003	17.5064856	78.4772646	2026-04-25 14:38:13.388991	inside
2168	E002	17.5065344	78.4772905	2026-04-25 14:38:17.19321	inside
2169	E002	17.5065338	78.4772937	2026-04-25 14:38:18.28222	inside
2170	E003	17.5064857	78.4772673	2026-04-25 14:38:18.591603	inside
2171	E003	17.5064847	78.4772636	2026-04-25 14:38:23.685085	inside
2172	E002	17.5065337	78.4772942	2026-04-25 14:38:28.113296	inside
2173	E003	17.5064949	78.4772712	2026-04-25 14:38:28.831392	inside
2174	E003	17.5065344	78.4772956	2026-04-25 14:38:33.932045	inside
2175	E002	17.5064844	78.4772618	2026-04-25 14:38:38.624273	inside
2176	E003	17.5065374	78.4772923	2026-04-25 14:38:39.208231	inside
2177	E002	17.5064846	78.4772563	2026-04-25 14:38:39.561409	inside
2178	E002	17.5064846	78.4772548	2026-04-25 14:38:49.384911	inside
2179	E002	17.506485	78.4772592	2026-04-25 14:39:07.145194	inside
2180	E002	17.5065423	78.477286	2026-04-25 14:39:08.24943	inside
2181	E002	17.5065434	78.4772892	2026-04-25 14:39:09.567617	inside
2182	E002	17.5065435	78.4772908	2026-04-25 14:39:10.402888	inside
2183	E002	17.5065432	78.4772933	2026-04-25 14:39:10.958098	inside
2184	E002	17.5065431	78.4772959	2026-04-25 14:39:11.579463	inside
2185	E002	17.5065429	78.4772978	2026-04-25 14:39:12.243206	inside
2186	E002	17.5089282	78.4785687	2026-04-25 14:39:18.010948	outside
2187	E002	17.5064832	78.4772666	2026-04-25 14:39:18.966681	inside
2188	E002	17.5064835	78.4772677	2026-04-25 14:39:36.857173	inside
2189	E002	17.5064923	78.4772574	2026-04-25 15:57:41.646576	inside
2190	E002	17.50649	78.4772548	2026-04-25 15:57:48.000028	inside
2191	E002	17.5064898	78.4772544	2026-04-25 15:57:48.403899	inside
2192	E002	17.5064896	78.4772542	2026-04-25 15:57:48.881023	inside
2193	E002	17.5064895	78.4772542	2026-04-25 15:57:49.906238	inside
2194	E002	17.5064921	78.4772573	2026-04-25 15:57:54.420038	inside
2195	E002	17.506492	78.4772573	2026-04-25 15:57:54.906847	inside
2196	E002	17.5064919	78.4772584	2026-04-25 15:57:55.565307	inside
2197	E002	17.5064914	78.477259	2026-04-25 15:57:56.349864	inside
2198	E002	17.5064898	78.4772652	2026-04-25 15:58:07.393968	inside
2199	E002	17.5063035	78.4772159	2026-04-25 15:58:08.024224	inside
2200	E002	17.5062413	78.4771472	2026-04-25 15:58:08.836517	outside
2201	E002	17.5063086	78.4771172	2026-04-25 15:58:09.903351	inside
2202	E002	17.506426	78.4771479	2026-04-25 15:58:10.878861	inside
2203	E002	17.5064733	78.4771674	2026-04-25 15:58:11.914995	inside
2204	E002	17.5065009	78.4771795	2026-04-25 15:58:12.7025	inside
2205	E002	17.5065289	78.4771868	2026-04-25 15:58:13.031507	inside
2206	E002	17.5065446	78.4771904	2026-04-25 15:58:13.421274	inside
2207	E002	17.5065594	78.4771915	2026-04-25 15:58:13.865079	inside
2208	E002	17.5065659	78.4771923	2026-04-25 15:58:13.924216	inside
2209	E002	17.5065729	78.477194	2026-04-25 15:58:14.879483	inside
2210	E002	17.5065772	78.4771992	2026-04-25 15:58:15.998326	inside
2211	E002	17.506579	78.4772012	2026-04-25 15:58:16.410374	inside
2212	E002	17.5065815	78.477207	2026-04-25 15:58:16.938327	inside
2213	E002	17.5065833	78.47721	2026-04-25 15:58:17.87582	inside
2214	E002	17.5065889	78.4772238	2026-04-25 15:58:18.593631	inside
2215	E002	17.5065887	78.4772253	2026-04-25 15:58:18.820374	inside
2216	E002	17.5065886	78.477227	2026-04-25 15:58:19.856228	inside
2217	E002	17.5065893	78.4772267	2026-04-25 15:58:20.838715	inside
2218	E002	17.5065889	78.47723	2026-04-25 15:58:21.729741	inside
2219	E002	17.5065895	78.4772294	2026-04-25 15:58:21.884268	inside
2220	E002	17.5065921	78.4772284	2026-04-25 15:58:22.664493	inside
2221	E002	17.5065911	78.4772286	2026-04-25 15:58:22.834529	inside
2222	E002	17.5065916	78.4772284	2026-04-25 15:58:23.409647	inside
2223	E002	17.5065922	78.4772284	2026-04-25 15:58:23.790211	inside
2224	E002	17.5065924	78.4772285	2026-04-25 15:58:23.823294	inside
2225	E002	17.5065929	78.4772284	2026-04-25 15:58:24.302479	inside
2226	E002	17.5065937	78.4772281	2026-04-25 15:58:24.920416	inside
2227	E002	17.5065938	78.4772282	2026-04-25 15:58:24.972859	inside
2228	E002	17.5065943	78.4772286	2026-04-25 15:58:26.04708	inside
2229	E002	17.506595	78.4772288	2026-04-25 15:58:26.864215	inside
2230	E002	17.5065953	78.4772282	2026-04-25 15:58:27.887736	inside
2231	E002	17.5065974	78.4772255	2026-04-25 15:58:28.853302	inside
2232	E002	17.5065988	78.477225	2026-04-25 15:58:29.931154	inside
2233	E002	17.5066001	78.4772238	2026-04-25 15:58:30.234717	inside
2234	E002	17.506601	78.4772231	2026-04-25 15:58:30.545287	inside
2235	E002	17.5066014	78.4772226	2026-04-25 15:58:30.907267	inside
2236	E002	17.506602	78.4772214	2026-04-25 15:58:31.164069	inside
2237	E002	17.506602	78.4772201	2026-04-25 15:58:31.842983	inside
2238	E002	17.5066025	78.4772193	2026-04-25 15:58:31.877717	inside
2239	E002	17.5066025	78.4772192	2026-04-25 15:58:32.515553	inside
2240	E002	17.5066027	78.477219	2026-04-25 15:58:32.904716	inside
2241	E002	17.506603	78.4772187	2026-04-25 15:58:33.086003	inside
2242	E002	17.5066022	78.4772206	2026-04-25 15:58:33.832248	inside
2243	E002	17.5066023	78.4772207	2026-04-25 15:58:33.862975	inside
2244	E002	17.5066042	78.477222	2026-04-25 15:58:34.957857	inside
2245	E002	17.5066042	78.4772236	2026-04-25 15:58:35.870105	inside
2246	E002	17.5066039	78.4772241	2026-04-25 15:58:36.490617	inside
2247	E002	17.5066037	78.4772253	2026-04-25 15:58:36.894128	inside
2248	E002	17.5066035	78.4772263	2026-04-25 15:58:37.142611	inside
2249	E002	17.5066031	78.477229	2026-04-25 15:58:37.923289	inside
2250	E002	17.5066029	78.47723	2026-04-25 15:58:38.055776	inside
2251	E002	17.5066023	78.4772334	2026-04-25 15:58:38.785416	inside
2252	E002	17.5066014	78.4772356	2026-04-25 15:58:38.828796	inside
2253	E002	17.5065997	78.4772398	2026-04-25 15:58:39.488082	inside
2254	E002	17.5065984	78.4772414	2026-04-25 15:58:39.859552	inside
2255	E002	17.5065967	78.4772437	2026-04-25 15:58:40.365704	inside
2256	E002	17.506595	78.4772454	2026-04-25 15:58:40.817506	inside
2257	E002	17.506591	78.4772492	2026-04-25 15:58:41.694826	inside
2258	E002	17.5065894	78.4772513	2026-04-25 15:58:41.994326	inside
2259	E002	17.5065883	78.477253	2026-04-25 15:58:42.340637	inside
2260	E002	17.5065862	78.4772551	2026-04-25 15:58:42.928151	inside
2261	E002	17.5065845	78.4772594	2026-04-25 15:58:43.954091	inside
2262	E002	17.5065816	78.4772582	2026-04-25 15:58:44.275057	inside
2263	E002	17.5065805	78.4772591	2026-04-25 15:58:44.903046	inside
2264	E002	17.5065801	78.4772589	2026-04-25 15:58:45.903753	inside
2265	E002	17.5065801	78.4772587	2026-04-25 15:58:45.927885	inside
2266	E002	17.5065792	78.4772593	2026-04-25 15:58:46.937937	inside
2267	E002	17.5065783	78.4772595	2026-04-25 15:58:47.856897	inside
2268	E002	17.5065773	78.4772596	2026-04-25 15:58:48.846772	inside
2269	E002	17.506577	78.4772598	2026-04-25 15:58:49.31411	inside
2270	E002	17.506577	78.47726	2026-04-25 15:58:49.821969	inside
2271	E002	17.5065762	78.4772616	2026-04-25 15:58:50.958133	inside
2272	E002	17.5065699	78.4772615	2026-04-25 15:58:52.146262	inside
2273	E002	17.506568	78.47726	2026-04-25 15:58:52.871859	inside
2274	E002	17.5065689	78.4772595	2026-04-25 15:58:53.89772	inside
2275	E002	17.5065666	78.4772598	2026-04-25 15:58:53.981072	inside
2276	E002	17.5065658	78.4772592	2026-04-25 15:58:54.852556	inside
2277	E002	17.5065658	78.477259	2026-04-25 15:58:55.238388	inside
2278	E002	17.5065645	78.4772584	2026-04-25 15:58:55.836435	inside
2279	E002	17.5065642	78.4772575	2026-04-25 15:58:56.888592	inside
2280	E002	17.5065633	78.4772569	2026-04-25 15:58:57.884694	inside
2281	E002	17.5065631	78.4772562	2026-04-25 15:58:58.349089	inside
2282	E002	17.5065628	78.4772557	2026-04-25 15:58:58.881964	inside
2283	E002	17.5065622	78.477255	2026-04-25 15:58:59.617023	inside
2284	E002	17.5065621	78.4772546	2026-04-25 15:58:59.828999	inside
2285	E002	17.506562	78.4772534	2026-04-25 15:59:00.865648	inside
2286	E002	17.5065622	78.4772536	2026-04-25 15:59:01.906037	inside
2287	E002	17.5065628	78.4772535	2026-04-25 15:59:02.682009	inside
2288	E002	17.5065624	78.4772539	2026-04-25 15:59:02.826519	inside
2289	E002	17.5065627	78.4772544	2026-04-25 15:59:03.927258	inside
2290	E002	17.5065625	78.4772553	2026-04-25 15:59:04.959057	inside
2291	E002	17.5065621	78.4772555	2026-04-25 15:59:05.018219	inside
2292	E002	17.5065615	78.4772562	2026-04-25 15:59:05.876501	inside
2293	E002	17.5065616	78.4772564	2026-04-25 15:59:06.281055	inside
2294	E002	17.5065615	78.4772559	2026-04-25 15:59:06.606443	inside
2295	E002	17.5065619	78.4772585	2026-04-25 15:59:06.932687	inside
2296	E002	17.506562	78.4772587	2026-04-25 15:59:06.935668	inside
2297	E002	17.5065614	78.477259	2026-04-25 15:59:07.429744	inside
2298	E002	17.5065603	78.4772597	2026-04-25 15:59:07.926368	inside
2299	E002	17.5065592	78.4772602	2026-04-25 15:59:08.330145	inside
2300	E002	17.506558	78.4772603	2026-04-25 15:59:08.745849	inside
2301	E002	17.5065576	78.4772603	2026-04-25 15:59:08.812323	inside
2302	E002	17.5065571	78.4772603	2026-04-25 15:59:09.359409	inside
2303	E002	17.5065566	78.477261	2026-04-25 15:59:09.846644	inside
2304	E002	17.506555	78.4772615	2026-04-25 15:59:10.68805	inside
2305	E002	17.5065543	78.477261	2026-04-25 15:59:10.825635	inside
2306	E002	17.506554	78.4772606	2026-04-25 15:59:11.005174	inside
2307	E002	17.5065521	78.4772613	2026-04-25 15:59:11.608968	inside
2308	E002	17.5065513	78.4772614	2026-04-25 15:59:11.939374	inside
2309	E002	17.5065502	78.4772612	2026-04-25 15:59:12.318012	inside
2310	E002	17.5065477	78.4772609	2026-04-25 15:59:12.835447	inside
2311	E002	17.5065418	78.4772586	2026-04-25 15:59:13.382696	inside
2312	E002	17.5065401	78.4772572	2026-04-25 15:59:13.863739	inside
2313	E002	17.50654	78.4772571	2026-04-25 15:59:13.896901	inside
2314	E002	17.5065387	78.477255	2026-04-25 15:59:14.574881	inside
2315	E002	17.506536	78.4772532	2026-04-25 15:59:14.886824	inside
2316	E002	17.506534	78.4772484	2026-04-25 15:59:15.839049	inside
2317	E002	17.5065338	78.4772473	2026-04-25 15:59:16.31716	inside
2318	E002	17.5065325	78.4772485	2026-04-25 15:59:16.425396	inside
2319	E002	17.5065315	78.4772434	2026-04-25 15:59:16.95834	inside
2320	E002	17.5065314	78.4772435	2026-04-25 15:59:17.443973	inside
2321	E002	17.5065312	78.4772459	2026-04-25 15:59:17.760305	inside
2322	E002	17.5065207	78.4772529	2026-04-25 15:59:17.819747	inside
2323	E002	17.5065204	78.4772535	2026-04-25 15:59:18.878994	inside
2324	E002	17.5065216	78.4772542	2026-04-25 15:59:19.846409	inside
2325	E002	17.5065236	78.4772553	2026-04-25 15:59:20.930295	inside
2326	E002	17.5065255	78.4772551	2026-04-25 15:59:21.945566	inside
2327	E002	17.5065264	78.477256	2026-04-25 15:59:22.97604	inside
2328	E002	17.5065276	78.4772563	2026-04-25 15:59:23.895418	inside
2329	E002	17.5065282	78.4772564	2026-04-25 15:59:24.922988	inside
2330	E002	17.5065278	78.4772573	2026-04-25 15:59:25.94898	inside
2331	E002	17.5065266	78.4772595	2026-04-25 15:59:26.986186	inside
2332	E002	17.5065256	78.477261	2026-04-25 15:59:27.595413	inside
2333	E002	17.5065259	78.477261	2026-04-25 15:59:27.891625	inside
2334	E002	17.5065266	78.4772621	2026-04-25 15:59:28.328766	inside
2335	E002	17.5065209	78.4772615	2026-04-25 15:59:28.871314	inside
2336	E002	17.5065204	78.477262	2026-04-25 15:59:29.842713	inside
2337	E002	17.5065212	78.4772625	2026-04-25 15:59:30.861657	inside
2338	E002	17.5065205	78.4772614	2026-04-25 15:59:31.887322	inside
2339	E002	17.5065178	78.4772611	2026-04-25 15:59:32.884284	inside
2340	E002	17.5065166	78.4772616	2026-04-25 15:59:33.848629	inside
2341	E002	17.5065167	78.4772621	2026-04-25 15:59:34.852628	inside
2342	E002	17.5065147	78.4772572	2026-04-25 15:59:35.847356	inside
2343	E002	17.5065128	78.4772526	2026-04-25 15:59:36.946001	inside
2344	E002	17.5065114	78.4772492	2026-04-25 15:59:37.876799	inside
2345	E002	17.5065103	78.4772467	2026-04-25 15:59:38.95366	inside
2346	E002	17.5065086	78.4772473	2026-04-25 15:59:39.97013	inside
2347	E002	17.5065068	78.4772481	2026-04-25 15:59:41.101936	inside
2348	E002	17.5065051	78.477249	2026-04-25 15:59:41.918535	inside
2349	E002	17.5065038	78.4772498	2026-04-25 15:59:42.836937	inside
2350	E002	17.5065029	78.4772505	2026-04-25 15:59:43.86921	inside
2351	E002	17.5065022	78.4772509	2026-04-25 15:59:44.893756	inside
2352	E002	17.5065018	78.4772513	2026-04-25 15:59:45.909615	inside
2353	E002	17.5065026	78.4772519	2026-04-25 15:59:46.938856	inside
2354	E002	17.5065032	78.4772514	2026-04-25 15:59:47.868335	inside
2355	E002	17.5065042	78.4772497	2026-04-25 15:59:48.960362	inside
2356	E002	17.5065049	78.4772479	2026-04-25 15:59:49.17955	inside
2357	E002	17.5065057	78.4772471	2026-04-25 15:59:49.881559	inside
2358	E002	17.5065058	78.4772463	2026-04-25 15:59:50.417315	inside
2359	E002	17.5065096	78.4772531	2026-04-25 15:59:50.920011	inside
2360	E002	17.5065098	78.4772534	2026-04-25 15:59:51.853647	inside
2361	E002	17.5065099	78.4772534	2026-04-25 15:59:52.971089	inside
2362	E002	17.5065099	78.4772533	2026-04-25 15:59:53.9005	inside
2363	E002	17.5065099	78.4772532	2026-04-25 15:59:54.938295	inside
2364	E002	17.50651	78.4772531	2026-04-25 15:59:55.951438	inside
2365	E002	17.50651	78.4772529	2026-04-25 15:59:56.975045	inside
2366	E002	17.5065094	78.4772516	2026-04-25 15:59:57.895826	inside
2367	E002	17.5065092	78.4772485	2026-04-25 15:59:59.025538	inside
2368	E002	17.5065095	78.4772451	2026-04-25 15:59:59.965275	inside
2369	E002	17.5065092	78.4772466	2026-04-25 16:00:00.118131	inside
2370	E002	17.5065099	78.4772403	2026-04-25 16:00:00.857511	inside
2371	E002	17.5065156	78.4772513	2026-04-25 16:00:01.886456	inside
2372	E002	17.5065166	78.4772526	2026-04-25 16:00:02.851083	inside
2373	E002	17.5065171	78.4772534	2026-04-25 16:00:03.929452	inside
2374	E002	17.5065171	78.4772549	2026-04-25 16:00:04.906465	inside
2375	E002	17.5065173	78.4772555	2026-04-25 16:00:05.901272	inside
2376	E002	17.5065175	78.4772548	2026-04-25 16:00:06.901108	inside
2377	E002	17.5065159	78.4772548	2026-04-25 16:00:07.928127	inside
2378	E002	17.5065153	78.4772568	2026-04-25 16:00:09.060186	inside
2379	E002	17.5065375	78.4772938	2026-04-25 16:01:03.226688	inside
2380	E002	17.506537	78.4772931	2026-04-25 16:01:10.896273	inside
2381	E002	17.5065371	78.477293	2026-04-25 16:01:13.172425	inside
2382	E002	17.3746	78.5582	2026-05-20 18:36:04.835666	inside
2383	E002	17.506490727567975	78.47689417059698	2026-05-20 18:36:07.847271	inside
2384	E002	17.506490727567975	78.47689417059698	2026-05-20 18:36:07.873116	inside
2385	E002	17.506490727567975	78.47689417059698	2026-05-20 18:36:16.111843	inside
2386	E002	17.50654100653649	78.47704139681481	2026-05-20 18:36:31.179403	inside
2387	E002	17.50660486696931	78.47711887181424	2026-05-20 18:36:42.763599	inside
2388	E002	17.50660486696931	78.47711887181424	2026-05-20 18:36:42.787064	inside
2389	E002	17.50654100653649	78.47704139681481	2026-05-20 18:36:54.528599	inside
2390	E002	17.50654100653649	78.47704139681481	2026-05-20 18:36:54.533487	inside
2391	E002	17.50654100653649	78.47704139681481	2026-05-20 18:37:02.32839	inside
2392	E002	17.50654100653649	78.47704139681481	2026-05-20 18:37:08.753128	inside
2393	E002	17.50648724696984	78.47689010586227	2026-05-20 18:37:42.426526	inside
2394	E002	17.5065598432993	78.47695797402743	2026-05-20 18:37:53.971113	inside
2395	E002	17.5065598432993	78.47695797402743	2026-05-20 18:38:21.67508	inside
2396	E002	17.5064888	78.4772748	2026-05-20 18:38:24.746459	inside
2397	E002	17.5064831	78.4772845	2026-05-20 18:38:30.582196	inside
2398	E002	17.50660486696931	78.47711887181424	2026-05-20 18:38:33.309436	inside
2399	E002	17.5064726	78.4772741	2026-05-20 18:38:36.833551	inside
2400	E002	17.5064726	78.4772741	2026-05-20 18:38:36.860689	inside
2401	E002	17.5064831	78.4772845	2026-05-20 18:38:36.967806	inside
2402	E002	17.5064647	78.4772909	2026-05-20 18:38:55.019161	inside
2403	E002	17.506462	78.4772963	2026-05-20 18:39:00.805013	inside
2404	E002	17.5064754	78.4772766	2026-05-20 18:39:06.774383	inside
2405	E002	17.50654100653649	78.47704139681481	2026-05-20 18:39:08.272327	inside
2406	E002	17.5064782	78.4772803	2026-05-20 18:39:12.615639	inside
2407	E002	17.5064746	78.4772815	2026-05-20 18:39:18.488012	inside
2408	E002	17.506490727567975	78.47689417059698	2026-05-20 18:39:19.819774	inside
2409	E002	17.5064771	78.4772798	2026-05-20 18:39:24.353022	inside
2410	E002	17.5064765	78.4772788	2026-05-20 18:39:30.907089	inside
2411	E002	17.5064747	78.4772795	2026-05-20 18:39:36.341498	inside
2412	E002	17.5064764	78.4772788	2026-05-20 18:39:42.14261	inside
2413	E002	17.506477	78.477279	2026-05-20 18:39:48.044284	inside
2414	E002	17.5064781	78.4772791	2026-05-20 18:39:53.964674	inside
2415	E002	17.5064794	78.4772786	2026-05-20 18:39:59.825805	inside
2416	E002	17.5064938	78.4772748	2026-05-20 18:41:19.489283	inside
2417	E001	17.5065573812953	78.4771338363508	2026-05-21 11:35:16.801358	inside
2418	E001	17.506544853897733	78.477047740487	2026-05-21 11:35:40.350397	inside
2419	E001	17.5065598432993	78.47695797402743	2026-05-21 11:36:15.433679	inside
2420	E001	17.506566578641714	78.47696527818981	2026-05-21 11:36:27.263022	inside
2421	E001	17.5065598432993	78.47695797402743	2026-05-21 11:37:02.381657	inside
2422	E001	17.506566578641714	78.47696527818981	2026-05-21 11:37:37.444448	inside
2423	E001	17.506610983806024	78.47712827093144	2026-05-21 11:37:49.207354	inside
2424	E001	17.50660486696931	78.47711887181424	2026-05-21 11:38:00.907958	inside
2425	E001	17.5065598432993	78.47695797402743	2026-05-21 11:38:24.669576	inside
2426	E001	17.506566578641714	78.47696527818981	2026-05-21 11:38:36.574677	inside
2427	E001	17.5065598432993	78.47695797402743	2026-05-21 11:38:59.836111	inside
2428	E001	17.5065573812953	78.4771338363508	2026-05-21 11:40:49.763238	inside
2429	E001	17.5065598432993	78.47695797402743	2026-05-21 11:41:01.470803	inside
2430	E001	17.50660486696931	78.47711887181424	2026-05-21 11:41:13.176224	inside
2431	E001	17.50654100653649	78.47704139681481	2026-05-21 11:41:24.916238	inside
2432	E001	17.506544853897733	78.477047740487	2026-05-21 11:41:36.579275	inside
2433	E001	17.50660486696931	78.47711887181424	2026-05-21 11:42:11.970226	inside
2434	E001	17.50654100653649	78.47704139681481	2026-05-21 11:42:35.226652	inside
2435	E001	17.50648724696984	78.47689010586227	2026-05-21 11:42:46.907758	inside
2436	E001	17.50654100653649	78.47704139681481	2026-05-21 11:42:58.529841	inside
2437	E001	17.50660486696931	78.47711887181424	2026-05-21 11:43:10.101717	inside
2438	E001	17.50660486696931	78.47711887181424	2026-05-21 11:43:24.755736	inside
2439	E001	17.50660486696931	78.47711887181424	2026-05-21 11:44:02.529173	inside
2440	E001	17.506610983806024	78.47712827093144	2026-05-21 11:44:08.590635	inside
2441	E001	17.506610983806024	78.47712827093144	2026-05-21 11:44:08.639332	inside
2442	E001	17.5065598432993	78.47695797402743	2026-05-21 11:44:20.270656	inside
2443	E001	17.5065598432993	78.47695797402743	2026-05-21 11:44:20.333574	inside
2444	E001	17.5065598432993	78.47695797402743	2026-05-21 11:44:28.358481	inside
2445	E001	17.50654100653649	78.47704139681481	2026-05-21 11:44:31.908303	inside
2446	E001	17.50654100653649	78.47704139681481	2026-05-21 11:44:31.908651	inside
2447	E001	17.506544853897733	78.477047740487	2026-05-21 11:44:55.029801	inside
2448	E001	17.506544853897733	78.477047740487	2026-05-21 11:44:55.093439	inside
2449	E001	17.506611845253428	78.47727700852415	2026-05-21 11:45:18.377783	inside
2450	E001	17.506611845253428	78.47727700852415	2026-05-21 11:45:18.427921	inside
2451	E001	17.50660486696931	78.47711887181424	2026-05-21 11:45:30.128176	inside
2452	E001	17.50660486696931	78.47711887181424	2026-05-21 11:45:30.145029	inside
2453	E001	17.506566578641714	78.47696527818981	2026-05-21 11:45:41.818668	inside
2454	E001	17.506566578641714	78.47696527818981	2026-05-21 11:45:41.875045	inside
2455	E001	17.50660486696931	78.47711887181424	2026-05-21 11:45:53.384544	inside
2456	E001	17.50660486696931	78.47711887181424	2026-05-21 11:45:53.443385	inside
2457	E001	17.50648724696984	78.47689010586227	2026-05-21 11:47:03.231613	inside
2458	E001	17.506566578641714	78.47696527818981	2026-05-21 11:47:38.068643	inside
2459	E001	17.506610983806024	78.47712827093144	2026-05-21 11:48:13.051885	inside
2460	E001	17.50654100653649	78.47704139681481	2026-05-21 11:48:36.443347	inside
2461	E001	17.50648724696984	78.47689010586227	2026-05-21 11:49:23.316346	inside
2462	E001	17.5065598432993	78.47695797402743	2026-05-21 11:49:35.007481	inside
2463	E001	17.50648724696984	78.47689010586227	2026-05-21 11:49:46.688922	inside
2464	E001	17.5065598432993	78.47695797402743	2026-05-21 11:50:21.645955	inside
2465	E001	17.50660486696931	78.47711887181424	2026-05-21 11:50:33.282359	inside
2466	E001	17.3746	78.5582	2026-05-21 12:03:23.480457	inside
2467	E001	17.3746	78.5582	2026-05-21 12:03:23.505	inside
2468	E001	17.506620307302956	78.47729490611795	2026-05-21 12:03:26.272316	inside
2469	E001	17.506529362274126	78.47714848528537	2026-05-21 12:03:37.902013	inside
2470	E001	17.50654100653649	78.47704139681481	2026-05-21 12:03:49.509827	inside
2471	E001	17.50648724696984	78.47689010586227	2026-05-21 12:04:01.100298	inside
2472	E001	17.5065598432993	78.47695797402743	2026-05-21 12:04:12.750907	inside
2473	E001	17.506566578641714	78.47696527818981	2026-05-21 12:04:47.754344	inside
2474	E001	17.5065598432993	78.47695797402743	2026-05-21 12:05:11.089405	inside
2475	E001	17.506566578641714	78.47696527818981	2026-05-21 12:48:27.476203	inside
2476	E001	17.506566578641714	78.47696527818981	2026-05-21 12:48:27.53185	inside
2477	E001	17.506566578641714	78.47696527818981	2026-05-21 12:48:35.650405	inside
2478	E001	17.50660486696931	78.47711887181424	2026-05-21 12:48:39.22753	inside
2479	E001	17.50660486696931	78.47711887181424	2026-05-21 12:48:48.014027	inside
2480	E001	17.50660486696931	78.47711887181424	2026-05-21 12:48:51.681172	inside
2481	E001	17.50660486696931	78.47711887181424	2026-05-21 12:48:54.161475	inside
2482	E001	17.50660486696931	78.47711887181424	2026-05-21 12:48:55.872235	inside
2483	E001	17.50660486696931	78.47711887181424	2026-05-21 12:48:57.098099	inside
2484	E001	17.5065573812953	78.4771338363508	2026-05-21 12:49:56.412675	inside
2485	E001	17.5065573812953	78.4771338363508	2026-05-21 12:50:04.521015	inside
2486	E001	17.5065598432993	78.47695797402743	2026-05-21 12:50:07.96533	inside
2487	E001	17.5065598432993	78.47695797402743	2026-05-21 12:50:19.914055	inside
2488	E001	17.5065598432993	78.47695797402743	2026-05-21 12:50:19.952228	inside
2489	E001	17.50660486696931	78.47711887181424	2026-05-21 12:50:31.50617	inside
2490	E001	17.50660486696931	78.47711887181424	2026-05-21 12:50:31.549493	inside
2491	E001	17.50660486696931	78.47711887181424	2026-05-21 12:50:31.556665	inside
2492	E001	17.50654100653649	78.47704139681481	2026-05-21 12:51:29.977681	inside
2493	E001	17.50654100653649	78.47704139681481	2026-05-21 12:51:30.018194	inside
2494	E001	17.50648724696984	78.47689010586227	2026-05-21 12:51:41.673025	inside
2495	E001	17.50648724696984	78.47689010586227	2026-05-21 12:51:41.68578	inside
2496	E001	17.50660486696931	78.47711887181424	2026-05-21 12:52:04.861457	inside
2497	E001	17.50660486696931	78.47711887181424	2026-05-21 12:52:04.865593	inside
2498	E001	17.50660486696931	78.47711887181424	2026-05-21 12:53:21.275782	inside
2499	E002	17.50660486696931	78.47711887181424	2026-05-21 12:53:37.336342	inside
2500	E002	17.506566578641714	78.47696527818981	2026-05-21 12:56:16.51172	inside
2501	E003	17.506566578641714	78.47696527818981	2026-05-21 12:56:20.8586	inside
2502	E002	17.506566578641714	78.47696527818981	2026-05-21 12:56:23.237171	inside
2503	E003	17.506566578641714	78.47696527818981	2026-05-21 12:56:24.866908	inside
2504	E002	17.5065598432993	78.47695797402743	2026-05-21 12:56:28.286794	inside
2505	E002	17.50660486696931	78.47711887181424	2026-05-21 12:58:21.975922	inside
2506	E002	17.506610983806024	78.47712827093144	2026-05-21 12:58:56.84745	inside
2507	E002	17.50660486696931	78.47711887181424	2026-05-21 12:59:20.284736	inside
2508	E002	17.5065598432993	78.47695797402743	2026-05-21 13:00:06.798464	inside
2509	E002	17.50648724696984	78.47689010586227	2026-05-21 13:00:30.254221	inside
2510	E002	17.50648724696984	78.47689010586227	2026-05-21 13:00:32.802422	inside
2511	E002	17.5065598432993	78.47695797402743	2026-05-21 13:01:01.876092	inside
2512	E002	17.50660486696931	78.47711887181424	2026-05-21 13:01:33.557369	inside
2513	E002	17.50654100653649	78.47704139681481	2026-05-21 13:02:04.981937	inside
2514	E002	17.50660486696931	78.47711887181424	2026-05-21 13:02:36.768398	inside
2515	E002	17.506614231502603	78.47713656293529	2026-05-21 13:03:08.160323	inside
2516	E002	17.5065598432993	78.47695797402743	2026-05-21 13:04:34.153055	inside
2517	E001	17.50660486696931	78.47711887181424	2026-05-21 13:05:28.182268	inside
2518	E001	17.5065598432993	78.47695797402743	2026-05-21 13:06:13.985528	inside
2519	E001	17.5065598432993	78.47695797402743	2026-05-21 13:06:18.433775	inside
2520	E002	17.5065598432993	78.47695797402743	2026-05-21 13:06:23.853113	inside
2521	E001	17.50660486696931	78.47711887181424	2026-05-21 13:06:27.680259	inside
2522	E001	17.50654100653649	78.47704139681481	2026-05-21 13:06:41.844367	inside
2523	E002	17.506610983806024	78.47712827093144	2026-05-21 13:07:16.171077	inside
2524	E003	17.506610983806024	78.47712827093144	2026-05-21 13:07:23.237838	inside
2525	E003	17.50654100653649	78.47704139681481	2026-05-21 13:07:27.78701	inside
2526	E003	17.50660486696931	78.47711887181424	2026-05-21 13:08:03.067102	inside
2527	E003	17.5065598432993	78.47695797402743	2026-05-21 13:08:49.518553	inside
2528	E002	17.5065598432993	78.47695797402743	2026-05-21 13:09:06.891942	inside
2529	E003	17.50654100653649	78.47704139681481	2026-05-21 13:09:24.690301	inside
2530	E003	17.506610983806024	78.47712827093144	2026-05-21 13:09:59.958369	inside
2531	E003	17.50660486696931	78.47711887181424	2026-05-21 13:10:11.457765	inside
2532	E003	17.50654100653649	78.47704139681481	2026-05-21 13:10:34.633329	inside
2533	E004	17.50654100653649	78.47704139681481	2026-05-21 13:10:42.545838	inside
2534	E004	17.50648724696984	78.47689010586227	2026-05-21 13:10:46.32197	inside
2535	E003	17.50648724696984	78.47689010586227	2026-05-21 13:10:46.372234	inside
2536	E003	17.50660486696931	78.47711887181424	2026-05-21 13:11:33.080528	inside
2537	E003	17.50660486696931	78.47711887181424	2026-05-21 13:11:58.805109	inside
2538	E003	17.50654100653649	78.47704139681481	2026-05-21 13:12:10.448077	inside
2539	E003	17.50648724696984	78.47689010586227	2026-05-21 13:12:45.744095	inside
2540	E003	17.50660486696931	78.47711887181424	2026-05-21 13:12:57.426186	inside
2541	E004	17.506566578641714	78.47696527818981	2026-05-21 13:14:47.451764	inside
2542	E002	17.506566578641714	78.47696527818981	2026-05-21 13:14:47.467546	inside
2543	E001	17.506566578641714	78.47696527818981	2026-05-21 13:14:47.506341	inside
2544	E003	17.506566578641714	78.47696527818981	2026-05-21 13:14:47.530601	inside
2545	E003	17.5065598432993	78.47695797402743	2026-05-21 13:14:59.192493	inside
2546	E001	17.5065598432993	78.47695797402743	2026-05-21 13:14:59.250459	inside
2547	E004	17.5065598432993	78.47695797402743	2026-05-21 13:14:59.270012	inside
2548	E004	17.50648724696984	78.47689010586227	2026-05-21 13:16:55.995478	inside
2549	E003	17.50648724696984	78.47689010586227	2026-05-21 13:16:56.023078	inside
2550	E001	17.50648724696984	78.47689010586227	2026-05-21 13:16:56.02787	inside
2551	E001	17.5065598432993	78.47695797402743	2026-05-21 13:17:30.968927	inside
2552	E004	17.5065598432993	78.47695797402743	2026-05-21 13:17:30.989612	inside
2553	E003	17.5065598432993	78.47695797402743	2026-05-21 13:17:31.008325	inside
2554	E001	17.50648724696984	78.47689010586227	2026-05-21 13:18:17.696762	inside
2555	E004	17.50648724696984	78.47689010586227	2026-05-21 13:18:17.741439	inside
2556	E003	17.50648724696984	78.47689010586227	2026-05-21 13:18:17.84613	inside
2557	E004	17.5065598432993	78.47695797402743	2026-05-21 13:18:52.66671	inside
2558	E003	17.5065598432993	78.47695797402743	2026-05-21 13:18:52.674154	inside
2559	E001	17.5065598432993	78.47695797402743	2026-05-21 13:18:52.679803	inside
2560	E004	17.50660486696931	78.47711887181424	2026-05-21 13:19:15.963011	inside
2561	E001	17.50660486696931	78.47711887181424	2026-05-21 13:19:15.967453	inside
2562	E003	17.50660486696931	78.47711887181424	2026-05-21 13:19:15.97821	inside
2563	E003	17.5065598432993	78.47695797402743	2026-05-21 13:20:14.357348	inside
2564	E004	17.5065598432993	78.47695797402743	2026-05-21 13:20:14.402251	inside
2565	E001	17.5065598432993	78.47695797402743	2026-05-21 13:20:14.552536	inside
2566	E001	17.50648724696984	78.47689010586227	2026-05-21 13:20:49.579751	inside
2567	E003	17.50648724696984	78.47689010586227	2026-05-21 13:20:49.596179	inside
2568	E004	17.50648724696984	78.47689010586227	2026-05-21 13:20:49.60242	inside
2569	E003	17.50654100653649	78.47704139681481	2026-05-21 13:21:01.161975	inside
2570	E004	17.50654100653649	78.47704139681481	2026-05-21 13:21:01.164945	inside
2571	E001	17.50654100653649	78.47704139681481	2026-05-21 13:21:01.182948	inside
2572	E003	17.506544853897733	78.477047740487	2026-05-21 13:21:12.827703	inside
2574	E001	17.506544853897733	78.477047740487	2026-05-21 13:21:12.912097	inside
2573	E004	17.506544853897733	78.477047740487	2026-05-21 13:21:12.911886	inside
2575	E001	17.506610983806024	78.47712827093144	2026-05-21 13:21:24.373352	inside
2576	E003	17.506610983806024	78.47712827093144	2026-05-21 13:21:24.389372	inside
2577	E004	17.506610983806024	78.47712827093144	2026-05-21 13:21:24.395439	inside
2579	E001	17.506566578641714	78.47696527818981	2026-05-21 13:21:59.54341	inside
2578	E003	17.506566578641714	78.47696527818981	2026-05-21 13:21:59.532578	inside
2580	E004	17.506566578641714	78.47696527818981	2026-05-21 13:21:59.555171	inside
2581	E001	17.5065598432993	78.47695797402743	2026-05-21 13:22:11.006657	inside
2582	E004	17.5065598432993	78.47695797402743	2026-05-21 13:22:11.047981	inside
2583	E003	17.5065598432993	78.47695797402743	2026-05-21 13:22:11.153777	inside
2584	E002	17.5065598432993	78.47695797402743	2026-05-21 13:22:35.822955	inside
2585	E001	17.5065598432993	78.47695797402743	2026-05-21 13:22:35.89051	inside
2586	E003	17.5065598432993	78.47695797402743	2026-05-21 13:22:35.898941	inside
2587	E004	17.5065598432993	78.47695797402743	2026-05-21 13:22:35.912273	inside
2588	E002	17.50648724696984	78.47689010586227	2026-05-21 13:22:58.142724	inside
2589	E001	17.50648724696984	78.47689010586227	2026-05-21 13:22:58.157851	inside
2590	E004	17.50648724696984	78.47689010586227	2026-05-21 13:22:58.301578	inside
2591	E003	17.50648724696984	78.47689010586227	2026-05-21 13:22:58.314512	inside
2592	E001	17.506490727567975	78.47689417059698	2026-05-21 13:23:09.792162	inside
2593	E004	17.506490727567975	78.47689417059698	2026-05-21 13:23:09.811785	inside
2594	E003	17.506490727567975	78.47689417059698	2026-05-21 13:23:09.843811	inside
2595	E003	17.50648724696984	78.47689010586227	2026-05-21 13:24:02.836366	inside
2596	E003	17.50648724696984	78.47689010586227	2026-05-21 13:25:04.789997	inside
2597	E003	17.50654100653649	78.47704139681481	2026-05-21 13:25:19.936976	inside
2598	E001	17.50654100653649	78.47704139681481	2026-05-21 13:25:19.976334	inside
2599	E004	17.50654100653649	78.47704139681481	2026-05-21 13:25:19.995712	inside
2600	E003	17.506544853897733	78.477047740487	2026-05-21 13:25:43.260244	inside
2601	E001	17.506544853897733	78.477047740487	2026-05-21 13:25:43.333509	inside
2602	E004	17.506544853897733	78.477047740487	2026-05-21 13:25:43.414403	inside
2603	E003	17.506490727567975	78.47689417059698	2026-05-21 13:25:54.89677	inside
2604	E004	17.506490727567975	78.47689417059698	2026-05-21 13:25:54.929381	inside
2605	E001	17.506490727567975	78.47689417059698	2026-05-21 13:25:55.050807	inside
2606	E004	17.5065598432993	78.47695797402743	2026-05-21 13:26:18.317975	inside
2607	E001	17.5065598432993	78.47695797402743	2026-05-21 13:26:18.340748	inside
2608	E003	17.5065598432993	78.47695797402743	2026-05-21 13:26:18.358553	inside
2609	E003	17.50660486696931	78.47711887181424	2026-05-21 13:26:29.900206	inside
2610	E004	17.50660486696931	78.47711887181424	2026-05-21 13:26:29.931116	inside
2611	E001	17.50660486696931	78.47711887181424	2026-05-21 13:26:29.952241	inside
2612	E003	17.50660486696931	78.47711887181424	2026-05-21 13:26:58.830624	inside
2613	E001	17.506610983806024	78.47712827093144	2026-05-21 13:27:05.190619	inside
2614	E002	17.506610983806024	78.47712827093144	2026-05-21 13:27:05.240317	inside
2615	E004	17.506610983806024	78.47712827093144	2026-05-21 13:27:05.278838	inside
2616	E003	17.506610983806024	78.47712827093144	2026-05-21 13:27:14.065696	inside
2617	E003	17.506544853897733	78.477047740487	2026-05-21 13:27:17.560241	inside
2618	E001	17.506544853897733	78.477047740487	2026-05-21 13:27:17.646375	inside
2619	E004	17.506544853897733	78.477047740487	2026-05-21 13:27:17.819002	inside
2620	E001	17.3746	78.5582	2026-05-21 13:28:35.160492	inside
2621	E001	17.506463	78.4772648	2026-05-21 13:28:40.456386	inside
2622	E001	17.5064664	78.4772769	2026-05-21 13:28:42.361499	inside
2623	E001	17.5064625	78.4772663	2026-05-21 13:28:47.433207	inside
2624	E001	17.5064671	78.477265	2026-05-21 13:28:52.627388	inside
2625	E001	17.5064672	78.4772651	2026-05-21 13:28:57.766119	inside
2626	E001	17.50660486696931	78.47711887181424	2026-05-21 13:29:02.257296	inside
2627	E001	17.5064683	78.4772646	2026-05-21 13:29:02.909549	inside
2628	E001	17.5064676	78.4772644	2026-05-21 13:29:07.046481	inside
2629	E001	17.5064676	78.4772644	2026-05-21 13:29:07.976186	inside
2630	E001	17.5064661	78.4772645	2026-05-21 13:29:08.319916	inside
2631	E001	17.5064651	78.4772645	2026-05-21 13:29:11.257758	inside
2632	E001	17.5064643	78.4772659	2026-05-21 13:29:13.221803	inside
2633	E001	17.5064636	78.4772671	2026-05-21 13:29:18.227262	inside
2634	E001	17.5064636	78.4772672	2026-05-21 13:29:23.550599	inside
2635	E001	17.5064636	78.4772672	2026-05-21 13:29:28.522922	inside
2636	E001	17.50660486696931	78.47711887181424	2026-05-21 13:29:29.506963	inside
2637	E001	17.5064595	78.4772592	2026-05-21 13:29:33.823637	inside
2638	E001	17.5064584	78.4772604	2026-05-21 13:29:38.894642	inside
2639	E001	17.5064616	78.477262	2026-05-21 13:29:44.050116	inside
2640	E001	17.5064616	78.4772619	2026-05-21 13:29:49.179575	inside
2641	E001	17.506566578641714	78.47696527818981	2026-05-21 13:29:53.011737	inside
2642	E001	17.5064624	78.4772624	2026-05-21 13:29:54.429764	inside
2643	E001	17.5064617	78.4772616	2026-05-21 13:29:59.595602	inside
2644	E001	17.5065598432993	78.47695797402743	2026-05-21 13:30:04.677753	inside
2645	E001	17.5064612	78.477261	2026-05-21 13:30:04.682874	inside
2646	E001	17.5064603	78.4772616	2026-05-21 13:30:09.760466	inside
2647	E001	17.50660486696931	78.47711887181424	2026-05-21 13:30:16.327324	inside
2648	E001	17.50660486696931	78.47711887181424	2026-05-21 13:32:07.657685	inside
2649	E001	17.506610983806024	78.47712827093144	2026-05-21 13:33:15.896197	inside
2650	E001	17.5064581	78.477265	2026-05-21 13:34:14.039549	inside
2651	E001	17.5064581	78.477265	2026-05-21 13:34:18.863952	inside
2652	E001	17.50656643287374	78.47707201260754	2026-05-21 13:34:21.553088	inside
2653	E001	17.5064519	78.4772657	2026-05-21 13:34:24.202683	inside
2654	E001	17.5064603	78.4772651	2026-05-21 13:34:29.200089	inside
2655	E001	17.506478	78.4772546	2026-05-21 13:34:34.375667	inside
2656	E001	17.5064919	78.4772458	2026-05-21 13:34:39.480432	inside
2657	E001	17.5064795	78.4772523	2026-05-21 13:34:44.703452	inside
2658	E001	17.5064793	78.4772524	2026-05-21 13:34:49.736594	inside
2659	E001	17.5064706	78.47726	2026-05-21 13:34:55.082797	inside
2660	E001	17.5064688	78.4772623	2026-05-21 13:35:00.140367	inside
2661	E001	17.5064674	78.4772628	2026-05-21 13:35:05.26012	inside
2662	E001	17.5064674	78.4772628	2026-05-21 13:35:10.336362	inside
2663	E001	17.5064673	78.4772628	2026-05-21 13:35:13.634848	inside
2664	E001	17.5064674	78.4772628	2026-05-21 13:35:15.59163	inside
2665	E001	17.506466	78.4772629	2026-05-21 13:35:20.606993	inside
2666	E001	17.506466	78.4772629	2026-05-21 13:35:25.927364	inside
2667	E001	17.5064653	78.4772636	2026-05-21 13:35:31.166154	inside
2668	E001	17.5064647	78.4772641	2026-05-21 13:35:36.229679	inside
2669	E001	17.5064644	78.4772646	2026-05-21 13:35:41.304058	inside
2670	E001	17.5064644	78.4772645	2026-05-21 13:35:46.480709	inside
2671	E001	17.5064639	78.4772646	2026-05-21 13:35:51.535716	inside
2672	E001	17.5064632	78.4772646	2026-05-21 13:35:56.851083	inside
2673	E001	17.5064631	78.4772646	2026-05-21 13:36:01.783745	inside
2674	E001	17.5064668	78.47727	2026-05-21 13:36:46.012755	inside
2675	E001	17.5064668	78.4772702	2026-05-21 13:36:50.837736	inside
2676	E001	17.506464	78.4772668	2026-05-21 13:36:56.054211	inside
2677	E002	17.3746	78.5582	2026-05-21 13:37:02.629176	inside
2678	E003	17.5064651	78.4772663	2026-05-21 13:37:07.129005	inside
2679	E003	17.5064581	78.4772723	2026-05-21 13:37:12.180225	inside
2680	E003	17.5064615	78.4772669	2026-05-21 13:37:17.460101	inside
2681	E003	17.5064615	78.4772668	2026-05-21 13:37:22.393211	inside
2682	E003	17.5064608	78.4772661	2026-05-21 13:37:27.739138	inside
2683	E003	17.5064612	78.477266	2026-05-21 13:37:32.679337	inside
2684	E003	17.506461	78.477266	2026-05-21 13:37:37.983222	inside
2685	E003	17.5064608	78.4772661	2026-05-21 13:37:43.122775	inside
2686	E003	17.5064608	78.4772661	2026-05-21 13:37:48.37381	inside
2687	E003	17.506467	78.4772666	2026-05-21 13:37:53.301759	inside
2688	E003	17.5064664	78.4772659	2026-05-21 13:37:58.498948	inside
2689	E003	17.5064666	78.4772659	2026-05-21 13:38:00.427233	inside
2690	E003	17.506466	78.4772652	2026-05-21 13:38:03.546214	inside
2691	E003	17.5064655	78.477265	2026-05-21 13:38:08.86306	inside
2692	E003	17.5064655	78.477265	2026-05-21 13:38:13.765448	inside
2693	E003	17.5064658	78.477264	2026-05-21 13:38:19.050521	inside
2694	E003	17.5064658	78.477264	2026-05-21 13:38:24.235503	inside
2695	E003	17.5064657	78.4772636	2026-05-21 13:38:27.360597	inside
2696	E003	17.5064657	78.4772636	2026-05-21 13:38:29.410908	inside
2697	E003	17.5064654	78.4772635	2026-05-21 13:38:34.448265	inside
2698	E003	17.5064649	78.4772634	2026-05-21 13:38:39.780176	inside
2699	E003	17.5064645	78.4772637	2026-05-21 13:38:44.724953	inside
2700	E003	17.5064645	78.4772636	2026-05-21 13:38:49.98511	inside
2701	E003	17.5064642	78.4772634	2026-05-21 13:38:54.988413	inside
2702	E003	17.5064641	78.4772632	2026-05-21 13:39:00.256406	inside
2703	E003	17.5064645	78.4772627	2026-05-21 13:39:05.265176	inside
2704	E003	17.5064643	78.4772626	2026-05-21 13:39:10.547078	inside
2705	E003	17.5064635	78.4772625	2026-05-21 13:39:11.684471	inside
2706	E003	17.5064632	78.4772625	2026-05-21 13:39:15.496385	inside
2707	E003	17.5064632	78.4772625	2026-05-21 13:39:20.815083	inside
2708	E002	17.5064641	78.4772701	2026-05-21 13:39:25.499326	inside
2709	E003	17.5064629	78.4772626	2026-05-21 13:39:25.851835	inside
2710	E002	17.5064671	78.4772694	2026-05-21 13:39:30.347795	inside
2711	E003	17.5064627	78.4772626	2026-05-21 13:39:31.023074	inside
2712	E002	17.5064667	78.4772711	2026-05-21 13:39:35.596215	inside
2713	E003	17.5064626	78.4772625	2026-05-21 13:39:36.16754	inside
2714	E002	17.5064667	78.4772711	2026-05-21 13:39:40.711382	inside
2715	E003	17.5064623	78.4772624	2026-05-21 13:39:41.34379	inside
2716	E002	17.5064572	78.477266	2026-05-21 13:39:46.076532	inside
2717	E003	17.5064622	78.4772624	2026-05-21 13:39:46.380029	inside
2718	E002	17.5064773	78.4772781	2026-05-21 13:39:51.105662	inside
2719	E003	17.506462	78.4772623	2026-05-21 13:39:51.655577	inside
2720	E003	17.5064617	78.4772625	2026-05-21 13:39:56.678792	inside
2721	E003	17.5064616	78.4772625	2026-05-21 13:40:01.812167	inside
2722	E003	17.5064618	78.4772622	2026-05-21 13:40:06.872719	inside
2723	E003	17.5064617	78.4772622	2026-05-21 13:40:12.104924	inside
2724	E003	17.5064615	78.4772624	2026-05-21 13:40:17.091006	inside
2725	E003	17.5064615	78.4772623	2026-05-21 13:40:22.408895	inside
2726	E003	17.5064618	78.4772624	2026-05-21 13:40:23.247228	inside
2727	E003	17.5064628	78.4772628	2026-05-21 13:40:23.859028	inside
2728	E003	17.5064629	78.4772629	2026-05-21 13:40:27.509778	inside
2729	E003	17.5064628	78.4772629	2026-05-21 13:40:32.619198	inside
2730	E003	17.5064626	78.477263	2026-05-21 13:40:37.755897	inside
2731	E003	17.5064624	78.4772631	2026-05-21 13:40:42.883849	inside
2732	E003	17.5064622	78.4772632	2026-05-21 13:40:47.900275	inside
2733	E003	17.5064621	78.4772631	2026-05-21 13:40:53.170347	inside
2734	E003	17.5064619	78.4772632	2026-05-21 13:40:58.171691	inside
2735	E003	17.5064618	78.4772632	2026-05-21 13:41:03.55354	inside
2736	E003	17.506462	78.4772629	2026-05-21 13:41:08.474474	inside
2737	E003	17.5064619	78.4772628	2026-05-21 13:41:13.650983	inside
2738	E003	17.506462	78.4772628	2026-05-21 13:41:18.744447	inside
2739	E003	17.506462	78.4772627	2026-05-21 13:41:23.933295	inside
2740	E003	17.5064618	78.4772628	2026-05-21 13:41:28.963236	inside
2741	E003	17.5064615	78.4772631	2026-05-21 13:41:34.254607	inside
2742	E003	17.5064615	78.477263	2026-05-21 13:41:39.307223	inside
2743	E003	17.5064615	78.4772629	2026-05-21 13:41:44.421426	inside
2744	E003	17.5064615	78.4772629	2026-05-21 13:41:49.51522	inside
2745	E003	17.5064559	78.4772646	2026-05-21 13:41:54.75064	inside
2746	E003	17.5064556	78.4772647	2026-05-21 13:41:59.765762	inside
2747	E003	17.506452	78.4772677	2026-05-21 13:42:05.042553	inside
2748	E003	17.5064563	78.4772644	2026-05-21 13:42:10.056242	inside
2749	E003	17.5064563	78.4772645	2026-05-21 13:42:15.338046	inside
2750	E003	17.5064559	78.4772651	2026-05-21 13:42:20.345032	inside
2751	E003	17.5064559	78.4772651	2026-05-21 13:42:25.519442	inside
2752	E003	17.5064566	78.4772656	2026-05-21 13:42:30.593555	inside
2753	E003	17.5064569	78.4772655	2026-05-21 13:42:35.773083	inside
2754	E003	17.5064571	78.4772655	2026-05-21 13:42:40.838421	inside
2755	E003	17.506457	78.4772654	2026-05-21 13:42:46.129763	inside
2756	E003	17.5064572	78.4772655	2026-05-21 13:42:51.0728	inside
2757	E004	17.5064548	78.4772605	2026-05-21 13:42:54.092458	inside
2758	E003	17.5064576	78.4772658	2026-05-21 13:42:56.585336	inside
2759	E003	17.5064579	78.4772656	2026-05-21 13:43:01.332828	inside
2760	E004	17.5064571	78.4772633	2026-05-21 13:43:03.701287	inside
2761	E003	17.5064578	78.4772655	2026-05-21 13:43:06.667299	inside
2762	E003	17.5064581	78.4772654	2026-05-21 13:43:11.68109	inside
2763	E003	17.5064586	78.4772652	2026-05-21 13:43:16.951853	inside
2764	E003	17.5064588	78.4772652	2026-05-21 13:43:22.018969	inside
2765	E003	17.5064589	78.4772651	2026-05-21 13:43:27.175409	inside
2766	E003	17.5064589	78.477265	2026-05-21 13:43:32.337675	inside
2767	E003	17.506459	78.477265	2026-05-21 13:43:37.466869	inside
2768	E003	17.5064589	78.4772648	2026-05-21 13:43:42.559199	inside
2769	E003	17.5064588	78.4772648	2026-05-21 13:43:47.716876	inside
2770	E003	17.5064582	78.4772649	2026-05-21 13:43:52.795975	inside
2771	E003	17.5064582	78.4772649	2026-05-21 13:43:58.03602	inside
2772	E003	17.5064582	78.4772648	2026-05-21 13:44:03.163765	inside
2773	E003	17.5064582	78.4772648	2026-05-21 13:44:08.443754	inside
2774	E003	17.5064581	78.4772649	2026-05-21 13:44:13.406544	inside
2775	E003	17.5064581	78.477265	2026-05-21 13:44:18.573839	inside
2776	E003	17.5064581	78.477265	2026-05-21 13:44:23.522464	inside
2777	E003	17.506458	78.477265	2026-05-21 13:44:28.86096	inside
2778	E003	17.506458	78.477265	2026-05-21 13:44:33.790778	inside
2779	E003	17.5064579	78.4772649	2026-05-21 13:44:39.104225	inside
2780	E003	17.506458	78.4772649	2026-05-21 13:44:44.217133	inside
2781	E003	17.5064579	78.4772648	2026-05-21 13:44:49.34924	inside
2782	E003	17.5064579	78.4772648	2026-05-21 13:44:54.334178	inside
2783	E003	17.5064577	78.4772647	2026-05-21 13:44:59.603938	inside
2784	E003	17.5064577	78.4772647	2026-05-21 13:45:04.696841	inside
2785	E003	17.5064577	78.4772647	2026-05-21 13:45:09.919084	inside
2786	E003	17.5064576	78.4772648	2026-05-21 13:45:14.883603	inside
2787	E003	17.5064575	78.4772648	2026-05-21 13:45:20.155496	inside
2788	E003	17.5064574	78.4772648	2026-05-21 13:45:25.18688	inside
2789	E003	17.5064575	78.4772646	2026-05-21 13:45:30.375591	inside
2790	E003	17.5064575	78.4772647	2026-05-21 13:45:35.471317	inside
2791	E002	17.5064586	78.4772627	2026-05-21 13:45:40.302511	inside
2792	E003	17.5064575	78.4772645	2026-05-21 13:45:40.696542	inside
2793	E003	17.5064573	78.4772645	2026-05-21 13:45:45.713514	inside
2794	E002	17.5064589	78.4772688	2026-05-21 13:45:45.743323	inside
2795	E002	17.50646	78.4772616	2026-05-21 13:45:50.735577	inside
2796	E003	17.5064572	78.4772646	2026-05-21 13:45:50.927704	inside
2797	E002	17.5064673	78.4772521	2026-05-21 13:45:56.062503	inside
2798	E003	17.5064572	78.4772646	2026-05-21 13:45:56.081076	inside
2799	E002	17.5064635	78.4772532	2026-05-21 13:46:01.130597	inside
2800	E003	17.5064573	78.4772645	2026-05-21 13:46:01.206828	inside
2801	E003	17.5064573	78.4772645	2026-05-21 13:46:06.35191	inside
2802	E002	17.506482	78.4772652	2026-05-21 13:46:06.428835	inside
2803	E002	17.506485	78.4772678	2026-05-21 13:46:11.483399	inside
2804	E003	17.5064573	78.4772645	2026-05-21 13:46:11.563524	inside
2805	E003	17.5064572	78.4772645	2026-05-21 13:46:16.634205	inside
2806	E002	17.5064521	78.4772245	2026-05-21 13:46:16.84105	inside
2807	E002	17.5064808	78.4772644	2026-05-21 13:46:21.863764	inside
2808	E003	17.5064573	78.4772645	2026-05-21 13:46:21.921561	inside
2809	E003	17.5064572	78.4772646	2026-05-21 13:46:26.911785	inside
2810	E002	17.5064553	78.4772561	2026-05-21 13:46:27.234102	inside
2811	E003	17.5064572	78.4772646	2026-05-21 13:46:32.187038	inside
2812	E002	17.5064657	78.4772703	2026-05-21 13:46:32.30812	inside
2813	E003	17.5064572	78.4772647	2026-05-21 13:46:37.275484	inside
2814	E002	17.5064596	78.4772589	2026-05-21 13:46:37.624243	inside
2815	E003	17.5064572	78.4772648	2026-05-21 13:46:42.510411	inside
2816	E002	17.5064576	78.4772599	2026-05-21 13:46:42.627425	inside
2817	E003	17.5064573	78.4772647	2026-05-21 13:46:47.532229	inside
2818	E003	17.5064572	78.4772647	2026-05-21 13:46:52.845386	inside
2819	E003	17.5064572	78.4772648	2026-05-21 13:46:57.967959	inside
2820	E003	17.5064571	78.4772648	2026-05-21 13:47:03.098541	inside
2821	E003	17.5064572	78.4772648	2026-05-21 13:47:08.123822	inside
2822	E003	17.5064572	78.4772648	2026-05-21 13:47:13.414364	inside
2823	E003	17.5064572	78.4772647	2026-05-21 13:47:18.389422	inside
2824	E003	17.5064572	78.4772647	2026-05-21 13:47:23.628925	inside
2825	E003	17.5064572	78.4772647	2026-05-21 13:47:28.666904	inside
2826	E003	17.5064572	78.4772647	2026-05-21 13:47:33.880659	inside
2827	E003	17.5064572	78.4772647	2026-05-21 13:47:38.922765	inside
2828	E003	17.5064572	78.4772646	2026-05-21 13:47:44.247928	inside
2829	E003	17.5064572	78.4772647	2026-05-21 13:47:49.177305	inside
2830	E003	17.5064572	78.4772647	2026-05-21 13:47:54.390173	inside
2831	E003	17.5064571	78.4772647	2026-05-21 13:47:59.477525	inside
2832	E003	17.5064571	78.4772647	2026-05-21 13:48:04.81123	inside
2833	E003	17.5064572	78.4772646	2026-05-21 13:48:09.935457	inside
2834	E003	17.5064572	78.4772646	2026-05-21 13:48:14.988893	inside
2835	E003	17.5064573	78.4772646	2026-05-21 13:48:20.10952	inside
2836	E003	17.5064573	78.4772646	2026-05-21 13:48:25.402651	inside
2837	E003	17.5064572	78.4772645	2026-05-21 13:48:30.361496	inside
2838	E003	17.5064573	78.4772643	2026-05-21 13:48:35.578295	inside
2839	E003	17.5064573	78.4772642	2026-05-21 13:48:40.693679	inside
2840	E003	17.5064573	78.477264	2026-05-21 13:48:45.990955	inside
2841	E003	17.5064573	78.4772641	2026-05-21 13:48:51.007484	inside
2842	E003	17.5064573	78.477264	2026-05-21 13:48:56.328941	inside
2843	E003	17.5064573	78.4772641	2026-05-21 13:49:01.350916	inside
2844	E003	17.5064573	78.477264	2026-05-21 13:49:06.467861	inside
2845	E003	17.5064574	78.4772641	2026-05-21 13:49:11.51353	inside
2846	E002	17.5064896	78.4772709	2026-05-21 13:49:12.536243	inside
2847	E003	17.5064574	78.477264	2026-05-21 13:49:16.779282	inside
2848	E002	17.5064896	78.4772709	2026-05-21 13:49:17.462436	inside
2849	E003	17.5064574	78.4772639	2026-05-21 13:49:21.793247	inside
2850	E002	17.5064943	78.4772671	2026-05-21 13:49:22.828334	inside
2851	E003	17.5064575	78.4772639	2026-05-21 13:49:27.076189	inside
2852	E002	17.5064922	78.4772661	2026-05-21 13:49:27.836255	inside
2853	E002	17.5064632	78.4772597	2026-05-21 13:49:33.275744	inside
2854	E002	17.5064916	78.4772683	2026-05-21 13:49:38.409922	inside
2855	E002	17.5064595	78.47726	2026-05-21 13:49:43.643693	inside
2856	E002	17.5064935	78.4772686	2026-05-21 13:49:48.737089	inside
2857	E002	17.5064522	78.477276	2026-05-21 13:49:54.063666	inside
2858	E002	17.5064612	78.4772637	2026-05-21 13:49:59.047964	inside
2859	E002	17.5064632	78.4772614	2026-05-21 13:50:04.447858	inside
2860	E002	17.5064631	78.4772615	2026-05-21 13:50:09.441921	inside
2861	E002	17.3746	78.5582	2026-05-21 13:53:37.857784	inside
2862	E004	17.5065598432993	78.47695797402743	2026-05-21 13:53:54.921564	inside
2863	E004	17.50660486696931	78.47711887181424	2026-05-21 13:54:18.175825	inside
2864	E004	17.5065573812953	78.4771338363508	2026-05-21 15:51:49.652037	inside
\.


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 220
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 16, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 222
-- Name: presence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presence_id_seq', 2864, true);


--
-- TOC entry 4818 (class 2606 OID 41649)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 41651)
-- Name: presence presence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 41653)
-- Name: employees unique_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT unique_employee_id UNIQUE (employee_id);


-- Completed on 2026-05-27 19:23:06

--
-- PostgreSQL database dump complete
--

\unrestrict 1xK2CmiUcelzRuurytywvGat5noNX8PLG6imIzn1ItQSr3GcCgVdBjGdB3N08p4

-- Completed on 2026-05-27 19:23:06

--
-- PostgreSQL database cluster dump complete
--

