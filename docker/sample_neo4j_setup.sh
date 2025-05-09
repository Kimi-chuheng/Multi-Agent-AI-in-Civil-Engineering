#!/bin/bash

# Script to create multiple Neo4j instances for the Multi-Agent Civil Engineering system
# This script sets up Docker containers for Neo4j with APOC plugin

# Stop running containers if needed
echo "Checking for running Neo4j containers..."
docker ps | grep neo4j_ && echo "Stopping existing containers..." && docker stop $(docker ps -q --filter "name=neo4j_")

# Create Neo4j instance 1
echo "Creating Neo4j instance 1..."
docker run -d -p 7474:7474 -p 7687:7687 --name neo4j_1 \
  -e NEO4J_AUTH=neo4j/password \
  -e NEO4J_apoc_export_file_enabled=true \
  -e NEO4J_apoc_import_file_enabled=true \
  -e NEO4J_apoc_import_file_use__neo4j__config=true \
  -e NEO4J_PLUGINS='["apoc"]' \
  -v neo4j_volume_1:/var/lib/neo4j neo4j:5.26.1

# Create Neo4j instance 2
echo "Creating Neo4j instance 2..."
docker run -d -p 7475:7474 -p 7688:7687 --name neo4j_2 \
  -e NEO4J_AUTH=neo4j/password \
  -e NEO4J_apoc_export_file_enabled=true \
  -e NEO4J_apoc_import_file_enabled=true \
  -e NEO4J_apoc_import_file_use__neo4j__config=true \
  -e NEO4J_PLUGINS='["apoc"]' \
  -v neo4j_volume_2:/var/lib/neo4j neo4j:5.26.1

# Create Neo4j instance 3
echo "Creating Neo4j instance 3..."
docker run -d -p 7476:7474 -p 7689:7687 --name neo4j_3 \
  -e NEO4J_AUTH=neo4j/password \
  -e NEO4J_apoc_export_file_enabled=true \
  -e NEO4J_apoc_import_file_enabled=true \
  -e NEO4J_apoc_import_file_use__neo4j__config=true \
  -e NEO4J_PLUGINS='["apoc"]' \
  -v neo4j_volume_3:/var/lib/neo4j neo4j:5.26.1

# Wait for Neo4j to start
echo "Waiting for Neo4j instances to start..."
sleep 10

# Add APOC plugin to each container
for container in neo4j_1 neo4j_2 neo4j_3
do
  echo "Setting up APOC plugin for $container..."
  
  # Create plugins directory if it doesn't exist
  docker exec -it $container bash -c "mkdir -p /var/lib/neo4j/plugins"
  
  # Download APOC plugin
  docker exec -it $container bash -c "cd /var/lib/neo4j/plugins && wget https://github.com/neo4j/apoc/releases/download/5.26.1/apoc-5.26.1-core.jar"
  
  # Update Neo4j configuration
  docker exec -it $container bash -c "echo 'dbms.security.procedures.unrestricted=algo.*,apoc.*' >> /var/lib/neo4j/conf/neo4j.conf"
  docker exec -it $container bash -c "echo 'dbms.security.procedures.allowlist=algo.*,apoc.*' >> /var/lib/neo4j/conf/neo4j.conf"
  
  # Restart container to apply changes
  docker restart $container
done

echo "All Neo4j instances are set up with APOC plugin."
echo "- Neo4j Instance 1: http://localhost:7474 (bolt://localhost:7687)"
echo "- Neo4j Instance 2: http://localhost:7475 (bolt://localhost:7688)"
echo "- Neo4j Instance 3: http://localhost:7476 (bolt://localhost:7689)"
echo ""
echo "Default credentials:"
echo "Username: neo4j"
echo "Password: password"
echo ""
echo "Please change the password in production environments."
