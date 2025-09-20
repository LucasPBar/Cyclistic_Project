# Introdução

Este estudo de caso representa o projeto final da Certificação Profissional de Análise de Dados do Google.

Este estudo consiste na análise de dados da empresa Cyclistic, uma empresa de compartilhamento de bicicletas em Chicago, que opera cerca de 6000 bicicletas e quase 700 estações. A Cyclistic oferece dois tipos de serviços: passes diários (viagem única ou dia inteiro) e assinaturas anuais.

Os clientes com assinaturas anuais são denominados 'membros Cyclistic', enquanto os que utilizam passes diários são chamados de 'usuários casuais'. A análise financeira da empresa revelou que os membros anuais são mais lucrativos que os usuários casuais. Lily Moreno, Diretora de Marketing da Cyclistic, acredita que aumentar o número de membros anuais é crucial para o crescimento futuro da empresa. Ela propõe que, em vez de focar em novos clientes, a empresa deve se concentrar em converter usuários casuais em membros, já que esses usuários já estão familiarizados com o serviço.

Para conduzir a análise de dados, seguirei as seis etapas recomendadas pelo Google: 
  
  - Perguntar (Ask)

- Preparar (Prepare)

- Processar (Process)

- Analisar (Analyze)

- Compartilhar (Share)

- Agir (Act)


# Perguntar

Como dito anteriormente, o cenário deste estudo de caso é encima dos dados da Cyclistic. Atualmene, a empresa oferece passes diários e assinaturas anuais. Clientes com assinaturas anuais são chamados de 'membros Cyclistic', enquanto usuários de passes diários são 'casuais'. A partir da análise financeira chegou-se a conclusão de que membros anuais são mais lucrativos e desenvolver uma estratégia de marketing visando converter os usuários casuais em membros é essencial para o crescimento da empresa. Diante disso, foram escolhidas três perguntas para serem respondidas 

1- Como os membros anuais e os ciclistas casuais utilizam as bicicletas da Cyclistic de maneira diferente?
  
  2 - Por que os ciclistas casuais comprariam assinaturas anuais da Cyclistic?
  
  3 - Como a Cyclistic pode usar mídia digital para influenciar os ciclistas casuais a se tornarem membros?
  
  Para este estudo em questão, foi definido que a pergunta a ser seguida seria a primeira, sendo assim, o objetivo e o público foram definidos da seguinte forma:
  
  - Objetivo: Entender como membros Cyclistic e os usuários casuais usam as bicicletas de maneira diferente.

- Público: As partes interessadas são a diretoria de marketing e a equipe executiva da Cyclistic.


# Preparar

## Etapa 2: Preparando os Dados

### Os dados

Para realizar este estudo de caso, utilizei os dados históricos de trajetos da Cyclistic para analisar e identificar tendências. Diante disso, fiz o download dos dados de trajetos da Cyclistic entre março de 2024 até fevereiro de 2025. que foram disponibilizados conforme este contrato de licença.

Os dados estão divididos em 12 arquivos, cada um referente a um mês do ano (mar/2024 a fev/2025).

Os arquivos utilizados possuem a extensão .csv e representam os registros de viagem utilizando as bicicletas da empresa.

O registro de cada viagem é composto por um ID (único) da viagem, horário do início e término da viagem, localização das estações de início e término da viagem, tipo de bicicleta utilizada e tipo de usuário que realizou a viagem (casual ou membro).

inicialmente, comecei a minha análise instalando as bibliotecas que vou utilizar durante o projeto.

### Instalando bibliotecas


```{r}
library(readr)
library(tidyverse)
library(ggplot2)
library(conflicted)
library(dplyr)
library(tidyr)

conflict_prefer("lag", "dplyr")
conflict_prefer("filter", "dplyr")
conflict_prefer("mutate", "dplyr")


```

Com as bibliotecas devidamente instaladas, agora vou começar a inserir os dados que irei utilizar para a análise

### Inserindo dados

