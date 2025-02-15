GRANT USAGE ON SCHEMA library to replication_group;

INSERT INTO library.authors VALUES (9999, 'Julian May', 'julianmay', 'Born in 1931, Julian May sold her first short story to John W. Campbell''s Astounding Science Fiction magazine in 1951. It was a science fiction short story called Dune Roller. But it wasn''t until the 1980s that the author returned to genre fiction, after writing a variety of non-fiction and children''s books, often under pseudonyms. May then wrote the phenomenally successful Saga of the Exiles, followed by the Galactic Milieu series. The Many-Coloured Land, book one of the Saga of the Exiles, won the Locus Best Novel Award. It was also shortlisted for top genre awards including the Hugo, the Nebula, the Prometheus Award and the Mythopoetic Fantasy Award for Adult Literature. Julian May passed away in October 2017.', NULL);

INSERT INTO library.books VALUES ('1447224051', 'Jack the Bodiless', 398, 1991, 'His powers may be the ultimate hope, if they allow him to live.', '', 2, 2, 'Jack the Bodiless', NULL, NULL, 132, 19, 1);
INSERT INTO library.books VALUES ('144722406X', 'Diamond Mask', 402, 1994, 'She concealed her great gifts, but some plans were made to be broken.', '', 2, 2, 'Diamond Mask', NULL, NULL, 132, 19, 1);
INSERT INTO library.books VALUES ('1447224078', 'Magnificat', 434, 1996, 'A glorious future is in sight, until the rebellion brings Armageddon.', '', 2, 2, 'Magnificat', NULL, NULL, 132, 19, 1);

INSERT INTO library.book_genre VALUES ('1447224051', 803);
INSERT INTO library.book_genre VALUES ('144722406X', 803);
INSERT INTO library.book_genre VALUES ('1447224078', 803);

INSERT INTO library.author_book VALUES (9999, '1447224051');
INSERT INTO library.author_book VALUES (9999, '144722406X');
INSERT INTO library.author_book VALUES (9999, '1447224078');