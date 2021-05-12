# About this

Convert PlantUML embedded in Markdown to an image with Pandoc and output it to HTML

## Requirements

-   [plantuml](https://plantuml.com/download)
-   [pandoc](https://pandoc.org/installing.html)
-   [Java](https://java.com/)

### for Windows

-   Unix shell

## Usage

-   `./pandoc.sh <input-md-file-path>`
    -   Output file to the \<input-path>/\<input-filename>.html
-   `./pandoc.sh <input-md-file-path> <output-html-file-path>`

## Format example

### Input

-   [example/example.md](example/example.md)

````markdown
# sample

```plantuml
@startuml

Alice->Bob: Hello
Bob->山田: ハロー
note over Bob, 山田
    こんにちは世界
end note

@enduml
```
````

### Output

-   [example/example.html](example/example.html)

**Screenshot HTML of above**

![](README.assets/2021-05-12-23-09-19.png)

## Thanks

Imported features

-   [diagram-generator.lua](diagram-generator.lua)
    -   [pandoc](https://github.com/pandoc/lua-filters)
-   [github.css](github.css)
    -   [andyferra/github.css](https://gist.github.com/andyferra/2554919)

```

```
