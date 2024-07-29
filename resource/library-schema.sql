--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 16.0

-- Started on 2024-07-29 18:04:00 AEST

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
-- TOC entry 6 (class 2615 OID 20491)
-- Name: library; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA library;

CREATE DATABASE postgres;

ALTER SCHEMA library OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 20492)
-- Name: get_books_borrowed_by_user(integer); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.get_books_borrowed_by_user(user_id_param integer) RETURNS TABLE(title character varying, borrow_date timestamp without time zone, due_date timestamp without time zone, returned boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT b.title, id.borrow_date, id.due_date, id.returned
    FROM issue_details id
    JOIN books b ON id.book_id = b.id
    WHERE id.user_id = user_id_param;
END;
$$;


ALTER FUNCTION library.get_books_borrowed_by_user(user_id_param integer) OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 20493)
-- Name: get_books_by_author(integer); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.get_books_by_author(author_id integer) RETURNS TABLE(id character varying, title character varying, pages integer, year integer, synopsis character varying, cover character varying, "totalInventory" integer, available integer, binding character varying, language character varying, publisher character varying, "longTitle" character varying, "bookOfTheMonth" boolean)
    LANGUAGE sql
    AS $$SELECT * FROM books
WHERE id IN 
	(SELECT book_id from author_book
	WHERE author_id = 2)$$;


ALTER FUNCTION library.get_books_by_author(author_id integer) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 20494)
-- Name: get_books_by_genre(character varying); Type: FUNCTION; Schema: library; Owner: postgres
--

CREATE FUNCTION library.get_books_by_genre(genre_param character varying) RETURNS TABLE(title character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT b.title
    FROM books b
    JOIN book_genre bg ON b.id = bg.book_id
    WHERE bg.genre = genre_param;
END;
$$;


ALTER FUNCTION library.get_books_by_genre(genre_param character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 20495)
-- Name: author_alias; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.author_alias (
    author_id integer NOT NULL,
    alias character varying NOT NULL
);


ALTER TABLE library.author_alias OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 20500)
-- Name: author_book; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.author_book (
    author_id integer NOT NULL,
    book_id character varying NOT NULL
);


ALTER TABLE library.author_book OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 20505)
-- Name: authors; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.authors (
    id integer NOT NULL,
    name character varying NOT NULL,
    "sanitizedName" character varying NOT NULL,
    bio character varying
);


ALTER TABLE library.authors OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 20511)
-- Name: book_attribute; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.book_attribute (
    book_id character varying NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE library.book_attribute OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 20516)
-- Name: book_genre; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.book_genre (
    book_id character varying NOT NULL,
    genre character varying NOT NULL
);


ALTER TABLE library.book_genre OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 20521)
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
    binding character varying,
    language character varying NOT NULL,
    publisher character varying NOT NULL,
    "longTitle" character varying NOT NULL,
    "bookOfTheMonth" boolean
);


ALTER TABLE library.books OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 20526)
-- Name: books_by_rating; Type: VIEW; Schema: library; Owner: postgres
--

CREATE VIEW library.books_by_rating AS
SELECT
    NULL::character varying AS id,
    NULL::character varying AS title,
    NULL::numeric AS average_rating;


ALTER VIEW library.books_by_rating OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20530)
-- Name: issue_details; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.issue_details (
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


ALTER TABLE library.issue_details OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 20535)
-- Name: borrowed_books; Type: VIEW; Schema: library; Owner: postgres
--

CREATE VIEW library.borrowed_books AS
 SELECT issue_details.id,
    issue_details.book_id,
    issue_details.user_id,
    issue_details.borrow_date,
    issue_details.due_date,
    issue_details."recordType",
    issue_details.returned,
    issue_details.returned_date,
    issue_details.expiration_date
   FROM library.issue_details
  WHERE (((issue_details."recordType")::text = 'borrowedBook'::text) AND (issue_details.returned = false));


ALTER VIEW library.borrowed_books OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 20539)
-- Name: overdue_books; Type: VIEW; Schema: library; Owner: postgres
--

CREATE VIEW library.overdue_books AS
 SELECT issue_details.id,
    issue_details.book_id,
    issue_details.user_id,
    issue_details.borrow_date,
    issue_details.due_date,
    issue_details."recordType",
    issue_details.returned,
    issue_details.returned_date,
    issue_details.expiration_date
   FROM library.issue_details
  WHERE (((issue_details."recordType")::text = 'borrowedBook'::text) AND (issue_details.returned = false) AND (issue_details.returned_date IS NULL) AND (issue_details.due_date < now()));


