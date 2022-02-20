# highlightjs-macaulay2

[![npm version](https://badge.fury.io/js/highlightjs-macaulay2.svg)](
https://badge.fury.io/js/highlightjs-macaulay2)
![github workflow](
https://github.com/d-torrance/highlightjs-macaulay2/actions/workflows/build.yml/badge.svg)

[Macaulay2](https://faculty.math.illinois.edu/Macaulay2/) is a
software system devoted to supporting research in algebraic geometry
and commutative algebra.

[highlight.js](https://highlightjs.org/) is a JavaScript syntax
highlighter with language auto-detection and zero dependencies.

## Usage

Include the Highlight.js library in your webpage or Node app, then load this module.

### Static website

Load the module after loading Highlight.js.  Use the minified version found in the `dist` directory.  This module is just a CDN build of the language, so it will register itself as the JavaScript is loaded.

```html
<script type="text/javascript" src="/path/to/highlight.min.js"></script>
<script type="text/javascript" src="/path/to/macaulay2.min.js"></script>
<script type="text/javascript">hljs.highlightAll();</script>
```

### Using directly from the UNPKG CDN

```html
<script type="text/javascript"
  src="https://unpkg.com/highlightjs-macaulay2/dist/macaulay2.min.js"></script>
```

- More info: <https://unpkg.com>

### With Node or another build system

If you're using Node / Webpack / Rollup / Browserify, etc., require the language module, then register it with Highlight.js.

```javascript
var hljs = require('highlight.js');
var macaulay2 = require('highlightjs-macaulay2');

hljs.registerLanguage("macaulay2", macaulay2);
hljs.highlightAll();
```

## Building and testing

To build `dist/macaulay2.min.js` yourself, run:

```
npm run build
```

Or, if you have already cloned the highlight.js repository:

```
npm run build -- HLJSDIR=/path/to/highlight.js
```

To build a minimal version, `dist/highlight.js`, bundling highlight.js, the
Macaulay2 language, and the default highlight.js style (without the background
color), run:

```
npm install
npm run bundle
```

To update the Macaulay2 language keywords, e.g., after a new release of
Macaulay2, run:

```
npm run update
```

Note that you must have Macaulay2 installed for this to work.  If you have
already cloned the Macaulay2 repository:

```
npm run update -- M2DIR=/path/to/M2
```

To run the test suite, run:

```
npm run test
```

Or, as above, if you already have the highlight.js repository cloned:

```
npm run test -- HLJSDIR=/path/to/highlight.js
```


## License

Distributed under the [BSD 3-Clause License](./LICENSE). See `LICENSE` for more information.

Highlight.js is also released under the [BSD 3-Clause License](https://github.com/highlightjs/highlight.js/blob/master/LICENSE).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork this project.
2. Create a work branch (`git checkout -b my-branch`).
3. Commit your changes (`git commit -m 'my changes'`).
4. Push the branch (`git push origin my-branch`).
5. Open a Pull Request from your fork back to this repository.

## Links

- The official site for the Highlight.js library is <https://highlightjs.org/>.
- The Highlight.js GitHub project: <https://github.com/highlightjs/highlight.js>
- Learn more about Macaulay2: <https://faculty.math.illinois.edu/Macaulay2/>
