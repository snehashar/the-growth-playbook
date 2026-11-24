import { createClient } from '@supabase/supabase-js';

const url = import.meta.env.VITE_SUPABASE_URL?.trim();
const key = import.meta.env.VITE_SUPABASE_ANON_KEY?.trim();

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

export const BUCKET = 'portfolio-media';
