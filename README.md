# Git, O Fluxo do Dia a Dia.

Bem-vindo(a) ao meu guia prático e definitivo de Git!

Este repositório foi criado para documentar o fluxo de trabalho real no desenvolvimento e na automação de testes. Se você tem receio de "quebrar o código" ao usar o Git em equipe, este material foi feito para você. Aqui, o foco é entender **o que cada comando faz**, **quando usá-lo** e **como resolver problemas com segurança**.

---

## 🛠️ 1. Configuração Inicial (Quem é você?)

Antes de começar a versionar seus códigos, o Git precisa saber quem está fazendo as alterações. Isso é configurado uma única vez no seu computador. Abra seu terminal e digite:

```bash
git config --global user.name "Seu Nome e Sobrenome"
git config --global user.email "seu.email@exemplo.com"

```

**O que isso faz:** Toda vez que você salvar uma versão do seu trabalho, o Git vai carimbar o seu nome e e-mail nela. É a assinatura digital de quem fez o quê no projeto.

---

## 🏗️ 2. Começando um Projeto

Existem duas formas principais de começar a usar o Git: criando um projeto do zero ou copiando um projeto que já existe na nuvem.

### Iniciando um repositório do zero (Local)

Se você tem uma pasta no seu computador e quer começar a rastreá-la com o Git:

```bash
git init

```

**O que isso faz:** Cria uma estrutura oculta (`.git`) na sua pasta. A partir desse momento, o Git passa a monitorar qualquer alteração feita nos arquivos ali dentro.

### Baixando um projeto existente (Clone)

Se a equipe já tem um repositório no GitHub e você precisa dele na sua máquina para trabalhar:

```bash
git clone https://github.com/usuario/nome-do-projeto.git

```

**O que isso faz:** Faz o download completo do projeto, incluindo todo o histórico de alterações antigas. A pasta já vem configurada e pronta para o uso.

---

## 📸 3. O Fluxo de Trabalho Diário (O Be-a-Bá)

Este é o ciclo principal que você vai repetir todos os dias ao criar seus scripts, testes ou documentações.

### O Radar (Verificando o status)

Sempre que quiser saber o que foi alterado, criado ou deletado na sua máquina:

```bash
git status

```

> **Dica de Ouro:** Use o `git status` o tempo todo! Ele é o seu melhor amigo e mostra exatamente em qual etapa do fluxo você está.

### O Carrinho de Compras (Adicionando arquivos)

O Git não salva suas alterações automaticamente. Você precisa escolher e preparar o que deseja salvar:

```bash
git add script_de_teste.js

```

Para adicionar **tudo** que foi modificado de uma vez só:

```bash
git add .

```

**O que isso faz:** Coloca os arquivos em uma "área de preparação" (Staging Area). É como colocar produtos no carrinho de compras antes de passar no caixa.

### O Backup (Criando o Commit)

Agora você vai empacotar essas alterações e salvá-las no histórico da sua máquina:

```bash
git commit -m "test: adiciona script de automação"

```

**O que isso faz:** Tira uma "fotografia" do estado atual dos arquivos que estavam preparados e guarda no histórico com uma mensagem clara explicando a mudança.

---

## ☁️ 4. Sincronizando com a Nuvem (GitHub)

Até a etapa anterior, tudo está salvo **apenas no seu computador**. Para que a equipe veja o seu trabalho e o código fique seguro na nuvem, usamos o Push.

```bash
git push origin main

```

*(Nota: `main` é o nome da ramificação principal. Se o projeto usar `master`, basta substituir no comando).*

**O que isso faz:** Envia todo o seu histórico local para o repositório remoto no GitHub.

---

## 🛡️ 5. Trabalhando em Equipe (Sem quebrar o código)

Aqui está o segredo para trabalhar com outras pessoas sem medo. O código na nuvem é atualizado constantemente. Como baixar essas novidades com segurança?

### Passo 1: Buscar informações sem alterar nada (Fetch)

Nunca baixe o código dos outros às cegas. Primeiro, pergunte ao servidor o que há de novo:

```bash
git fetch

```

**O que isso faz:** O Git vai ao GitHub, baixa o histórico de tudo que mudou, mas **não mistura** com os arquivos que estão abertos no seu editor de código.

### Passo 2: Comparar as mudanças (Diff)

Descubra o que seus colegas alteraram antes de aceitar a atualização:

```bash
git diff main origin/main

```

**O que isso faz:** Mostra linha por linha as diferenças entre o código que está na sua máquina (`main`) e o código que acabou de chegar da nuvem (`origin/main`).

### Passo 3: Atualizar seu código com segurança (Pull)

Se tudo estiver correto e você quiser juntar o código da nuvem com o seu:

```bash
git pull origin main

```

**O que isso faz:** Aplica as atualizações no seu computador, unindo o trabalho da equipe ao seu.

---

## 🚨 6. Lidando com Conflitos (Sem pânico)

Você rodou um `git pull` e o terminal exibiu: **"CONFLICT (content): Merge conflict..."**. Calma!

**O que é isso?** Um conflito acontece quando você e um colega alteraram exatamente a mesma linha do mesmo arquivo. O Git não sabe qual versão escolher e pede a sua ajuda.

### Como resolver:

1. Abra o arquivo que deu erro no seu editor de código.
2. O Git terá inserido marcações no código mostrando as duas versões. Vai estar parecido com isso:

```text
<<<<<<< HEAD
    const timeout_padrao = 5000; // O código que VOCÊ fez
=======
    const timeout_padrao = 10000; // O código do COLEGA que veio da nuvem
>>>>>>> origin/main

```

3. **Apague as marcações** (`<<<<<<<`, `=======`, `>>>>>>>`) e edite o arquivo deixando apenas o código correto final. Você pode escolher a sua versão, a do colega ou criar uma terceira.
4. Salve o arquivo.
5. Avise ao Git que você resolveu o problema preparando o arquivo corrigido:

```bash
git add arquivo_corrigido.js

```

6. Conclua a resolução finalizando o commit:

```bash
git commit -m "fix: resolve conflito de merge no arquivo de configuração"

```

Pronto! Conflito resolvido e histórico alinhado com a equipe.

---

*Documentação criada para suporte aos estudos práticos de Git.*

---
