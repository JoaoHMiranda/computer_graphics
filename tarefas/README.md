# Tarefas de Computação Gráfica com Godot

Coleção de cinco exercícios feitos no Godot 4.5 (Forward Plus) para treinar desenho 2D, shaders, física 3D, iluminação e interface.

## Autores
- João Henrique Silva de Miranda
- Silvania Alves Oliveira

## Como rodar rápido
1. Instale o Godot 4.5 e abra `project.godot`.
2. No painel FileSystem, abra uma das cenas `Exercício 0X.tscn`.
3. Aperte F6 (Play Scene) para testar a cena atual.
4. No Exercício 05, clique em "Iniciar" para ir direto para a cena 3D (Exercício 04).

## Estrutura do repositório
- `Exercício 01.tscn` - polígonos 2D gerados por script (`scripts/Exercicio01.gd`).
- `Exercício 02.tscn` - sprite com shader de padrões (`scripts/Exercicio02.gd`, `shaders/pattern_shader.tres`).
- `Exercício 03.tscn` - cubo com física e câmera (`scripts/player.gd`).
- `Exercício 04.tscn` - cena do cubo com `SpotLight3D` que troca de cor (`scripts/SpotCor.gd`).
- `Exercício 05.tscn` - menu 2D que inicia a cena 3D (`scripts/Menu.gd`).
- `shaders/roxo.png` e `shaders/branco.png` - texturas usadas pelo shader do exercício 02.
- `scripts/` - scripts GDScript dos exercícios.

## Exercícios

### Exercício 01 - Preenchimentos criativos em 2D
- Objetivo: gerar triângulo/hexágono/estrela com contorno, textura repetida e cores por vértice.
- Cena: `Exercício 01.tscn`; script principal `scripts/Exercicio01.gd` em `Area2D`.
- Parâmetros exportados: `raio`, `lados`, `estrela`, `textura`.
- Interação: clique esquerdo troca todas as cores; o contorno acompanha a cor base.
- Conceitos: geração procedural de geometria 2D, `Polygon2D`, `Line2D`, `CollisionPolygon2D`, `vertex_colors`.

### Exercício 02 - Experimentos com padrões
- Objetivo: repetir texturas em um `Sprite2D` via `ShaderMaterial` e alternar padrões pelo teclado.
- Cena: `Exercício 02.tscn`; script `scripts/Exercicio02.gd`.
- Shader: `shaders/pattern_shader.tres` recebe `pattern_tex` e as repetições `tiles_x`, `tiles_y`.
- Interação: tecla `1` aplica `roxo.png`; tecla `2` aplica `branco.png`.
- Conceitos: parâmetros de shader com `set_shader_parameter`, texturas repetidas, `_unhandled_input` para teclado.

### Exercício 03 - Cubo 3D com física e câmera
- Objetivo: mover um `CharacterBody3D` no plano alinhando movimento à rotação do player/câmera.
- Cena: `Exercício 03.tscn`; script `scripts/player.gd` no nó `Player`.
- Nós: chão `StaticBody3D` com `PlaneMesh` e `CollisionShape3D`; cubo `MeshInstance3D` + `BoxShape3D`; `Camera3D` filha do player.
- Controles: setas esquerda/direita giram o cubo; seta para cima anda para frente; seta para baixo anda para trás.
- Conceitos: vetores frente/direita a partir do transform, `move_and_slide`, câmera presa ao personagem.

### Exercício 04 - Iluminação dinâmica
- Objetivo: testar luz focal seguindo a câmera e alternar cores em tempo real.
- Cena: `Exercício 04.tscn`; script `scripts/SpotCor.gd` no `SpotLight3D`.
- Interação: clique esquerdo alterna entre cores predefinidas.
- Materiais: ajuste `Albedo`, `Metallic` e `Roughness` do cubo para ver a resposta da luz.
- Conceitos: controle de `SpotLight3D`, interação simples de mouse em 3D.

### Exercício 05 - Menu 2D que inicia a cena 3D
- Objetivo: ligar UI 2D com o fluxo 3D do projeto.
- Cena: `Exercício 05.tscn`; script `scripts/Menu.gd`.
- Layout: três `Button` centralizados (`Iniciar`, `Opções`, `Sair`).
- Interação: `Iniciar` abre `Exercício 04.tscn`; `Opções` imprime um placeholder; `Sair` fecha o jogo.
- Conceitos: sinais de botão, `change_scene_to_file`, fluxo simples de menu.
