DevOps Architecture – Challenge REF: IT-AR
Autor: Jefferson Muniz de Moura
Cargo Alvo: DevOps Engineer / SRE
Data: 08/04/2025
Tech Stack (Revisada e Estratégica)
Distribuição e Deploy do Executável
Principal: Docker (empacotamento em imagem leve, compatível com qualquer runtime containerizado)


Alternativas: Podman, Buildah, Bazel, Nix (para build hermético), ou distribuição via artefatos binários (Releases GitHub, S3, etc)
Orquestração e Execução em Produção
Principal: Kubernetes em AWS (EKS) como padrão corporativo


Alternativas: GKE (Google), AKS (Azure), Nomad, ECS (Fargate), K3s (edge), K0s
Pipeline CI/CD
Principal: GitHub Actions (nativo, robusto, ideal para GitHub-hosted)


Alternativas: GitLab CI/CD, Jenkins (autogerenciado), CircleCI, Argo Workflows, Tekton, Harness, Azure DevOps Pipelines
Registro de Artefatos e Imagens
Principal: Amazon ECR (integração nativa com AWS e EKS)


Alternativas: GitHub Container Registry, Harbor (on-prem e compliance), Docker Hub (dev), GCR (Google), Quay
Escalonamento durante Picos de Tráfego
Principal: HPA (Horizontal Pod Autoscaler) do Kubernetes com métricas nativas (CPU/RAM, custom metrics)
Alternativas: KEDA (event-driven scaling), Cluster Autoscaler, VPA (Vertical Pod Autoscaler), escalabilidade via Redis Queue, Kafka ou Pub/Sub


Ingress & Balanceamento de Carga
Principal: Ingress Controller com NGINX (equilibrado entre robustez e simplicidade)


Alternativas: Istio Gateway, AWS ALB Ingress Controller, Traefik, Envoy, Kong


Fila / Buffer para Alta Carga
Principal: Kafka (distribuído, resiliente e ideal para sistemas críticos)


Alternativas: AWS SQS, GCP Pub/Sub, RabbitMQ, NATS Streaming, Redis Streams


CDN e Distribuição de Conteúdo
Principal: Cloudflare (segurança, cache, proteção DDoS)


Alternativas: Fastly, AWS CloudFront, Akamai, Netlify Edge, Bunny.net


Alta Disponibilidade
Principal: Multi-Zone Kubernetes com readiness/liveness probes e réplicas ativas


Alternativas e complementares: Service Mesh com Istio, DNS failover, Database cluster ativo-ativo (PostgreSQL com Patroni, Redis Sentinel), Load Balancer HA (ALB/NLB, Envoy)


Monitoramento e Métricas
Principal: Prometheus + Grafana (padrão de mercado, extensível)


Alternativas: Datadog, New Relic, CloudWatch, Zabbix, Victoria Metrics, InfluxDB + Chronograf


Logs Centralizados
Principal: Loki (leve, integrável com Grafana e Prometheus)


Alternativas: ELK (ElasticSearch + Logstash + Kibana), Fluent Bit, Graylog, Splunk, Sumo Logic


Alertas e Incidentes
Principal: Alertmanager + integração com PagerDuty


Alternativas: Opsgenie, VictorOps, Prometheus Alert Webhook, New Relic Alerts, Zabbix, Discord/Slack Webhook com bot


Ambiente de Desenvolvimento e Testes
Principal: Kind (Kubernetes in Docker, simula ambiente real localmente)


Alternativas: Minikube, Tilt, Skaffold, Telepresence, Garden, Docker Compose (para stack leve)


Testes de Performance e Carga
Principal: k6 (moderno, leve, script em JS)


Alternativas: Locust, Gatling, Artillery, JMeter, Vegeta



Diagrama de Arquitetura (Alto Nível)

[Client / Frontend]
        |
    [API Gateway]
        |
+--------------------------+
| Authentication Service  |
+--------------------------+
        |
    [ Core Service (Go) ] <--> [ Kafka / PubSub ]
        |            |
 [Audit Service]   [Legacy Adapter]
        |
    [Prometheus, Grafana, Loki]

DevOps flow
Pipeline CI/CD

[Commit] 
   ↓
[Code Quality Scan] → [Unit Tests] 
   ↓
[Build Binary] 
   ↓
[Dockerize] 
   ↓
[SAST/DAST Scan] 
   ↓
[Push to Registry] 
   ↓
[Deploy to Staging] 
   ↓
[E2E Tests / Load Test] 
   ↓
[Manual Approval (if needed)] 
   ↓
[Deploy to Prod]


Métricas de Acompanhamento
Equipe:


Lead Time


Throughput (entregas semanais)


Cycle Time


SLA de incidentes


Individuais (não punitivas):


Pull Requests revisadas


Bugs encontrados por estágio


Participação em deploys e incidentes


Proatividade em reuniões técnicas
