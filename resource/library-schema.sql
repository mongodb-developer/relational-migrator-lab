--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-02-12 17:27:53 CET

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

DROP DATABASE IF EXISTS library;
--
-- TOC entry 3488 (class 1262 OID 16384)
-- Name: library; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';


\connect library

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
-- TOC entry 216 (class 1259 OID 16392)
-- Name: user_addresses; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.user_addresses (
    id integer NOT NULL,
    user_id integer,
    street character varying(255),
    city_id integer
);


--
-- TOC entry 217 (class 1259 OID 16395)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

CREATE SEQUENCE library.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 217
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: -
--

ALTER SEQUENCE library.addresses_id_seq OWNED BY library.user_addresses.id;


--
-- TOC entry 218 (class 1259 OID 16396)
-- Name: author_alias; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.author_alias (
    author_id integer NOT NULL,
    alias character varying NOT NULL
);

ALTER TABLE ONLY library.author_alias REPLICA IDENTITY FULL;


--
-- TOC entry 219 (class 1259 OID 16401)
-- Name: author_book; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.author_book (
    author_id integer NOT NULL,
    book_id character varying NOT NULL
);

ALTER TABLE ONLY library.author_book REPLICA IDENTITY FULL;


--
-- TOC entry 220 (class 1259 OID 16406)
-- Name: authors; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.authors (
    id integer NOT NULL,
    name character varying NOT NULL,
    "sanitizedName" character varying NOT NULL,
    bio character varying,
    awards jsonb
);

ALTER TABLE ONLY library.authors REPLICA IDENTITY FULL;


--
-- TOC entry 221 (class 1259 OID 16411)
-- Name: bindings; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.bindings (
    id integer NOT NULL,
    name character varying
);


--
-- TOC entry 222 (class 1259 OID 16416)
-- Name: bindings_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

CREATE SEQUENCE library.bindings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 222
-- Name: bindings_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: -
--

ALTER SEQUENCE library.bindings_id_seq OWNED BY library.bindings.id;


--
-- TOC entry 223 (class 1259 OID 16417)
-- Name: book_attribute; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.book_attribute (
    book_id character varying NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);

ALTER TABLE ONLY library.book_attribute REPLICA IDENTITY FULL;


--
-- TOC entry 224 (class 1259 OID 16422)
-- Name: book_genre; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.book_genre (
    book_id character varying,
    genre_id integer
);

ALTER TABLE ONLY library.book_genre REPLICA IDENTITY FULL;


--
-- TOC entry 225 (class 1259 OID 16427)
-- Name: books; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.books (
    id character varying NOT NULL,
    title character varying NOT NULL,
    pages integer,
    year integer,
    synopsis character varying NOT NULL,
    cover character varying NOT NULL,
    "totalInventory" integer NOT NULL,
    available integer NOT NULL,
    "longTitle" character varying NOT NULL,
    "bookOfTheMonth" boolean,
    tags character varying,
    publisher_id integer,
    binding_id integer,
    language_id integer
);

ALTER TABLE ONLY library.books REPLICA IDENTITY FULL;


--
-- TOC entry 226 (class 1259 OID 16432)
-- Name: books_by_rating; Type: VIEW; Schema: library; Owner: -
--

CREATE VIEW library.books_by_rating AS
SELECT
    NULL::character varying AS id,
    NULL::character varying AS title,
    NULL::numeric AS average_rating;


--
-- TOC entry 227 (class 1259 OID 16436)
-- Name: operations; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.operations (
    id integer NOT NULL,
    book_id character varying NOT NULL,
    user_id integer NOT NULL,
    borrow_date timestamp without time zone,
    due_date timestamp without time zone,
    "recordType" character varying NOT NULL,
    returned boolean,
    returned_date timestamp without time zone,
    expiration_date timestamp without time zone
);

ALTER TABLE ONLY library.operations REPLICA IDENTITY FULL;


--
-- TOC entry 228 (class 1259 OID 16441)
-- Name: borrowed_books; Type: VIEW; Schema: library; Owner: -
--

CREATE VIEW library.borrowed_books AS
 SELECT id,
    book_id,
    user_id,
    borrow_date,
    due_date,
    "recordType",
    returned,
    returned_date,
    expiration_date
   FROM library.operations
  WHERE ((("recordType")::text = 'borrowedBook'::text) AND (returned = false));


--
-- TOC entry 229 (class 1259 OID 16445)
-- Name: cities; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.cities (
    id integer NOT NULL,
    name character varying(255),
    country_id integer
);


--
-- TOC entry 230 (class 1259 OID 16448)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

CREATE SEQUENCE library.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 230
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: -
--

ALTER SEQUENCE library.cities_id_seq OWNED BY library.cities.id;


