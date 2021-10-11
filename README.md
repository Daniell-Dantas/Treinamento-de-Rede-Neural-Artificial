# Treinamento de Rede Neural
![ezgif com-gif-maker](https://user-images.githubusercontent.com/67600860/136825544-05c9b3d4-d5ce-4e81-a4c9-0b30acb13628.gif)

<p align="justify">
💻 Como trabalho proposto na disciplina Redes Neurais Artificiais da graduação em Engenharia Elétrica, este é um código básico que implementa, passo a passo, o processo de treinamento de uma Perceptron de Múltiplas Camadas por meio do algoritmo backpropagtion. Para isso, foi utilizado um banco de dados conhecido para problemas de classificação, o dataset <a href="https://archive.ics.uci.edu/ml/datasets/iris">Iris</a> 🌼
</p>
  
OBS: O código tem por objetivo exemplificar a etapa de treino 🏋🏾‍♀ e atualização dos pesos, as outras etapas importnates como validação cruzada e teste não estão presentes neste código.

# Modelo de Neurônio
<p align="justify">
O neurônio é a unidade básica morfofuncional do tecido nervoso e, da
mesma maneira, é a unidade básica de processamento da rede neural. Estes
modelos computacionais inspirados em neurônios biológicos possuem
algumas características semelhantes aos naturais para poder desfrutar da
capacidade de aprendizado, são elas: sinais de entrada, pesos sinápticos,
função de soma, função de ativação e sinal de saída.
Para realizar esse processo em uma linguagem de programação, é
aconselhável utilizar operações matriciais, pois assim ocorre uma otimização
na etapa de compilação. Teremos então, um vetor de entrada e um vetor de
pesos (ou matriz, caso haja mais de um neurônio na camada).
</p>

![neuronio](https://user-images.githubusercontent.com/67600860/136829925-bfd180e6-f59b-4901-85d3-a3c2a8d2a98b.png)

# Forma de Aprendizado
<p align="justify">
Os pesos sinápticos são peças fundamentais para o armazenamento de
informação do neurônio artificial, é através deles que o modelo possui a
capacidade de aprender. Utiliza-se o algoritmo de Backpropagation,
que possibilita o ajuste dos pesos em camadas intermediárias, fazendo a
chamada “retropropagação do erro”, ou seja, utiliza o valor do erro da
camada de saída no ajuste dos pesos das outras camadas ocultas.
 </p>

# Algoritmo Backpropagation
<p align="justify">
A inicialização dos pesos sinápticos ocorre de maneira randômica, a
escolha dos pesos iniciais pode prevenir o problema do mínimo local e ainda
a saturação prematura da rede. O fluxo de informação acontece em duas
etapas, primeiramente na etapa "forward", a rede é apresentada aos padrões
de treinamento e tem seus pesos excitados a produzir uma saída, na etapa
“backward”, calcula-se o erro da rede para aquele padrão e este erro, então, é
"retro propagado" para as outras camadas ocultas da rede, que não tem
acesso direto ao erro da camada de saída. É nesta etapa que os pesos são atualizados e a rede adquire conhecimento, o processo se repete até que o
critério de parada seja satisfeito (o critério adotado foi o de número de
épocas de treinamento).
</p>

**A imagem abaixo faz um resumo geral das etapas do código**

<p align="center">
  <img src="https://user-images.githubusercontent.com/67600860/136827442-aff9e61d-ec4c-437f-98d6-1b8e20688ff6.png" />
</p>

# Gráficos
*Os gráficos apresentados a seguir tem por finalidade melhorar a compreensão dos processos executados e a importância de cada um. Para gerar estes gráficos, utilizou-se 5 neurônios na camada escondida, 300 épocas e taxa de aprendizado de 0.01*

* Imagem 1 - Evolução do erro por número de épocas

<p align="center">
  <img src="https://user-images.githubusercontent.com/67600860/136830197-fa51fda2-5f17-40d4-9f6f-7149d4c4f9ec.jpg" />
</p>
<p align="justify">
Esta imagem mostra a magnitude do erro quadrático médio para cada número de épocas, onde o erro se inicia em aproximadamente 0.04 e finaliza em aproximadamente 0.015 na época de número 300
</p>

* Imagem 2 - Saída desejada e saída de treinamento

<p align="center">
  <img src="https://user-images.githubusercontent.com/67600860/136830662-dc29ecb8-bbc2-4a29-956f-a7a4e7a25b9a.jpg" />
</p>

<p align="justify">
Apresenta os valores de saída do treinamento (círulo azul) sobrepostos aos valores de saída desejado (asterisco verde) para as classes 1 (Iris Setosa), 2 (Iris
Versicolour) e 3 (Iris Virginica). Note que esta imagem não representa a classificação final, já que os valores estão plotados de maneira contínua. Para performar a classificação, poderíamos por exemplo instituir limites de valores para as classes, sendo a classe 1 correspondendo aos valores de saída entre 0.5 e 1.5, a classe 2 aos valores de 1.5 a 2.5 e a classe 3 aos valores entre 2.5 e 3.5
 </p>

* Imagem 3 - Saídas e épocas

<p align="center">
  <img src="https://user-images.githubusercontent.com/67600860/136830937-b0bf0b76-0ec7-4e6d-b08b-50e3bf7ea43b.jpg" />
</p>

<p align="justify">
A finalizade desta imagem é proporcionar o "feeling" sobre como as classificações vão se ajustando e ficando melhor à medida que o número de épocas aumenta. Na imagem podemos observar que as classificações começam muito dispersas e se concentram à medida que os pesos se ajustam
 </p>
 
 
 ***Para qualquer dúvida, consideração ou sugestões, fique à vontade de entrar em contato 📧***

