# Compilar usando somente o celular

## 1. GitHub

No navegador do celular, abra o GitHub e crie um repositório vazio chamado:

X360Tube

Não precisa adicionar README, .gitignore ou licença, porque este pacote já contém tudo.

## 2. Enviar os arquivos

Extraia este ZIP no celular.

Envie para o repositório:
- Makefile
- README.md
- source/main.c
- .github/workflows/build.yml

É importante que `.github/workflows/build.yml` mantenha exatamente esse caminho.

## 3. Executar a compilação

No GitHub:
- abra "Actions";
- selecione "Build X360Tube ELF32";
- toque em "Run workflow" se necessário.

O workflow usa `free60/libxenon:latest`, a imagem pré-configurada indicada no
README oficial do LibXenon.

## 4. Baixar o resultado

Quando aparecer uma execução verde:
- abra a execução;
- procure "Artifacts";
- baixe `X360Tube-Test-0.1`;
- dentro dele estará `xenon.elf`.

## 5. Testar no Xbox

Copie `xenon.elf` para a raiz de um USB FAT32.

No seu RGH, inicie o XeLL Reloaded pelo método que você já usa.

O XeLL deve localizar `xenon.elf` no USB.

## 6. Resultado esperado

A tela deve mostrar:

X360Tube TESTE 0.1
X360Tube carregado!

Pressione A.

Depois deve aparecer:

CONTROLE: OK!

Se isso acontecer, o primeiro teste do nosso código no seu console foi bem-sucedido.
