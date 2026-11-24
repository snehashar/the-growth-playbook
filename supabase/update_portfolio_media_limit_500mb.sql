-- Raise the existing portfolio-media bucket limit without changing its policies.
update storage.buckets
set file_size_limit = 524288000
where id = 'portfolio-media';
