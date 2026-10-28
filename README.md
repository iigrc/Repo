# Docker web stack experiment

Historical 2018 Ansible/Docker Compose experiment combining HAProxy, Nginx, PHP-FPM, MySQL, and Redis. The Ansible playbooks invoke Docker Compose on an existing host. This is example code and needs dependency and configuration review before reuse.

## Local secrets

Copy `.env.example` to `.env` and set distinct strong MySQL and Redis passwords locally. Compose requires both values. Redis is explicitly started with password authentication. The `.env` file is ignored by Git. Database ports are bound to loopback for local access; adjust networking deliberately if deploying to another host.

Supply fresh TLS material locally in the ignored `certs/` directory:

- `dockerproject.gq.pem`: HAProxy certificate chain and matching private key.
- `dockerproject.gq.pem.ocsp`: OCSP response if used by your chosen HAProxy version.
- `fullchain.pem` and `privkey.pem`: Nginx certificate chain and matching private key.

Certificate mounts are read-only. Update the domain names and certificate configuration for your own environment. Never commit private keys or combined certificate/key bundles. The tracked `dhparm.pem` contains public Diffie-Hellman parameters, not a private key.

The HAProxy statistics endpoint is disabled. Configure authentication through your deployment's secret-management mechanism before enabling it.

## Security cleanup

Previously committed private keys, certificate artifacts, and hardcoded service credentials were removed from branch history in October 2026. The old certificate expired in June 2018, but any reuse of its private key still requires replacement. Rotate any previously exposed passwords that remain in use. Git cleanup does not revoke credentials or erase existing clones and caches.

The certificate tutorial and captured command output are historical notes. Review image versions and all service configurations before deployment; the floating image tags are not a tested modern stack.
