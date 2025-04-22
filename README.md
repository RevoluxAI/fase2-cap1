# 🌾 Projeto FarmTech Solutions – Agricultura Digital

## 📘 Descrição do Projeto

Este projeto foi desenvolvido como parte da disciplina de Banco de Dados, baseado nos capítulos 10, 11 e 12. O objetivo é modelar um banco de dados relacional para auxiliar produtores rurais a monitorar suas plantações com sensores e aplicar recursos (água, nutrientes, etc.) de forma eficiente e inteligente.

A modelagem foi feita com base em dados coletados por sensores e registros de aplicação de insumos nas plantações. Os dados são armazenados para análise, histórico e tomada de decisões futuras, otimizando o uso de recursos.

---

## 📌 Objetivos do Sistema

- Armazenar leituras de sensores de umidade, pH e nutrientes (NPK)
- Registrar aplicações de recursos como água, nitrogênio, fósforo e potássio
- Relacionar plantações com diferentes culturas ao longo do tempo
- Permitir análises históricas das condições e intervenções nas plantações

---

## 🧱 Entidades e Atributos (MER)

### 1. `TB_TIPO_SENSOR`
- `TP_SENS_PK_ID` (PK) – Identificador do tipo sensor – `INTEGER`
- `TP_SENS_NOME` – Tipo (umidade, pH, nutrientes) – `VARCHAR(50)`
- `TP_SENS_UNI_MEDIDA` – Unidade (%, mg/kg, etc.) – `VARCHAR(20)`

### 2. `TB_SENSOR`
- `SENS_PK_ID` (PK) – Identificador do sensor – `INTEGER`
- `TP_SENS_PK_ID` (FK) –  Identificador do tipo sensor – `INTEGER`
- `SENS_MODELO` – Modelo – `VARCHAR(50)`

### 3. `TB_LEITURA`
- `PLANT_PK_ID` (PF) – Plantação medida – `INTEGER`
- `LEIT_PK_ID` (PK) – Identificador da leitura – `INTEGER`
- `SENS_PK_ID` (FK) – Sensor que fez a leitura – `INTEGER`
- `LEIT_VALOR_LIDO` – Valor numérico da medição – `NUMBER`
- `LEIT_DAT_HORA` – Data Hora da medida – `DATE`

### 4. `TB_PLANTACAO`
- `PLANT_PK_ID` (PK) – Identificador único da plantação – `INTEGER`
- `CULT_PK_ID` (FK) –Identificador da cultura – `INTEGER`
- `PLANT_NOME` – Nome da plantação – `VARCHAR(50)`
- `PLANT_AREA_M2` – Área em metros quadrados – `NUMBER`
- `PLANT_DT_INICIO` – Data inicio  – `DATA`
- `PLANT_DT_FINAL` – Data final – `DATA`

### 4. `TB_CULTURA`
- `CULT_PK_ID` (PK) – Identificador da cultura – `INTEGER`
- `CULT_NOME` – Nome da cultura (ex: milho, soja) – `VARCHAR(100)`
- `CULT_TIPO` – Tipo (leguminosa, grão, etc.) – `VARCHAR(50)`

### 5. `TB_APLICACAO`
- `PLANT_PK_ID` (PF) – Plantação que recebeu o recurso – `INTEGER`
- `APLIC_PK_ID` (PK) – Identificador da aplicação – `INTEGER`
- `APLIC_DATA_HORA` – Data e hora – `DATE`
- `APLIC_TIPO_RECURSO` – Tipo (água, fósforo, potássio...) – `VARCHAR(50)`
- `APLIC_QUANTIDADE` – Quantidade aplicada (litros, kg, etc.) – `NUMBER`
- `APLIC_DESCRICAO` – Descriçao da aplicação – `VARCHAR(100)`

### 6. `TB_PREVISAO`
- `PREV_PK_ID` (PK) – Identificador da aplicação – `INTEGER`
- `PLANT_PK_ID` (FK) – Plantação que recebeu o recurso – `INTEGER`
- `PREV_DATA_HORA` – Data hora da previsão – `DATA`
- `PREV_TIPO_RECURSO` – Tipo de recurso – `VARCHAR(50)`
- `PREV_QUANT_RECURSO` – Quantidade do recurso – `NUMBER`

---

## 🔄 Relacionamentos

- **TB_TIPO_SENSOR → TB_SENSOR**: 1:N
- **TB_SENSOR → TB_LEITURA**: 1:N
- **TB_PLANTACAO → TB_LEITURA**: 1:N
- **TB_PLANTACAO → TB_APLICACAO**: 1:N
- **TB_PLANTACAO → TB_PREVISAO**: 1:N
- **TB_CULTURA → TB_PLANTACAO**: 1:N 

---

## 🧩 DER (Diagrama Entidade Relacionamento)

📷 Veja o diagrama completo em:  
[`PROJETO_SENSOR.png`](./PROJETO_SENSOR.png)

---

## 📂 Estrutura do Repositório

```bash
📦 projeto-farmtech
 ┣ 📂 DMD_PROJETO
    ┣ 📂 DMD_PROJETO_SENSOR
    ┣ 📄 DMD_PROJETO_SENSOR.DMD
 ┣ 📄 PROJETO_SENSOR.png
 ┣ 📄 SCRIPT_DDL_PROJETO_SENSOR.SQL
 ┣ 📄 README.md
