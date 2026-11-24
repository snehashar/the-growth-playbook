-- Replace sneha20sharma2005@gmail.com with the exact email used for admin login, then run in Supabase SQL Editor.
create table if not exists public.portfolio_profile(id integer primary key check(id=1),photo_url text,intro_video_url text,updated_at timestamptz default now());
insert into public.portfolio_profile(id) values(1) on conflict(id) do nothing;
create table if not exists public.portfolio_projects(id uuid primary key default gen_random_uuid(),title text not null,category text,description text,url text,thumbnail_url text,media_type text default 'link',featured boolean default false,created_at timestamptz default now());
alter table public.portfolio_profile enable row level security; alter table public.portfolio_projects enable row level security;
create policy "Public read profile" on public.portfolio_profile for select using(true);
create policy "Public read projects" on public.portfolio_projects for select using(true);
create policy "Admin write profile" on public.portfolio_profile for all using((auth.jwt()->>'email')='sneha20sharma2005@gmail.com') with check((auth.jwt()->>'email')='sneha20sharma2005@gmail.com');
create policy "Admin write projects" on public.portfolio_projects for all using((auth.jwt()->>'email')='sneha20sharma2005@gmail.com') with check((auth.jwt()->>'email')='sneha20sharma2005@gmail.com');
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types) values('portfolio-media','portfolio-media',true,262144000,array['image/jpeg','image/png','image/webp','video/mp4','video/webm','video/quicktime']) on conflict(id) do update set public=true,file_size_limit=262144000,allowed_mime_types=excluded.allowed_mime_types;
create policy "Admin upload media" on storage.objects for insert to authenticated with check(bucket_id='portfolio-media' and (auth.jwt()->>'email')='sneha20sharma2005@gmail.com');
create policy "Admin update media" on storage.objects for update to authenticated using(bucket_id='portfolio-media' and (auth.jwt()->>'email')='sneha20sharma2005@gmail.com') with check(bucket_id='portfolio-media' and (auth.jwt()->>'email')='sneha20sharma2005@gmail.com');
create policy "Admin delete media" on storage.objects for delete to authenticated using(bucket_id='portfolio-media' and (auth.jwt()->>'email')='sneha20sharma2005@gmail.com');
