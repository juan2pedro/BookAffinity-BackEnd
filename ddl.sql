--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-28 12:37:54

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
-- TOC entry 3490 (class 1262 OID 16401)
-- Name: BookAffinity_db; Type: DATABASE; Schema: -; Owner: admin
--

-- COMENTADO PARA HACER PRUEBAS (DESCOMENTAR AL IMPLANTAR DOCKER)
SELECT 'CREATE DATABASE "BookAffinity_db" WITH TEMPLATE = template0 ENCODING = "UTF8";'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'BookAffinity_db')\gexec

CREATE ROLE admin WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  REPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:LHcQUFjhQwf27lOJjluILg==$7HEOtl27HY9EkQFPBbBbeFsGDl7aNOpBgbiWBC4aiFI=:hTvC8H7SGnIGhe03b22UDvwN5SoJP5J0CrmDY+/cLTE=';

GRANT pg_read_all_data, pg_write_all_data TO admin WITH ADMIN OPTION;

ALTER DATABASE "BookAffinity_db" OWNER TO admin;

--\connect "BookAffinity_db"

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
-- TOC entry 6 (class 2615 OID 16402)
-- Name: BookAffinity; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA "BookAffinity";


ALTER SCHEMA "BookAffinity" OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 254 (class 1259 OID 17047)
-- Name: author; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".author (
    id_author integer NOT NULL,
    name_author character varying(25) NOT NULL
);


ALTER TABLE "BookAffinity".author OWNER TO admin;

--
-- TOC entry 256 (class 1259 OID 17051)
-- Name: autor_id_autor_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".author ALTER COLUMN id_author ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".autor_id_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 17001)
-- Name: book; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".book (
    id_book integer NOT NULL,
    name character varying(50) NOT NULL,
    summary character varying(300),
    isbn bigint NOT NULL,
    id_author integer,
    language integer,
    status smallint
);


ALTER TABLE "BookAffinity".book OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 16791)
-- Name: book_categories; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".book_categories (
    id_book_categories integer NOT NULL,
    id_category integer NOT NULL,
    id_book integer NOT NULL
);


ALTER TABLE "BookAffinity".book_categories OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16784)
-- Name: category; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".category (
    id_category integer NOT NULL,
    name_category character varying(25) NOT NULL
);


ALTER TABLE "BookAffinity".category OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 16783)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".categoria_id_categoria_seq OWNER TO admin;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 215
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".categoria_id_categoria_seq OWNED BY "BookAffinity".category.id_category;


--
-- TOC entry 253 (class 1259 OID 17044)
-- Name: categoria_id_categoria_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".category ALTER COLUMN id_category ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".categoria_id_categoria_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16874)
-- Name: chat; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".chat (
    id_chat integer NOT NULL,
    id_user1 integer NOT NULL,
    id_user2 integer NOT NULL
);


ALTER TABLE "BookAffinity".chat OWNER TO admin;

--
-- TOC entry 230 (class 1259 OID 16908)
-- Name: comment; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".comment (
    id_comment integer NOT NULL,
    rating integer NOT NULL,
    text character varying(140),
    id_book integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE "BookAffinity".comment OWNER TO admin;

--
-- TOC entry 229 (class 1259 OID 16907)
-- Name: comentario_id_comentario_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".comentario_id_comentario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".comentario_id_comentario_seq OWNER TO admin;

--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 229
-- Name: comentario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".comentario_id_comentario_seq OWNED BY "BookAffinity".comment.id_comment;


--
-- TOC entry 252 (class 1259 OID 17043)
-- Name: comentario_id_comentario_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".comment ALTER COLUMN id_comment ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".comentario_id_comentario_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 17042)
-- Name: conversacion_id_conversacion_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".chat ALTER COLUMN id_chat ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".conversacion_id_conversacion_seq
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16873)
-- Name: conversacion_idconversacion_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".conversacion_idconversacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".conversacion_idconversacion_seq OWNER TO admin;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 225
-- Name: conversacion_idconversacion_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".conversacion_idconversacion_seq OWNED BY "BookAffinity".chat.id_chat;


--
-- TOC entry 224 (class 1259 OID 16856)
-- Name: copy; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".copy (
    price integer NOT NULL,
    visible smallint DEFAULT 1 NOT NULL,
    id_copy integer NOT NULL,
    status character varying(100) NOT NULL,
    id_user integer NOT NULL,
    id_book integer NOT NULL
);


ALTER TABLE "BookAffinity".copy OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16855)
-- Name: ejemplar_id_ejemplar_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".ejemplar_id_ejemplar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".ejemplar_id_ejemplar_seq OWNER TO admin;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 223
-- Name: ejemplar_id_ejemplar_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".ejemplar_id_ejemplar_seq OWNED BY "BookAffinity".copy.id_copy;


--
-- TOC entry 250 (class 1259 OID 17041)
-- Name: ejemplar_id_ejemplar_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".copy ALTER COLUMN id_copy ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".ejemplar_id_ejemplar_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16891)
-- Name: invoice; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".invoice (
    id_invoice integer NOT NULL,
    id_copy integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE "BookAffinity".invoice OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 16890)
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".factura_id_factura_seq OWNER TO admin;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 227
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".factura_id_factura_seq OWNED BY "BookAffinity".invoice.id_invoice;


--
-- TOC entry 249 (class 1259 OID 17040)
-- Name: factura_id_factura_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".invoice ALTER COLUMN id_invoice ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".factura_id_factura_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 17010)
-- Name: img_book; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".img_book (
    id_img_book integer NOT NULL,
    rute character varying NOT NULL,
    id_book integer
);


ALTER TABLE "BookAffinity".img_book OWNER TO admin;

--
-- TOC entry 232 (class 1259 OID 16949)
-- Name: img_comment; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".img_comment (
    id_img_comment integer NOT NULL,
    rute character varying NOT NULL,
    id_comment integer
);


ALTER TABLE "BookAffinity".img_comment OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 16948)
-- Name: img_comentario_id_img_comentario_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".img_comentario_id_img_comentario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".img_comentario_id_img_comentario_seq OWNER TO admin;

--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 231
-- Name: img_comentario_id_img_comentario_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".img_comentario_id_img_comentario_seq OWNED BY "BookAffinity".img_comment.id_img_comment;


--
-- TOC entry 248 (class 1259 OID 17036)
-- Name: img_comentario_id_img_comentario_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".img_comment ALTER COLUMN id_img_comment ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".img_comentario_id_img_comentario_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16975)
-- Name: img_copy; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".img_copy (
    id_img_copy integer NOT NULL,
    rute character varying NOT NULL,
    id_copy integer
);


ALTER TABLE "BookAffinity".img_copy OWNER TO admin;

--
-- TOC entry 235 (class 1259 OID 16974)
-- Name: img_ejemplar_id_img_ejemplar_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".img_ejemplar_id_img_ejemplar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".img_ejemplar_id_img_ejemplar_seq OWNER TO admin;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 235
-- Name: img_ejemplar_id_img_ejemplar_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".img_ejemplar_id_img_ejemplar_seq OWNED BY "BookAffinity".img_copy.id_img_copy;


--
-- TOC entry 247 (class 1259 OID 17035)
-- Name: img_ejemplar_id_img_ejemplar_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".img_copy ALTER COLUMN id_img_copy ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".img_ejemplar_id_img_ejemplar_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 17009)
-- Name: img_libro_id_img_libro_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".img_libro_id_img_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".img_libro_id_img_libro_seq OWNER TO admin;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 239
-- Name: img_libro_id_img_libro_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".img_libro_id_img_libro_seq OWNED BY "BookAffinity".img_book.id_img_book;


--
-- TOC entry 246 (class 1259 OID 17034)
-- Name: img_libro_id_img_libro_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".img_book ALTER COLUMN id_img_book ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".img_libro_id_img_libro_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 17000)
-- Name: libro_id_libro_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".libro_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".libro_id_libro_seq OWNER TO admin;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 237
-- Name: libro_id_libro_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".libro_id_libro_seq OWNED BY "BookAffinity".book.id_book;


--
-- TOC entry 245 (class 1259 OID 17029)
-- Name: libro_id_libro_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".book ALTER COLUMN id_book ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".libro_id_libro_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16963)
-- Name: message; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".message (
    id_message integer NOT NULL,
    text character varying(140) NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_chat integer NOT NULL
);


ALTER TABLE "BookAffinity".message OWNER TO admin;

--
-- TOC entry 233 (class 1259 OID 16962)
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".mensaje_id_mensaje_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".mensaje_id_mensaje_seq OWNER TO admin;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 233
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".mensaje_id_mensaje_seq OWNED BY "BookAffinity".message.id_message;


--
-- TOC entry 244 (class 1259 OID 17027)
-- Name: mensaje_id_mensaje_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".message ALTER COLUMN id_message ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".mensaje_id_mensaje_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16808)
-- Name: rol; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity".rol (
    id_rol integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE "BookAffinity".rol OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16807)
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".rol_id_rol_seq OWNER TO admin;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 219
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".rol_id_rol_seq OWNED BY "BookAffinity".rol.id_rol;


