-- número de visitantes maiores que 18 anos por parque no ano de 2022
SELECT parque_ecologico.NOME, COUNT(visita.COD_VISITA) AS CONTAGEM
FROM bd_parque_ecologico.visita
INNER JOIN bd_parque_ecologico.visitante USING (COD_VISITANTE)
INNER JOIN bd_parque_ecologico.parque_ecologico USING (COD_PARQUE)
WHERE YEAR(DATA_VISITA) = 2022 AND visitante.DATA_NASCIMENTO <= '2005-12-01'
GROUP BY parque_ecologico.NOME;

-- Média das quantidades totais observadas da espécie de código 2 por parque parque e as temperaturas médias nesses parques
SELECT parque_ecologico.nome, AVG(registro_climatico.TEMPERATURA) AS MEDIA_TEMPERATURA, AVG(especie_parque.quantidade) AS MEDIA_QUANTIDADE
FROM bd_parque_ecologico.parque_ecologico
INNER JOIN bd_parque_ecologico.registro_climatico USING (COD_PARQUE)
INNER JOIN bd_parque_ecologico.especie_parque USING (COD_PARQUE)
WHERE especie_parque.COD_ESPECIE = 2
GROUP BY parque_ecologico.nome;

-- Quantos eventos e quantos participantes por parque
SELECT parque_ecologico.nome, COUNT(evento.cod_evento) AS QUANT_EVENTOS, COUNT(participacao.cod_participacao) AS QUANT_PARTICIPANTES
FROM bd_parque_ecologico.evento_parque
INNER JOIN bd_parque_ecologico.evento USING(COD_EVENTO)
INNER JOIN bd_parque_ecologico.participacao USING (COD_EVENTO_PARQUE)
INNER JOIN bd_parque_ecologico.parque_ecologico USING (COD_PARQUE)
GROUP BY parque_ecologico.nome;