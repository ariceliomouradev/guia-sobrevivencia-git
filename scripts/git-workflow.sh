#!/bin/bash

# =================================================================
# GUIA PRÁTICO DE GIT - LABORATÓRIO INTERATIVO
# Este script serve como um guia de treinamento prático.
# Ele executa os comandos na ordem lógica de trabalho do dia a dia.
# =================================================================

echo "====================================================="
echo "🚀 BEM-VINDO AO LABORATÓRIO INTERATIVO DO GIT!"
echo "Vamos simular um fluxo de trabalho passo a passo."
echo "====================================================="
echo ""

# Pausa para o usuário ler a tela antes de continuar
read -p "Pressione [Enter] para começar a simulação..."

# Criar um diretório seguro para o laboratório não misturar com o projeto real
mkdir -p lab_git_teste
cd lab_git_teste

echo ""
echo "--- 1. CONFIGURAÇÃO INICIAL (git config) ---"
# git config: Define quem está fazendo as alterações (nome e e-mail).
# Usamos --local aqui apenas para o laboratório. No dia a dia usa-se --global.
git config --local user.name "Analista de Testes"
git config --local user.email "qa@projeto.com"
echo "✅ Identidade configurada."
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 2. INICIALIZANDO O AMBIENTE (git init) ---"
# git init: Transforma uma pasta comum em um repositório Git.
# Ele cria uma pasta oculta chamada '.git' que rastreia tudo.
git init
echo "✅ Repositório inicializado com sucesso!"
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 3. SIMULANDO TRABALHO: CRIANDO UM ARQUIVO ---"
echo "Criando o arquivo 'login_test.js'..."
echo "// Teste de API - Rota de Login" > login_test.js
echo "✅ Arquivo de teste criado na sua máquina."

echo ""
echo "--- 4. VERIFICANDO O ESTADO (git status) ---"
# git status: Mostra o que aconteceu na pasta. Arquivos novos, modificados ou deletados.
git status
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 5. PREPARANDO PARA SALVAR (git add) ---"
# git add: Move os arquivos da "Área de Trabalho" para a "Staging Area" (Área de Preparação).
# O ponto (.) significa "adicione todos os arquivos que foram alterados".
git add .
echo "✅ Arquivo adicionado ao carrinho (Staging Area)."
git status
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 6. SALVANDO A VERSÃO (git commit) ---"
# git commit: Tira uma 'foto' dos arquivos preparados e guarda no histórico de versões.
# O -m serve para adicionar a mensagem que explica a mudança.
git commit -m "test: adiciona script inicial para teste de login"
echo "✅ Versão salva no histórico!"
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 7. TRABALHANDO COM RAMIFICAÇÕES (git branch / checkout) ---"
# git checkout -b: Cria uma nova ramificação (branch) isolada e já muda para ela.
# Excelente para criar novos testes sem quebrar o código principal.
git checkout -b feature/teste-timeout
echo "✅ Mudamos para a branch 'feature/teste-timeout'."
echo "const timeout = 5000;" >> login_test.js
git add .
git commit -m "test: adiciona validacao de timeout"
echo "✅ Novo commit salvo APENAS na branch da nova funcionalidade!"
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 8. UNINDO O TRABALHO (git checkout / merge) ---"
# git checkout: Usado para trocar entre branches existentes. Vamos voltar para a principal.
git checkout main
echo "✅ Voltamos para a branch 'main'."
# git merge: Pega as alterações da branch que criamos e junta com a branch principal.
git merge feature/teste-timeout
echo "✅ Funcionalidade unida à branch 'main' com sucesso!"
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 9. GUARDANDO ALTERAÇÕES TEMPORÁRIAS (git stash) ---"
# git stash: Guarda alterações que você ainda não quer commitar para poder mudar de branch.
echo "// Todo: Adicionar teste de payload" >> login_test.js
echo "Iniciamos um novo código, mas precisamos parar e fazer outra coisa urgente..."
git stash
echo "✅ Código incompleto guardado no 'stash'. O arquivo voltou ao estado limpo."
# git stash pop: Devolve as alterações guardadas para você continuar de onde parou.
git stash pop
echo "✅ Código restaurado do 'stash' para voltarmos a trabalhar!"
git add .
git commit -m "test: adiciona comentario sobre payload"
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 10. REPOSITÓRIOS NA NUVEM (git remote, fetch, pull, push) ---"
# git remote add: Conecta o seu repositório local a um servidor remoto (ex: GitHub).
# Abaixo usamos uma URL de exemplo educacional.
git remote add origin https://github.com/usuario/projeto-automacao.git
echo "✅ Repositório remoto 'origin' configurado."
echo ""
echo "💡 Comandos do dia a dia para Nuvem (Apenas leitura no laboratório):"
# git fetch: Olha o que tem de novo no GitHub, mas não altera sua máquina.
echo "-> 'git fetch' (Verifica se há atualizações)"
# git pull: Baixa as atualizações do GitHub e mistura com o seu código.
echo "-> 'git pull origin main' (Puxa e atualiza o código)"
# git push: Envia os seus commits (suas fotos) para a nuvem.
echo "-> 'git push origin main' (Envia o seu trabalho)"
read -p "Pressione [Enter] para continuar..."

echo ""
echo "--- 11. VISUALIZANDO O HISTÓRICO (git log) ---"
# git log: Mostra a linha do tempo de todos os commits realizados.
# --oneline simplifica a visualização; --graph desenha as ramificações.
git log --oneline --graph --all
echo ""

echo "====================================================="
echo "🎉 LABORATÓRIO CONCLUÍDO!"
echo "Uma pasta chamada 'lab_git_teste' foi criada no seu computador"
echo "com todo esse passo a passo. Para limpar, basta deletá-la."
echo "====================================================="