```{r}
mar_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202403-divvy-tripdata.csv")
abr_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202404-divvy-tripdata.csv")
mai_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202405-divvy-tripdata.csv")
jun_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202406-divvy-tripdata.csv")
jul_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202407-divvy-tripdata.csv")
ago_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202408-divvy-tripdata.csv")
set_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202409-divvy-tripdata.csv")
out_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202410-divvy-tripdata.csv")
nov_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202411-divvy-tripdata.csv")
dez_2024 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202412-divvy-tripdata.csv")
jan_2025 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202501-divvy-tripdata.csv")
fev_2025 <- read.csv("~/Data Scicence Study/Projeto FInal/Google Analytics/Base de dados/202502-divvy-tripdata.csv")
```

### Coletando uma amostra de nome para as colunas

```{r}
colnames(mar_2024)
```

### Avaliando se os nomes das colunas correspondem para todas as tabelas

```{r}
identical(names(dez_2024), names(nov_2024))
identical(names(dez_2024), names(out_2024))
identical(names(dez_2024), names(set_2024))
identical(names(dez_2024), names(ago_2024))
identical(names(dez_2024), names(jul_2024))
identical(names(dez_2024), names(jun_2024))
identical(names(dez_2024), names(mai_2024))
identical(names(dez_2024), names(abr_2024))
identical(names(dez_2024), names(mar_2024))
identical(names(dez_2024), names(fev_2025))
identical(names(dez_2024), names(jan_2025))
```

### Checando se os dados estão estruturados

```{r}
str(mar_2024)
str(abr_2024)
str(mai_2024)
str(jun_2024)
str(jul_2024)
str(ago_2024)
str(set_2024)
str(out_2024)
str(nov_2024)
str(dez_2024)
str(jan_2025)
str(fev_2025)

```
A partir do resultado obtido, nota-se que os dados estão padronizados

### Segunda checagem 

```{r}
janitor::compare_df_cols(dez_2024, nov_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, out_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, set_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, ago_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, jul_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, jun_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, mai_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, abr_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, mar_2024, return = "mismatch")
janitor::compare_df_cols(dez_2024, jan_2025, return = "mismatch")
janitor::compare_df_cols(dez_2024, fev_2025, return = "mismatch")
```

### Gerando um DataFrame único com os dados

Agora que tenho certeza de que os dados estão padronizados, agora posso uni-los em apenas uma tabela para facilitar a nossa análise. Para realizar a junção, irei utilizar a função bind_rows().

```{r}
cyclistic <- bind_rows(mar_2024, abr_2024, mai_2024, jun_2024, jul_2024, ago_2024, set_2024, out_2024, nov_2024, dez_2024, jan_2025, fev_2025)

```

# Processar

## Etapa 3: Processando os Dados

```{r}
head(cyclistic)
```

# Contagem de linhas após a junção

```{r}
nrow(cyclistic)
```

# Avaliação dos dados

```{r}
str(cyclistic)
```
A partir da primeira vizualização, notei que havia a presença de valores vazios dentro da minha tabela, que por sua vez, podem ser prejudiciais paraa minha análise. Para isso, usarei a função drop_na() para limpar os dados vazios

### Limpando dados Vazios

```{r}
cyclistic <- drop_na(cyclistic)
```

### Contagem de linhas após a limpeza

```{r}
nrow(cyclistic)
```
### Visualizando quais colunas possuem valores NA

```{r}
colSums(is.na(cyclistic))

```
### Convertendo colunas numéricas corretamente

Os valores vazios podem ser espaços em branco (" ") ou NA_character_ e não NA. Para isso, precisarei converter todas as colunas numéricas para numeric e as colunas categóricas para character, e posteriormente aplicar o drop_na() para realizar a limpeza dos dados vazios

```{r}

cyclistic <- cyclistic %>%
  mutate(across(where(is.character), ~na_if(.x, ""))) %>%
  mutate(across(where(is.character), ~na_if(.x, "NA"))) %>%
  mutate(across(c(start_lat, start_lng, end_lat, end_lng), as.numeric))

```

