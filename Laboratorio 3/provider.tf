terraform{
  required_version = "~> 1.6"
required_providers {
  local = {
    source = "hashicorp/local"
    version = "~> 2.5"
      } 
    }
  }
  
#Para configurar as variáveis de ambiente da máquina é necessário definir da seguinte forma por meio de uma CLI do Windows.

#$ export AWS_ACCESS_KEY_ID="anaccesskey"
#$ export AWS_SECRET_ACCESS_KEY="asecretkey"
#$ export AWS_DEFAULT_REGION="us-east-1"