--
-- TOC entry 243 (class 1259 OID 17026)
-- Name: rol_id_rol_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".rol ALTER COLUMN id_rol ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".rol_id_rol_seq1
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16790)
-- Name: tiene_id_tiene_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".tiene_id_tiene_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".tiene_id_tiene_seq OWNER TO admin;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 217
-- Name: tiene_id_tiene_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".tiene_id_tiene_seq OWNED BY "BookAffinity".book_categories.id_book_categories;


--
-- TOC entry 242 (class 1259 OID 17025)
-- Name: tiene_id_tiene_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity".book_categories ALTER COLUMN id_book_categories ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".tiene_id_tiene_seq1
    START WITH 51
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16843)
-- Name: user; Type: TABLE; Schema: BookAffinity; Owner: admin
--

CREATE TABLE "BookAffinity"."user" (
    id_user integer NOT NULL,
    name character varying(25) NOT NULL,
    pass character varying(16) NOT NULL,
    picture character varying(100),
    email character varying(100) NOT NULL,
    status smallint NOT NULL,
    id_rol smallint NOT NULL,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);


ALTER TABLE "BookAffinity"."user" OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16842)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

CREATE SEQUENCE "BookAffinity".usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BookAffinity".usuario_id_usuario_seq OWNER TO admin;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 221
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: BookAffinity; Owner: admin
--

ALTER SEQUENCE "BookAffinity".usuario_id_usuario_seq OWNED BY "BookAffinity"."user".id_user;


--
-- TOC entry 241 (class 1259 OID 17024)
-- Name: usuario_id_usuario_seq1; Type: SEQUENCE; Schema: BookAffinity; Owner: admin
--

ALTER TABLE "BookAffinity"."user" ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "BookAffinity".usuario_id_usuario_seq1
    START WITH 52
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 17050)
-- Name: categoria_id_autor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_autor_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 17047)
-- Dependencies: 254
-- Data for Name: author; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (1, 'Miguel de Cervantes');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (2, 'García Lorca');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (3, 'Gabriel García Márquez');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (4, 'Pablo Neruda');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (5, 'Isabel Allende');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (6, 'Jorge Luis Borges');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (7, 'Mario Vargas Llosa');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (8, 'Octavio Paz');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (9, 'Federico García Lorca');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (10, 'Julio Cortázar');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (11, 'Antonio Machado');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (12, 'Lope de Vega');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (13, 'Luis de Góngora');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (14, 'Benito Pérez Galdós');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (15, 'Miguel Delibes');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (16, 'Juan Ramón Jiménez');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (17, 'Camilo José Cela');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (18, 'José Saramago');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (19, 'Virginia Woolf');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (20, 'William Shakespeare');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (21, 'Jane Austen');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (22, 'Charles Dickens');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (23, 'George Orwell');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (24, 'Mary Shelley');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (25, 'Lewis Carroll');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (26, 'J.K. Rowling');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (27, 'J.R.R. Tolkien');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (28, 'George Eliot');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (29, 'Emily Bronte');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (30, 'Charlotte Bronte');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (31, 'Thomas Hardy');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (32, 'Agatha Christie');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (33, 'D.H. Lawrence');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (34, 'E.M. Forster');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (35, 'Graham Greene');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (36, 'Ian McEwan');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (37, 'Salman Rushdie');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (38, 'Zadie Smith');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (39, 'Kazuo Ishiguro');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (40, 'Philip Pullman');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (41, 'Terry Pratchett');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (42, 'Roald Dahl');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (43, 'Neil Gaiman');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (44, 'J.G. Ballard');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (45, 'Martin Amis');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (46, 'Hilary Mantel');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (47, 'Margaret Atwood');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (48, 'Alice Munro');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (49, 'Michael Ondaatje');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (50, 'Joseph Conrad');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (51, 'Evelyn Waugh');
INSERT INTO "BookAffinity".author (id_author, name_author) OVERRIDING SYSTEM VALUE VALUES (52, 'Anthony Burgess');


