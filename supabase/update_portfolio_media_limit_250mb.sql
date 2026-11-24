-- Raise the existing portfolio-media bucket limit without changing its policies.
update storage.buckets
set file_size_limit = 262144000
where id = 'portfolio-media';
