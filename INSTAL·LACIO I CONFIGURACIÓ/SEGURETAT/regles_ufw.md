# Objectiu
En aquesta part de la seguretat definirem les regles que tindrá en nsotre firewall del sistema operatiu, ja que només volem que només es comuniqui amb el client la base de dades cassandra.

# Passos a seguir

```
sudo ufw enable         # Habilitar Fallafocs
sudo ufw allow from 192.168.1.22 to any port 9042
sudo ufw allow out to 192.168.1.22 port 9042
sudo ufw allow out to any

ufw status              # Per veure les regles aplicades

```