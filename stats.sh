#!/bin/bash

echo "### Types"
echo

TYPES=("ACUERDOS" \
  "COMUNICACION DEL P.EJECUTIVO" \
  "COMUNICACIONES DE COMISIONES" \
  "COMUNICACIONES DE DIPUTADOS" \
  "COMUNICACIONES DE SENADORES" \
  "DECRETO" \
  "MENSAJE DE SENADO" \
  "MENSAJE DIPUTADOS" \
  "PETICIONES" \
  "PROYECTO DE COMUNICACION" \
  "PROYECTO DE DECLARACION" \
  "PROYECTO DE DECRETO" \
  "PROYECTO DE LEY" \
  "PROYECTO DE RESOLUCION" \
  "RESOLUCION CONJUNTA" \
  "RESPUESTA DE PRESIDENCIA")

for type in "${TYPES[@]}"; do
  count=`grep -l -r "\"type\":\"$type\"" bills | wc -l`

  if [ $count -gt 0 ]; then
    echo "$type: $count"
    echo
  fi
done

count_senators=`grep -lr "\"source\":\"Senado\",\"file\"" bills | wc -l`
count_legislative=`grep -lr "\"source\":\"Diputados\",\"file\"" bills | wc -l`

echo "### Source"
echo
echo "SENADO: $count_senators"
echo
echo "DIPUTADOS: $count_legislative"
echo

echo "### Blocks"
echo

BLOCKS=("FRENTE PARA LA VICTORIA - PJ" \
  "UCR" \
  "UNION PRO" \
  "FRENTE RENOVADOR" \
  "PARTIDO SOCIALISTA" \
  "FRENTE CIVICO POR SANTIAGO" \
  "COMPROMISO FEDERAL" \
  "GEN" \
  "FRENTE NUEVO ENCUENTRO" \
  "UNIDAD POPULAR" \
  "COALICION CIVICA ARI - UNEN" \
  "MOVIMIENTO POPULAR NEUQUINO" \
  "UNION POR CORDOBA" \
  "FRENTE CIVICO - CORDOBA"
  "FRENTE CIVICO Y SOCIAL DE CATAMARCA" \
  "TRABAJO Y DIGNIDAD" \
  "FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES" \
  "CULTURA, EDUCACION Y TRABAJO" \
  "SUMA + UNEN" \
  "DEMOCRATA DE MENDOZA" \
  "LIBRES DEL SUR" \
  "MOVIMIENTO POPULAR FUEGUINO" \
  "PERONISMO MAS AL SUR" \
  "FRENTE POR LA INCLUSION SOCIAL" \
  "UNION CELESTE Y BLANCO" \
  "UNION POR ENTRE RIOS" \
  "PROYECTO SUR - UNEN" \
  "MOVIMIENTO SOLIDARIO POPULAR" \
  "PARTIDO JUSTICIALISTA LA PAMPA" \
  "PTS - FRENTE DE IZQUIERDA" \
  "CONSERVADOR POPULAR" \
  "BLOQUE FE" \
  "UNIR")

for block in "${BLOCKS[@]}"; do
  count=`grep -l -r "\"party\":\"$block\"" bills | wc -l`

  echo "$block: $count"
  echo
done