ALTER VIEW library.overdue_books OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 20543)
-- Name: reviews; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.reviews (
    book_id character varying NOT NULL,
    user_id integer NOT NULL,
    text character varying,
    rating numeric NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE library.reviews OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20548)
-- Name: top_ten_borrowed_books; Type: VIEW; Schema: library; Owner: postgres
--

CREATE VIEW library.top_ten_borrowed_books AS
SELECT
    NULL::character varying AS id,
    NULL::character varying AS title,
    NULL::integer AS pages,
    NULL::integer AS year,
    NULL::character varying AS publisher,
    NULL::bigint AS issue_count;


ALTER VIEW library.top_ten_borrowed_books OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20552)
-- Name: users; Type: TABLE; Schema: library; Owner: postgres
--

CREATE TABLE library.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    "isAdmin" boolean NOT NULL
);


ALTER TABLE library.users OWNER TO postgres;

--
-- TOC entry 4189 (class 2606 OID 21277)
-- Name: author_alias author_alias_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_alias
    ADD CONSTRAINT author_alias_pkey PRIMARY KEY (alias, author_id);


--
-- TOC entry 4191 (class 2606 OID 21279)
-- Name: author_book author_book_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_pkey PRIMARY KEY (author_id, book_id);


--
-- TOC entry 4193 (class 2606 OID 21281)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 4195 (class 2606 OID 21283)
-- Name: book_attribute book_attribute_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_attribute
    ADD CONSTRAINT book_attribute_pkey PRIMARY KEY (book_id, key);


--
-- TOC entry 4197 (class 2606 OID 21285)
-- Name: book_genre book_genre_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_pkey PRIMARY KEY (genre, book_id);


--
-- TOC entry 4199 (class 2606 OID 21287)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 4201 (class 2606 OID 21289)
-- Name: issue_details issue_details_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.issue_details
    ADD CONSTRAINT issue_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4203 (class 2606 OID 21291)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (book_id, user_id);


--
-- TOC entry 4205 (class 2606 OID 21293)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4357 (class 2618 OID 20529)
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
-- TOC entry 4360 (class 2618 OID 20551)
-- Name: top_ten_borrowed_books _RETURN; Type: RULE; Schema: library; Owner: postgres
--

CREATE OR REPLACE VIEW library.top_ten_borrowed_books AS
 SELECT books.id,
    books.title,
    books.pages,
    books.year,
    books.publisher,
    sum(issue_details.id) AS issue_count
   FROM (library.books
     JOIN library.issue_details ON (((books.id)::text = (issue_details.book_id)::text)))
  GROUP BY books.id
  ORDER BY (sum(issue_details.id)) DESC
 LIMIT 10;


--
-- TOC entry 4206 (class 2606 OID 21296)
-- Name: author_alias author_alias_author_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_alias
    ADD CONSTRAINT author_alias_author_id_fkey FOREIGN KEY (author_id) REFERENCES library.authors(id) NOT VALID;


--
-- TOC entry 4207 (class 2606 OID 21302)
-- Name: author_book author_book_author_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_author_id_fkey FOREIGN KEY (author_id) REFERENCES library.authors(id) NOT VALID;


--
-- TOC entry 4208 (class 2606 OID 21307)
-- Name: author_book author_book_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.author_book
    ADD CONSTRAINT author_book_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4209 (class 2606 OID 21312)
-- Name: book_attribute book_attribute_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_attribute
    ADD CONSTRAINT book_attribute_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4210 (class 2606 OID 21317)
-- Name: book_genre book_genre_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.book_genre
    ADD CONSTRAINT book_genre_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4211 (class 2606 OID 21322)
-- Name: issue_details issue_details_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.issue_details
    ADD CONSTRAINT issue_details_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4212 (class 2606 OID 21327)
-- Name: issue_details issue_details_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.issue_details
    ADD CONSTRAINT issue_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id) NOT VALID;


--
-- TOC entry 4213 (class 2606 OID 21332)
-- Name: reviews reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES library.books(id) NOT VALID;


--
-- TOC entry 4214 (class 2606 OID 21337)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: library; Owner: postgres
--

ALTER TABLE ONLY library.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES library.users(id) NOT VALID;


-- Completed on 2024-07-29 18:04:18 AEST

--
-- PostgreSQL database dump complete
--

