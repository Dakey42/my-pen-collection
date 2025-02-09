-- https://supabase.com/docs/guides/auth/managing-user-data

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY definer set search_path = ''
AS $function$
begin
  insert into public.collectors (collector_id
                            , name
                            , first_name
                            , last_name
                            , email)
  values (new.id
        , new.raw_user_meta_data ->> 'name'
        , new.raw_user_meta_data ->> 'first_name'
        , new.raw_user_meta_data ->> 'last_name'
        , new.raw_user_meta_data ->> 'email'
        );
  return new;
end;$function$
;
