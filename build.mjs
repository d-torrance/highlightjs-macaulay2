// based on tools/lib/language.js from highlight.js repo
// TODO: can we do all of this in a rollup config script?

import { rollup } from "rollup";
import { minify } from "terser";
import { writeFile, mkdir } from "fs/promises";
import hljsJSON from "highlight.js/package.json" with { type: "json" };

const HEADER = `/*! \`macaulay2\` grammar compiled for Highlight.js ${hljsJSON.version} */`;
const bundle = await rollup({ input: "./src/languages/macaulay2.js" });
const { output } = await bundle.generate({
  name: "hljsGrammar",
  format: "iife",
  interop: false,
});
const data = output[0].code;

const iife = `
  ${HEADER}
  (function(){
    ${data}
    hljs.registerLanguage('macaulay2', hljsGrammar);
  })();
  `.trim();
const esm = `${HEADER}\n${data};\nexport default hljsGrammar;`;

const terserOptions = {
  format: {
    max_line_len: 80,
    ascii_only: true,
  },
  compress: {
    ecma: 2015,
    unsafe_arrows: true,
    passes: 2,
    unsafe: true,
    warnings: true,
    dead_code: true,
    toplevel: "funcs",
  },
};

const miniIife = await minify(iife, terserOptions);
const miniEsm = await minify(esm, terserOptions);

mkdir("dist", { recursive: true });
writeFile("dist/macaulay2.min.js", miniIife.code);
writeFile("dist/macaulay2.es.min.js", miniEsm.code);
