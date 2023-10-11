# Use uma imagem de node.js como base
FROM node:18 as builder

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos de origem para o diretório de trabalho
COPY . .

# Instale as dependências e crie a versão de produção
RUN npm install
RUN npm run build --prod

# Use uma imagem Nginx para hospedar a aplicação Angular
FROM nginx:alpine

# Copie os arquivos de construção da etapa anterior para o diretório de hospedagem Nginx
COPY --from=builder /app/dist/treinamento-app /usr/share/nginx/html

# Exponha a porta 80
EXPOSE 80

# Inicie o servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
