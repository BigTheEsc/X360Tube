# X360Tube Test 0.1

Primeiro teste real do X360Tube.

## O que esta versão faz

- inicializa vídeo do Xbox 360;
- inicializa USB/controle;
- mostra "X360Tube TESTE 0.1";
- ao pressionar A, mostra "CONTROLE: OK!";
- Y encerra.

Ela **não é YouTube ainda**. O objetivo é confirmar que o seu Trinity RGH consegue
executar nosso primeiro homebrew.

## Por que ELF e não XEX?

O caminho LibXenon usado pelo XeLL Reloaded produz um ELF32 para homebrew.
A documentação oficial dos exemplos do Free60 orienta colocar o ELF32 na raiz de
um USB FAT32 com o nome `xenon.elf` e iniciar pelo XeLL Reloaded.

## Compilação sem PC

Este pacote inclui um workflow do GitHub Actions. O workflow usa a imagem Docker
oficial `free60/libxenon`, documentada pelo projeto LibXenon.

Você só precisa:
1. criar um repositório no GitHub pelo celular;
2. enviar estes arquivos para o repositório;
3. abrir a aba Actions;
4. esperar o workflow terminar;
5. abrir o artefato `X360Tube-Test-0.1`;
6. baixar `xenon.elf` no celular;
7. colocar `xenon.elf` na raiz de um USB FAT32;
8. iniciar XeLL no Xbox.

Não altere a NAND/XeLL para este teste.
