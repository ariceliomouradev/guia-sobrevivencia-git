# 🚀 Guia de Sobrevivência Git: O Fluxo do Dia a Dia

Bem-vindo(a) ao meu guia prático de Git! Criei este repositório para documentar o fluxo de trabalho real de um desenvolvedor. Se você tem medo de "quebrar o código" ao usar o Git em equipe, este guia foi feito para você. 

Aqui, vou explicar não apenas os comandos, mas **o que eles fazem**, **quando usá-los** e **como resolver problemas**.

---

## 🛠️ 1. Configuração Inicial (Quem é você?)
Antes de começar a registrar suas alterações, o Git precisa saber quem está fazendo elas. Isso é configurado uma única vez no seu computador.

Abra seu terminal e digite:
```bash
git config --global user.name "Seu Nome Aqui"
git config --global user.email "seu.email@exemplo.com"
O que isso faz? Toda vez que você salvar uma versão do código, o Git vai carimbar o seu nome e e-mail nela. Assim, a equipe sabe quem fez o quê.

🏗️ 2. Começando um Projeto
Existem duas formas de começar a usar o Git em um projeto: começando do zero ou pegando um projeto que já existe.

Opção A: Criando um repositório do zero (Local)
Se você tem uma pasta no seu computador e quer começar a rastreá-la com o Git:

Bash
git init
O que isso faz? Cria uma pasta oculta chamada .git. É como se você instalasse uma câmera de segurança na sua pasta; a partir de agora, o Git está de olho em tudo que muda.

Opção B: Baixando um projeto existente (Clone)
Se a sua equipe já tem um repositório no GitHub e você precisa dele na sua máquina:

Bash
git clone [https://github.com/usuario/nome-do-projeto.git](https://github.com/usuario/nome-do-projeto.git)
O que isso faz? Faz o download completo do projeto, incluindo todo o histórico de alterações. Ele já vem configurado e pronto para uso.

📸 3. O Fluxo de Trabalho Diário
Este é o ciclo que você vai repetir todos os dias ao programar ou criar scripts de teste.

Passo 3.1: O Radar (Verificando o status)
Sempre que quiser saber o que foi alterado na sua máquina, use:

Bash
git status
Dica de Ouro: Use o git status o tempo todo. Ele é o seu melhor amigo e te diz exatamente onde você está.

Passo 3.2: O Carrinho de Compras (Adicionando arquivos)
O Git não salva suas alterações automaticamente. Você precisa escolher o que quer salvar.

Bash
# Para adicionar um arquivo específico, como um script em Java ou uma coleção do Postman:
git add MeuArquivo.java

# Para adicionar TUDO que foi modificado de uma vez:
git add .
Analogia: É como colocar produtos no carrinho de compras. Você separou o que quer levar, mas ainda não pagou.

Passo 3.3: O Pagamento / O Backup (Criando o Commit)
Agora você vai fechar o pacote e salvar essa versão na sua máquina:

Bash
git commit -m "feat: adiciona validação de login na API"
O que isso faz? Tira uma "foto" dos arquivos que estavam no carrinho (git add) e guarda no histórico com uma mensagem clara do que foi feito.

☁️ 4. Sincronizando com a Nuvem (GitHub)
Até o passo 3, tudo está salvo apenas no seu computador. Se o seu PC queimar, você perde tudo. Precisamos mandar para o GitHub.

Subindo suas alterações:
Bash
git push origin main
(Nota: main é o nome da branch principal. Se a sua for master, mude no comando).
O que isso faz? Envia todos os seus commits locais para o servidor remoto. Agora sua equipe pode ver seu código.

🛡️ 5. Trabalhando em Equipe (Sem quebrar nada!)
Aqui está o segredo dos desenvolvedores. Quando você trabalha com outras pessoas, o repositório na nuvem é atualizado o tempo todo. Como baixar essas atualizações sem estragar o que você está fazendo na sua máquina?

O jeito seguro de olhar atualizações (Fetch + Diff)
Nunca puxe as alterações "às cegas". Faça isso:

1. Baixe as informações (mas não aplique ainda):

Bash
git fetch
O que isso faz? O Git vai até o GitHub e pergunta: "Tem algo novo aí?". Ele baixa as novidades, mas não mistura com o seu código local. É como olhar pela janela para ver quem está na porta.

2. Compare o que mudou:

Bash
git status
O Git vai te avisar: "Seu branch está 2 commits atrás do origin/main".
Se quiser ver exatamente as linhas de código que a sua equipe mudou:

Bash
git diff main origin/main
3. Aplique as atualizações (Pull):
Se estiver tudo ok e você quiser juntar o código da nuvem com o seu:

Bash
git pull origin main
O que isso faz? Agora sim, ele mistura o código que seus colegas fizeram com o que está na sua máquina.

🚨 6. Lidando com Conflitos (Não entre em pânico)
Você fez o git pull e o terminal gritou: "CONFLICT (content): Merge conflict in Arquivo.java". E agora?

O que é um conflito?
Acontece quando você e seu colega mexeram exatamente na mesma linha do mesmo arquivo. O Git é inteligente, mas não sabe qual versão escolher. Ele pausa tudo e pede para você decidir.

Como resolver passo a passo:
Abra o arquivo que deu conflito no seu editor de código (como VS Code ou IntelliJ).

O Git terá inserido marcações horríveis no seu código. Vai estar assim:

Java
<<<<<<< HEAD
    // Esse é o código que VOCÊ fez
    int timeout = 5000;
=======
    // Esse é o código que SEU COLEGA fez e estava na nuvem
    int timeout = 10000;
>>>>>>> origin/main
Apague as marcações (<<<<<<<, =======, >>>>>>>) e deixe apenas o código final que deve prevalecer. Você pode manter o seu, o do colega, ou misturar os dois.

Salve o arquivo.

Avise ao Git que o conflito foi resolvido adicionando o arquivo novamente:

Bash
git add Arquivo.java
Finalize com um commit:

Bash
git commit -m "fix: resolve conflito no tempo de timeout"
Pronto! Você sobreviveu a um conflito no Git.