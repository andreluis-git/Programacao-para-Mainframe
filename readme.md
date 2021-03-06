# Sistema médico em COBOL :stethoscope:

#### EXERCÍCIO 1: CADASTRO DO MEDICO

PROGRAMA :  SMP001<br/>
ARQUIVO  :  CADMED<br/>
REGISTRO :  REGMED<br/>
CAMPOS DO REGISTRO :

CAMPO |	FORMATO |	TAMANHO	| ---------
------|--------|---------| ---------
CRM |	NUM |	06 |	KEY PRINCIPAL
NOME|	ALFA|	30|	KEY ALTERNATIVA
ESPECIALIDADE|	NUM|	02	
SEXO|	ALFA|	01	
DATA NASCIMENTO|	NUM	|08|	DDMMAAAA			

**ESPECIALIDADE**
- 01 - CLINICA MEDICA
- 02 – UROLOGIA
- 03 – GINICOLOGISTA
- 04 – PEDIATRIA
- 05 – CARDIOLOGISTA
- ...(COLOCAR DIVERSAS ESPECIALIDADES)

**SEXO**

- M – MASCULINO
- F – FEMENINO

**OBS. :** TODOS OS CAMPOS DEVEM  SER CONSISTIDOS.
- CRM – NÃO PODE SER ZEROS.
- NOME DO MEDICO NÃO PODE FICAR EM BRANCO.
- DATA NASCIMENTO TEM QUE SER UMA DATA VALIDA.

----

##### EXERCÍCIO 2: CADASTRO DA CID( CID = DOENÇA )

PROGRAMA :  SMP002<br/>
ARQUIVO  :  CADCID<br/>
REGISTRO :  REGCID<br/>
CAMPOS DO REGISTRO :

CAMPO |	FORMATO |	TAMANHO	| ---------
------|--------|---------| ---------
CODIGO|	NUM|	04|	KEY PRINCIPAL
DENOMINAÇÃO|	ALFA|	30|	KEY ALTERNATIVA		

**OBS. :** TODOS OS CAMPOS DEVEM  SER CONSISTIDOS.
- CODIGO – NÃO PODE SER ZEROS.
- DENOMINAÇÃONÃO PODE FICAR EM BRANCO.

----

##### EXERCÍCIO 3: CADASTRO DO CONVENIO

PROGRAMA :  SMP003<br/>
ARQUIVO  :  CADCONV<br/>
REGISTRO :  REGCONV<br/>
CAMPOS DO REGISTRO :

CAMPO |	FORMATO |	TAMANHO	| ---------
------|--------|---------| ---------
CODIGO|	NUM	|04|	KEY PRINCIPAL
NOME|	ALFA|	30|	KEY ALTERNATIVA
PLANO|	NUM	|02	|KEY ALTERNATIVA 2	

**PLANO :**
- 01 – ENFERMARIA REGINAL
- 02 – ENFERMARIA NACIONAL
- 03 -ENFERMARIA INTERNACIONAÇ
- 04 – APTO PADRÃO REGINAL
- 05 – APTO PADRAO NACIONAL
- 06 -APTO PADRAO INTERNACIONAL
- 07 – EMERGENCIA REGIONAL
- 08 – EMERGENCIA NACIONAL
- 09 – EMERCENCIA INTERNACIONAL
- 10 – PLANO GLOBAL  
- 11 - ........

**OBS. :** TODOS OS CAMPOS DEVEM  SER CONSISTIDOS.
- CODIGO – NÃO PODE SER ZEROS.
- NOME DO CONVENIONÃO PODE FICAR EM BRANCO.
- DATA NASCIMENTO TEM QUE SER UMA DATA VALIDA.
- PLANO NÃO PODE SER ZEROS.

----

#### EXERCICO 4: CADASTRO DE PACIENTES

PROGRAMA :  SMP004<br/>
ARQUIVO  :  CADPACI<br/>
REGISTRO :  REGPACI<br/>
CAMPOS DO REGISTRO :

CAMPO |	FORMATO |	TAMANHO	| ---------
------|--------|---------| ---------	
CPF	|NUM|	11|	KEY PRINCIPAL
NOME|	ALFA|	30|	KEY ALTERNATIVA
DATA| NASCIMENTO|	NUM	|08	
SEXO	|ALFA	|01|	F ou M 
GENERO|	ALFA|	01	
CONVENIO|	NUM|	04	
CEP|	NUM|	08	
NUMERO ENDEREÇO|	NUM|	04	
COMPLEMENTO|	ALFA|	10	
TELEFONE|	NUM|	11|	DDD E NUMERO
EMAIL|	ALFA|	30	

