--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.0

-- Started on 2025-03-19 11:59:11 +08

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
-- TOC entry 4445 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


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
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 4445
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 6 (class 2615 OID 16456)
-- Name: library; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA library;


ALTER SCHEMA library OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 16457)
-- Name: generate_random_street(); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.generate_random_street() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  street_names TEXT[] := ARRAY['Main St', 'Oak Ave', 'Pine Ln', 'Maple Dr', '1st St', '2nd Ave', 'High St', 'Low St', 'River Rd', 'Hillside Ct'];
BEGIN
  RETURN street_names[floor(random() * array_length(street_names, 1)) + 1] || ' ' || (floor(random() * 1000) + 1);
END;
$$;


ALTER FUNCTION library.generate_random_street() OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 16458)
-- Name: generate_random_tags(); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.generate_random_tags() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  possible_tags TEXT[] := ARRAY[
'club pick', 'reading challenge', 'recommended read', 'must read', 'favorite', 'booktok', 'bookstagram',
'hangover', 'currently reading', 'tbr', 'haul', 'shelfie', 'worm', 'bibliophile', 'lover', 'reader', 'reading',
'review', 'recommendation', 'discussion', 'chat', 'community', 'ish', 'reading list', 'stack',
'new release', 'bestseller', 'award winner', 'prize winner', 'classic literature', 'contemporary fiction', 'debut novel',
'indie author', 'self-published', 'audio', 'e', 'hardcover', 'paperback', 'used', 'library',
'signing', 'author event', 'festival', 'literary festival', 'fair', 'swap', 'exchange',
'cozy read', 'beach read', 'winter read', 'summer read', 'fall read', 'spring read', 'weekend read', 'bedtime read',
'quick read', 'short read', 'long read', 'slow burn', 'fast-paced', 'plot-driven', 'character-driven', 'world-building',
'writing style', 'themes', 'motifs', 'symbols', 'imagery', 'metaphors', 'similes', 'allegory', 'irony', 'satire',
'humor', 'drama', 'romance', 'mystery', 'thriller', 'suspense', 'horror', 'fantasy', 'science fiction',
'historical fiction', 'biography', 'autobiography', 'memoir', 'essay', 'poetry', 'graphic novel', 'comic',
'manga', 'childrens literature', 'young adult', 'middle grade', 'new adult', 'adult fiction', 'literary fiction',
'genre fiction', 'speculative fiction', 'realistic fiction', 'historical romance', 'paranormal romance', 'urban fantasy',
'high fantasy', 'low fantasy', 'magical realism', 'space opera', 'cyberpunk', 'dystopian fiction', 'utopian fiction',
'apocalyptic fiction', 'post-apocalyptic fiction', 'time travel fiction', 'alternate history fiction', 'military fiction',
'war fiction', 'spy fiction', 'espionage fiction', 'political thriller', 'legal thriller', 'courtroom drama', 'psychological thriller',
'domestic thriller', 'gothic fiction', 'historical mystery', 'cozy mystery', 'hard-boiled detective', 'police procedural',
'amateur sleuth', 'true crime', 'creative nonfiction', 'science writing', 'nature writing', 'travel writing', 'food writing',
'self-help', 'business', 'technology', 'science', 'history', 'art', 'music',
'photography', 'cookbook', 'guide', 'reference', 'text', 'educational', 'academic',
'professional', 'technical', 'medical', 'legal', 'business', 'finance', 'real estate',
'engineering', 'manufacturing', 'construction', 'agriculture', 'mining', 'energy',
'transportation', 'communication', 'media', 'entertainment', 'sports', 'recreation',
'travel', 'tourism', 'hospitality', 'education', 'healthcare', 'social services',
'government', 'politics', 'law', 'justice', 'crime', 'security', 'defense',
'international relations', 'globalization', 'development', 'sustainability',
'environment', 'climate change', 'energy', 'water', 'food', 'agriculture', 'health',
'wellness', 'poverty', 'inequality', 'human rights', 'democracy', 'freedom', 'justice',
'peace', 'war', 'conflict', 'terrorism', 'global issues', 'social issues',
'cultural issues', 'economic issues', 'political issues', 'religious issues',
'philosophical issues', 'spiritual issues'
]; -- No "book" in any of the tags

  num_tags INT;
  i INT;
  tags_string TEXT := '';
