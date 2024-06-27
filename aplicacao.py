import mysql.connector
from mysql.connector import errorcode
from funcoes import cria_tabelas, adiciona_dados, executa_consulta1, executa_consulta2, executa_consulta3, exclui_tabelas

# Faz a conexão com o banco de dados MySQL
try:
    conexao = mysql.connector.connect(
        user = 'root',
        password = '164528',
        host = 'localhost',
        database = "bd_parque_ecologico"
    )

    while True:
        print("\n\n------Selecione a operação------\n",
              "1- Criar tabelas\n",
              "2- Adicionar dados\n",
              "3- Consulta 1\n",
              "4- Consulta 2\n",
              "5- Consulta 3\n",
              "6- Exclui tabelas\n",
              "0- Sair do programa\n")
        operacao = input("Operação: ")

        if operacao == "1":
            cria_tabelas(conexao)
        
        elif operacao == "2":
            adiciona_dados(conexao)

        elif operacao == "3":
            executa_consulta1(conexao)

        elif operacao == "4":
            executa_consulta2(conexao)

        elif operacao == "5":
            executa_consulta3(conexao)

        elif operacao == "6":
            exclui_tabelas(conexao)

        elif operacao == "0":
            conexao.close()
            break
        else:
            print("Operação inválida")

# Checa o tipo de erro
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("User ou Passaword estão errados")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database não existe")
    else:
        print(err)

