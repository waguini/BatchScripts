@ECHO OFF
ECHO.
ECHO.
ECHO 			**************************
ECHO 			** Criacao de estrutura **
ECHO 			**     de pastas        **
ECHO 			**************************
ECHO.
ECHO.

:start
ECHO 			..::Telefonica \ VIVO::..
ECHO.
ECHO.

set /p projeto="Informe o PROJETO - (Ex: 1124):"
ECHO.
set /p demanda="Informe o TICKET DO JIRA - (Ex: DEMOSS-527):"
ECHO.
set /p sistem="Informe o Sistema Trabalhado- (Ex: MANOBRA UNIFICADA):"
ECHO.
set /p autor="Informe seu nome Completo :"
ECHO.
set /p git="Informe o AMBIENTE (url da branch do sistema alterado)  :"
ECHO.

:dirCreate

CALL :upper demanda

:upper
FOR %%a IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO CALL SET "%1=%%%1:%%a=%%a%%%"

MKDIR "%projeto%"\"%demanda%"
IF %ERRORLEVEL% == 1 GOTO start
CD "%projeto%"\"%demanda%"
GOTO folderStruct


:folderStruct
MKDIR "00 - AM 125"
MKDIR "01 - Entry Criteria"
MKDIR "02 - PTMON"
MKDIR "03 - Peer Review"
MKDIR "04 - Exit Criteria"
MKDIR "05 - Documentacao de Entrada"
MKDIR "06 - Matriz de Rastreabilidade"
MKDIR "07 - Emails"

ECHO *********************************
ECHO ******* Estrutura Criada ********
ECHO *********************************

@SET /a sistema=%sistema%

@SET  i=0

CD..

COPY "..\templates\01_Documentacao\00 - AM 125\AM125 - [demanda].xlsm" "..\%projeto%\%demanda%\00 - AM 125\AM125 - [%demanda%]_TEMPLATE.xlsm"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - AM125 - [%demanda%]_TEMPLATE.xlsm

COPY "..\templates\01_Documentacao\01 - Entry Criteria\TLF - Entry Criteria - [demanda].xlsx" "..\%projeto%\%demanda%\01 - Entry Criteria\TLF - Entry Criteria - [%demanda%]_TEMPLATE.xlsx"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - TLF - Entry Criteria - [%demanda%]_TEMPLATE.xlsx

COPY "..\templates\01_Documentacao\02 - PTMON\TLF - PTMON - [demanda].docx" "..\%projeto%\%demanda%\02 - PTMON\TLF - PTMON - [%demanda%]_TEMPLATE.docx"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - TLF - PTMON - [%demanda%]_TEMPLATE.docx

COPY "..\templates\01_Documentacao\03 - Peer Review\TLF - Peer Review - [demanda].xls" "..\%projeto%\%demanda%\03 - Peer Review\TLF - Peer Review - [%demanda%]_TEMPLATE.xls"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - TLF - Peer Review - [%demanda%]_TEMPLATE.xls

COPY "..\templates\01_Documentacao\04 - Exit Criteria\TLF - Exit Criteria - [demanda].xlsx" "..\%projeto%\%demanda%\04 - Exit Criteria\TLF - Exit Criteria - [%demanda%]_TEMPLATE.xlsx"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - TLF - Exit Criteria - [%demanda%]_TEMPLATE.xlsx

COPY "..\templates\01_Documentacao\06 - Matriz de Rastreabilidade\TLF - Matriz de Rastreabilidade - [demanda].xlsx" "..\%projeto%\%demanda%\06 - Matriz de Rastreabilidade\TLF - Matriz de Rastreabilidade - [%demanda%]_TEMPLATE.xlsx"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - TLF - Matriz de Rastreabilidade - [%demanda%]_TEMPLATE.xlsx

COPY "..\templates\01_Documentacao\justificativa.txt" "..\%projeto%\%demanda%\"
IF %ERRORLEVEL% == 1 SET /a i=%i%+1
IF %ERRORLEVEL% == 0 ECHO Criado - justificativa.txt

GOTO encerramento

:encerramento
IF %ERRORLEVEL% NEQ 0 (	
	GOTO endWhitErrors
)

IF %ERRORLEVEL% == 0 (
	GOTO end
)

:endWhitErrors
ECHO Estrutura criada, %i% templates nao copiados!
PAUSE
EXIT

:end
ECHO Estruturas criadas com sucesso!


ECHO Rodando script em Python para preencher os documentos
CD..
py python_edita_excel.py %projeto% %demanda% "%sistem%" "%autor%" "%git%"
PAUSE
EXIT