```{r}
cyclistic <- drop_na(cyclistic)

```

### Avaliando o resultado da limpeza

```{r}
str(cyclistic)
```

```{r}
head(cyclistic)
```


```{r}
nrow(cyclistic)
```
Agora que conseguimos retirar os valores nulos, como esta base retrata o uso das bicicletas a partir do ID do passseio, não pode haver a preseça de um registro de ID do passeio duplicado


### Análise de valores duplicados

Para realizar esta análise, contei a quantidade de valores únicos presentes na coluna "ride_id" através da função "lenght()", e posteriormente, fiz um código para conferir quantas duplicatas existem antes de removê-las.

```{r}
length(unique(cyclistic$ride_id))
```

```{r}
cyclistic %>% 
  group_by(ride_id) %>% 
  filter(n() > 1)
```

A partir da análise realizada, ficou evidente a presença de valores duplicados. Para corrigir isso, usarei a função distinct() para retirar os ID's duplicados e verifiquei se a quantidade de linhas com os valores únicos na coluna "ride_id" condiz com a quantidade de valores calculada anteriormente

```{r}
cyclistic <- cyclistic %>% distinct(ride_id, .keep_all = TRUE)

```

```{r}
cyclistic %>% 
  group_by(ride_id) %>% 
  filter(n() > 1)
```
```{r}
registros_sujos = 5783100 - 4120453
porcentual_valores_sujos = (registros_sujos / 5783100) * 100
print(registros_sujos)
print(porcentual_valores_sujos)
```
Com o térimo da limpeza, foi removido um total de 1662647 linhas com valores NA ou duplicados. O que corresponde a 28,75% do dataframe original

# Analisar

## Análise do estudo de caso

Vizando responder a pergunta definida inicialmente "Como os membros anuais e os ciclistas casuais utilizam as bicicletas da Cyclistic de maneira diferente?", foram selecionadas as seguintes perguntas para a análise:


- Qual a duração média das viagens de cada grupo? 

- A duração média varia conforme os dias da semana ou meses do ano?

- Qual o número total de viagens de cada grupo?

- Qual o percentual de viagens feitas por membros versus casuais?

- O que os clientes casuais mais usam? Bicicletas elétricas ou a bicicleta clássica? 


## Criando novas colunas:

Para responder as perguntas, Vou precisar novas colunas baseadas na Data e Hora de saída. Para trabalhar com data e hora usei o pacote lubridate.

Vou criar as seguintes colunas:

hora_saida: representa o horário em que a bicicleta saiu da base.

mes_saida: representa o mês em que a bicicleta saiu da base.

dia_saida: representa o dia em que a bicicleta saiu da base.

dia_da_semana_saida: representa o dia da semana - de segunda a domingo - em que a bicicleta saiu da base.

duracao: representa a duração da viagem.


```{r}
colnames(cyclistic)
```

```{r}

cyclistic$date <- as.Date(cyclistic$started_at) # O formato padrão é yyyy-mm-dd
cyclistic$month <- format(as.Date(cyclistic$date), "%m")
cyclistic$day <- format(as.Date(cyclistic$date), "%d")
cyclistic$year <- format(as.Date(cyclistic$date), "%Y")
cyclistic$day_of_week <- format(as.Date(cyclistic$date), "%A")
cyclistic_2022hora_saida <- lubridate::hour(cyclistic$ended_at)
```

### Criando a coluna para calcular a duração da viagem em segundos

```{r}
cyclistic$ride_length <- difftime(cyclistic$ended_at, cyclistic$started_at)
```

```{r}
str(cyclistic)
head(cyclistic)
```
### Converta “ride_length” de Factor para numérico 

Para que possamos realizar cálculos com os valores da coluna "ride_length", será necessário converter os valores desta coluna para numérico

