#!/bin/bash
# Consultas LDAP para el directorio coolcompany.org
# Uso: bash consultas_ldap.sh
# Se asume que el servidor LDAP está en localhost con el admin por defecto.

BASE="dc=coolcompany,dc=org"
ADMIN="cn=admin,dc=coolcompany,dc=org"

echo "=============================================="
echo " 1. Todo el contenido del directorio"
echo "=============================================="
ldapsearch -x -b "$BASE" "(objectClass=*)"

echo "=============================================="
echo " 2. Solo la ou llamada informaticos"
echo "=============================================="
ldapsearch -x -b "$BASE" "(ou=informaticos)"

echo "=============================================="
echo " 3. Buscar usuario por uid (ejemplo: amartinez)"
echo "=============================================="
ldapsearch -x -b "$BASE" "(uid=amartinez)"

echo "=============================================="
echo " 4. Solo el atributo cn de todos los usuarios"
echo "=============================================="
ldapsearch -x -b "$BASE" "(objectClass=inetOrgPerson)" cn

echo "=============================================="
echo " 5. Usuarios cuyo uid empiece por la letra a"
echo "=============================================="
ldapsearch -x -b "$BASE" "(uid=a*)"

echo "=============================================="
echo " 6. Usuarios con sn igual a Martinez"
echo "=============================================="
ldapsearch -x -b "$BASE" "(sn=Martinez)"

echo "=============================================="
echo " 7. Usuarios en ou=ventas con cn que NO empiece por s"
echo "=============================================="
ldapsearch -x -b "ou=ventas,$BASE" "(&(objectClass=inetOrgPerson)(!(cn=s*)))"

echo "=============================================="
echo " 8. Todos los objetos de tipo inetOrgPerson"
echo "=============================================="
ldapsearch -x -b "$BASE" "(objectClass=inetOrgPerson)"
