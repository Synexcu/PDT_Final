CREATE TABLE IF NOT EXISTS public.books
(
    id SERIAL NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    author character varying(255) COLLATE pg_catalog."default" NOT NULL,
    status character varying(255) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Avalible'::character varying,
    CONSTRAINT books_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    id SERIAL NOT NULL,
    username character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_username_key UNIQUE (username)
);

CREATE TABLE IF NOT EXISTS public.borrowhistory
(
    id SERIAL NOT NULL,
    book_id integer,
    user_id integer,
    borrow_date date NOT NULL DEFAULT CURRENT_DATE,
    returned boolean NOT NULL,
    CONSTRAINT borrowhistory_pkey PRIMARY KEY (id),
    CONSTRAINT borrowhistory_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT borrowhistory_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
