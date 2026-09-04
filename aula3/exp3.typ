#import "../lib.typ"
#import "@preview/zero:0.2.0": num
#import "@preview/subpar:0.2.2"

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
A presente atividade prática tem como objetivo verificar o funcionamento de um diodo semicondutor quando conectado a uma fonte com polarização direta e reversa. A partir de medições com um multímetro, é possível extrair a curva $I_d times V_d$ característica do diodo.

= Métodos

Utilizou-se uma fonte CC, um multímetro Minipa e um resistor de 10~$Omega$ para obter a curva de operação de um diodo semicondutor IN4148.

Um circuito série (@circuito) foi montado em _protoboard_ para as medições. A tensão da fonte foi variada de #num("0.1", decimal-separator: ",") V a #num("1.0", decimal-separator: ",")  V, em passos de #num("0.1", decimal-separator: ",")~V. Na primeira configuração, as medidas foram feitas com o diodo em polarização direta (@polarizacao-direta). Na sequência, tomaram-se medidas com o diodo em polarização reversa (@polarizacao-reversa).

#subpar.grid(
  figure(image("circuito_diodo_resistor.pdf"), caption: [Polarização direta.]), <polarizacao-direta>,
  figure(image("circuito_diodo_resistor_rev.pdf"), caption: [Polarização reversa.]), <polarizacao-reversa>,
  columns: (1fr, 1fr),
  gutter: 1em,
  caption: [Circuito série e pontos de medida de tensão elétrica.],
  label: <circuito>,
)

= Resultados

A partir do teste do multímetro, obteve-se que a tensão de polarização direta do diodo é de #num("0.610", decimal-separator: ",")~V. A resistência do resistor utilizado foi aferida e o valor observado foi $R = 9",87" Omega$.

Os pontos de operação medidos em polarização direta e em polarização reversa são apresentados na @op-direto e na @op-reverso, respectivamente.


#figure(
  table(
    columns: 11,
    align: center,
    stroke: (x: none, y: 0.05em),
    table.hline(y: 0, stroke: (dash: "solid", thickness: 0.08em),),
    table.hline(y: 4, stroke: (dash: "solid", thickness: 0.08em),),
      [$V_F$ (V)],
      [$0","1$],
      [$0","2$],
      [$0","3$],
      [$0","4$],
      [$0","5$],
      [$0","6$],
      [$0","7$],
      [$0","8$],
      [$0","9$],
      [$1","0$],
      [$V_D$~(V)],
      [$0","107$],
      [$0","152$],
      [$0","298$],
      [$0","353$],
      [$0","359$],
      [$0","407$],
      [$0","424$],
      [$0","443$],
      [$0","456$],
      [$0","460$],
      [$V_R$ (V)],
      [$0","000$],
      [$0","000$],
      [$0","000$],
      [$0","000$],
      [$0","100$],
      [$0","154$],
      [$0","225$],
      [$0","340$],
      [$0","456$],
      [$0","501$],
      [$I$~(mA)],
      [$0","0$],
      [$0","0$],
      [$0","0$],
      [$0","0$],
      [$1","0$],
      [$15","4$],
      [$22","5$],
      [$34","0$],
      [$45","6$],
      [$50","1$],
      ),
caption: [Pontos de operação para polarização direta.]
) <op-direto>


#figure(
  table(
    columns: 11,
    align: center,
    stroke: (x: none, y: 0.05em),
    table.hline(y: 0, stroke: (dash: "solid", thickness: 0.08em),),
    table.hline(y: 4, stroke: (dash: "solid", thickness: 0.08em),),
  [$V_F$(V)],
  [$0","1$],
  [$0","2$],
  [$0","3$],
  [$0","4$],
  [$0","5$],
  [$0","6$],
  [$0","7$],
  [$0","8$],
  [$0","9$],
  [$1","0$],
  [$V_D$~(V)],
  [$0","122$],
  [$0","224$],
  [$0","313$],
  [$0","350$],
  [$0","519$],
  [$0","635$],
  [$0","676$],
  [$0","802$],
  [$0","911$],
  [$1","047$],
  [$V_R$ (V)],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$0","000$],
  [$I$~(mA)],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  [$0","0$],
  ),
caption: [Pontos de operação para polarização reversa.]
) <op-reverso>

A partir dos dados medidos, é possivel construir os gráficos de corrente em função da tensão nos terminais do diodo.

#figure(
  image("polarizacao_diodo.pdf"),
  caption: [Curva $I_d times V_d$ do diodo IN4148.]
) <operacao-diodo>

É notável que em polarização reversa o diodo operou como um circuito aberto para todos os valores de tensão medidos. Em polarização direta, a curva medida apresenta o comportamento exponencial esperado. No entanto, o joelho da curva não condiz com os #num("0.610", decimal-separator: ",")~V medidos com o multimetro. Uma possível explicação é que a tensão da fonte não foi suficiente para mostrar a faixa de subida abrupta da curva característica. Assim, seria válido repetir o experimento com uma faixa de maiores de tensão para melhor entender a curva exponencial e poder localizar o ponto de joelho de forma mais exata.


= Considerações finais
Nesta aula prática, foi possível caracterizar o diodo 1N4148. Verificou-se o comportamento exponencial da curva $I_d times V_d$ sob polarização direta, e o comportamento de bloqueio de corrente sob polarização reversa. Os níveis de tensão experimentais foram baixos, e assim a tensão sobre o diodo não chegou à tensão de joelho medida com multímetro. Próximos experimentos evidenciarão em maiores detalhes o comportamento do diodo frente a tensões maiores.
