# MERN Production Project

A full-stack MERN application with separate `backend` and `frontend` services, container-ready configuration, and Kubernetes deployment manifests.

## Project Overview

- `backend/` - Express.js API server using MongoDB via Mongoose.
- `frontend/` - React application bootstrapped with Create React App.
- `docker-compose.yml` - Local container stack for MongoDB, backend, and frontend.
- `k8s/` - Kubernetes manifests for backend, frontend, and service resources.
- `nginx/` - Reverse proxy configuration used for frontend routing and API proxying.
- `Dockerfile` (root) - Jenkins build agent image, not the application runtime image.

## Architecture

1. `backend`
   - Exposes REST endpoints.
   - Uses `dotenv` for environment variables.
   - Connects to MongoDB using `MONGO_URI`.
   - Health endpoint: `GET /health`

2. `frontend`
   - React SPA served on port `3000` in development.
   - Includes static build capability via `npm run build`.

3. `mongodb`
   - Defined in `docker-compose.yml` using official `mongo:6` image.
   - Uses a named volume for persistent storage.

4. `nginx`
   - Configured to serve frontend assets and proxy `/api/` traffic to backend.
   - Used by Kubernetes manifests for production-style routing.

## Folder Structure

- `backend/`
  - `server.js` - server bootstrapper.
  - `app.js` - Express app configuration.
  - `config/db.js` - MongoDB connection helper.
  - `tests/app.test.js` - backend integration test.
  - `Dockerfile` - backend service container image.

- `frontend/`
  - `src/App.js` - main React component.
  - `public/` - static assets.
  - `Dockerfile` - frontend service container image.

- `k8s/`
  - `backend-deployment.yaml`
  - `backend-service.yaml`
  - `frontend-deployment.yaml`
  - `frontend-service.yaml`

- `nginx/nginx.conf` - reverse proxy and SPA routing configuration.

## Getting Started

### Prerequisites

- Node.js and npm
- Docker and Docker Compose
- MongoDB (optional if using Docker Compose)
- `kubectl` and a Kubernetes cluster (optional)

### Local Development

1. Start the backend

```bash
cd backend
npm install
npm run dev
```

2. Start the frontend

```bash
cd frontend
npm install
npm start
```

Open the frontend at `http://localhost:3000` and the backend at `http://localhost:5000`.

### Backend API Endpoints

- `GET /` - Returns `{ message: 'MERN Backend API is running' }`
- `GET /health` - Returns server health status and timestamp

> Note: Additional API routes can be added under `backend/routes` and `backend/controllers`.

## Running with Docker Compose

Use the included compose stack for local container-based deployment.

```bash
docker compose up --build
```

Services:
- `mongodb` on `27017`
- `backend` on `5000`
- `frontend` on `3000`

### Environment Variables

Set the backend environment in `docker-compose.yml` or in a `.env` file:

- `MONGO_URI` - MongoDB connection string
- `PORT` - backend port
- `NODE_ENV` - `development` or `production`

Example for Docker Compose:

```yaml
environment:
  - MONGO_URI=mongodb://admin:example123@mongodb:27017
  - PORT=5000
```

## Testing

Run backend tests with Jest and Supertest:

```bash
cd backend
npm test
```

## Kubernetes Deployment

The `k8s/` directory contains deployment and service manifests.

Apply the manifests:

```bash
kubectl apply -f k8s/
```

### Notes

- Kubernetes manifests reference container images named `madanrayamajhi/backend:latest` and `madanrayamajhi/frontend:latest`.
- The frontend manifest mounts `nginx/nginx.conf` for proxying requests to the backend.

> Important: The current frontend Docker image starts the CRA development server on port `3000`. For a production-grade Kubernetes deployment, build the React app and serve static files through an Nginx-based image.

## Production Considerations

- Use a production-ready reverse proxy such as Nginx for static asset serving and API routing.
- Build frontend assets with `npm run build` before deploying.
- Secure MongoDB credentials and avoid hard-coded passwords.
- Configure health probes and readiness probes in Kubernetes.
- Use environment-specific configuration for `NODE_ENV`, database URI, and service endpoints.

## Deployment Checklist

- [ ] Build frontend assets with `npm run build`
- [ ] Build backend production image
- [ ] Push images to a container registry
- [ ] Update Kubernetes manifests with registry image tags
- [ ] Configure secrets for MongoDB and app environment
- [ ] Enable HTTPS and proper CORS policies


