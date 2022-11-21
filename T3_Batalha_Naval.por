programa
{
	inclua biblioteca Util --> u

	inteiro naviosDerrubados = 0
	inteiro tentativas = 0
	
	funcao inicio()
	{
		caracter campoPrimeiroJogador[5][5]
		caracter linhasPrimeiroJogador[5] 
		inteiro colunasPrimeiroJogador[5]
		montarCampo(campoPrimeiroJogador, linhasPrimeiroJogador, colunasPrimeiroJogador)
	}

	funcao montarCampo(caracter campo[][], caracter linhasPrimeiroJogador[],inteiro colunas[]){
		caracter letras[5] = {'A', 'B', 'C', 'D', 'E'}
		escreva("SIMULADOR PEARL HARBOR JAPAO X EUA \n")
		para(inteiro i = 0; i <= 4; i++){
			escreva("  ",i)
		}
		para(inteiro i = 0; i < 5; i++){
			para(inteiro j = 0; j < 5; j++){
				campo[i][j] = 'X'
			}
		}
		geraNavios(campo, letras, linhasPrimeiroJogador, colunas)
		escreva("\n")
	}

	funcao preencher_unicamente(inteiro linhas[], inteiro colunas[], inteiro tamanho, inteiro minimo, inteiro maximo){
		inteiro novaLinhaAleatoria
		inteiro novaColunaAleatoria
		inteiro unico

		para(inteiro i = 0; i < tamanho; i++){
			faca{
				novaLinhaAleatoria = u.sorteia(minimo, maximo)
				novaColunaAleatoria = u.sorteia(minimo, maximo)
				unico = 0

				para(inteiro j = 0; j < i; j++){
					se (linhas[j] == novaLinhaAleatoria e colunas[j] == novaColunaAleatoria){
						unico = 1
					}
				}
			} enquanto(unico == 1)

			linhas[i] = novaLinhaAleatoria
			colunas[i] = novaColunaAleatoria
		}
	}

	funcao geraNavios(caracter campo[][], caracter letras[], caracter linhas[], inteiro colunas[]){
		inteiro colunasNavios[5] = {u.sorteia(1, 5), u.sorteia(1, 5), u.sorteia(1, 5), u.sorteia(1, 5), u.sorteia(1, 5)}
		inteiro colunasIndice[5]

		inteiro linhasNavios[5]
		inteiro colunasNaviosVetor[5]
		preencher_unicamente(linhasNavios, colunasNaviosVetor, 5, 0, 4)
		
		para(inteiro i = 0; i < 5; i++){
			colunas[i] = colunasNaviosVetor[i]
			linhas[i] = letras[linhasNavios[i]] 
			colunasIndice[i] = linhasNavios[i]
			//escreva(colunas[i], linhas[i], "\n")// <-- HACK
		}
		
		para(inteiro i = 0; i < 5; i++){
			escreva("\n")
			escreva(letras[i])
			para(inteiro j = 0; j < 5; j++){
				escreva(" ", campo[i][j], " ")
			}
		}

		enquanto(naviosDerrubados != 5){
			tentativa(campo, linhas, colunas, colunasIndice)	
		}

		finalizarJogo()
	}

	funcao printarCampo(caracter campo[][]){
		limpa()
		caracter letras[5] = {'A', 'B', 'C', 'D', 'E'}
		escreva("SIMULADOR PEARL HARBOR JAPAO X EUA \n")
		para(inteiro i = 0; i <= 4; i++){
			escreva("  ",i)
		}
		para(inteiro i = 0; i < 5; i++){
			escreva("\n")
			escreva(letras[i])
			para(inteiro j = 0; j < 5; j++){
				escreva(" ", campo[i][j], " ")
			}
		}
	}

	funcao inteiro retornaIndice(caracter linha){
		caracter letras[5] = {'A', 'B', 'C', 'D', 'E'} 

		para(inteiro i = 0; i < 5; i++){
			se(letras[i] == linha){
				retorne i
			}
		}

		retorne 0
	}

	funcao tentativa(caracter campo[][], caracter linhas[], inteiro colunas[], inteiro colunasIndice[]){
		caracter linhaTentada
		inteiro colunaTentada
		
		escreva("\nEm qual coluna deseja bombardear? ")
		leia(colunaTentada)
		escreva("\nEm qual linha deseja bombardear? ")
		leia(linhaTentada)

		inteiro indice = retornaIndice(linhaTentada)
		tentativas += 1
		inteiro marcou = 1

		para(inteiro i = 0; i < 5; i++){
			se(colunaTentada == colunas[i] e linhaTentada == linhas[i]){
				naviosDerrubados += 1
				campo[indice][colunaTentada] = 'N'
				marcou = 0
				pare
			} 
		}

		se(marcou == 1){
			campo[indice][colunaTentada] = '~'
		}
		printarCampo(campo)
	}

	funcao finalizarJogo(){
		escreva("\nParabéns. Você achou todos os navios, com apenas ", tentativas, " tentativas!")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1883; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */