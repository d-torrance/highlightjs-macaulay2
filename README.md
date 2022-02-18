# highlightjs-macaulay2

[Macaulay2](https://faculty.math.illinois.edu/Macaulay2/) is a
software system devoted to supporting research in algebraic geometry
and commutative algebra.

**Built with**

* [highlightjs](https://github.com/highlightjs/highlight.js)

## Usage

Include the Highlight.js library in your webpage or Node app, then load this module.

### Static website

Load the module after loading Highlight.js.  Use the minified version found in the `dist` directory.  This module is just a CDN build of the language, so it will register itself as the JavaScript is loaded.

```html
<script type="text/javascript" src="/path/to/highlight.min.js"></script>
<script type="text/javascript" src="/path/to/macaulay2.min.js"></script>
<script type="text/javascript">
  hljs.highlightAll();
</script>
```

### With Node or another build system

If you're using Node / Webpack / Rollup / Browserify, etc., require the language module, then register it with Highlight.js.

```javascript
var hljs = require('highlight.js');
var hljsYourLanguage = require('highlightjs-macaulay2');

hljs.registerLanguage("macaulay2", hljsYourLanguage);
hljs.highlightAll();
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
