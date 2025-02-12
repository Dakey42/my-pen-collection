CREATE TABLE public.pens (
	pen_id int8 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE) NOT NULL,
	created_at timestamptz DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
	brand text DEFAULT ''::text NULL,
	"type" text DEFAULT ''::text NULL,
	description text DEFAULT ''::text NULL,
	"name" text DEFAULT ''::text NULL,
	rarity text DEFAULT ''::text NULL,
	"version" int2 DEFAULT '0'::smallint NOT NULL,
	"date" date NULL,
	series text DEFAULT ''::text NULL,
	"ref" text DEFAULT ''::text NULL,
	CONSTRAINT pens_pkey PRIMARY KEY (pen_id)
);
CREATE INDEX pens_brand_idx ON public.pens USING btree (brand);
CREATE INDEX pens_brand_type_name_version_idx ON public.pens USING btree (brand, type, name, version);
