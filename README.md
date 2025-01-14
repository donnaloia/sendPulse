# sendPulse $\textcolor{#86c5da}{\text{ϟ}}$

Put simply, sendPulse is a platform for organizing and sending emails to users in bulk.
I started this project for fun after I got turned down for a job at Postscript that I was really excited about.
I figured if I could build something similar in a weekend, maybe they'd be impressed and at least engage in a conversation with me about how I think about system design.


![sendPulse Diagram](./system-design/diagrams/sendpulse-sd-diagram-2.png)


Anyway, there is a smorgosborg of technologies and frameworks that I've used to build this project.  

- [Gleam](https://gleam.run/) for the authentication AND permissions service
- [Go](https://go.dev/) for the business logic service
- [NextJS](https://nextjs.org/) for the frontend
- [ReactJS](https://reactjs.org/) for the frontend
- [EffectTS](https://effect.ts/) for the frontend
- [MongoDB](https://www.mongodb.com/) for the permissions database
- [PostgreSQL](https://www.postgresql.org/) for the business logic database
- [Redis](https://redis.io/) for the permissions cache
- [Prometheus](https://prometheus.io/) for monitoring
- [Grafana](https://grafana.com/) for the monitoring dashboard

I've also used a lot of other technologies and frameworks to build this project.
- [Terraform](https://www.terraform.io/) for the infrastructure as code
- [Docker](https://www.docker.com/) for the containerization
- [Kubernetes](https://kubernetes.io/) for the container orchestration
- [GitHub Actions](https://github.com/features/actions) for the CI/CD pipeline


There are a lot of things that I would change about this project if I were to do it again or continue working on it and I think there's a lot of great conversations to be had there.


# Featured Microservices

- [Authentication Service](https://github.com/donnaloia/authentication-service)
- [Permissions Service](https://github.com/donnaloia/permissions-service)
- [Email Campaign Service](https://github.com/donnaloia/email-campaign-service)
- [Frontend Service](https://github.com/donnaloia/sendPulse-frontend)


