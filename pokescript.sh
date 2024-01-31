

if [ $# -eq 0 ]; then
    echo "Se debe proporcionar el nombre de un Pokemon como primer argumento"
    else
    pokemon=$1


api_url="https://pokeapi.co/api/v2/pokemon/$pokemon/"

response=$(curl -s "$api_url" | jq '.' 2>/dev/null)


if [ "$(echo "$response" | jq -r '.detail')" != "null" ]; then
    echo "No se encontro información del pokemon: $pokemon"
    else

id=$(echo "$response" | jq -r '.id')
name=$(echo "$response" | jq -r '.name')
weight=$(echo "$response" | jq -r '.weight')
height=$(echo "$response" | jq -r '.height')
order=$(echo "$response" | jq -r '.order')


echo "$name (No. $id)"
echo "Id = $id"
echo "Weight = $weight"
echo "Height = $height"

fi


fi



