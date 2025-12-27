# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| < 1.1   | :x:                |

## Reporting a Vulnerability

**DO NOT** open public issues for security vulnerabilities.

Please report security vulnerabilities by emailing: richkmeli@gmail.com

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

## Security Best Practices

### Production Deployment

1. **Never use default credentials**
   - Change all passwords in `.env` file
   - Use strong, randomly generated passwords (min 16 characters)

2. **Encryption Key**
   - Generate a secure 32+ character encryption key
   - Never commit encryption keys to version control
   - Rotate keys periodically

3. **Database Security**
   - Use separate database user with minimal privileges
   - Enable SSL/TLS for database connections
   - Regular backups with encryption

4. **Network Security**
   - Use HTTPS only (configure SSL certificates)
   - Implement firewall rules
   - Use VPN or private networks when possible

5. **Application Security**
   - Keep dependencies updated
   - Enable security headers
   - Implement rate limiting
   - Regular security audits

### Environment Variables

Required environment variables for production:

```bash
DB_PASSWORD=<strong-password>
ENCRYPTION_KEY=<32-char-minimum-key>
SPRING_PROFILES_ACTIVE=prod
DEBUG_MODE=false
```

## Known Security Considerations

This is a research/educational project demonstrating C2 infrastructure. 

**Use only in authorized, controlled environments.**
