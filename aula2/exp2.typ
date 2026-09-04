#import "../lib.typ"
#import "@preview/zero:0.2.0": num
#import "@preview/subpar:0.2.2"
#import "@preview/tblr:0.5.0": *

#show: lib.technical-report.with(
  course-code: "UFSM00055",
  course-name: "Fundamentos da Eletrônica",
  subtitle: [Aula Prática 2 - Montagem e medição de circuitos série e paralelo],
  authors: ("João Vítor Carli Pereira", "Willian Chamma"),
  institution: ("Universidade Federal de Santa Maria", "Centro de Tecnologia"),
  date: datetime.today(),
)

#set par(first-line-indent: (amount: 1em, all: true))
= Introdução

A presente atividade prática tem como objetivo compreender e montar circuitos de associação de resistores em série e em paralelo.

= Métodos

Utilizou-se uma fonte CC, um multímetro Minipa e quatro resistores analisar o comportamento de quatro circuitos (@circuitos).

#subpar.grid(
  figure(image("circuito_a.pdf"), caption: [$R_1 + R_2 + R_3 + R_4 $]), <serie>,
  figure(image("circuito_b.pdf"), caption: [$(R_1 + R_2) parallel (R_3 + R_4)$]), <serie-em-paralelo>,
  figure(image("circuito_c.pdf"), caption: [$(R_1 parallel R_2) + (R_3 parallel R_4)$]), <paralelo-em-serie>,
  figure(image("circuito_d.pdf"), caption: [$R_1 parallel R_2 parallel R_3 parallel R_4$]), <paralelo>,
  columns: (1fr, 1fr),
  gutter: 1em,
  caption: [Circuitos de associação de resistores analisados.],
  label: <circuitos>,
)

Os resistores utilizados estão descritos na @resistores. Nota-se que o maior desvio do valor nominal ocorreu no resistor $R_1$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: (x: none, y: 0.05em),
    table.hline(y: 0, stroke: (dash: "solid", thickness: 0.08em),),
    table.hline(y: 4, stroke: (dash: "solid", thickness: 0.08em),),
    table.header[*Resistor*][*Valor teórico ($Omega$)*][*Valor medido ($Omega$)*][*Desvio (%)*],
    [$R_1$], [1000], [1072], [$+6","72$],
    [$R_2$], [2200], [2150], [$-2","33$],
    [$R_3$], [1800], [1795], [$-0","28$],
    [$R_4$], [1500], [1501], [$+0","07$]
  ),
  caption: [Resistores utilizados.],
) <resistores>

A fonte CC foi configurada em $12$~V, e mediu-se a tensão sobre cada resistor utilizando o multímetro. As correntes foram calculadas dividindo-se o valor de tensão medido pelo valor de resistência medida para cada resistor. Para os cálculos de tensão e corrente teóricas, também considerou-se os valores de resistência medidos na prática.

= Resultados

Os valores de tensão e corrente medidos e calculados em cada um dos resistores, para cada configuração de circuito, são apresentados nas tabelas abaixo.

