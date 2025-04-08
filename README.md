
# DevOps Architecture – Challenge REF: IT-AR

![DevOps Architecture Diagram](devops-architecture-diagram.png)

## Descrição

Proposta técnica de arquitetura para um microserviço Go em ambiente bancário, com requisitos de alta disponibilidade, escalabilidade automática, rastreabilidade, observabilidade e ambiente Kubernetes em produção (EKS).

---

## Tech Stack

### Distribuição e Deploy do Executável
- Principal: Docker  
- Alternativas: Podman, Buildah, Bazel, Nix, GitHub Releases, S3

### Orquestração
- Principal: Kubernetes (EKS – AWS)  
- Alternativas: GKE, AKS, Nomad, ECS, K3s, K0s

### Pipeline CI/CD
- Principal: GitHub Actions  
- Alternativas: GitLab CI/CD, Jenkins, CircleCI, Argo Workflows, Tekton, Azure DevOps

### Registro de Artefatos
- Principal: Amazon ECR  
- Alternativas: GHCR, Harbor, Docker Hub, GCR, Quay

### Escalonamento
- Principal: HPA (Horizontal Pod Autoscaler)  
- Alternativas: KEDA, Cluster Autoscaler, VPA, Redis Queue, Kafka

### Ingress e Balanceamento
- Principal: NGINX  
- Alternativas: Istio, ALB Ingress, Traefik, Envoy, Kong

### Fila / Buffer
- Principal: Kafka  
- Alternativas: SQS, Pub/Sub, RabbitMQ, NATS, Redis Streams

### CDN
- Principal: Cloudflare  
- Alternativas: Fastly, CloudFront, Akamai, Netlify Edge, Bunny.net

### Alta Disponibilidade
- Principal: Multi-Zone com readiness/liveness probes  
- Alternativas: Istio, DNS failover, PostgreSQL Patroni, Redis Sentinel, ALB/NLB, Envoy

### Monitoramento
- Principal: Prometheus + Grafana  
- Alternativas: Datadog, New Relic, CloudWatch, Zabbix, VictoriaMetrics, InfluxDB

### Logs
- Principal: Loki  
- Alternativas: ELK, Fluent Bit, Graylog, Splunk, Sumo Logic

### Alertas
- Principal: Alertmanager + PagerDuty  
- Alternativas: Opsgenie, VictorOps, Webhook, New Relic, Zabbix

### Dev/Test Local
- Principal: Kind  
- Alternativas: Minikube, Tilt, Skaffold, Telepresence, Garden, Docker Compose

### Testes de Performance
- Principal: k6  
- Alternativas: Locust, Gatling, Artillery, JMeter, Vegeta

---

## Diagrama de Arquitetura

```
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
```

---

## Pipeline CI/CD

```
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
```

---

## Métricas de Acompanhamento

### Equipe
- Lead Time  
- Throughput  
- Cycle Time  
- SLA de incidentes

### Individuais
- PRs revisadas  
- Bugs por estágio  
- Participação em deploys  
- Proatividade em reuniões

---

## Estrutura de Time Ideal

| Cargo             | Skills principais                                      |
|------------------|--------------------------------------------------------|
| Eng. Backend      | Go, testes, REST/gRPC, performance                     |
| Eng. DevOps / SRE | Terraform, Docker, Kubernetes, CI/CD, observabilidade |
| Eng. Front/API    | API Gateway, OAuth2, JWT, segurança                    |
| Eng. QA           | Testes automatizados, carga, observabilidade           |
| Eng. Integrador   | Kafka, sistemas legados, tolerância a falhas           |
| Tech Lead         | Arquitetura, revisão, liderança técnica                |
