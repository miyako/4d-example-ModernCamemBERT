//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$inputs:=[\
"Il m'a posé un lapin hier soir."; \
"Il n'est pas venu à notre rendez-vous."\
]

$batch:=$AIClient.embeddings.create($inputs)

$fr1:=$batch.embeddings[0].embedding
$fr2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$fr1.cosineSimilarity($fr2)
//0.9317271103703