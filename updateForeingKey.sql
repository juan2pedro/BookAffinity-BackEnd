--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-27 11:25:54

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
-- TOC entry 3448 (class 1262 OID 16401)
-- Name: BookAffinity_db; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE "BookAffinity_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE "BookAffinity_db" OWNER TO admin;

\connect "BookAffinity_db"

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
-- TOC entry 3449 (class 0 OID 0)
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
-- TOC entry 3450 (class 0 OID 0)
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
-- TOC entry 3451 (class 0 OID 0)
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
-- TOC entry 3452 (class 0 OID 0)
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
-- TOC entry 3453 (class 0 OID 0)
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
-- TOC entry 3454 (class 0 OID 0)
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
-- TOC entry 3455 (class 0 OID 0)
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
-- TOC entry 3456 (class 0 OID 0)
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
-- TOC entry 3457 (class 0 OID 0)
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
-- TOC entry 3458 (class 0 OID 0)
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
-- TOC entry 3459 (class 0 OID 0)
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
-- TOC entry 3460 (class 0 OID 0)
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
    "createAt" timestamp without time zone,
    "updateAt" timestamp without time zone
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
-- TOC entry 3461 (class 0 OID 0)
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


-- Completed on 2023-03-27 11:25:54

--
-- PostgreSQL database dump complete
--

