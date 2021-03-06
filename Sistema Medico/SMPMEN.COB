       IDENTIFICATION DIVISION.
       PROGRAM-ID. SMPMEN.
      ****************************************
      * MENU DO SISTEMA DE CONSULTAS MEDICAS *
      ****************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                    DECIMAL-POINT IS COMMA.
      *-----------------------------------------------------------------
       DATA DIVISION.
      *
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       01 W-CONT       PIC 9(04) VALUE ZEROS.
       01 W-OPCAO      PIC 9(02) VALUE ZEROS.
       01 ST-ERRO      PIC X(02) VALUE "00".
       01 MENS         PIC X(50) VALUE SPACES.
       01 LIMPA        PIC X(50) VALUE SPACES.
       01 W-PROGR      PIC X(06) VALUE SPACES.

      *-----------------------------------------------------------------
       01 TAB-PROGR-R.
           03 FILLER PIC X(06) VALUE "SMP001".
           03 FILLER PIC X(06) VALUE "SMP002".
           03 FILLER PIC X(06) VALUE "SMP003".
           03 FILLER PIC X(06) VALUE "SMP004".
           03 FILLER PIC X(06) VALUE "SMP005".
           03 FILLER PIC X(06) VALUE "SMP006".
           03 FILLER PIC X(06) VALUE "SMP007".
           03 FILLER PIC X(06) VALUE "SMP008".
           03 FILLER PIC X(06) VALUE "SMP009".
           03 FILLER PIC X(06) VALUE "SMP010".
           03 FILLER PIC X(06) VALUE "SMP011".
           03 FILLER PIC X(06) VALUE "SMP012".
           03 FILLER PIC X(06) VALUE "SMP013".
           03 FILLER PIC X(06) VALUE "SMP014".
           03 FILLER PIC X(06) VALUE "SMP015".
           03 FILLER PIC X(06) VALUE "      ".
           03 FILLER PIC X(06) VALUE "      ".
           03 FILLER PIC X(06) VALUE "      ".
           03 FILLER PIC X(06) VALUE "      ".
           03 FILLER PIC X(06) VALUE "      ".
      *
       01 TAB-PROGR   REDEFINES TAB-PROGR-R.
          03 TAB-PROG  PIC X(06) OCCURS 20 TIMES.
      **********************
      *
      ******************
      * ROTINA DE TELA *
      ******************
      *
       SCREEN SECTION.
       01  SMTMEN.
           05  BLANK SCREEN.
           05  LINE 02  COLUMN 01 
               VALUE  "                             SISTEMA DE".
           05  LINE 02  COLUMN 41 
               VALUE  "CONSULTAS".
           05  LINE 05  COLUMN 01 
               VALUE  "                1  - CADASTRO D".
           05  LINE 05  COLUMN 32 
               VALUE  "E MEDICOS".
           05  LINE 06  COLUMN 01 
               VALUE  "                2  - CADASTRO D".
           05  LINE 06  COLUMN 32 
               VALUE  "E CIDs".
           05  LINE 07  COLUMN 01 
               VALUE  "                3  - CADASTRO D".
           05  LINE 07  COLUMN 32 
               VALUE  "E CONVENIOS".
           05  LINE 08  COLUMN 01 
               VALUE  "                4  - CADASTRO D".
           05  LINE 08  COLUMN 32 
               VALUE  "E CEP".
           05  LINE 09  COLUMN 01 
               VALUE  "                5  - CADASTRO D".
           05  LINE 09  COLUMN 32 
               VALUE  "E PACIENTE".
           05  LINE 10  COLUMN 01 
               VALUE  "                6  - CADASTRO D".
           05  LINE 10  COLUMN 32 
               VALUE  "E CONSULTAS".
           05  LINE 11  COLUMN 01 
               VALUE  "                7  - CONSULTA D".
           05  LINE 11  COLUMN 32 
               VALUE  "E MEDICOS".
           05  LINE 12  COLUMN 01 
               VALUE  "                8  - CONSULTA D".
           05  LINE 12  COLUMN 32 
               VALUE  "E MEDICOS C/ PAGINACAO".
           05  LINE 13  COLUMN 01 
               VALUE  "                9  - CONSULTA D".
           05  LINE 13  COLUMN 32 
               VALUE  "E CEP C/ PAGINACAO".
           05  LINE 14  COLUMN 01 
               VALUE  "                10 - CONVERTER".
           05  LINE 14  COLUMN 31 
               VALUE  "ARQUIVO DE CEP P/ TXT".
           05  LINE 15  COLUMN 01 
               VALUE  "                11 - CONVERTER".
           05  LINE 15  COLUMN 31 
               VALUE  "ARQUIVO DE CEP TXT P/ DAT".
           05  LINE 16  COLUMN 01 
               VALUE  "                12 - CONVERTER".
           05  LINE 16  COLUMN 31 
               VALUE  "ARQUIVO DE MEDICO P/ TXT".
           05  LINE 17  COLUMN 01 
               VALUE  "                13 - CONVERTER".
           05  LINE 17  COLUMN 31 
               VALUE  "ARQUIVO DE MEDICO TXT P/ DAT".
           05  LINE 18  COLUMN 01 
               VALUE  "                14 - RELATORIO".
           05  LINE 18  COLUMN 31 
               VALUE  "DE CEP P/ IMPRESSAO".
           05  LINE 19  COLUMN 01 
               VALUE  "                15 - RELATORIO".
           05  LINE 19  COLUMN 31 
               VALUE  "DE MEDICO P/ IMPRESSAO".
           05  LINE 21  COLUMN 01 
               VALUE  "                             OPCAO :".
           05  LINE 21  COLUMN 41 
               VALUE  " ( 00 - ENCERRA )".
           05  LINE 23  COLUMN 01 
               VALUE  " MENSAGEM :".
           05  T-OPCAO
               LINE 21  COLUMN 38  PIC 9(02)
               USING  W-OPCAO
               HIGHLIGHT.
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.

      ****************************
      * ROTINA DE SELECAO NIVEL1 *
      ****************************
      *
       NIVEL1.
           DISPLAY SMTMEN.
           
           ACCEPT T-OPCAO.
           IF W-OPCAO = 00
                      GO TO ROT-FIM.
           IF W-OPCAO > 20 
                 MOVE "*** FUNCAO NAO DISPONIVEL *** " TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO NIVEL1.
           MOVE TAB-PROG(W-OPCAO) TO W-PROGR
           IF W-PROGR = SPACES
                 MOVE "*** FUNCAO NAO IMPLEMENTADA *** " TO MENS
                 PERFORM ROT-MENS THRU ROT-MENS-FIM
                 GO TO NIVEL1.

       ROT-EXEC.
           CALL W-PROGR ON OVERFLOW
              MOVE "* ERRO NA CHAMADA DO PROGRAMA SELECIONADO *" TO MENS
              PERFORM ROT-MENS THRU ROT-MENS-FIM
              GO TO ROT-EXEC1.
           CANCEL W-PROGR.
      *
       ROT-EXEC1.
           GO TO NIVEL1.
      *
      **********************
      * ROTINA DE FIM      *
      **********************
      *
       ROT-FIM.
           EXIT PROGRAM.
       ROT-FIM1.
           DISPLAY (01, 01) ERASE.
           STOP RUN.
      *
      **********************
      * ROTINA DE MENSAGEM *
      **********************
      *
       ROT-MENS.
           MOVE ZEROS TO W-CONT.
       ROT-MENS1.
           DISPLAY (23 12) MENS.
       ROT-MENS2.
           ADD 1 TO W-CONT
           IF W-CONT < 3000
              GO TO ROT-MENS2
           ELSE
              DISPLAY (23 12) LIMPA.
       ROT-MENS-FIM.
      *
      *---------------------*** FIM DE PROGRAMA ***--------------------*