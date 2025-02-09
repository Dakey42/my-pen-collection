CREATE TABLE public.tags (
	id int8 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE) NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	collector_id uuid DEFAULT auth.uid() NULL,
	tag text NULL,
	description text NULL,
	CONSTRAINT tags_pkey PRIMARY KEY (id),
	CONSTRAINT tags_collector_id_fkey FOREIGN KEY (collector_id) REFERENCES public.collectors(collector_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE INDEX tags_collector_id_idx ON public.tags USING btree (collector_id);
