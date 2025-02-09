CREATE TABLE public.collections (
	id int8 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE) NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	collector_id uuid DEFAULT auth.uid() NOT NULL,
	pen_id int8 NOT NULL,
	"owned" int2 DEFAULT '1'::smallint NULL,
	tag _text NULL,
	CONSTRAINT collections_pkey PRIMARY KEY (id),
	CONSTRAINT collections_collector_id_fkey FOREIGN KEY (collector_id) REFERENCES public.collectors(collector_id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT collections_pen_id_fkey FOREIGN KEY (pen_id) REFERENCES public.pens(pen_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE INDEX collections_collector_id_tag_idx ON public.collections USING btree (collector_id, tag);
