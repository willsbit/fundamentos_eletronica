#import "lib.typ"
#import "@preview/zero:0.2.0": num

#show: lib.technical-report.with(
  course-code: "UFSM00055",
  course-name: "Fundamentos da Eletrônica",
  subtitle: [Aula Prática 3 - Diodo semicondutor],
  authors: ("Willian Chamma",),
  institution: ("Universidade Federal de Santa Maria", "Centro de Tecnologia"),
  date: datetime.today(),
)

= Introdução

#set par(first-line-indent: (amount: 1em, all: true))
A presente atividade prática tem como verificar o funcionamento de um diodo semicondutor quando conectado a uma fonte com polarização direta e reversa. A partir de medições com um multímetro, é possível extrair a curva $I_d times V_d$ característica do diodo.

= Métodos

Utilizou-se uma fonte CC, um multímetro Minipa e um resistor de 10~$Omega$ para obter a curva de operação de um diodo semicondutor IN4148.

Um circuito série (@circuito) foi montado em _protoboard_ para as medições. A tensão da fonte foi variada de #num("0.1", decimal-separator: ",") V a #num("1.0", decimal-separator: ",")  V, em passos de #num("0.1", decimal-separator: ",")~V.

#figure(
  image("circuito_diodo_resistor.pdf", width: 70%),
  caption: [Circuito serie e pontos de medida de tensão elétrica.],
) <circuito>

= Resultados

A partir do teste do multímetro, obteve-se

Por meio de medições de tensões e cálculos de correntes em um circuito em série, analisou-se o diodo 1N4148. Calculando a resistência CC e resistência CA do dispositivo, foi possível comparar os dados experimentais com as previsões teóricas do modelo linear por partes, modelo simplificado e diodo ideal. Assim validando a aplicabilidade de modelos aproximados do diodo.
