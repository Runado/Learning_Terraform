provider "aws" {
  region = "us-east-1"
  #access_key = "ajseijsaoijesaoij"
  #secret_key = "oijeaoesaoikesapokeapopokspoakespo"
  #é possível definir as credentials keys dentro do bloco de provider.
  
}

#Para configurar as variáveis de ambiente da máquina é necessário definir da seguinte forma por meio de uma CLI do Windows.

#$ export AWS_ACCESS_KEY_ID="anaccesskey"
#$ export AWS_SECRET_ACCESS_KEY="asecretkey"
#$ export AWS_DEFAULT_REGION="us-east-1"