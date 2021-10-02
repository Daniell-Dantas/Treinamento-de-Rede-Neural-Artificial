% BACKPROPAGATION
clear; close all; clc;

%% Carregar os dados de conjuntos de treinamento, teste e validação do banco de dados

%PADRÕES DE ENTRADA
load iris_treino.txt;
I1=iris_treino'; % Carregar os padrões de treino do banco de dados Iris com os atributos e a respectiva classe

I=I1(1:4, :); % Definição do vetor de entrada para ser normalizado

%% Requisições ao usuário e parâmetros

%Pedir o número de neuronios da camada oculta
Neuronios_oculta=input('Nerônios na Camada Oculta: ');%
%Especificar o número de neuronios da camada de saída, no nosso caso é 1
Neuronios_saida = 1;
%Pedir o número de épocas
epocas = input('Digite o número de épocas: ');
%Pedir a taxa de aprendizagem
taxa_aprendizagem = input('Digite a taxa de aprendizagem: ');
E = exp(-10); %Definir precisão (limite de erro)


%% Normalização
normalizado = ((I - min(min(I))*(1))/(max(max(I)) - min(min(I)))); %considerando Lmax = 1 e Lmin = 0.

%% Organizando as matrizes

%Matriz de treinamento e sua respectiva saída
Entrada_treinamento = normalizado(:,:);
Saida_desejada_treinamento = I1(5, :);
[numero_linhas_treinamento, numero_colunas_treinamento] = size(Entrada_treinamento); %Define o número de linhas e colunas da matriz de entrada no treinamento. Precisamos desses valores para fazer alógica do Foward.


%% Inicializar os valores dos pesos da camada 1 e 2
w1 = rand(Neuronios_oculta,numero_linhas_treinamento+1); %PESOS DA CAMADA OCULTA
w2 = rand(Neuronios_saida,Neuronios_oculta+1); %PESOS DA CAMADA DE SAÍDA

%% Definição das Funções de ativação e derivadas usando "function_handle"
Sigmoide = @(z)1./(1 + exp(-z)); %FUNÇÃO DE ATIVAÇÃO SIGMOIDE NA CAMADA OCULTA
deriv_sigmoide = @(z)(exp(z)/(1+exp(z)).^2); %DERIVADA DA SIGMOIDE
linear = @(z) z; % FUNÇÃO DE ATIVAÇÃO LINEAR NA CAMADA DE SAÍDA
deriv_linear = @(z) 1; %DERIVADA DA FUNÇÃO LINEAR


%% ETAPA DE TREINAMENTO
ww1=w1; %Definimos os novos pesos ww1 e ww2 para poder guardar o valor dos pesos originais e mostrar os pesos finais
ww2=w2;
Saida_treinamento = zeros(1, numero_colunas_treinamento);
EQM_train = zeros(1, epocas);
Saida_treinamento_total = zeros(epocas, 90);

for a = 1:epocas %Critério de parada. Define que o laço começa em 1 e segue até o valor de "epocas". A variável parada guarda a iteração atual
Erro_quadratico=0;
    for i = 1:numero_colunas_treinamento %Estamos percorrendo todas as 90 colunas, ou seja, os 90 padrões para o treino
    %~~~~~~~~~~~~~~~~~~ INÍCIO FOWARD ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    %~~~~~~~ CAMADA DE ENTRADA ~~~~~~~
    x=[-1;Entrada_treinamento(:,i)]; 
    Ij1 = ww1*x; 
    Yj1 = Sigmoide(Ij1); %Função de ativação da camada 1 (oculta): Foi escolhida a função Sigmóide. Esta é a saída dos neurônios da camada oculta

    %~~~~~~~ CAMADA DE SAÍDA ~~~~~~~
    y=[-1; Yj1]; %Aqui é a saída dos neurônios da camada oculta + bias. 
    Ij2 = ww2*y;  % Entradas para o neurônio da camada de saída
    Yj2 = linear(Ij2); %Função de ativação da camada de saída: Foi escolhida a função Linear. Esta é a saída do neurônio da camada de saída, e portanto, da rede


    %~~~~~~~~~~~~~~~~~~ INÍCIO BACKWARD ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    erro = Saida_desejada_treinamento(:,i) - Yj2; %Sinal de erro da camada de saída

    Erro_quadratico = Erro_quadratico + 0.5*sum(erro.^2); % Considerando todos os neurômnios da camada de saída, a soma do erro quadrático no instante N, ou seja, para um par entrada saída. No nosso caso, a soma terá o valor de somente 1 erro.
    derivada_saida_rede = deriv_linear(Ij2); %Derivada da função linear na camada de saída
    gradiente_local_saida = erro.*derivada_saida_rede; %Gradiente local da camada de saida.

    % Ajuste dos pesos na camada de saída
    ww2 = ww2 + taxa_aprendizagem*gradiente_local_saida*y';

    derivada_saida_camada_oculta = deriv_sigmoide(Ij1); %Derivada da função sigmóide na camada oculta
    gradiente_local_oculta = derivada_saida_camada_oculta*(ww2(:,2:end)'*gradiente_local_saida) ; % GRADIENTE LOCAL DA CAMADA OCULTA

    % Ajuste dos pesos na camda oculta
    ww1 = ww1 + taxa_aprendizagem*gradiente_local_oculta*x';

    Saida_treinamento(i) = Yj2;
    

    end %90
    
Saida_treinamento_total(a,:) = Saida_treinamento;
EQM_train(a) = sum(Erro_quadratico)/numero_colunas_treinamento; %Agora considerando todos os N momentos, ou seja, os N pares de entrada e saída que eu tenho no banco da dados. Esta é a função custo, o nosso erro quadrático médio, a que queremos minimzar durante o treinamento.

end %300

%% PLOTAGEM DOS GRÁFICOS
figure(1);
plot(EQM_train,'LineWidth',2) % PLOTA ERRO QUADRÁTICO MÉDIO DE TREINAMENTO
legend('ERRO DE TREINO')
title('EVOLUÇÃO DO ERRO')
ylabel('ERRO QUADRÁTICO MÉDIO')
xlabel('ÉPOCAS')
grid on

figure(2);
plot(Saida_desejada_treinamento, 'g*')
hold on;
plot(Saida_treinamento, 'bo')
legend('Saída desejada', 'Saída do treinamento')
title('SAÍDA DESEJADA X SAÍDA TREINAMENTO')
ylabel('CLASSES')
xlabel('DADOS')
grid on

figure(3);
plot(Saida_treinamento_total)
title('SAÍDA X NÚMERO DE ÉPOCAS')
ylabel('SAÍDAS')
xlabel('ÉPOCAS')
grid on

