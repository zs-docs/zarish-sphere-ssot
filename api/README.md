# API Documentation

REST API reference for Zarish Sphere SSOT.

## Base URL

```
https://api.zarishsphere.org/v1
```

## Authentication

All API requests require authentication via OAuth 2.0 / JWT tokens:

```
Authorization: Bearer <your-token>
```

## Endpoints

### Patient API
- `GET /api/patients` - List patients
- `POST /api/patients` - Create patient
- `GET /api/patients/{id}` - Get patient details
- `PUT /api/patients/{id}` - Update patient
- `DELETE /api/patients/{id}` - Delete patient

### Encounter API
- `GET /api/encounters` - List encounters
- `POST /api/encounters` - Create encounter
- `GET /api/encounters/{id}` - Get encounter details

### Observation API
- `GET /api/observations` - List observations
- `POST /api/observations` - Create observation

### Form API
- `GET /api/forms` - List available forms
- `GET /api/forms/{id}` - Get form schema
- `POST /api/submissions` - Submit form data

## Response Format

All responses are in JSON format:

```json
{
  "status": "success",
  "data": { ... },
  "message": "Optional message"
}
```

## Error Handling

Error responses include:

```json
{
  "status": "error",
  "code": 400,
  "message": "Error description",
  "details": { ... }
}
```

## Rate Limiting

- Rate limit: 1000 requests per hour
- Header: `X-RateLimit-Remaining`

## Documentation

See [/docs/08-api/](../docs/08-api/) for complete API documentation.
