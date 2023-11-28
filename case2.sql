-- Cara mengerjakan
-- 1. Buat field parent_name terlebih dahulu dengan default NULL (name tabel kita ibaratkan people)
-- 2. Isi data parent_name berdasarkan parent_id yang ada
-- 3. Hapus tabel parent_id(jika tidak diperlukan)

ALTER TABLE people ADD COLUMN parent_name VARCHAR(255) DEFAULT NULL;

UPDATE people SET parent_name = (SELECT name FROM people p WHERE p.id = people.parent_id) 
WHERE people.parent_id IS NOT NULL;

ALTER TABLE people DROP COLUMN parent_id;