**GENERO :**
- N – NÃO DECLARADO
- H –HETEROSEXUAL
- B – BISEXUAL
- T – TRANSEXUAL
- P – PANSEXUAL
- ......
- O - OUTROS

**OBS. :** TODOS OS CAMPOS DEVEM  SER CONSISTIDOS.
- NUMERICOS– NÃO PODE SER ZEROS.
- ALFANUMERICOSNÃO PODE FICAR EM BRANCO.
- DATA NASCIMENTO TEM QUE SER UMA DATA VALIDA.
- CONVENIO DEVE APRESENTAR DADOS CADASTRADOS NO CADCONV

DEPENDE DO EXERCÍCIO NUMERO 05

----

#### EXERCICO 5: CADASTRO DE CEP
PROGRAMA :  SMP005<br/>
ARQUIVO  :  CADCEP<br/>
REGISTRO :  REGCEP<br/>
CAMPOS DO REGISTRO :

CAMPO |	FORMATO |	TAMANHO	| ---------
------|--------|---------| ---------	
CODIGO DO CEP|	NUM|	08|	KEY PRINCIPAL
 ENDEREÇO	|ALFA|	30|	KEY ALTERNATIVA
BAIRRO|	ALFA	|20	
CIDADE|	ALFA	|20	
ESTADO(UNID.FEDERAÇAO)|	ALFA	|02	
			
			

**OBS. :** TODOS OS CAMPOS DEVEM  SER CONSISTIDOS.
- CAMPOS NUMERICOS – NÃO PODE SER ZEROS.
- CAMPOS ALFABETICOSNÃO PODE FICAR EM BRANCO QUANDO OBRIGATORIOS .
- APRESENTAR O ESTADO (UNIDADE DA FEDERAÇÃO ) POR EXTENSO.

----

#### EXERCICO 6: CADASTRO DE CONSULTA
PROGRAMA :  SMP006<br/>                                              
ARQUIVO  :  CADCONSU<br/>
REGISTRO :  REGCONSU<br/>
CAMPOS DO REGISTRO :

CAMPO |	FORMATO |	TAMANHO	| ---------
------|--------|---------| ---------
CPF PACIENTE<br/>DATA DA CONSULTA| NUM<br/>NUM| 11<br/>08| KEY PRINCIPAL(COMPOSTA)
COD MEDICO|	NUM	|06	
COD CONVENIO|	NUM	|04	|VIDE OBSERV. **
COD CID|	NUM	|04	
DESCRIÇÃO CONSULTA 1|	ALFA	|60	
DESCRIÇÃO CONSULTA 2|	ALFA|	60	

**OBS. :** TODOS OS CAMPOS DEVEM  SER CONSISTIDOS.
- CAMPOS NUMERICOS – NÃO PODE SER ZEROS.
- CAMPOS ALFABETICOSNÃO PODE FICAR EM BRANCO QUANDO OBRIGATORIOS .

- DEVEM SER VISUALIZADO QUANDO DIGITADO O  CPF DO PACIENTE,  CODIGO DO MEDICO,  CODIGO CONVENIO E CODIGO DA CID,  VISUALIZADO DADOS REFERENTE AOS CODIGO DIGITADOS.

- PEGAR O CODIGO QUE ESTA NO CADASTRO DE PACIENTES.


```
01 REGCONS.
      03 KEYPRINCIPAL.
           05 CPFPACIENTE          PIC 9(11).       
           05 DATACONSULTA    PIC 9(08).
      03 CODMEDICO                PIC 9(06)
```

----

#### MÓDULOS ADICIONAIS

- SMP007: CONSULTA DE MEDICO
- SMP008: CONSULTA DE ENDERECAMENTO MEDICOS
- SMP009: CONSULTA DE ENDERECAMENTO CEP
- SMP0010: CONVERCAO DO ARQUIVO CADCEP PARA TXT
- SMP0011: CONVERCAO DO ARQUIVO CADCEPTX PARA DAT
- SMP0012: CONVERCAO DO ARQUIVO CADMED PARA TXT
- SMP0013: CONVERCAO DO ARQUIVO CADMEDTX PARA DAT
- SMP0014: RELATORIO DE CEPs
- SMP0015: RELATORIO DE CEPs c/ CABEÇALHO
