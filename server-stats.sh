#!/bin/bash

# server-stats.sh - versão colorida e visual

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # sem cor

echo -e "${GREEN}==========================================${NC}"
echo -e "${GREEN}           ESTATÍSTICAS DO SERVIDOR       ${NC}"
echo -e "${GREEN}==========================================${NC}"
echo ""

# Uso da CPU
echo -e "${YELLOW}Uso total da CPU:${NC}"
cpu_line=$(top -bn1 | grep "Cpu(s)")
user_cpu=$(echo $cpu_line | awk '{print $2}')
system_cpu=$(echo $cpu_line | awk '{print $4}')
idle_cpu=$(echo $cpu_line | awk '{print $8}')
echo -e "Usuário: $user_cpu% | Sistema: $system_cpu% | Idle: $idle_cpu%"
echo ""

# Uso da memória
echo -e "${YELLOW}Uso de Memória:${NC}"
mem_total=$(free -h | awk 'NR==2{print $2}')
mem_used=$(free -h | awk 'NR==2{print $3}')
mem_free=$(free -h | awk 'NR==2{print $4}')
mem_percent=$(free | awk 'NR==2{printf "%.2f", $3/$2*100}')
echo -e "Usada: $mem_used | Livre: $mem_free | Total: $mem_total | ${RED}$mem_percent%${NC} usada"

# Barra visual de memória
mem_bar_len=$(echo "$mem_percent/2" | bc)
printf "["
for i in $(seq 1 $mem_bar_len); do
  printf "#"
done
for i in $(seq 1 $((50-mem_bar_len))); do
  printf "-"
done
printf "]\n\n"

# Uso do disco
echo -e "${YELLOW}Uso de Disco:${NC}"
disk_line=$(df -h --total | grep "total")
disk_used=$(echo $disk_line | awk '{print $3}')
disk_avail=$(echo $disk_line | awk '{print $4}')
disk_total=$(echo $disk_line | awk '{print $2}')
disk_percent=$(echo $disk_line | awk '{print $5}')
echo -e "Usado: $disk_used | Livre: $disk_avail | Total: $disk_total | $disk_percent utilizado"

# Top 5 processos por CPU
echo -e "\n${YELLOW}Top 5 processos por uso de CPU:${NC}"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Top 5 processos por Memória
echo -e "\n${YELLOW}Top 5 processos por uso de Memória:${NC}"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

echo -e "${GREEN}==========================================${NC}"
echo -e "${GREEN}               FIM DO RELATÓRIO           ${NC}"
echo -e "${GREEN}==========================================${NC}"