BEGIN
  num_tags := floor(random() * 3) + 1; -- Generates 1 to 3 tags per book

  FOR i IN 1..num_tags LOOP
    tags_string := tags_string || possible_tags[floor(random() * array_length(possible_tags, 1)) + 1];
    IF i < num_tags THEN
        tags_string := tags_string || ',';
    END IF;
  END LOOP;
  RETURN tags_string;
END;
$$;


ALTER FUNCTION library.generate_random_tags() OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 16460)
-- Name: get_books_borrowed_by_user(integer); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.get_books_borrowed_by_user(user_id_param integer) RETURNS TABLE(title character varying, borrow_date timestamp without time zone, due_date timestamp without time zone, returned boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT b.title, ops.borrow_date, ops.due_date, ops.returned
    FROM library.operations ops
    JOIN library.books b ON ops.book_id = b.id
    WHERE ops.user_id = user_id_param;
END;
$$;


ALTER FUNCTION library.get_books_borrowed_by_user(user_id_param integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16498)
-- Name: books; Type: TABLE; Schema: library; Owner: postgres
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


ALTER TABLE library.books OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 20559)
-- Name: get_books_by_author(integer); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.get_books_by_author(author_id_param integer) RETURNS SETOF library.books
    LANGUAGE plpgsql
    AS $$BEGIN
    RETURN QUERY
	SELECT * FROM library.books b 
	WHERE b.id IN (
	SELECT ab.book_id
	FROM library.author_book ab 
	WHERE ab.author_id = author_id_param);
END$$;


ALTER FUNCTION library.get_books_by_author(author_id_param integer) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 16462)
-- Name: get_books_by_genre(character varying); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.get_books_by_genre(genre_param character varying) RETURNS TABLE(title character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
	SELECT b.title 
  	FROM library.books b
  	WHERE b.id IN (
  	SELECT bg.book_id
  	FROM library.book_genre bg
  	JOIN library.genres g ON bg.genre_id = g.id
  	WHERE g.name = genre_param
  );
END;
$$;


ALTER FUNCTION library.get_books_by_genre(genre_param character varying) OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16463)
-- Name: user_addresses; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.user_addresses (
    id integer NOT NULL,
    user_id integer,
    street character varying(255),
    city_id integer
);


ALTER TABLE library.user_addresses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16466)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
--

CREATE SEQUENCE library.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 218 (class 1259 OID 16467)
-- Name: author_alias; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.author_alias (
    author_id integer NOT NULL,
    alias character varying NOT NULL
);

ALTER TABLE ONLY library.author_alias REPLICA IDENTITY FULL;


ALTER TABLE library.author_alias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16472)
-- Name: author_book; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.author_book (
    author_id integer NOT NULL,
    book_id character varying NOT NULL
);

ALTER TABLE ONLY library.author_book REPLICA IDENTITY FULL;


ALTER TABLE library.author_book OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16477)
-- Name: authors; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.authors (
    id integer NOT NULL,
    name character varying NOT NULL,
    "sanitizedName" character varying NOT NULL,
    bio character varying,
    awards jsonb
);

ALTER TABLE ONLY library.authors REPLICA IDENTITY FULL;


ALTER TABLE library.authors OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16482)
-- Name: bindings; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.bindings (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE library.bindings OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16487)
-- Name: bindings_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
--

CREATE SEQUENCE library.bindings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 223 (class 1259 OID 16488)
-- Name: book_attribute; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.book_attribute (
    book_id character varying NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);

ALTER TABLE ONLY library.book_attribute REPLICA IDENTITY FULL;


ALTER TABLE library.book_attribute OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16493)
-- Name: book_genre; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.book_genre (
    book_id character varying,
    genre_id integer
);


ALTER TABLE library.book_genre OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16503)
-- Name: books_by_rating; Type: VIEW; Schema: library; Owner: postgres
--

CREATE VIEW library.books_by_rating AS
SELECT
    NULL::character varying AS id,
    NULL::character varying AS title,
    NULL::numeric AS average_rating;

--
-- TOC entry 227 (class 1259 OID 16507)
-- Name: operations; Type: TABLE; Schema: library; Owner: postgres
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


ALTER TABLE library.operations OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16512)
-- Name: borrowed_books; Type: VIEW; Schema: library; Owner: postgres
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
-- TOC entry 229 (class 1259 OID 16516)
-- Name: cities; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.cities (
    id integer NOT NULL,
    name character varying(255),
    country_id integer
);


ALTER TABLE library.cities OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16519)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
--

CREATE SEQUENCE library.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 230
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: postgres
--

