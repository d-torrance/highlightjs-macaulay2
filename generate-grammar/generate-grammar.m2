needsPackage "Style"

generateGrammar(
    "generate-grammar/macaulay2.js.in",
    "src/languages/macaulay2.js",
    x -> demark(",\n\t", format \ x))
