# The Growth Playbook — Sneha Sharma
Responsive React + Vite portfolio with Supabase email/password admin authentication, Row Level Security, profile photo and video uploads, and editable project cards.

## Setup
1. Install Node.js 20+ and run `npm install`.
2. Copy `.env.example` to `.env`.
3. Create a Supabase project at https://supabase.com. Copy Project URL and anon/publishable key from Project Settings → API into `.env`.
4. In `supabase/schema.sql`, replace every `YOUR_ADMIN_EMAIL` with your exact admin email, then run the SQL in Supabase SQL Editor.
5. In Supabase Authentication → Users, create your admin user with that same email and a strong password.
6. Run `npm run dev`.

Never use the Supabase service-role key in browser code. SQL policies limit write access to the configured admin email. Public reads and public media URLs are enabled because this is a public portfolio.

## Deploy
Deploy to Vercel or Netlify. Build command: `npm run build`; output folder: `dist`. Add `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` as hosting environment variables. Configure the deployed URL in Supabase Authentication → URL Configuration.

This is source code, not a deployed/live website. It includes sample project cards based on the work discussed; replace them with final real project details and upload your photo and intro video before sharing with recruiters. Image upload limit: 8 MB. Video upload limit: 250 MB.
