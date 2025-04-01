# Use uma imagem base do Python
FROM python:3.8-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie apenas os arquivos necessários para instalar as dependências
COPY requirements.txt ./


# Instala as dependências do sistema
RUN apt-get update && apt-get install -y curl

# Instale as dependências do projeto
RUN python -m venv /app/venv && \
    /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install -r requirements.txt && \
    /app/venv/bin/pip install prometheus_client bandit

# Copie os demais arquivos para o container
COPY . .

# Exponha a porta usada pelo Flask
EXPOSE 5000

# Configuração do Prometheus
ENV PROMETHEUS_METRICS_PORT=9090
ENV PROMETHEUS_METRICS_ENABLED=true

# Comando para iniciar o servidor Flask
CMD ["/app/venv/bin/python", "app/run.py"]