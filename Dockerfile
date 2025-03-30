# Use uma imagem base do Python
FROM python:3.8-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /

# Copie os arquivos necessários para o container
COPY . .

# Instale as dependências do projeto
RUN python -m venv /app/venv && \
    /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install bandit
RUN pip install --no-cache-dir -r requirements.txt

# Exponha a porta usada pelo Flask
EXPOSE 5000

# Comando para iniciar o servidor Flask
CMD ["python", "app/todo_project/run.py"]