--
-- TOC entry 231 (class 1259 OID 16449)
-- Name: countries; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.countries (
    id integer NOT NULL,
    name character varying(255)
);


--
-- TOC entry 232 (class 1259 OID 16452)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

CREATE SEQUENCE library.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 232
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: -
--

ALTER SEQUENCE library.countries_id_seq OWNED BY library.countries.id;


--
-- TOC entry 233 (class 1259 OID 16453)
-- Name: genres; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.genres (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 16458)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

ALTER TABLE library.genres ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME library.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16459)
-- Name: languages; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.languages (
    id integer NOT NULL,
    iso_639_1 character varying(2),
    iso_639_3 character(3),
    name character varying(255)
);


--
-- TOC entry 236 (class 1259 OID 16462)
-- Name: languages_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

CREATE SEQUENCE library.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 236
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: -
--

ALTER SEQUENCE library.languages_id_seq OWNED BY library.languages.id;


--
-- TOC entry 237 (class 1259 OID 16463)
-- Name: overdue_books; Type: VIEW; Schema: library; Owner: -
--

CREATE VIEW library.overdue_books AS
 SELECT id,
    book_id,
    user_id,
    borrow_date,
    due_date,
    "recordType",
    returned,
    returned_date,
    expiration_date
   FROM library.operations
  WHERE ((("recordType")::text = 'borrowedBook'::text) AND (returned = false) AND (returned_date IS NULL) AND (due_date < now()));


--
-- TOC entry 238 (class 1259 OID 16467)
-- Name: publishers; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.publishers (
    id integer NOT NULL,
    name character varying(255)
);


--
-- TOC entry 239 (class 1259 OID 16470)
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: library; Owner: -
--

CREATE SEQUENCE library.publishers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 239
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: -
--

ALTER SEQUENCE library.publishers_id_seq OWNED BY library.publishers.id;


--
-- TOC entry 240 (class 1259 OID 16471)
-- Name: reviews; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.reviews (
    book_id character varying NOT NULL,
    user_id integer NOT NULL,
    text character varying,
    rating numeric NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY library.reviews REPLICA IDENTITY FULL;


--
-- TOC entry 241 (class 1259 OID 16476)
-- Name: top_ten_borrowed_books; Type: VIEW; Schema: library; Owner: -
--

CREATE VIEW library.top_ten_borrowed_books AS
 SELECT b.id,
    b.title,
    b.pages,
    b.year,
    p.name AS publisher,
    count(id.id) AS issue_count
   FROM ((library.books b
     JOIN library.operations id ON (((b.id)::text = (id.book_id)::text)))
     LEFT JOIN library.publishers p ON ((b.publisher_id = p.id)))
  GROUP BY b.id, b.title, b.pages, b.year, p.name
  ORDER BY (count(id.id)) DESC
 LIMIT 10;


--
-- TOC entry 242 (class 1259 OID 16481)
-- Name: users; Type: TABLE; Schema: library; Owner: -
--

CREATE TABLE library.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    "isAdmin" boolean NOT NULL
);

ALTER TABLE ONLY library.users REPLICA IDENTITY FULL;


--
-- TOC entry 3272 (class 2604 OID 16486)
-- Name: bindings id; Type: DEFAULT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.bindings ALTER COLUMN id SET DEFAULT nextval('library.bindings_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 16487)
-- Name: cities id; Type: DEFAULT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.cities ALTER COLUMN id SET DEFAULT nextval('library.cities_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 16488)
-- Name: countries id; Type: DEFAULT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.countries ALTER COLUMN id SET DEFAULT nextval('library.countries_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 16489)
-- Name: languages id; Type: DEFAULT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.languages ALTER COLUMN id SET DEFAULT nextval('library.languages_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 16490)
-- Name: publishers id; Type: DEFAULT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.publishers ALTER COLUMN id SET DEFAULT nextval('library.publishers_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 16491)
-- Name: user_addresses id; Type: DEFAULT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.user_addresses ALTER COLUMN id SET DEFAULT nextval('library.addresses_id_seq'::regclass);


--
-- TOC entry 3278 (class 2606 OID 17205)
-- Name: user_addresses addresses_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.user_addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 17207)
-- Name: author_alias author_alias_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.author_alias
    ADD CONSTRAINT author_alias_pkey PRIMARY KEY (alias, author_id);


--
-- TOC entry 3282 (class 2606 OID 17209)
-- Name: author_book author_book_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_pkey PRIMARY KEY (author_id, book_id);


--
-- TOC entry 3284 (class 2606 OID 17211)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 17213)
-- Name: bindings bindings_name_key; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.bindings
    ADD CONSTRAINT bindings_name_key UNIQUE (name);


--
-- TOC entry 3288 (class 2606 OID 17215)
-- Name: bindings bindings_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.bindings
    ADD CONSTRAINT bindings_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 17217)
-- Name: book_attribute book_attribute_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.book_attribute
    ADD CONSTRAINT book_attribute_pkey PRIMARY KEY (book_id, key);


--
-- TOC entry 3292 (class 2606 OID 17219)
-- Name: book_genre book_genre_1_book_id_genre_id_key; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_1_book_id_genre_id_key UNIQUE (book_id, genre_id);


--
-- TOC entry 3294 (class 2606 OID 17221)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 17223)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 17225)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 17227)
-- Name: genres genres_pk; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.genres
    ADD CONSTRAINT genres_pk PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 17229)
