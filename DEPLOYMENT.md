# Deployment Guide - Richkware Manager Server

## Prerequisites

- Docker and Docker Compose installed
- Java 17 JDK (for building)
- Maven 3.6+
- Minimum 2GB RAM, 10GB disk space

## Production Deployment Steps

### 1. Prepare Environment

```bash
# Clone repository
git clone https://github.com/richkmeli/Richkware-Manager-Server.git
cd Richkware-Manager-Server

# Create environment file
cp .env.example .env
```

### 2. Configure Security

Edit `.env` file with secure values:

```bash
# Generate strong password (example using openssl)
openssl rand -base64 32

# Generate encryption key
openssl rand -hex 32

# Update .env
DB_PASSWORD=<generated-password>
ENCRYPTION_KEY=<generated-key>
SPRING_PROFILES_ACTIVE=prod
DEBUG_MODE=false
```

### 3. Build Application

```bash
# Build with Maven
mvn clean package -DskipTests

# Verify WAR file created
ls -lh target/Richkware-Manager-Server.war
```

### 4. Deploy with Docker Compose

```bash
# Start services
docker-compose up -d

# Check logs
docker-compose logs -f web

# Verify services are healthy
docker-compose ps
```

### 5. Verify Deployment

```bash
# Test database connection
docker-compose exec db mysql -urichk -p richkware

# Test web application
curl http://localhost:8080/Richkware-Manager-Server/

# Check application logs
docker-compose logs web | tail -50
```

### 6. Configure Firewall

```bash
# Allow only necessary ports
sudo ufw allow 8080/tcp
sudo ufw enable
```

## SSL/TLS Configuration

### Using Reverse Proxy (Recommended)

Install Nginx as reverse proxy:

```bash
# Install Nginx
sudo apt install nginx

# Configure SSL with Let's Encrypt
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
```

Nginx configuration example:

```nginx
server {
    listen 443 ssl http2;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Backup Strategy

### Database Backup

```bash
# Create backup script
cat > backup.sh << 'EOF'
#!/bin/bash
BACKUP_DIR="/backups"
DATE=$(date +%Y%m%d_%H%M%S)
docker-compose exec -T db mysqldump -uroot -p$DB_PASSWORD richkware > $BACKUP_DIR/richkware_$DATE.sql
gzip $BACKUP_DIR/richkware_$DATE.sql
# Keep only last 7 days
find $BACKUP_DIR -name "richkware_*.sql.gz" -mtime +7 -delete
EOF

chmod +x backup.sh

# Add to crontab (daily at 2 AM)
echo "0 2 * * * /path/to/backup.sh" | crontab -
```

## Monitoring

### Health Checks

```bash
# Application health
curl http://localhost:8080/Richkware-Manager-Server/actuator/health

# Database health
docker-compose exec db mysqladmin ping -h localhost
```

### Log Monitoring

```bash
# Real-time logs
docker-compose logs -f --tail=100

# Application logs
docker-compose exec web tail -f /usr/local/tomcat/logs/catalina.out
```

## Troubleshooting

### Container won't start

```bash
# Check logs
docker-compose logs web
docker-compose logs db

# Restart services
docker-compose restart

# Full reset (WARNING: deletes data)
docker-compose down -v
docker-compose up -d
```

### Database connection issues

```bash
# Verify database is running
docker-compose ps db

# Check database logs
docker-compose logs db

# Test connection
docker-compose exec web nc -zv db 3306
```

### Performance issues

```bash
# Check resource usage
docker stats

# Increase memory limits in docker-compose.yml
services:
  web:
    mem_limit: 2g
  db:
    mem_limit: 1g
```

## Updating

```bash
# Pull latest changes
git pull origin master

# Rebuild
mvn clean package

# Restart services
docker-compose down
docker-compose up -d

# Verify
docker-compose ps
```

## Security Checklist

- [ ] Changed all default passwords
- [ ] Generated secure encryption key
- [ ] Configured SSL/TLS
- [ ] Enabled firewall
- [ ] Set up automated backups
- [ ] Configured log rotation
- [ ] Disabled debug mode
- [ ] Restricted database access
- [ ] Implemented monitoring
- [ ] Documented incident response plan
