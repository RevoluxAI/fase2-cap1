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

### 1. `SENSOR`
- `id_sensor` (PK) – Identificador do sensor – `INTEGER`
- `tipo_sensor` – Tipo (umidade, pH, nutrientes) – `VARCHAR(50)`
- `modelo_sensor` – Modelo – `VARCHAR(50)`
- `unidade_medida` – Unidade (%, mg/kg, etc.) – `VARCHAR(20)`

### 2. `LEITURA_SENSOR`
- `id_leitura` (PK) – Identificador da leitura – `INTEGER`
- `id_sensor` (FK) – Sensor que fez a leitura – `INTEGER`
- `id_plantacao` (FK) – Plantação medida – `INTEGER`
- `valor_lido` – Valor numérico da medição – `NUMBER`

### 3. `PLANTACAO`
- `id_plantacao` (PK) – Identificador único da plantação – `INTEGER`
- `nome_plantacao` – Nome da plantação – `VARCHAR(50)`
- `area_m2` – Área em metros quadrados – `NUMBER`

### 4. `APLICACAO_RECURSOS`
- `id_aplicacao` (PK) – Identificador da aplicação – `INTEGER`
- `id_plantacao` (FK) – Plantação que recebeu o recurso – `INTEGER`
- `data_hora_aplicacao` – Data e hora – `DATE`
- `tipo_recurso` – Tipo (água, fósforo, potássio...) – `VARCHAR(50)`
- `quantidade` – Quantidade aplicada (litros, kg, etc.) – `NUMBER`

### 5. `PLANTACAO_CULTURA` *(Associação N:N)*
- `id_plantacao_cultura` (PK) – `INTEGER`
- `id_plantacao` (FK) – `INTEGER`
- `id_cultura` (FK) – `INTEGER`
- `data_inicio` – Início do plantio – `DATE`
- `data_final` – Final da cultura – `DATE`

### 6. `CULTURA`
- `id_cultura` (PK) – Identificador da cultura – `INTEGER`
- `nome_cultura` – Nome da cultura (ex: milho, soja) – `VARCHAR(100)`
- `tipo_cultura` – Tipo (leguminosa, grão, etc.) – `VARCHAR(50)`

---

## 🔄 Relacionamentos

- **SENSOR → LEITURA_SENSOR**: 1:N
- **PLANTACAO → LEITURA_SENSOR**: 1:N
- **PLANTACAO → APLICACAO_RECURSOS**: 1:N
- **PLANTACAO ↔ CULTURA**: N:N (via PLANTACAO_CULTURA)

---

## 🧩 DER (Diagrama Entidade Relacionamento)

📷 Veja o diagrama completo em:  
[`modelo.png`](./modelo.png)

---

## 📂 Estrutura do Repositório

```bash
📦 projeto-farmtech
 ┣ 📄 modelo.dmd
 ┣ 📄 modelo.png
 ┣ 📄 SCRIPT_DDL_PROJETO_SENSOR.SQL
 ┣ 📄 README.md