-- Name: genres genres_unique; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.genres
    ADD CONSTRAINT genres_unique UNIQUE (name);


--
-- TOC entry 3296 (class 2606 OID 17231)
-- Name: operations issue_details_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.operations
    ADD CONSTRAINT issue_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 17233)
-- Name: languages languages_iso_639_1_key; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_iso_639_1_key UNIQUE (iso_639_1);


--
-- TOC entry 3308 (class 2606 OID 17235)
-- Name: languages languages_iso_639_3_key; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_iso_639_3_key UNIQUE (iso_639_3);


--
-- TOC entry 3310 (class 2606 OID 17237)
-- Name: languages languages_name_key; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- TOC entry 3312 (class 2606 OID 17239)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 17241)
-- Name: publishers publishers_name_key; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.publishers
    ADD CONSTRAINT publishers_name_key UNIQUE (name);


--
-- TOC entry 3316 (class 2606 OID 17243)
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 17245)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (book_id, user_id);


--
-- TOC entry 3320 (class 2606 OID 17247)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2618 OID 16435)
-- Name: books_by_rating _RETURN; Type: RULE; Schema: library; Owner: -
--

CREATE OR REPLACE VIEW library.books_by_rating AS
 SELECT b.id,
    b.title,
    avg(r.rating) AS average_rating
   FROM (library.books b
     JOIN library.reviews r ON (((b.id)::text = (r.book_id)::text)))
  GROUP BY b.id
  ORDER BY (avg(r.rating)) DESC;


--
-- TOC entry 3321 (class 2606 OID 17249)
-- Name: user_addresses addresses_city_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.user_addresses
    ADD CONSTRAINT addresses_city_id_fkey FOREIGN KEY (city_id) REFERENCES library.cities(id);


--
-- TOC entry 3322 (class 2606 OID 17254)
-- Name: user_addresses addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.user_addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id);


--
-- TOC entry 3323 (class 2606 OID 17259)
-- Name: author_alias author_alias_author_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.author_alias
    ADD CONSTRAINT author_alias_author_id_fkey FOREIGN KEY (author_id) REFERENCES library.authors(id) NOT VALID;


--
-- TOC entry 3324 (class 2606 OID 17264)
-- Name: author_book author_book_author_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_author_id_fkey FOREIGN KEY (author_id) REFERENCES library.authors(id) NOT VALID;


--
-- TOC entry 3325 (class 2606 OID 17269)
-- Name: author_book author_book_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 3326 (class 2606 OID 17274)
-- Name: book_attribute book_attribute_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.book_attribute
    ADD CONSTRAINT book_attribute_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 3327 (class 2606 OID 17279)
-- Name: book_genre book_genre_1_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_1_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id);


--
-- TOC entry 3328 (class 2606 OID 17284)
-- Name: book_genre book_genre_1_genre_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_1_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES library.genres(id);


--
-- TOC entry 3329 (class 2606 OID 17289)
-- Name: books books_binding_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_binding_id_fkey FOREIGN KEY (binding_id) REFERENCES library.bindings(id);


--
-- TOC entry 3330 (class 2606 OID 17294)
-- Name: books books_publisher_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES library.publishers(id);


--
-- TOC entry 3333 (class 2606 OID 17299)
-- Name: cities cities_country_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.cities
    ADD CONSTRAINT cities_country_id_fkey FOREIGN KEY (country_id) REFERENCES library.countries(id);


--
-- TOC entry 3331 (class 2606 OID 17304)
-- Name: operations issue_details_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.operations
    ADD CONSTRAINT issue_details_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 3332 (class 2606 OID 17309)
-- Name: operations issue_details_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.operations
    ADD CONSTRAINT issue_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id) NOT VALID;


--
-- TOC entry 3334 (class 2606 OID 17314)
-- Name: reviews reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 3335 (class 2606 OID 17319)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: -
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id) NOT VALID;


-- Completed on 2025-02-12 17:27:53 CET

--
-- PostgreSQL database dump complete
--