```{r}
cyclistic$ride_length <- as.numeric(as.character(cyclistic$ride_length))
 is.numeric(cyclistic$ride_length)
```
Vizando garantir a qualidade dos dados para a análise, resolvi realizar uma segunda limpeza, desta vez, na coluna "ride_length"

```{r}
cyclistic_v2 <- cyclistic[!(cyclistic$ride_length <= 0 | cyclistic$ride_length == ""),]
```

Por fim, irei verificar a quantidade de linhas que foram retiradas do dataframe

```{r}
nrow(cyclistic_v2)
```
## Etapa 4: Fazendo análise descritiva 

Agora, vamos iniciar a análise dos dados para descobrir as histórias que eles revelam sobre como cada grupo de usuários utiliza as bicicletas da Cyclistic. O objetivo é identificar padrões e comportamentos que possam ajudar a entender melhor as necessidades e preferências dos ciclistas, contribuindo para decisões mais informadas e estratégicas.

### Análise descritiva em ride_length (todos os números em segundos)

```{r}
mean(cyclistic_v2$ride_length) # Média
median(cyclistic_v2$ride_length) # Mediana
max(cyclistic_v2$ride_length) # Maior Corrida
min(cyclistic_v2$ride_length) # Menor Corrida
summary(cyclistic_v2$ride_length)
```
### Análise descritiva em ride_length (todos os números em minutos)

```{r}
mean(cyclistic_v2$ride_length)/60 #straight average (total ride length / rides)
median(cyclistic_v2$ride_length)/60 #midpoint number in the ascending array of ride lengths
max(cyclistic_v2$ride_length)/60 #longest ride
min(cyclistic_v2$ride_length)/60 #shortest ride
```
Resultados: 

- Tempo médio das viagens: 16,61 minutos.
- Mediana do tempo de viagens: 10,13 minutos.
- Duração Máxima de uma viagem: 1509 minutos (aproximadamente 24 dias).
- Menor duração de viagem: 1 segundo.


Utilizando o dataframe (cyclistic), agrupei os dados por tipo de usuário (tipo_usuario) e apliquei a função summarise() para obter a duração média das viagens (duracao_media) e o número total de viagens (num_viagens) realizadas por cada grupo. Para otimizar o processo, empreguei o operador pipe (%>%), que será uma ferramenta essencial ao longo do projeto.

```{r}
duracao_media <- cyclistic_v2 %>% 
  group_by(member_casual) %>% 
  summarise(duracao_media_min = mean(ride_length)/60, num_viagens = length(ride_length)) # duracao_media em minutos (por isso divisao por 60 para converter segundos em minutos) e num_viagens é o número total de registros no dataframe, no caso para cada grupo
print(duracao_media)
```

### Resultados

- A média da duração da utilização das bicicletas dos usuários casuais foi maior do que o tempo médio dos usuários membros, sendo aproximadamente 24 minutos de duração dos usuários casuais e aproximadamente 12 minutos dos usuários membros da cyclistic

- O número total de passeios realizados pelos membros da Cyclistic é maior do que o número total de viagens dos usuários casuais.

### Duração média das viagem em minutos 

Pergunta - Qual a duração média das viagens de cada grupo?

```{r}
ggplot(duracao_media, aes(x= duracao_media_min, y= duracao_media_min, fill = member_casual)) +
 geom_col(color = "black", linewidth = 0.2) +
  scale_fill_manual(values = c("orange", "green")) + 
  labs(x= NULL, y = "Duração Média (min)", title = "Duração Média das Viagens (min)", fill="Tipo de Usuário") +  
  theme(axis.text.x = element_blank(), axis.ticks.x=element_blank(),
       axis.title.y = element_text(size = 16, face = "bold"),
       plot.title = element_text(size = 20, face = "bold"),
       legend.title= element_text(size = 16, face = "bold",),
       legend.text = element_text(size = 14))
```

# Compartilhar

Nesta fase do estudo, estarei usando os dados obtidos ao longo do estudo para desenvolver visualizações demonstrem os padrões de comportamento dos usuários casuais e dos usuários membros da Cyclistic.

