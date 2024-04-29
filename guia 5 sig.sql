-- Database: sig

-- Ejercicio 1
SELECT parcel.geom
FROM public."Sismos historicos UTM" as sismos, public."Parcelario SS OPAMSS UTM" as
parcel
where public._st_dwithin(
sismos.geom,
parcel.geom,
500
)

-- Ejercicio 2
SELECT escuelas."NOMBRE_CEN", escuelas.geom
FROM escuelas, volcanes
where
escuelas."DEPARTAMEN" = 'SAN SALVADOR' and
volcanes."NAM" = 'Volcán de San Salvador' and
public._st_dwithin(
escuelas.geom,
volcanes.geom,
10000
) = false

-- Ejercicio 3
SELECT escuelas."NOMBRE_CEN", escuelas.geom
FROM escuelas, municipios
WHERE
municipios."POB_MUJER" > municipios."POB_HOMB" and
public.st_contains(
	municipios.geom,
escuelas.geom
)

-- Ejercicio 4
SELECT 
    escuelas."NOMBRE_CEN", 
    escuelas.geom
FROM 
    escuelas
JOIN 
    municipios ON ST_Contains(municipios.geom, escuelas.geom)
LEFT JOIN 
    red_vial ON ST_DWithin(escuelas.geom, red_vial.geom, 3500) AND red_vial."COD_MOP" = 'CA04S'
WHERE
    municipios."NOM_MUN" = 'SANTA TECLA'
    AND red_vial.geom IS NULL;


-- consultas de pruebas xd

SELECT red_vial."TRAM"
FROM red_vial
WHERE red_vial."COD_MOP" = 'CA04S'

-- no estaba santa tecla, que diabolico xd
SELECT escuelas."NOMBRE_CEN"
FROM escuelas
WHERE escuelas."MUNICIPIO" = 'SANTA TECLA'


-- Ejercicio 5

SELECT escuelas.geom
FROM escuelas, inundaciones
WHERE public.st_contains(
	inundaciones.geom,
	escuelas.geom
) --da error :(

-- Ejercicio 6

SELECT escuelas."NOMBRE_CEN", escuelas.geom
FROM escuelas, volcanes
where
escuelas."ZONA" = 'Urbano' and
volcanes."NAM" = 'Volcán de Santa Ana' and
public._st_dwithin(
escuelas.geom,
volcanes.geom,
10000
) 

-- Ejercicio 7