#show math.equation: it => {
    show regex("\d+\.\d+"): it => {show ".": {","+h(0pt)}
        it}
    it
}
#grid(
  columns: (1fr, 1fr), // Allocates equal space to both tables
  gutter: 10pt,        // Space between the tables
  row-gutter: 20pt,
  figure(
  tblr(columns: 5, header-rows: 2,
    stroke: none,
    // combine header cells
    cells((0, (1, 3)), colspan: 2, stroke: (bottom: 0.03em)),
    column-gutter: 0.1em,
    // booktabs style rules
    rows(within: "header", auto, inset: (y: 0.5em)),
    rows(within: "header", auto, align: center),
    hline(within: "header", y: 0, stroke: 0.08em),
    hline(within: "header", y: end, stroke: 0.05em),
    rows(within: "body", 0, inset: (top: 0.5em)),
    hline(y: end, stroke: 0.08em),
    rows(end, inset: (bottom: 0.5em)),
    // table notes, remarks, and caption
    // content
    [], [Medido], [], [Calculado], [],
    [*Resistor*], [$V_R$ (V)], [$I_R$ (mA)], [$V_R$ (V)], [$I_R$ (mA)],
    [$R_1$], [$1.877$], [$1.751$], [$$], [],
    [$R_2$], [$4.049$], [$1.883$], [$$], [],
    [$R_3$], [$3.368$], [$1.876$], [$$], [],
    [$R_4$], [$2.787$], [$1.857$], [$$], [],
  ),
    caption: [Tensões e correntes no circuito a).]
  ),

  figure(
   tblr(columns: 5, header-rows: 2,
     stroke: none,
     // combine header cells
     cells((0, (1, 3)), colspan: 2, stroke: (bottom: 0.03em)),
     column-gutter: 0.1em,
     // booktabs style rules
     rows(within: "header", auto, inset: (y: 0.5em)),
     rows(within: "header", auto, align: center),
     hline(within: "header", y: 0, stroke: 0.08em),
     hline(within: "header", y: end, stroke: 0.05em),
     rows(within: "body", 0, inset: (top: 0.5em)),
     hline(y: end, stroke: 0.08em),
     rows(end, inset: (bottom: 0.5em)),
     // table notes, remarks, and caption
     // content
     [], [Medido], [], [Calculado], [],
     [*Resistor*], [$V_R$ (V)], [$I_R$ (mA)], [$V_R$ (V)], [$I_R$ (mA)],
     [$R_1$], [$3.834$], [$3.576$], [$$], [],
     [$R_2$], [$8.230$], [$3.828$], [$$], [],
     [$R_3$], [$6.600$], [$3.677$], [$$], [],
     [$R_4$], [$5.475$], [$3.648$], [$$], [],
   ),
    caption: [Tensões e correntes no circuito b).]
   ),
   figure(
   tblr(columns: 5, header-rows: 2,
     stroke: none,
     // combine header cells
     cells((0, (1, 3)), colspan: 2, stroke: (bottom: 0.03em)),
     column-gutter: 0.1em,
     // booktabs style rules
     rows(within: "header", auto, inset: (y: 0.5em)),
     rows(within: "header", auto, align: center),
     hline(within: "header", y: 0, stroke: 0.08em),
     hline(within: "header", y: end, stroke: 0.05em),
     rows(within: "body", 0, inset: (top: 0.5em)),
     hline(y: end, stroke: 0.08em),
     rows(end, inset: (bottom: 0.5em)),
     // table notes, remarks, and caption
     // content
     [], [Medido], [], [Calculado], [],
     [*Resistor*], [$V_R$ (V)], [$I_R$ (mA)], [$V_R$ (V)], [$I_R$ (mA)],
     [$R_1$], [$4.581$], [$4.273$], [$$], [],
     [$R_2$], [$4.582$], [$2.131$], [$$], [],
     [$R_3$], [$7.480$], [$4.167$], [$$], [],
     [$R_4$], [$7.480$], [$4.983$], [$$], [],
   ),
     caption: [Tensões e correntes no circuito c).]
   ),

   figure(
    tblr(columns: 5, header-rows: 2,
      stroke: none,
      // combine header cells
      cells((0, (1, 3)), colspan: 2, stroke: (bottom: 0.03em)),
      column-gutter: 0.1em,
      // booktabs style rules
      rows(within: "header", auto, inset: (y: 0.5em)),
      rows(within: "header", auto, align: center),
      hline(within: "header", y: 0, stroke: 0.08em),
      hline(within: "header", y: end, stroke: 0.05em),
      rows(within: "body", 0, inset: (top: 0.5em)),
      hline(y: end, stroke: 0.08em),
      rows(end, inset: (bottom: 0.5em)),
      // table notes, remarks, and caption
      // content
      [], [Medido], [], [Calculado], [],
      [*Resistor*], [$V_R$ (V)], [$I_R$ (mA)], [$V_R$ (V)], [$I_R$ (mA)],
      [$R_1$], [$12.05$], [$11.24$], [$$], [],
      [$R_2$], [$12.05$], [$5.60$], [$$], [],
      [$R_3$], [$12.03$], [$6.70$], [$$], [],
      [$R_4$], [$12.04$], [$8.02$], [$$], [],
    ),
     caption: [Tensões e correntes no circuito d).]
    )
)


= Considerações finais
