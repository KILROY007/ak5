SET check_function_bodies = false;
CREATE TABLE public."Project" (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone,
    status character varying,
    progress_percentage bigint,
    estimated_delivery_date timestamp with time zone,
    assigned_photographer_id bigint,
    payment_status character varying,
    photographer_id bigint NOT NULL,
    client_id bigint NOT NULL
);
CREATE SEQUENCE public."Project_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Project_id_seq" OWNED BY public."Project".id;
CREATE TABLE public.client (
    id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying,
    email character varying,
    phone_no bigint NOT NULL,
    hased_password character varying,
    salted_password character varying
);
CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;
CREATE TABLE public.photographer (
    id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying,
    email character varying NOT NULL,
    phone_no bigint NOT NULL,
    hased_password character varying,
    salted_password character varying
);
CREATE SEQUENCE public.photographer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.photographer_id_seq OWNED BY public.photographer.id;
ALTER TABLE ONLY public."Project" ALTER COLUMN id SET DEFAULT nextval('public."Project_id_seq"'::regclass);
ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);
ALTER TABLE ONLY public.photographer ALTER COLUMN id SET DEFAULT nextval('public.photographer_id_seq'::regclass);
ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.photographer
    ADD CONSTRAINT photographer_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_client_id_fkey" FOREIGN KEY (client_id) REFERENCES public.client(id);
ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_photographer_id_fkey" FOREIGN KEY (photographer_id) REFERENCES public.photographer(id);
