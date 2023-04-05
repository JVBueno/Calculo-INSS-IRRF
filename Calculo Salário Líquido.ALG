Algoritmo "ProvaBimestral"

Var
funcionario:caractere
salario,salario2,hora,valh:real
inss,irrf,irrf2,alqr,alqn,deducao:real
dep1,dep2,x:real
descontos,descontototal:real
porcentageminss,porcentagemirrf,porcentagemdesconto:real

Inicio
escreval("Nome do funcionário: ")
leia(funcionario)
escreval("")
escreval("Digite a quantidade de horas trabalhadas no mês:")
leia(hora)
escreval("")
escreval("Digite o valor da hora:")
leia(valh)
escreval("")
escreval("Quantidade de dependentes:")
leia(dep1)
escreval("")
escreval("Outros descontos:")
leia(descontos)

salario:=(valh*hora)
dep2:=dep1*189.59

// Calcular o desconto do inss

se (salario<=1302.00) entao
inss:=(salario*0.075)
senao(salario>=1302.01) e (salario<=2571.29)
alqn:=(salario*0.09)
deducao <- 19.53
inss:= alqn - deducao
fimse
se(salario>=2571.30) e (salario<=3856.94) entao
alqn:=(salario*0.12)
deducao <- 96.67
inss:= alqn - deducao
fimse
se(salario>=3856.95) e (salario<=7507.49) entao
alqn:=(salario*0.14)
deducao <- 173.81
inss:= alqn - deducao
fimse
se (salario>=7507.5) entao
inss:= 877.24
senao escreval("Dado inválido")
fimse

//Calcular o salario com desconto do inss - o desconto dos dependentes

x<-salario-inss-dep2

//Então enquadrar esse resultado na tabela do IRRF
//Então encontrar o valor real do IRRF

se x <=1903.98 entao
irrf:=0
fimse
se(x>=1903.99) e (x<=2826.65) entao
irrf:= (x*0.075)-142.8
fimse
se (x>=2826.66) e (x<=3751.05) entao
irrf:= (x*0.15) - 354.8
fimse
se(x>=3751.06) e (x<=4664.68) entao
irrf:=(x*0.225)-636.13
fimse
se(x>=4664.69) entao
irrf:=(x*0.275)-869.36
senao escreval("Dado Inválido")
fimse
escreval("")
escreval("================== SAlÁRIO BRUTO =======================")
escreval("")
escreval("Salário Bruto = R$",salario:2:2)
escreval("")
escreval("========================================================")
escreval("")

// Escreval % INSS

escreval("Cálculo do salário líquido de ",funcionario,":")
escreval("")
escreval("====================== INSS ============================")
porcentageminss<-salario
se (porcentageminss<=1302.00) entao
escreval("Isento de INSS")
fimse
se(porcentageminss>=1302.01) e (porcentageminss<=2571.29) entao
escreval("Margem Salarial entre R$1302,00 e R$2571,29")
escreval("Alíquota de 9% e Dedução de R$19,53")
fimse
se(porcentageminss>=2571.30) e (porcentageminss<=3856.94) entao
escreval("Margem Salarial entre R$2571,30 e R$3856,94")
escreval("Alíquota de 12% e Dedução de R$96,67")
fimse
se(porcentageminss>=3856.95) e (porcentageminss<=7507.49) entao
escreval("Margem Salarial entre R$3856,95 e R$7507,49")
escreval("Alíquota de 14% e Dedução de R$173,81")
fimse
se (porcentageminss>=7507.5) entao
escreval("Valor teto INSS, Salário acima de R$7507,50, desconto de R$877,24")
senao escreval("Dado inválido")
fimse
escreval("Desconto do INSS = R$ ",inss:2:2," reais")
escreval("========================================================")
escreval("")

// Escreval % IRRF

escreval("====================== IRRF ============================")

porcentagemirrf<-x
se porcentagemirrf <=1903.98 entao
escreval("Isento de IRRF")
fimse
se(porcentagemirrf>=1903.99) e (porcentagemirrf<=2826.65) entao
escreval("Margem Salarial entre R$1903,99 e R$2826,65")
escreval("Alíquota de 7,5% e Dedução de R$142,8")
fimse
se (porcentagemirrf>=2826.66) e (porcentagemirrf<=3751.05) entao
escreval("Margem Salarial entre R$2826,66 e R$3751,05")
escreval("Alíquota de 15% e Dedução de R$354,8")
fimse
se(porcentagemirrf>=3751.06) e (porcentagemirrf<=4664.68) entao
escreval("Margem Salarial entre R$3751,06 e R$4664,68")
escreval("Alíquota de 22,5% e Dedução de R$636.13")
fimse
se(porcentagemirrf>=4664.69) entao
escreval("Salario acima de R$4664,69")
escreval("Alíquota de 27,5% e Dedução de R$869,36")
senao escreval("Dado Inválido")
fimse

escreval("Desconto do IRRF = R$", irrf:2:2," reais")
escreval("========================================================")
escreval("")
escreval("Descontos referente aos dependentes = R$", dep2:2:2," reais")
escreval("")
escreval("Outros descontos = R$",descontos:2:2," reais")
escreval("")

//Outros descontos serão subtraídos do valor líquido calculado

descontototal<-irrf+inss+descontos
salario2<-(salario-irrf-inss)-descontos
porcentagemdesconto<-descontototal*100/salario

//Dados finais

escreval("==================== DESCONTOS =========================")
escreval("Total de descontos = R$",descontototal:2:2," reais")
escreval("Percentual de descontos = ",porcentagemdesconto:2:2," %")
escreval("========================================================")
escreval("")
escreval("========================================================")
escreval("Salário líquido = (Salário bruto - Total de descontos)")
escreval("Salário líquido = R$",salario:2:2," - R$",descontototal:2:2)
escreval("========================================================")
escreval("")
escreval("=================== SALÁRIO LÍQUIDO ====================")
escreval("SALÁRIO LÍQUIDO = R$",salario2:2:2," reais")
escreval("========================================================")
Fimalgoritmo