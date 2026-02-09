# API Documentation

## REST API Reference

This section provides complete API documentation for Zarish Sphere SSOT.

## Contents

- API Overview
- Authentication
- Endpoints
- Request/Response Examples
- Error Handling
- Rate Limiting

## API Endpoints

### Patient API
- `GET /api/patients` - List patients
- `POST /api/patients` - Create patient
- `GET /api/patients/{id}` - Get patient
- `PUT /api/patients/{id}` - Update patient
- `DELETE /api/patients/{id}` - Delete patient

### Encounter API
- `GET /api/encounters` - List encounters
- `POST /api/encounters` - Create encounter
- `GET /api/encounters/{id}` - Get encounter

### Observation API
- `GET /api/observations` - List observations
- `POST /api/observations` - Create observation

## Authentication

API uses OAuth 2.0 / JWT tokens:
```
Authorization: Bearer <token>
```

## Base URL

```
https://api.zarishsphere.org/v1
```

## Examples

See [/api/](../../api/) for detailed examples.