ALTER SEQUENCE library.cities_id_seq OWNED BY library.cities.id;


--
-- TOC entry 231 (class 1259 OID 16520)
-- Name: countries; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.countries (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE library.countries OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16523)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
--

CREATE SEQUENCE library.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 232
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: postgres
--

ALTER SEQUENCE library.countries_id_seq OWNED BY library.countries.id;


--
-- TOC entry 233 (class 1259 OID 16524)
-- Name: genres; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.genres (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE library.genres OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16529)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
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
-- TOC entry 235 (class 1259 OID 16530)
-- Name: languages; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.languages (
    id integer NOT NULL,
    iso_639_1 character varying(2),
    iso_639_3 character(3),
    name character varying(255)
);


ALTER TABLE library.languages OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16533)
-- Name: languages_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
--

CREATE SEQUENCE library.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 236
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: postgres
--

ALTER SEQUENCE library.languages_id_seq OWNED BY library.languages.id;


--
-- TOC entry 237 (class 1259 OID 16534)
-- Name: overdue_books; Type: VIEW; Schema: library; Owner: postgres
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
-- TOC entry 238 (class 1259 OID 16538)
-- Name: publishers; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.publishers (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE library.publishers OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16541)
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: library; Owner: postgres
--

CREATE SEQUENCE library.publishers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 239
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: library; Owner: postgres
--

ALTER SEQUENCE library.publishers_id_seq OWNED BY library.publishers.id;


--
-- TOC entry 240 (class 1259 OID 16542)
-- Name: reviews; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.reviews (
    book_id character varying NOT NULL,
    user_id integer NOT NULL,
    text character varying,
    rating numeric NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY library.reviews REPLICA IDENTITY FULL;


ALTER TABLE library.reviews OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16547)
-- Name: top_ten_borrowed_books; Type: VIEW; Schema: library; Owner: postgres
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
-- TOC entry 242 (class 1259 OID 16552)
-- Name: users; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    "isAdmin" boolean NOT NULL
);

ALTER TABLE ONLY library.users REPLICA IDENTITY FULL;


ALTER TABLE library.users OWNER TO postgres;

--
-- TOC entry 4229 (class 2604 OID 16557)
-- Name: bindings id; Type: DEFAULT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.bindings ALTER COLUMN id SET DEFAULT nextval('library.bindings_id_seq'::regclass);


--
-- TOC entry 4230 (class 2604 OID 16558)
-- Name: cities id; Type: DEFAULT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.cities ALTER COLUMN id SET DEFAULT nextval('library.cities_id_seq'::regclass);


--
-- TOC entry 4231 (class 2604 OID 16559)
-- Name: countries id; Type: DEFAULT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.countries ALTER COLUMN id SET DEFAULT nextval('library.countries_id_seq'::regclass);


--
-- TOC entry 4232 (class 2604 OID 16560)
-- Name: languages id; Type: DEFAULT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.languages ALTER COLUMN id SET DEFAULT nextval('library.languages_id_seq'::regclass);


--
-- TOC entry 4233 (class 2604 OID 16561)
-- Name: publishers id; Type: DEFAULT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.publishers ALTER COLUMN id SET DEFAULT nextval('library.publishers_id_seq'::regclass);


--
-- TOC entry 4228 (class 2604 OID 16562)
-- Name: user_addresses id; Type: DEFAULT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.user_addresses ALTER COLUMN id SET DEFAULT nextval('library.addresses_id_seq'::regclass);


--
-- TOC entry 4235 (class 2606 OID 17277)
-- Name: user_addresses addresses_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.user_addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4237 (class 2606 OID 17279)
-- Name: author_alias author_alias_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_alias
    ADD CONSTRAINT author_alias_pkey PRIMARY KEY (alias, author_id);


--
-- TOC entry 4239 (class 2606 OID 17281)
-- Name: author_book author_book_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_pkey PRIMARY KEY (author_id, book_id);


--
-- TOC entry 4241 (class 2606 OID 17283)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 4243 (class 2606 OID 17285)
-- Name: bindings bindings_name_key; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.bindings
    ADD CONSTRAINT bindings_name_key UNIQUE (name);


--
-- TOC entry 4245 (class 2606 OID 17287)
-- Name: bindings bindings_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.bindings
    ADD CONSTRAINT bindings_pkey PRIMARY KEY (id);


