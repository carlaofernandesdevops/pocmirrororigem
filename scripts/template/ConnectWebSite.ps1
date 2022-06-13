[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=0,HelpMessage="url do sistema")]
   [string]$website,
   
   [Parameter(Mandatory=$True,Position=1,HelpMessage="timeout em segundos")]
   [int]$timeout
)

function Test-Website($website, $timeout) 
{

    try 
    {
        Write-Host 'Acessando o website:' $website 'com timeout'  $timeout '(segundos)'
        $Response = Invoke-WebRequest -Uri $website -TimeoutSec $timeout -UseBasicParsing
        Write-Host 'Codigo de Resposta do Servidor:' $Response.StatusCode
        if ($Response.StatusCode -eq 200)
        {
          exit 0 
        }
        else 
        {
          exit 1
          return 
        }
    }
    catch [Exception]
    {
        Write-Host 'ERRO NA EXECUCAO DO SCRIPT:' $_.Exception.Message
        exit 1 
        return 
    }
}

Test-Website $website $timeout 
  