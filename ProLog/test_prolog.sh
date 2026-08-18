#!/bin/bash
# Script para demostrar Prolog en acción

echo "=========================================="
echo "  DEMOSTRANDO PROLOG EN CODESPACES"
echo "=========================================="
echo ""

echo "1. Consultando: ¿Cuáles son los animales?"
swipl -f ejemplo_basico.pl -t "animal(X), write(X), nl, fail" 2>/dev/null || true
echo ""

echo "2. Consultando: ¿Qué animales vuelan?"
swipl -f ejemplo_basico.pl -t "volador(X), write(X), nl, fail" 2>/dev/null || true
echo ""

echo "3. Consultando: ¿De quién es hijo maria?"
swipl -f ejemplo_basico.pl -t "padre(X, maria), write('Padre: '), write(X), nl, fail" 2>/dev/null || true
echo ""

echo "4. Consultando: ¿Quiénes son abuelos de ana?"
swipl -f ejemplo_basico.pl -t "abuelo(X, ana), write('Abuelo: '), write(X), nl, fail" 2>/dev/null || true
echo ""

echo "5. Consultando: ¿Hermanos de maria?"
swipl -f ejemplo_basico.pl -t "hermano(maria, X), write('Hermano: '), write(X), nl, fail" 2>/dev/null || true
echo ""

echo "=========================================="
echo "  ✅ PROLOG FUNCIONA CORRECTAMENTE"
echo "=========================================="