- Qual a duração média das viagens de cada grupo? ok

- Qual o número total de viagens de cada grupo? ok

- Qual o percentual de viagens feitas por membros versus casuais? ok

- Qual é o tipo de bicicleta que os clientes casuais mais usa? ok

- Há diferenças no uso ao longo da semana? (Ex.: membros usam mais em dias úteis e casuais nos fins de semana?) ok

- A duração média varia conforme os dias da semana ou meses do ano? ok




### Pergunta - Há diferenças no uso ao longo da semana? (Ex.: membros usam mais em dias úteis e casuais nos fins de semana?)


```{r}
cyclistic_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(),
            average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Número de corridas x Tipo de usuário",  # Adicionando título
       x = "Dia da Semana", 
       y = "Número de Corridas", 
       fill = "Tipo de Usuário") +
  theme_minimal() +  # Melhorando o visual
  theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.5))  # Centralizando título

```

```{r}
cyclistic_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(),
            average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Duração Média x Tipo de Usuário",  # Adicionando título
       x = "Dia da Semana", 
       y = "Duração Média (minutos)", 
       fill = "Tipo de Usuário") +
  theme_minimal() +  # Melhorando o design do gráfico
  theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.5))  # Centralizando o título


```

Análise

### Confrontando o número total de viagens de cada tipo de usuários

```{r}
duracao_media <- cyclistic %>% 
  group_by(member_casual) %>% 
  summarise(num_viagens = length(ride_length), porcentual_viagens = (length(ride_length)/nrow(cyclistic))*100 )
print(duracao_media)
```

### Pergunta - Qual o percentual de viagens feitas por membros versus casuais?

```{r}
ggplot(duracao_media, aes(x = "", y = porcentual_viagens, fill = member_casual)) +
    geom_col(color = "black", size = 0.7) +
    coord_polar("y", start = 0) +
    geom_text(aes(label = scales :: percent(porcentual_viagens/100)), position = position_stack(vjust = 0.5), size = 10, fontface = "bold") +
scale_fill_manual(values = c("seagreen3", "orange"), name = "Tipo de Usuário", labels = c("Usuario Casual", "Membro Anual")) +
labs(title = "Total de Viagens vs. Tipo de Usuário") +
theme_void() +
theme(plot.title = element_text(size = 10, face = "bold"),
    legend.title = element_text(size = 10, face = "bold",),
    legend.text = element_text(size = 10))

     
```

### Pergunta - Qual é o tipo de bicicleta que os clientes casuais mais usa?

```{r}
ggplot(cyclistic %>% filter(member_casual == "casual") %>%
         group_by(rideable_type) %>%
         summarise(count = n()) %>%
         mutate(percentage = count / sum(count) * 100),  
       aes(x = rideable_type, y = percentage, fill = rideable_type)) +
  geom_col(color = "black", linewidth = 0.2) +  
  geom_text(aes(label = paste0(round(percentage, 1), "%")),  
            vjust = -0.5, size = 3, fontface = "bold") +  
  scale_fill_manual(values = c("dodgerblue", "firebrick", "seagreen")) +  
  labs(x = "Tipo de Bicicleta",
       y = "Porcentagem de Viagens (%)",
       title = "Uso de Bicicletas por Clientes Casuais (em %)",
       fill = "Tipo de Bicicleta") +
  theme_minimal() +
  theme(axis.title = element_text(size = 15, face = "bold"),
        plot.title = element_text(size = 10, face = "bold"),
        legend.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 10))



```

### Pergunta - A duração média varia conforme os dias da semana ou meses do ano?

```{r}
duracao_media_mes <- cyclistic %>% 
  group_by(member_casual, month) %>% 
  summarise(duracao_media = mean(ride_length)/60, .groups = 'drop')
print(duracao_media_mes)

```