--
-- TOC entry 3466 (class 0 OID 17001)
-- Dependencies: 238
-- Data for Name: book; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (1, 'Don Quijote de la Mancha', 'La historia de un hombre que enloquece leyendo libros de caballería y sale a recorrer el mundo en busca de aventuras.', 9788426138017, 1, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (2, 'Bodas de sangre', 'La tragedia de una boda que termina en sangre y muerte.', 9788437600478, 2, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (3, 'Cien años de soledad', 'La historia de la familia Buendía y su pueblo Macondo a lo largo de siete generaciones.', 9788420471839, 3, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (4, 'Veinte poemas de amor y una canción desesperada', 'Veinte poemas de amor y una canción desesperada es una de las obras más conocidas del poeta chileno Pablo Neruda.', 9788432217176, 4, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (5, 'La casa de los espíritus', 'La casa de los espíritus es una novela de la escritora chilena Isabel Allende.', 9788401338034, 5, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (6, 'El Aleph', 'El Aleph es una colección de cuentos del escritor argentino Jorge Luis Borges.', 9788437602434, 6, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (7, 'La ciudad y los perros', 'La ciudad y los perros es una novela del escritor peruano Mario Vargas Llosa.', 9788420434521, 7, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (8, 'El laberinto de la soledad', 'El laberinto de la soledad es un ensayo del escritor mexicano Octavio Paz.', 9788432211341, 8, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (9, 'Rayuela', 'Rayuela es una novela del escritor argentino Julio Cortázar.', 9788466330674, 10, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (10, 'Campos de Castilla', 'Campos de Castilla es una obra poética del escritor español Antonio Machado.', 9788497402639, 11, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (11, 'Fuenteovejuna', 'Fuenteovejuna es una obra de teatro del escritor español Lope de Vega.', 9788420660733, 12, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (12, 'Fábula de Polifemo y Galatea', 'Fábula de Polifemo y Galatea es una obra poética del escritor español Luis de Góngora.', 9788437601253, 13, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (13, '1984', '1984 es una novela distópica del escritor británico George Orwell, que describe un futuro imaginario en el que el gobierno tiene control total sobre la vida de las personas.', 9788408175516, 14, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (14, 'Crimen y castigo', 'Crimen y castigo es una novela del escritor ruso Fiódor Dostoyevski, que cuenta la historia de un estudiante que comete un asesinato y sufrimiento posterior.', 9788467036008, 15, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (15, 'El gran Gatsby', 'El gran Gatsby es una novela del escritor estadounidense F. Scott Fitzgerald, que sigue la vida del millonario Jay Gatsby en la década de 1920.', 9788491053532, 16, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (16, 'El retrato de Dorian Gray', 'El retrato de Dorian Gray es una novela del escritor británico Oscar Wilde, que trata sobre un joven que desea permanecer eternamente joven y bello mientras su retrato envejece en su lugar.', 9788491041904, 17, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (17, 'The Catcher in the Rye', 'The Catcher in the Rye is a novel by American author J.D. Salinger about a teenage boy named Holden Caulfield who is expelled from his prep school and wanders through New York City.', 316769487, 14, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (18, 'To Kill a Mockingbird', 'To Kill a Mockingbird is a novel by American author Harper Lee set in the Great Depression, and follows the journey of a young girl named Scout Finch as she learns about racism and prejudice in her small Alabama town.', 446310786, 15, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (19, '1984', '1984 is a dystopian novel by British author George Orwell, set in a totalitarian society and focusing on the dangers of government surveillance and control.', 451524934, 16, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (20, 'The Great Gatsby', 'The Great Gatsby is a novel by American author F. Scott Fitzgerald set in the Roaring Twenties and follows the story of the mysterious millionaire Jay Gatsby and his obsession with the beautiful Daisy Buchanan.', 9780141182636, 17, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (89, 'Pride and Prejudice', 'Pride and Prejudice is a novel by British author Jane Austen, set in the late 18th century and follows the story of the Bennet sisters and their relationships with the wealthy Mr. Darcy and his friend Mr. Bingley.', 9780141439518, 18, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (90, 'Matar a un ruiseñor', 'Matar a un ruiseñor es una novela de la escritora estadounidense Harper Lee que trata temas como la discriminación racial y la justicia en la década de 1930 en el sur de los Estados Unidos.', 9788466330186, 15, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (91, 'El gran Gatsby', 'El gran Gatsby es una novela del escritor estadounidense F. Scott Fitzgerald que cuenta la historia de Jay Gatsby y su amor por la bella Daisy Buchanan.', 9788491050678, 16, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (92, 'Moby Dick', 'Moby Dick es una novela del escritor estadounidense Herman Melville que cuenta la historia del capitán Ahab y su obsesión por cazar a la ballena blanca Moby Dick.', 9788417430679, 17, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (93, 'El guardián entre el centeno', 'El guardián entre el centeno es una novela del escritor estadounidense J.D. Salinger que sigue a Holden Caulfield, un joven que acaba de ser expulsado de su escuela y busca encontrar su lugar en el mundo.', 9788435008964, 18, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (94, 'El señor de los anillos', 'El señor de los anillos es una trilogía de novelas del escritor británico J.R.R. Tolkien que sigue la historia del hobbit Frodo Bolsón y su misión de destruir el anillo único.', 9788445074483, 19, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (95, 'Drácula', 'Drácula es una novela del escritor irlandés Bram Stoker que sigue la historia del vampiro conde Drácula y su intento de trasladarse a Inglaterra desde Transilvania.', 9788437604339, 20, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (96, 'La metamorfosis', 'La metamorfosis es un relato del escritor checo Franz Kafka que sigue la historia de Gregor Samsa, un hombre que se despierta una mañana transformado en un insecto gigante.', 9788420665462, 21, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (97, 'El extranjero', 'El extranjero es una novela del escritor francés Albert Camus que cuenta la historia de Meursault, un hombre que vive su vida sin emociones y es juzgado por asesinato.', 9788420673924, 0, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (98, 'Cumbres borrascosas', 'Cumbres borrascosas es una novela de la escritora británica Emily Brontë que sigue la historia de Heathcliff y su amor por Catherine Earnshaw.', 9788415618795, 14, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (99, 'El perfume', 'El perfume es una novela del escritor alemán Patrick Süskind que cuenta la historia de Jean-Baptiste Grenouille, un asesino en serie obsesionado con crear el perfume perfecto.', 9788432226351, 22, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (100, 'El nombre de la rosa', 'El nombre de la rosa es una novela del escritor italiano Umberto Eco que sigue al monje franciscano William de Baskerville en su investigación de una serie de asesinatos en una abadía en el siglo XIV.', 9788497593790, 23, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (101, 'La insoportable levedad del ser', 'La insoportable levedad del ser es una novela del escritor checo Milan Kundera que explora la vida amorosa de cuatro personajes en la Praga comunista de los años 60.', 9788490628530, 24, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (102, 'Orgullo y prejuicio', 'Orgullo y prejuicio es una novela de la escritora británica Jane Austen que sigue a Elizabeth Bennet en su búsqueda de amor y felicidad en la sociedad inglesa del siglo XIX.', 9788490651941, 25, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (103, 'El retrato de Dorian Gray', 'El retrato de Dorian Gray es una novela del escritor británico Oscar Wilde que cuenta la historia del joven Dorian Gray y su retrato mágico que envejece en su lugar.', 9788491050937, 26, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (104, 'Rayuela', 'Rayuela es una novela del escritor argentino Julio Cortázar que sigue la historia del escritor Horacio Oliveira en su búsqueda de identidad en París y Buenos Aires.', 9788466323188, 27, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (105, 'Crónica de una muerte anunciada', 'Crónica de una muerte anunciada es una novela del escritor colombiano Gabriel García Márquez que relata el asesinato de Santiago Nasar en un pueblo caribeño.', 9788497592434, 28, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (106, 'Cien años de soledad', 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez que cuenta la historia de la familia Buendía en el pueblo ficticio de Macondo.', 9788466347276, 28, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (107, 'El laberinto de la soledad', 'El laberinto de la soledad es un ensayo del escritor mexicano Octavio Paz que explora la identidad y la cultura mexicana.', 9788437503142, 29, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (108, 'La conjura de los necios', 'La conjura de los necios es una novela del escritor estadounidense John Kennedy Toole que sigue la historia del personaje Ignatius J. Reilly en la Nueva Orleans de los años 60.', 9788433920115, 30, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (109, 'El código Da Vinci', 'El código Da Vinci es una novela del escritor estadounidense Dan Brown que sigue al simbólogo Robert Langdon en su búsqueda del Santo Grial en París.', 9780307474278, 31, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (110, 'El alquimista', 'El alquimista es una novela del escritor brasileño Paulo Coelho que cuenta la historia del joven pastor Santiago en su búsqueda de su destino personal y espiritual.', 9788408170013, 32, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (111, '1984', '1984 es una novela del escritor británico George Orwell que describe una sociedad totalitaria en el futuro en la que el gobierno controla todos los aspectos de la vida.', 9788499890944, 33, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (112, 'La naranja mecánica', 'La naranja mecánica es una novela del escritor británico Anthony Burgess que sigue la historia de Alex, un joven criminal y sociópata en una sociedad distópica.', 9788433902234, 34, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (113, 'La hoguera de las vanidades', 'La hoguera de las vanidades es una novela del escritor estadounidense Tom Wolfe que satiriza la cultura y la política de Nueva York en los años 80.', 9788497596975, 35, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (114, 'La naranja mecánica', 'La naranja mecánica es una novela del escritor británico Anthony Burgess que sigue la historia de Alex, un joven delincuente y su rehabilitación mediante un nuevo tratamiento psicológico.', 9788432229994, 31, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (115, 'La casa de los espíritus', 'La casa de los espíritus es una novela de la escritora chilena Isabel Allende que sigue a la familia Trueba en Chile a lo largo de varias generaciones.', 9788401468177, 32, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (116, 'El amor en los tiempos del cólera', 'El amor en los tiempos del cólera es una novela del escritor colombiano Gabriel García Márquez que cuenta la historia de amor entre Fermina Daza y Florentino Ariza a lo largo de 50 años.', 9788497592410, 28, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (117, 'El túnel', 'El túnel es una novela del escritor argentino Ernesto Sabato que cuenta la historia de un pintor llamado Juan Pablo Castel y su obsesión por una mujer.', 9788466321467, 33, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (118, 'El guardián entre el centeno', 'El guardián entre el centeno es una novela del escritor estadounidense J.D. Salinger que sigue al adolescente Holden Caulfield en su búsqueda de sentido en la vida.', 9788435009332, 34, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (119, 'Las venas abiertas de América Latina', 'Las venas abiertas de América Latina es un ensayo del escritor uruguayo Eduardo Galeano que analiza la historia y la economía de América Latina desde la época colonial hasta la actualidad.', 9788432314717, 35, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (120, 'La tregua', 'La tregua es una novela del escritor uruguayo Mario Benedetti que sigue la historia de amor entre Martín Santomé y Laura Avellaneda, dos trabajadores de una compañía de seguros.', 9788420423220, 36, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (121, 'La ciudad y los perros', 'La ciudad y los perros es una novela del escritor peruano Mario Vargas Llosa que sigue la vida de un grupo de estudiantes en una escuela militar en Lima.', 9788420481565, 37, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (122, 'El hobbit', 'El hobbit es una novela del escritor británico J.R.R. Tolkien que cuenta la historia del hobbit Bilbo Bolsón en su búsqueda del tesoro custodiado por el dragón Smaug.', 9788445071404, 38, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (123, 'El código Da Vinci', 'El código Da Vinci es una novela del escritor estadounidense Dan Brown que sigue al profesor de simbología Robert Langdon en su investigación del asesinato de un curador del Louvre y el descubrimiento de una conspiración.', 9788408091415, 39, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (130, 'El nombre de la rosa', 'El nombre de la rosa es una novela del escritor italiano Umberto Eco que sigue al monje franciscano Guillermo de Baskerville en su investigación de una serie de asesinatos en una abadía en el siglo XIV.', 9788420471818, 40, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (131, 'Cien años de soledad', 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez que sigue a la familia Buendía en el pueblo ficticio de Macondo.', 9788437604947, 28, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (132, 'El perfume', 'El perfume es una novela del escritor alemán Patrick Süskind que sigue la historia de un asesino en serie obsesionado con el olor perfecto.', 9788432226825, 41, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (133, 'La casa de Bernarda Alba', 'La casa de Bernarda Alba es una obra de teatro del escritor español Federico García Lorca que sigue a la familia de Bernarda Alba después de la muerte de su segundo esposo.', 9788437604695, 42, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (134, 'El extranjero', 'El extranjero es una novela del escritor francés Albert Camus que sigue la historia de Meursault, un francés residente en Argelia, después de cometer un asesinato.', 9788437613505, 43, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (135, 'El coronel no tiene quien le escriba', 'El coronel no tiene quien le escriba es una novela del escritor colombiano Gabriel García Márquez que sigue a un coronel retirado que espera una pensión del gobierno.', 9788497592435, 28, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (136, 'El gran Gatsby', 'El gran Gatsby es una novela del escritor estadounidense F. Scott Fitzgerald que sigue la historia del millonario Jay Gatsby y su obsesión por su antiguo amor, Daisy Buchanan.', 9788499897746, 44, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (137, 'El retrato de Dorian Gray', 'El retrato de Dorian Gray es una novela del escritor irlandés Oscar Wilde que sigue la vida de Dorian Gray, un joven obsesionado con su propia belleza y juventud eterna.', 9788497940932, 45, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (138, 'El hombre invisible', 'El hombre invisible es una novela del escritor británico H.G. Wells que sigue la historia de un científico que se vuelve invisible y su lucha por mantener su cordura.', 9788420673271, 46, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (139, 'La insoportable levedad del ser', 'La insoportable levedad del ser es una novela del escritor checo Milan Kundera que sigue a dos parejas durante la Primavera de Praga en 1968.', 9788490628790, 47, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (146, 'El guardián entre el centeno', 'El guardián entre el centeno es una novela del escritor estadounidense J.D. Salinger que sigue a Holden Caulfield, un adolescente que se encuentra en un estado de alienación y desesperación.', 9788497593615, 48, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (147, 'Los miserables', 'Los miserables es una novela del escritor francés Victor Hugo que sigue la vida de Jean Valjean, un ex-convicto que intenta redimirse después de ser liberado de prisión.', 9788491052329, 49, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (148, 'Matar a un ruiseñor', 'Matar a un ruiseñor es una novela del escritor estadounidense Harper Lee que sigue a Scout Finch, una niña que aprende sobre el racismo y la injusticia en el sur de Estados Unidos durante los años 30.', 9788491050516, 50, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (149, '1984', '1984 es una novela del escritor británico George Orwell que presenta una visión distópica de un futuro en el que el gobierno controla todos los aspectos de la vida de las personas.', 9788499890945, 51, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (150, 'Rayuela', 'Rayuela es una novela del escritor argentino Julio Cortázar que presenta una estructura no lineal y sigue la historia del personaje principal, Horacio Oliveira, a través de sus experiencias en París y Buenos Aires.', 9788437603193, 52, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (151, 'La naranja mecánica', 'La naranja mecánica es una novela del escritor británico Anthony Burgess que sigue la historia de Alex, un joven delincuente que es sometido a un programa de reforma psicológica.', 9788499890946, 53, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (152, 'La tregua', 'La tregua es una novela del escritor uruguayo Mario Benedetti que sigue la historia de Martín Santomé, un viudo de 49 años que se enamora de su joven secretaria.', 9788483833856, 54, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (153, 'El jardín de los cerezos', 'El jardín de los cerezos es una obra de teatro del escritor ruso Anton Chejov que presenta un retrato de la decadencia de la aristocracia rusa a finales del siglo XIX.', 9788420655284, 55, 1, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (154, 'Crónica de una muerte anunciada', 'Crónica de una muerte anunciada es una novela del escritor colombiano Gabriel García Márquez que sigue la investigación de un asesinato en un pequeño pueblo latinoamericano.', 9788420471832, 28, 0, NULL);
INSERT INTO "BookAffinity".book (id_book, name, summary, isbn, id_author, language, status) OVERRIDING SYSTEM VALUE VALUES (155, 'El amante', 'El amante es una novela de la escritora francesa Marguerite Duras que sigue la historia de una joven francesa que tiene una aventura con un hombre chino más viejo.', 9788490327234, 56, 1, NULL);


--
-- TOC entry 3446 (class 0 OID 16791)
-- Dependencies: 218
-- Data for Name: book_categories; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (1, 45, 5);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (2, 49, 8);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (3, 15, 8);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (4, 17, 8);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (5, 9, 1);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (6, 17, 6);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (7, 47, 10);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (8, 40, 5);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (9, 1, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (10, 13, 7);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (11, 13, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (12, 18, 9);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (13, 17, 9);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (14, 4, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (15, 40, 1);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (16, 31, 10);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (17, 26, 5);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (18, 12, 1);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (19, 15, 2);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (20, 33, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (21, 36, 8);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (22, 23, 0);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (23, 36, 2);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (24, 35, 6);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (25, 45, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (26, 47, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (27, 12, 6);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (28, 27, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (29, 42, 7);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (30, 2, 1);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (31, 43, 1);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (32, 30, 3);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (33, 43, 9);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (34, 25, 3);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (35, 2, 6);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (36, 42, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (37, 20, 10);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (38, 29, 9);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (39, 37, 8);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (40, 39, 3);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (41, 10, 10);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (42, 1, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (43, 16, 3);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (44, 4, 8);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (45, 7, 5);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (46, 14, 9);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (47, 50, 4);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (48, 40, 2);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (49, 34, 0);
INSERT INTO "BookAffinity".book_categories (id_book_categories, id_category, id_book) OVERRIDING SYSTEM VALUE VALUES (50, 34, 0);


--
-- TOC entry 3444 (class 0 OID 16784)
-- Dependencies: 216
-- Data for Name: category; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (2, 'Autobiográficos');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (3, 'Científicos');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (4, 'Autoayuda');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (5, 'Aventuras');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (6, 'Ciencia ficción');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (7, 'Cuentos');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (8, 'Deporte');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (9, 'Humor');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (10, 'Segunda Guerra Mundial');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (11, 'Marketing');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (12, 'salud');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (13, 'suspense');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (14, 'videojuegos');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (15, 'Sociedad');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (16, 'Microrrelatos');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (17, 'Novela de culto');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (18, 'Novela de no ficción');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (19, 'Novela Histórica');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (20, 'Novela negra');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (21, 'Novelas Románticas');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (22, 'Clásicos ');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (23, 'Detective y misterio');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (24, 'Fantasía');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (25, 'Horror');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (26, 'Romance ');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (27, 'Suspenso y Thriller');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (28, 'Libros de consultas ');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (29, 'Historia ');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (30, 'Poesía');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (31, 'Cocina');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (32, 'Ensayo');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (33, 'Ilustrado');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (34, 'infantil');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (35, 'Música');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (36, 'Periodismo');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (37, 'Diseño');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (38, 'Física');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (39, 'Idiomas');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (40, 'Geografía');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (41, 'Economía');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (42, 'Cine');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (43, 'Fotografía');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (44, 'Mitología');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (45, 'Atrología');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (46, 'Turismo');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (47, 'Fantasía');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (48, 'Cultura ');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (49, 'Manuales');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (50, 'Arte');
INSERT INTO "BookAffinity".category (id_category, name_category) OVERRIDING SYSTEM VALUE VALUES (1, 'Cómics');


--
-- TOC entry 3454 (class 0 OID 16874)
-- Dependencies: 226
-- Data for Name: chat; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (1, 13, 34);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (2, 33, 40);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (3, 35, 16);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (4, 18, 13);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (5, 19, 44);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (6, 17, 28);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (7, 22, 36);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (8, 9, 39);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (9, 36, 12);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (10, 31, 23);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (11, 21, 12);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (12, 41, 18);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (13, 11, 8);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (14, 33, 28);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (15, 1, 48);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (16, 14, 21);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (17, 19, 7);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (18, 15, 3);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (19, 35, 49);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (20, 37, 17);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (21, 9, 32);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (22, 37, 46);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (23, 20, 18);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (24, 33, 38);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (25, 30, 33);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (26, 35, 34);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (27, 15, 32);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (28, 23, 19);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (29, 38, 11);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (30, 44, 30);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (31, 44, 9);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (32, 28, 39);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (33, 7, 3);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (34, 11, 15);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (35, 16, 6);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (36, 9, 45);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (37, 14, 24);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (38, 8, 29);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (39, 37, 39);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (40, 39, 27);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (41, 25, 38);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (42, 29, 4);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (43, 42, 29);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (44, 21, 1);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (45, 41, 35);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (46, 16, 22);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (47, 33, 12);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (48, 39, 16);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (49, 48, 26);
INSERT INTO "BookAffinity".chat (id_chat, id_user1, id_user2) OVERRIDING SYSTEM VALUE VALUES (50, 30, 8);


--
-- TOC entry 3458 (class 0 OID 16908)
-- Dependencies: 230
-- Data for Name: comment; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (1, 2, 'Este libro es un clásico de la literatura y es imprescindible para cualquier persona interesada en el género.', 33, 8);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (2, 2, 'La trama de este libro es emocionante y me mantuvo enganchado desde el principio hasta el final.', 20, 12);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (3, 5, 'El estilo de escritura del autor es poético y evocador, y me transportó a otro mundo.', 9, 33);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (4, 5, 'No me gustó mucho este libro, ya que la trama era predecible y los personajes no eran interesantes.', 13, 5);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (5, 3, 'Este libro ofrece una perspectiva única sobre un tema importante y me dejó reflexionando durante días.', 19, 50);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (6, 1, 'Este libro me hizo reír y llorar, y me conecté emocionalmente con los personajes. ¡Fue una experiencia increíble!', 27, 44);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (7, 5, 'La prosa del autor es complicada y difícil de seguir, lo que dificultó mi comprensión del libro.', 7, 17);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (8, 3, 'Este libro es una obra maestra de la ficción, con una trama intrigante, personajes bien desarrollados y un final satisfactorio.', 1, 12);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (9, 1, 'Aunque la historia era interesante, encontré algunos errores de edición y gramática que distraían de la lectura.', 30, 42);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (10, 2, 'Este libro fue una decepción, ya que las promesas en la sinopsis no se cumplieron y la historia fue aburrida.', 31, 25);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (11, 3, 'Este libro es una obra maestra de la literatura contemporánea.', 12, 21);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (12, 1, 'Me encantó la forma en que el autor desarrolló los personajes en esta novela.', 38, 22);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (13, 3, 'No puedo dejar de pensar en las ideas y temas que se presentan en este libro.', 31, 43);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (14, 5, 'Aunque el final me dejó un poco decepcionado, la trama en general fue intrigante.', 42, 18);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (15, 3, 'La prosa de este autor es simplemente impresionante, me dejó sin palabras.', 22, 9);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (16, 2, 'Este libro me llevó a un mundo completamente nuevo y fascinante.', 10, 14);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (17, 1, 'La trama es emocionante y llena de giros inesperados que me mantuvieron enganchado hasta el final.', 6, 21);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (18, 3, 'Los personajes estaban bien desarrollados y creíbles, lo que hizo que me preocupara por su destino.', 42, 21);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (19, 3, 'La prosa del autor es hermosa y poética, lo que me hizo detenerme varias veces para reflexionar sobre sus palabras.', 22, 16);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (20, 4, 'Aunque hubo algunos momentos lentos, en general, el libro fue una experiencia increíble que no olvidaré pronto.', 45, 42);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (21, 3, 'No pude conectarme con los personajes, la trama me pareció confusa y el final decepcionante.', 35, 18);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (22, 0, 'El autor tiene una prosa hermosa y una habilidad única para crear escenas vívidas.', 47, 42);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (23, 5, 'Este libro es una obra maestra, una de las mejores que he leído en mucho tiempo.', 17, 24);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (24, 5, 'A pesar de haber sido recomendado por muchos, no pude superar el aburrimiento y abandoné la lectura a la mitad.', 35, 43);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (25, 3, 'Este libro me pareció muy entretenido y adictivo, no podía dejar de leerlo hasta terminarlo.', 19, 17);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (26, 3, 'La trama era interesante, pero la escritura y los diálogos eran un poco flojos en mi opinión.', 49, 9);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (27, 1, 'En general, disfruté mucho leyendo este libro, pero sentí que el final fue un poco apresurado y decepcionante.', 17, 44);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (28, 3, 'Me encantó este libro, fue una gran aventura y no podía dejar de leer.', 7, 19);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (29, 4, 'La prosa de este autor es increíble. Cada frase está bien construida y el lenguaje es hermoso.', 42, 49);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (30, 5, 'Sin duda, este libro es una obra maestra. Los personajes son profundos y la trama es cautivadora.', 48, 3);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (31, 2, 'Este libro tiene un mensaje poderoso que me hizo reflexionar sobre mi propia vida y las decisiones que he tomado.', 36, 25);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (32, 5, 'No me gustó este libro en absoluto. La trama fue predecible y los personajes eran planos.', 37, 47);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (33, 3, 'No entiendo por qué este libro recibió tantas críticas positivas. Me pareció aburrido y difícil de seguir.', 36, 39);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (34, 5, 'Me decepcionó este libro. La trama comenzó bien, pero el final fue una decepción total.', 38, 38);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (35, 4, 'En mi opinión, este libro no vale la pena leer. Los personajes eran superficiales y la trama era demasiado simplista.', 38, 28);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (36, 2, 'La escritura de este libro me pareció mediocre. No hay nada especial en el lenguaje o en la forma en que se desarrolla la trama.', 6, 33);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (37, 1, 'No puedo recomendar este libro. Me pareció ofensivo y sin sentido.', 6, 42);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (38, 4, 'Qué desperdicio de tiempo, dinero y energía leer este libro tan aburrido.', 11, 16);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (39, 4, 'No puedo creer que alguien pueda disfrutar leyendo algo tan mediocre y carente de originalidad.', 46, 31);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (40, 3, 'Una historia predecible y llena de clichés, no recomendaría este libro a nadie.', 42, 28);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (41, 3, 'No me gustó para nada la manera en que se desarrolló la historia, todo fue muy forzado y poco creíble.', 21, 14);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (42, 5, 'No entiendo cómo este libro ha recibido tantas críticas positivas, para mí fue una total pérdida de tiempo.', 17, 5);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (43, 1, 'Este libro es una completa pérdida de tiempo y dinero. No entiendo cómo alguien podría disfrutarlo', 50, 44);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (44, 0, 'No puedo creer que haya gastado mi tiempo leyendo este libro. Es aburrido, predecible y totalmente sin sentido', 37, 16);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (45, 2, 'La trama es incoherente y los personajes son planos y poco interesantes. Me arrepiento de haber comprado este libro', 41, 37);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (46, 1, 'Nunca he leído algo tan mal escrito en mi vida. Es una tortura intentar seguir la historia', 6, 12);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (47, 1, 'No puedo creer que alguien haya publicado este libro. Es un insulto para la inteligencia de los lectores.', 24, 17);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (48, 4, 'Cada página que leía me enfurecía aún más. ¿Cómo es posible que alguien haya escrito algo tan malo?', 13, 1);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (49, 3, 'Después de leer este libro, no puedo evitar sentirme enojado por haber perdido mi tiempo en algo tan aburrido y mal escrito.', 37, 8);
INSERT INTO "BookAffinity".comment OVERRIDING SYSTEM VALUE VALUES (50, 1, 'Si pudiera, le pediría al autor que me devolviera las horas que perdí leyendo este libro. Me dejó molesto y decepcionado.', 33, 27);


--
-- TOC entry 3452 (class 0 OID 16856)
-- Dependencies: 224
-- Data for Name: copy; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (655, 1, 1, 'Como nuevo', 35, 32);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (609, 0, 2, 'Nuevo', 22, 46);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (294, 0, 3, 'Muy bueno', 10, 37);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (470, 0, 4, 'Aceptable', 21, 22);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (198, 0, 5, 'Muy usado', 2, 10);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (373, 1, 6, 'Con marcas de lectura', 45, 43);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (576, 1, 7, 'Con subrayados y anotaciones', 32, 39);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (494, 1, 8, 'Sin sobrecubierta', 22, 16);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (977, 1, 9, 'Edición firmada', 43, 16);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (489, 0, 10, 'Muy usado', 20, 43);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (902, 0, 11, 'Con subrayados y anotaciones', 26, 48);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (834, 1, 12, 'Edición de tapa dura sin ilustraciones', 50, 11);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (114, 1, 13, 'Edición de tapa dura sin ilustraciones', 44, 2);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (49, 1, 14, 'Edición de tapa dura sin ilustraciones', 25, 39);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (391, 0, 15, 'Muy bueno', 13, 26);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (924, 0, 16, 'Muy bueno', 38, 35);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (603, 1, 17, 'Muy bueno', 28, 37);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (654, 1, 18, 'Muy bueno', 26, 46);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (598, 0, 19, 'Como nuevo', 5, 2);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (876, 1, 20, 'Como nuevo', 28, 11);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (148, 0, 21, 'Como nuevo', 5, 14);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (320, 1, 22, 'Como nuevo', 4, 14);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (159, 0, 23, 'Aceptable', 30, 31);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (715, 0, 24, 'Aceptable', 8, 42);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (853, 0, 25, 'Aceptable', 19, 36);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (410, 0, 26, 'Aceptable', 35, 6);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (186, 1, 27, 'Con marcas de lectura', 21, 20);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (526, 1, 28, 'Con marcas de lectura', 14, 49);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (487, 1, 29, 'Con marcas de lectura', 4, 13);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (977, 1, 30, 'Con marcas de lectura', 26, 19);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (635, 0, 31, 'Con marcas de lectura', 38, 13);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (117, 1, 32, 'Con marcas de lectura', 37, 1);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (750, 0, 33, 'Edición firmada', 14, 13);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (346, 1, 34, 'Edición firmada', 32, 4);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (784, 0, 35, 'Edición firmada', 34, 21);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (709, 1, 36, 'Nuevo', 32, 34);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (908, 0, 37, 'Nuevo', 37, 38);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (143, 1, 38, 'Nuevo', 5, 31);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (999, 0, 39, 'Nuevo', 24, 17);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (756, 0, 40, 'Nuevo', 20, 41);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (467, 1, 41, 'Con subrayados y anotaciones', 41, 47);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (347, 1, 42, 'Con subrayados y anotaciones', 45, 20);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (755, 0, 43, 'Con subrayados y anotaciones', 10, 22);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (368, 1, 44, 'Con subrayados y anotaciones', 12, 10);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (648, 1, 45, 'Con subrayados y anotaciones', 30, 35);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (739, 0, 46, 'Edición de tapa dura sin ilustraciones', 39, 35);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (377, 1, 47, 'Edición de tapa dura sin ilustraciones', 25, 24);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (865, 0, 48, 'Edición de tapa dura sin ilustraciones', 45, 37);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (16, 0, 49, 'Edición de tapa dura sin ilustraciones', 18, 18);
INSERT INTO "BookAffinity".copy (price, visible, id_copy, status, id_user, id_book) OVERRIDING SYSTEM VALUE VALUES (783, 1, 50, 'Como nuevo', 18, 47);


--
-- TOC entry 3468 (class 0 OID 17010)
-- Dependencies: 240
-- Data for Name: img_book; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (2, 'https://picsum.photos/400/600', 2);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (3, 'https://picsum.photos/400/600', 3);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (1, 'https://picsum.photos/400/600', 1);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (4, 'https://picsum.photos/400/600', 4);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (5, 'https://picsum.photos/400/600', 5);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (7, 'https://picsum.photos/400/600', 6);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (8, 'https://picsum.photos/400/600', 7);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (9, 'https://picsum.photos/400/600', 8);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (12, 'https://picsum.photos/400/600', 10);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (11, 'https://picsum.photos/400/600', 9);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (14, 'https://picsum.photos/400/600', 11);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (16, 'https://picsum.photos/400/600', 12);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (19, 'https://picsum.photos/400/600', 13);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (20, 'https://picsum.photos/400/600', 14);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (21, 'https://picsum.photos/400/600', 15);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (22, 'https://picsum.photos/400/600', 16);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (24, 'https://picsum.photos/400/600', 17);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (26, 'https://picsum.photos/400/600', 18);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (27, 'https://picsum.photos/400/600', 19);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (28, 'https://picsum.photos/400/600', 20);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (29, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (30, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (31, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (32, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (33, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (34, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (35, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (36, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (37, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (38, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (40, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (42, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (43, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (44, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (49, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (6, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (10, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (13, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (15, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (17, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (18, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (23, 'https://picsum.photos/400/600', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (25, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (39, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (41, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (45, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (46, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (47, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (48, 'https://imgur.com/BkqNIm4', NULL);
INSERT INTO "BookAffinity".img_book (id_img_book, rute, id_book) OVERRIDING SYSTEM VALUE VALUES (50, 'https://imgur.com/BkqNIm4', NULL);


--
-- TOC entry 3460 (class 0 OID 16949)
-- Dependencies: 232
-- Data for Name: img_comment; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (1, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (2, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (3, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (4, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (5, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (6, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (7, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (8, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (9, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (10, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (11, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (12, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (13, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (14, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (15, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (16, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (17, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (18, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (19, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (20, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (21, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (22, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (23, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (24, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (25, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (26, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (27, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (28, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (29, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (30, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (31, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (32, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (33, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (34, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (35, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (36, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (37, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (38, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (39, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (40, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (41, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (42, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (43, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (44, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (45, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (46, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (47, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (48, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (49, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_comment (id_img_comment, rute, id_comment) OVERRIDING SYSTEM VALUE VALUES (50, 'https://picsum.photos/350/350', NULL);


--
-- TOC entry 3464 (class 0 OID 16975)
-- Dependencies: 236
-- Data for Name: img_copy; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (1, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (2, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (3, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (4, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (5, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (6, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (7, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (8, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (9, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (10, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (11, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (12, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (13, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (14, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (15, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (16, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (17, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (18, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (19, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (20, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (21, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (22, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (23, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (24, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (25, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (26, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (27, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (28, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (29, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (30, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (31, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (32, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (33, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (34, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (35, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (36, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (37, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (38, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (39, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (40, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (41, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (42, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (43, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (44, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (45, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (46, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (47, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (48, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (49, 'https://picsum.photos/350/350', NULL);
INSERT INTO "BookAffinity".img_copy (id_img_copy, rute, id_copy) OVERRIDING SYSTEM VALUE VALUES (50, 'https://picsum.photos/350/350', NULL);


--
-- TOC entry 3456 (class 0 OID 16891)
-- Dependencies: 228
-- Data for Name: invoice; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (1, 39, 28);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (2, 12, 40);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (3, 29, 42);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (4, 34, 18);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (5, 40, 20);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (6, 29, 15);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (7, 42, 28);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (8, 7, 1);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (9, 29, 2);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (10, 23, 44);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (11, 8, 25);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (12, 19, 47);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (13, 46, 7);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (14, 27, 8);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (15, 31, 25);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (16, 45, 35);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (17, 32, 2);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (18, 5, 16);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (19, 32, 4);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (20, 21, 32);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (21, 26, 40);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (22, 32, 6);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (23, 6, 26);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (24, 29, 30);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (25, 11, 41);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (26, 33, 23);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (27, 27, 8);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (28, 20, 37);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (29, 28, 38);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (30, 28, 8);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (31, 25, 12);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (32, 25, 42);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (33, 24, 17);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (34, 39, 40);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (35, 4, 11);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (36, 42, 19);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (37, 28, 19);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (38, 47, 6);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (39, 45, 35);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (40, 2, 29);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (41, 48, 5);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (42, 27, 36);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (43, 40, 14);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (44, 33, 21);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (45, 3, 12);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (46, 33, 6);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (47, 36, 8);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (48, 28, 19);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (49, 28, 2);
INSERT INTO "BookAffinity".invoice (id_invoice, id_copy, id_user) OVERRIDING SYSTEM VALUE VALUES (50, 16, 13);


--
-- TOC entry 3462 (class 0 OID 16963)
-- Dependencies: 234
-- Data for Name: message; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (1, 'Hola, ¿cómo estás?', '2022-07-08 09:01:40', 31);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (2, '¿Leíste el último libro?', '2023-03-12 00:00:00', 24);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (3, '¡Mañana nos vemos!', '2022-03-05 00:00:00', 36);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (4, 'Felices fiestas a todos', '2022-12-22 00:00:00', 34);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (5, 'Necesito recomendaciones', '2022-05-06 00:00:00', 44);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (6, 'Terminé el libro, genial', '2022-10-30 00:00:00', 24);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (7, '¿Alguien tiene el PDF?', '2023-09-03 00:00:00', 18);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (8, 'Me encanta este grupo', '2023-01-27 00:00:00', 13);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (9, 'No entiendo este capítulo', '2022-05-29 00:00:00', 43);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (10, '¿Alguien quiere intercambiar?', '2022-05-25 00:00:00', 15);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (11, 'Hola, ¿cómo estás?', '2023-08-15 15:30:00', 39);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (12, '¿Qué planes tienes hoy?', '2022-11-01 18:45:00', 14);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (13, 'No puedo creer lo que acabo de ver', '2023-04-12 09:20:00', 43);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (14, '¿Ya viste la película de terror que te recomendé?', '2022-05-30 22:10:00', 4);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (15, 'Te extraño mucho, espero verte pronto', '2023-02-20 16:15:00', 50);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (16, '¡Qué divertida estuvo la fiesta de anoche!', '2023-09-08 03:40:00', 18);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (17, 'Me encanta esta canción, ¿tú la conocías?', '2022-06-17 12:00:00', 3);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (18, '¿Qué opinas de la nueva serie de televisión?', '2022-12-09 20:25:00', 26);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (19, '¿Quieres que te cuente un chiste?', '2022-02-16 07:50:00', 23);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (20, '¿Cómo te fue en tu examen?', '2023-05-11 14:30:00', 45);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (21, '¿Qué planes tienes para este fin de semana?', '2022-07-23 09:15:00', 30);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (22, 'Creo que me he enamorado', '2022-09-05 22:20:00', 13);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (23, 'Ya tengo el regalo para tu cumpleaños', '2023-11-29 17:00:00', 24);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (24, 'Hola, ¿cómo estás?', '2022-11-15 14:30:00', 9);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (25, '¡Qué locura!', '2022-02-27 18:45:00', 10);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (26, 'Vale, nos vemos allí', '2023-03-12 10:15:00', 20);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (27, 'Buenos días, ¿qué planes tienes hoy?', '2022-03-31 09:00:00', 4);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (28, '¿Qué libro me recomiendas?', '2022-02-28 21:00:00', 44);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (29, 'Me encantó ese libro, ¡gracias por la recomendación!', '2022-09-08 16:20:00', 30);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (30, 'No estoy seguro, ¿tú qué opinas?', '2022-10-06 12:00:00', 28);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (31, 'Estoy leyendo ese libro ahora mismo', '2023-12-18 20:30:00', 36);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (32, 'No puedo creer que el libro terminó así', '2023-08-12 17:45:00', 23);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (33, 'Ese libro fue una pérdida de tiempo', '2022-10-25 11:10:00', 28);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (34, '¿Has leído ese libro? Estoy pensando en comprarlo', '2022-03-19 14:50:00', 23);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (35, 'Me quedé hasta tarde anoche leyendo ese libro', '2024-01-07 01:30:00', 28);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (36, 'Hola, ¿cómo estás?', '2023-07-02 09:37:15', 46);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (37, 'Me gustó mucho ese libro', '2023-01-24 18:56:02', 33);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (38, '¿Qué libro me recomiendas?', '2023-10-06 13:22:47', 35);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (39, 'No puedo creer que haya pasado eso', '2023-04-29 07:11:30', 26);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (40, 'Acabo de terminar ese libro y es increíble', '2022-06-17 21:34:52', 2);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (41, '¿Cuándo podemos hablar del libro?', '2023-02-01 15:19:03', 44);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (42, 'No sé si me gusta ese personaje', '2022-08-09 11:27:14', 1);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (43, 'Este libro me hizo llorar', '2023-11-19 08:05:56', 8);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (44, 'Creo que deberías leer este libro', '2023-03-04 17:42:36', 14);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (45, '¿Qué opinas de ese personaje?', '2022-12-30 14:16:19', 14);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (46, 'No puedo creer que se haya acabado', '2023-08-23 19:48:10', 12);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (47, 'Ese final fue inesperado', '2023-05-10 10:57:44', 13);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (48, 'Creo que ese personaje es un poco aburrido', '2023-02-18 16:29:51', 13);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (49, 'Hola, ¿Qué tal estás?', '2022-12-25 09:30:00', 44);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (50, '¿Quieres quedar para ir al cine?', '2023-06-10 18:45:00', 35);
INSERT INTO "BookAffinity".message (id_message, text, date, id_chat) OVERRIDING SYSTEM VALUE VALUES (52, '¡Qué bien que me hayas llamado!', '2022-09-14 20:15:00', 1);


--
-- TOC entry 3448 (class 0 OID 16808)
-- Dependencies: 220
-- Data for Name: rol; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity".rol (id_rol, name) OVERRIDING SYSTEM VALUE VALUES (0, 'admin');
INSERT INTO "BookAffinity".rol (id_rol, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Usuario');


--
-- TOC entry 3450 (class 0 OID 16843)
-- Dependencies: 222
-- Data for Name: user; Type: TABLE DATA; Schema: BookAffinity; Owner: admin
--

INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (1, 'Emerson Serrano', 'XMO98WVV9KH', '/Profile/1.jpg', 'malesuada@yahoo.ca', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (2, 'Shay T. Peña', 'QXS40RIY5QY', '/Profile/2.jpg', 'dignissim.tempor.arcu@aol.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (3, 'Courtney H. Pardo', 'YMM54KRZ6ZM', '/Profile/3.jpg', 'eleifend.nec@protonmail.edu', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (4, 'Ivana Saez', 'CBW42DVK8EI', '/Profile/4.jpg', 'nulla.integer@icloud.com', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (5, 'Kennedy Flores', 'YOJ56UPU4MS', '/Profile/5.jpg', 'ornare.libero@yahoo.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (6, 'Lacey Vidal', 'ALV94IRP7EZ', '/Profile/6.jpg', 'eget.metus@google.ca', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (7, 'Justin U. Arias', 'BHF92BZK5CX', '/Profile/7.jpg', 'in.dolor.fusce@aol.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (8, 'Mira N. Leon', 'KGY74UCB9XT', '/Profile/8.jpg', 'at@google.edu', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (9, 'Tamekah E. Gimenez', 'UXD75PBI6EJ', '/Profile/9.jpg', 'integer.aliquam@aol.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (10, 'Drew K. Castro', 'XKC07ZML3QU', '/Profile/10.jpg', 'pellentesque.eget@hotmail.edu', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (11, 'September K. Ramos', 'QZP62LXE4SL', '/Profile/11.jpg', 'curabitur@aol.net', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (12, 'Zeus W. Andres', 'NXU86XAR7SO', '/Profile/12.jpg', 'augue.ac.ipsum@icloud.ca', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (13, 'Risa Esteban', 'SIJ49UXU8BN', '/Profile/13.jpg', 'dui.nec@hotmail.net', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (14, 'Price X. Pardo', 'NCT87MUD0WV', '/Profile/14.jpg', 'a@icloud.org', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (15, 'Idona S. Aguilar', 'RST29EZC8WO', '/Profile/15.jpg', 'tempus.eu@outlook.edu', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (16, 'Aidan U. Moya', 'QML84KDP0MG', '/Profile/16.jpg', 'magna.et@aol.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (17, 'Ori J. Moreno', 'UTH44QMR8GO', '/Profile/33.jpg', 'nunc.sed.pede@yahoo.com', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (18, 'Cynthia Herrero', 'UKB11DUS6FI', '/Profile/47.jpg', 'luctus.aliquet@icloud.net', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (19, 'Zoe G. Marin', 'ZIO84YZO7CL', '/Profile/48.jpg', 'ut.pharetra@outlook.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (20, 'Scarlett N. Marti', 'YCP96OMR3KE', '/Profile/1.jpg', 'sapien@google.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (21, 'Kiona Jimenez', 'FML18TGP1BL', '/Profile/2.jpg', 'et.euismod.et@yahoo.ca', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (22, 'Remedios Alvarez', 'IGY46GCP5OR', '/Profile/3.jpg', 'est.mauris@protonmail.net', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (23, 'Laith Fuentes', 'NMD87JER0FT', '/Profile/4.jpg', 'dictum@icloud.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (24, 'Brielle L. Duran', 'FPB99NNH5DQ', '/Profile/5.jpg', 'nulla.aliquet@protonmail.edu', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (25, 'Gary Fernandez', 'DCF52TUN4PC', '/Profile/6.jpg', 'augue.eu@yahoo.com', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (26, 'Colin Moreno', 'KEL35GWL8HF', '/Profile/7.jpg', 'libero.dui@protonmail.edu', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (27, 'Velma Pascual', 'NAN38JTL1QF', '/Profile/8.jpg', 'lectus.justo@outlook.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (28, 'Nero Cruz', 'CFK38GPT5EO', '/Profile/9.jpg', 'arcu.iaculis@icloud.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (29, 'Colton Gomez', 'LGB57GRP3RG', '/Profile/10.jpg', 'lorem.ipsum@yahoo.ca', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (30, 'Cameron L. Serrano', 'ESB72HJD5OE', '/Profile/11.jpg', 'nunc@google.net', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (31, 'Basil Moreno', 'DKW58KVB1VY', '/Profile/12.jpg', 'imperdiet.ullamcorper@protonmail.org', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (32, 'Solomon Z. Castro', 'TWR21DHK1IB', '/Profile/13.jpg', 'sapien.aenean@yahoo.org', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (33, 'Kenneth M. Marquez', 'LJY52HLT0PT', '/Profile/14.jpg', 'magna.praesent@hotmail.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (34, 'Kai S. Soto', 'HRI80VGS3KL', '/Profile/15.jpg', 'aliquam@hotmail.net', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (35, 'Alika Nuﾑez', 'IQS86IQK1MJ', '/Profile/16.jpg', 'eu.odio@hotmail.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (36, 'Molly Pastor', 'TNW18SHY7SY', '/Profile/33.jpg', 'sed.auctor@aol.org', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (37, 'Hannah Ferrer', 'WXT58NMK2RG', '/Profile/47.jpg', 'tempor@aol.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (38, 'Brady Perez', 'FUH17TPM1DP', '/Profile/48.jpg', 'est.ac@yahoo.ca', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (39, 'Damon Bravo', 'LCD70RQV5DX', '/Profile/1.jpg', 'fringilla.donec@protonmail.net', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (40, 'Erich V. Gallego', 'IOL15DWO6HE', '/Profile/2.jpg', 'sollicitudin@google.ca', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (41, 'Claudia Vidal', 'HGO81XNH2OG', '/Profile/3.jpg', 'parturient.montes@google.couk', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (42, 'Laith F. Castro', 'XKC88VWT7LE', '/Profile/4.jpg', 'lacus@google.org', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (43, 'Orson Torres', 'CWD43CJB8UN', '/Profile/5.jpg', 'feugiat.lorem@hotmail.couk', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (44, 'Graiden Santos', 'RVE38PFJ5JH', '/Profile/6.jpg', 'eu.tempor@google.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (45, 'Jane Marquez', 'BVG20BDE7KV', '/Profile/7.jpg', 'egestas.duis@google.com', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (46, 'Garrett Ibañez', 'JRP33TGU5DF', '/Profile/8.jpg', 'risus@icloud.org', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (47, 'Kaseem Alonso', 'GPJ94HFT7SZ', '/Profile/9.jpg', 'massa@aol.org', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (48, 'Dylan Hernandez', 'LHG27JKE3TC', '/Profile/10.jpg', 'nec.ante.blandit@icloud.net', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (49, 'Megan I. Cruz', 'XDY96MKP6ZK', '/Profile/11.jpg', 'mattis.cras.eget@icloud.edu', 0, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (50, 'Dacey T. ﾑez', 'MMH36JWN1EX', '/Profile/12.jpg', 'varius.et@protonmail.couk', 1, 1, NULL, NULL);
INSERT INTO "BookAffinity"."user" (id_user, name, pass, picture, email, status, id_rol, "createdAt", "updatedAt") OVERRIDING SYSTEM VALUE VALUES (51, 'Juanpe', 'Admin1234', '/Profile/13.jpg', 'juanpemt@gmail.com', 1, 0, NULL, NULL);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 256
-- Name: autor_id_autor_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".autor_id_autor_seq', 52, true);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 215
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".categoria_id_categoria_seq', 1, false);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 253
-- Name: categoria_id_categoria_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".categoria_id_categoria_seq1', 51, false);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 229
-- Name: comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".comentario_id_comentario_seq', 1, false);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 252
-- Name: comentario_id_comentario_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".comentario_id_comentario_seq1', 51, false);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 251
-- Name: conversacion_id_conversacion_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".conversacion_id_conversacion_seq', 51, false);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 225
-- Name: conversacion_idconversacion_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".conversacion_idconversacion_seq', 1, false);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 223
-- Name: ejemplar_id_ejemplar_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".ejemplar_id_ejemplar_seq', 1, false);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 250
-- Name: ejemplar_id_ejemplar_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".ejemplar_id_ejemplar_seq1', 51, false);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 227
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".factura_id_factura_seq', 1, false);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 249
-- Name: factura_id_factura_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".factura_id_factura_seq1', 51, false);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 231
-- Name: img_comentario_id_img_comentario_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".img_comentario_id_img_comentario_seq', 1, false);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 248
-- Name: img_comentario_id_img_comentario_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".img_comentario_id_img_comentario_seq1', 51, false);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 235
-- Name: img_ejemplar_id_img_ejemplar_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".img_ejemplar_id_img_ejemplar_seq', 1, false);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 247
-- Name: img_ejemplar_id_img_ejemplar_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".img_ejemplar_id_img_ejemplar_seq1', 51, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 239
-- Name: img_libro_id_img_libro_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".img_libro_id_img_libro_seq', 1, false);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 246
-- Name: img_libro_id_img_libro_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".img_libro_id_img_libro_seq1', 51, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 237
-- Name: libro_id_libro_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".libro_id_libro_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 245
-- Name: libro_id_libro_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".libro_id_libro_seq1', 155, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 233
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".mensaje_id_mensaje_seq', 1, false);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 244
-- Name: mensaje_id_mensaje_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".mensaje_id_mensaje_seq1', 52, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 219
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".rol_id_rol_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 243
-- Name: rol_id_rol_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".rol_id_rol_seq1', 3, false);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: tiene_id_tiene_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".tiene_id_tiene_seq', 1, false);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 242
-- Name: tiene_id_tiene_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".tiene_id_tiene_seq1', 51, false);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 221
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".usuario_id_usuario_seq', 5, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 241
-- Name: usuario_id_usuario_seq1; Type: SEQUENCE SET; Schema: BookAffinity; Owner: admin
--

SELECT pg_catalog.setval('"BookAffinity".usuario_id_usuario_seq1', 52, false);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 255
-- Name: categoria_id_autor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_autor_seq', 1, false);


--
-- TOC entry 3284 (class 2606 OID 17113)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id_author);


--
-- TOC entry 3256 (class 2606 OID 16789)
-- Name: category categoria_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".category
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_category);


--
-- TOC entry 3270 (class 2606 OID 16913)
-- Name: comment comentario_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".comment
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_comment);


--
-- TOC entry 3266 (class 2606 OID 16879)
-- Name: chat conversacion_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".chat
    ADD CONSTRAINT conversacion_pkey PRIMARY KEY (id_chat);


--
-- TOC entry 3264 (class 2606 OID 16862)
-- Name: copy ejemplar_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".copy
    ADD CONSTRAINT ejemplar_pkey PRIMARY KEY (id_copy);


--
-- TOC entry 3268 (class 2606 OID 16896)
-- Name: invoice factura_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".invoice
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_invoice);


--
-- TOC entry 3272 (class 2606 OID 16956)
-- Name: img_comment img_comentario_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".img_comment
    ADD CONSTRAINT img_comentario_pkey PRIMARY KEY (id_img_comment);


--
-- TOC entry 3276 (class 2606 OID 16982)
-- Name: img_copy img_ejemplar_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".img_copy
    ADD CONSTRAINT img_ejemplar_pkey PRIMARY KEY (id_img_copy);


--
-- TOC entry 3282 (class 2606 OID 17017)
-- Name: img_book img_libro_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".img_book
    ADD CONSTRAINT img_libro_pkey PRIMARY KEY (id_img_book);


--
-- TOC entry 3278 (class 2606 OID 17008)
-- Name: book libro_isbn_key; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".book
    ADD CONSTRAINT libro_isbn_key UNIQUE (isbn);


--
-- TOC entry 3280 (class 2606 OID 17006)
-- Name: book libro_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".book
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id_book);


--
-- TOC entry 3274 (class 2606 OID 16968)
-- Name: message mensaje_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".message
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id_message);


--
-- TOC entry 3260 (class 2606 OID 16815)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 3258 (class 2606 OID 16796)
-- Name: book_categories tiene_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".book_categories
    ADD CONSTRAINT tiene_pkey PRIMARY KEY (id_book_categories);


--
-- TOC entry 3262 (class 2606 OID 16849)
-- Name: user usuario_pkey; Type: CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity"."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3285 (class 2606 OID 17119)
-- Name: book_categories book_categories_id_book_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".book_categories
    ADD CONSTRAINT book_categories_id_book_fkey FOREIGN KEY (id_book) REFERENCES "BookAffinity".book(id_book) NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 17114)
-- Name: book book_id_author_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".book
    ADD CONSTRAINT book_id_author_fkey FOREIGN KEY (id_author) REFERENCES "BookAffinity".author(id_author) NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 16919)
-- Name: comment comentario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".comment
    ADD CONSTRAINT comentario_id_usuario_fkey FOREIGN KEY (id_user) REFERENCES "BookAffinity"."user"(id_user);


--
-- TOC entry 3295 (class 2606 OID 17124)
-- Name: comment comment_id_book_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".comment
    ADD CONSTRAINT comment_id_book_fkey FOREIGN KEY (id_book) REFERENCES "BookAffinity".book(id_book) NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 16880)
-- Name: chat conversacion_id_usuario1_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".chat
    ADD CONSTRAINT conversacion_id_usuario1_fkey FOREIGN KEY (id_user1) REFERENCES "BookAffinity"."user"(id_user);


--
-- TOC entry 3291 (class 2606 OID 16885)
-- Name: chat conversacion_id_usuario2_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".chat
    ADD CONSTRAINT conversacion_id_usuario2_fkey FOREIGN KEY (id_user2) REFERENCES "BookAffinity"."user"(id_user);


--
-- TOC entry 3288 (class 2606 OID 17129)
-- Name: copy copy_id_book_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".copy
    ADD CONSTRAINT copy_id_book_fkey FOREIGN KEY (id_book) REFERENCES "BookAffinity".book(id_book) NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 16863)
-- Name: copy ejemplar_id_usuario_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".copy
    ADD CONSTRAINT ejemplar_id_usuario_fkey FOREIGN KEY (id_user) REFERENCES "BookAffinity"."user"(id_user);


--
-- TOC entry 3292 (class 2606 OID 16897)
-- Name: invoice factura_id_ejemplar_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".invoice
    ADD CONSTRAINT factura_id_ejemplar_fkey FOREIGN KEY (id_copy) REFERENCES "BookAffinity".copy(id_copy);


--
-- TOC entry 3293 (class 2606 OID 16902)
-- Name: invoice factura_id_usuario_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".invoice
    ADD CONSTRAINT factura_id_usuario_fkey FOREIGN KEY (id_user) REFERENCES "BookAffinity"."user"(id_user);


--
-- TOC entry 3300 (class 2606 OID 17134)
-- Name: img_book img_book_id_book_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".img_book
    ADD CONSTRAINT img_book_id_book_fkey FOREIGN KEY (id_book) REFERENCES "BookAffinity".book(id_book) NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 17139)
-- Name: img_comment img_comment_id_comment_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".img_comment
    ADD CONSTRAINT img_comment_id_comment_fkey FOREIGN KEY (id_comment) REFERENCES "BookAffinity".comment(id_comment) NOT VALID;


--
-- TOC entry 3298 (class 2606 OID 17144)
-- Name: img_copy img_copy_id_copy_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".img_copy
    ADD CONSTRAINT img_copy_id_copy_fkey FOREIGN KEY (id_copy) REFERENCES "BookAffinity".copy(id_copy) NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 16969)
-- Name: message mensaje_id_conversacion_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".message
    ADD CONSTRAINT mensaje_id_conversacion_fkey FOREIGN KEY (id_chat) REFERENCES "BookAffinity".chat(id_chat);


--
-- TOC entry 3286 (class 2606 OID 16797)
-- Name: book_categories tiene_id_categoria_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity".book_categories
    ADD CONSTRAINT tiene_id_categoria_fkey FOREIGN KEY (id_category) REFERENCES "BookAffinity".category(id_category);


--
-- TOC entry 3287 (class 2606 OID 17062)
-- Name: user usuario_id_rol_fkey; Type: FK CONSTRAINT; Schema: BookAffinity; Owner: admin
--

ALTER TABLE ONLY "BookAffinity"."user"
    ADD CONSTRAINT usuario_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES "BookAffinity".rol(id_rol);


-- Completed on 2023-03-28 12:37:55

--
-- PostgreSQL database dump complete
--

