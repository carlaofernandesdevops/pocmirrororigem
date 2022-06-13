echo on
echo "Etapa iniciada - Verificacao de exclusao de arquivos"
echo off
if /i "sim" NEQ %1 goto end
IF EXIST %2\web.config del /F  %2\web.config
IF EXIST %2\web.debug.config del /F  %2\web.debug.config
IF EXIST %2\web.release.config del /F  %2\web.release.config
echo on
echo "Arquivos de configuracao excluidos com sucesso"
:end
echo "Etapa finalizada - Verificacao de exclusao de arquivos"