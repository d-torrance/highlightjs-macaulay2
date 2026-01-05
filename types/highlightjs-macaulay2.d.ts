import { LanguageFn } from "highlight.js";

declare module "highlightjs-macaulay2" {
  const macaulay2: LanguageFn;
  export default macaulay2;
}
