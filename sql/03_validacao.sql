USE catalogo_livros;

SELECT
    (SELECT COUNT(*) FROM estado)  AS qtd_estados,
    (SELECT COUNT(*) FROM cidade)  AS qtd_cidades,
    (SELECT COUNT(*) FROM usuario) AS qtd_usuarios;

SELECT u.id_usuario, u.id_cidade
FROM usuario u
LEFT JOIN cidade c ON c.id_cidade = u.id_cidade
WHERE u.id_cidade IS NOT NULL AND c.id_cidade IS NULL;

SELECT c.id_cidade, c.id_estado
FROM cidade c
LEFT JOIN estado e ON e.id_estado = c.id_estado
WHERE e.id_estado IS NULL;

SELECT COUNT(*) AS total, COUNT(DISTINCT email) AS distintos
FROM usuario;

SELECT u.id_usuario, u.nome, c.nome AS cidade, e.uf, e.nome AS estado
FROM usuario u
JOIN cidade c ON c.id_cidade = u.id_cidade
JOIN estado e ON e.id_estado = c.id_estado
ORDER BY u.id_usuario
LIMIT 10;

SELECT e.uf, COUNT(*) AS usuarios
FROM usuario u
JOIN cidade c ON c.id_cidade = u.id_cidade
JOIN estado e ON e.id_estado = c.id_estado
GROUP BY e.uf
ORDER BY usuarios DESC;

SELECT
    (SELECT COUNT(DISTINCT uf) FROM estado) AS ufs_armazenadas,
    (SELECT COUNT(*) FROM usuario)          AS linhas_de_usuario;
