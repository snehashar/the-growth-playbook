import { createClient } from '@supabase/supabase-js';

const url = import.meta.env.VITE_SUPABASE_URL?.trim();
const key = import.meta.env.VITE_SUPABASE_ANON_KEY?.trim();

export const SUPABASE_URL = url;
// VITE_* keys are public client keys. Never put a service-role key here.
export const SUPABASE_ANON_KEY = key;

export const configured = Boolean(url && key && !url.includes('YOUR-PROJECT'));

// Keep one browser client so auth state, persisted sessions, and PostgREST
// requests all share the same token lifecycle.
export const db = configured
  ? createClient(url, key, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
      },
    })
  : null;

const projectHost = url ? new URL(url).hostname : '';
const projectRef = projectHost.endsWith('.supabase.co')
  ? projectHost.slice(0, -'.supabase.co'.length)
  : null;

export const TUS_ENDPOINT = url
  ? projectRef
    ? `https://${projectRef}.storage.supabase.co/storage/v1/upload/resumable`
    : `${url.replace(/\/+$/, '')}/storage/v1/upload/resumable`
  : null;

export const BUCKET = 'portfolio-media';
