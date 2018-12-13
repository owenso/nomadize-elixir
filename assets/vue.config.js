const path = require('path');

module.exports = {
  lintOnSave: true,
  outputDir: path.resolve(__dirname, '../priv/static'),
  devServer: {
    host: '0.0.0.0',
    port: '8080',
    disableHostCheck: true
  },
  css: {
    // https://github.com/vuejs/vue-loader/issues/328#issuecomment-436193859
    loaderOptions: {
      // pass options to sass-loader
      sass: {
        data: `@import "@/styles/variables.scss";`
      }
    }
  }
};
