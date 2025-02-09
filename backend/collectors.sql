CREATE TABLE public.collectors (
	collector_id uuid DEFAULT auth.uid() NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	"name" text DEFAULT ''::text NULL,
	first_name text DEFAULT ''::text NULL,
	last_name text DEFAULT ''::text NULL,
	email text DEFAULT ''::text NULL,
	plan text DEFAULT 'FREE'::text NULL,
	CONSTRAINT collectors_pkey PRIMARY KEY (collector_id)
);

ALTER TABLE public.collectors ADD CONSTRAINT collectors_id_fkey FOREIGN KEY (collector_id) REFERENCES auth.users(id) ON DELETE CASCADE ON UPDATE CASCADE;