```{r}
ggplot(duracao_media_mes, aes(x = month, y = duracao_media, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("seagreen3", "firebrick")) +
  labs(x= NULL, y = "Duração Média (min)", title = "Duração Média (min) vs. Mês", fill="Tipo de Usuário") +
  theme(axis.title.y = element_text(size = 15, face = "bold"),
       plot.title = element_text(size = 15, face = "bold"),
       legend.title= element_text(size = 10, face = "bold",),
       legend.text = element_text(size = 10))
```
## Principais pontos a serem considerados:

## Análise dos Gráficos: Principais Insights

### 1. Duração Média das Viagens
- **Usuários Casuais**: Tendem a ter viagens mais longas, especialmente nos fins de semana e meses de clima favorável, sugerindo uso recreativo ou turístico.
- **Membros Assinantes**: Apresentam viagens mais curtas e consistentes ao longo da semana e do ano, indicando uso para deslocamentos regulares.

### 2. Número de Viagens
- **Membros Assinantes**: Realizam a maioria das viagens (64%), mostrando que são o grupo mais ativo e consistente.
- **Usuários Casuais**: Representam 36% das viagens, com picos de uso nos fins de semana, indicando um padrão de uso mais esporádico e recreativo.

### 3. Preferência por Tipos de Bicicletas
- **Bicicletas Clássicas**: São as mais utilizadas por usuários casuais (62,9%), provavelmente devido à familiaridade e conforto.
- **Bicicletas Elétricas**: Representam 35,4% do uso, indicando uma preferência significativa por uma opção mais rápida e menos cansativa.
- **Patinetes Elétricos**: Têm uso mínimo (1,7%), sugerindo menor popularidade ou disponibilidade.

### 4. Variação Mensal
- **Usuários Casuais**: A duração média das viagens aumenta em meses específicos, como verão, indicando maior uso para atividades recreativas durante períodos de clima agradável.
- **Membros Assinantes**: Mantêm uma duração média estável ao longo do ano, refletindo uso consistente para deslocamentos diários.

### 5. Oportunidades de Conversão
- **Fins de Semana e Meses de Pico**: Como os usuários casuais já utilizam o serviço ativamente nesses períodos, campanhas de marketing direcionadas podem incentivá-los a se tornarem membros assinantes.
- **Incentivos para Uso Durante a Semana**: Oferecer passes promocionais ou descontos para dias úteis pode ajudar a converter usuários casuais em membros.

### 6. Estratégias de Marketing
- **Campanhas Temáticas**: Desenvolver campanhas que destacam os benefícios financeiros e de conveniência de ser um membro assinante.
- **Programas de Fidelidade**: Implementar programas que recompensem o uso frequente, incentivando a conversão de usuários casuais.

### 7. Feedback e Melhorias
- **Pesquisas de Satisfação**: Coletar feedback para entender as necessidades e objeções dos usuários casuais, ajustando as estratégias conforme necessário.
- **Melhoria Contínua**: Aumentar a disponibilidade de bicicletas elétricas e patinetes, e melhorar a experiência do usuário com base no feedback.

## Conclusão
Os gráficos revelam que os usuários casuais têm um padrão de uso distinto, com viagens mais longas e esporádicas, especialmente nos fins de semana e meses de clima favorável. A Cyclistic pode aproveitar essas informações para desenvolver estratégias de marketing e ofertas personalizadas que incentivem a conversão de usuários casuais em membros assinantes, aumentando assim a base de clientes fiéis e a lucratividade da empresa.

# Agir

## Ações propostas para a Cyclistic:

- Passeios exclusivos para membros, criando uma comunidade engajada e atraindo mais usuários casuais.

- Relatos reais de assinantes falando sobre a experiência e as vantagens

- Um plano mais barato que dá acesso ilimitado às bikes apenas nos finais de semana. Como muitos casuais usam as bicicletas nesses dias, pode ser um incentivo para testar a assinatura

- Usuários casuais poderiam experimentar a assinatura anual por um mês com um preço reduzido

- Criar desafios semanais e mensais com prêmios para engajar usuários membros do plano anual
















```











