FROM nextcloud:27.1.4-apache

COPY app-hooks/post-installation /docker-entrypoint-hooks.d/post-installation

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]