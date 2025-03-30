from prometheus_client import Counter, generate_latest
from flask import Response
from todo_project import app

# Criando um contador para monitorar o número de requisições
REQUEST_COUNT = Counter('request_count', 'Total de requisições recebidas')

@app.before_request
def before_request():
    REQUEST_COUNT.inc()

# Rota para expor as métricas em /metrics
@app.route('/metrics')
def metrics():
    return Response(generate_latest(), mimetype='text/plain')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)