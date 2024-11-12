const path = require('path');

module.exports = {
  dependencies: {
    'range-slider-package': { // <--------- Add entry for "range-slider-package"
      root: path.resolve(__dirname, './range-slider-package'),
    },
  },
};