--
-- TOC entry 4247 (class 2606 OID 17289)
-- Name: book_attribute book_attribute_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_attribute
    ADD CONSTRAINT book_attribute_pkey PRIMARY KEY (book_id, key);


--
-- TOC entry 4249 (class 2606 OID 17291)
-- Name: book_genre book_genre_1_book_id_genre_id_key; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_1_book_id_genre_id_key UNIQUE (book_id, genre_id);


--
-- TOC entry 4251 (class 2606 OID 17293)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 4255 (class 2606 OID 17295)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 17297)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4259 (class 2606 OID 17299)
-- Name: genres genres_pk; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.genres
    ADD CONSTRAINT genres_pk PRIMARY KEY (id);


--
-- TOC entry 4261 (class 2606 OID 17301)
-- Name: genres genres_unique; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.genres
    ADD CONSTRAINT genres_unique UNIQUE (name);


--
-- TOC entry 4253 (class 2606 OID 17303)
-- Name: operations issue_details_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.operations
    ADD CONSTRAINT issue_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4263 (class 2606 OID 17305)
-- Name: languages languages_iso_639_1_key; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_iso_639_1_key UNIQUE (iso_639_1);


--
-- TOC entry 4265 (class 2606 OID 17307)
-- Name: languages languages_iso_639_3_key; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_iso_639_3_key UNIQUE (iso_639_3);


--
-- TOC entry 4267 (class 2606 OID 17309)
-- Name: languages languages_name_key; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- TOC entry 4269 (class 2606 OID 17311)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 4271 (class 2606 OID 17313)
-- Name: publishers publishers_name_key; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.publishers
    ADD CONSTRAINT publishers_name_key UNIQUE (name);


--
-- TOC entry 4273 (class 2606 OID 17315)
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- TOC entry 4275 (class 2606 OID 17317)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (book_id, user_id);


--
-- TOC entry 4277 (class 2606 OID 17319)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4436 (class 2618 OID 16506)
-- Name: books_by_rating _RETURN; Type: RULE; Schema: library; Owner: postgres
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
-- TOC entry 4278 (class 2606 OID 17321)
-- Name: user_addresses addresses_city_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.user_addresses
    ADD CONSTRAINT addresses_city_id_fkey FOREIGN KEY (city_id) REFERENCES library.cities(id);


--
-- TOC entry 4279 (class 2606 OID 17326)
-- Name: user_addresses addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.user_addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id);


--
-- TOC entry 4280 (class 2606 OID 17331)
-- Name: author_alias author_alias_author_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_alias
    ADD CONSTRAINT author_alias_author_id_fkey FOREIGN KEY (author_id) REFERENCES library.authors(id) NOT VALID;


--
-- TOC entry 4281 (class 2606 OID 17336)
-- Name: author_book author_book_author_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_author_id_fkey FOREIGN KEY (author_id) REFERENCES library.authors(id) NOT VALID;


--
-- TOC entry 4282 (class 2606 OID 17341)
-- Name: author_book author_book_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4283 (class 2606 OID 17346)
-- Name: book_attribute book_attribute_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_attribute
    ADD CONSTRAINT book_attribute_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4284 (class 2606 OID 17351)
-- Name: book_genre book_genre_1_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_1_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id);


--
-- TOC entry 4285 (class 2606 OID 17356)
-- Name: book_genre book_genre_1_genre_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_1_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES library.genres(id);


--
-- TOC entry 4286 (class 2606 OID 17361)
-- Name: books books_binding_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_binding_id_fkey FOREIGN KEY (binding_id) REFERENCES library.bindings(id);


--
-- TOC entry 4287 (class 2606 OID 17366)
-- Name: books books_publisher_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES library.publishers(id);


--
-- TOC entry 4290 (class 2606 OID 17371)
-- Name: cities cities_country_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.cities
    ADD CONSTRAINT cities_country_id_fkey FOREIGN KEY (country_id) REFERENCES library.countries(id);


--
-- TOC entry 4288 (class 2606 OID 17376)
-- Name: operations issue_details_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.operations
    ADD CONSTRAINT issue_details_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4289 (class 2606 OID 17381)
-- Name: operations issue_details_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.operations
    ADD CONSTRAINT issue_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id) NOT VALID;


--
-- TOC entry 4291 (class 2606 OID 17386)
-- Name: reviews reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4292 (class 2606 OID 17391)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id) NOT VALID;


-- Completed on 2025-03-19 11:59:17 +08

--
-- PostgreSQL database dump complete
--

