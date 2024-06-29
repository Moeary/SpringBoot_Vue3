const {
  defineConfig
} = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave: false, //关闭语法检查
  assetsDir: "static",
  devServer: {
    port: "8000",
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:80',
        pathRewrite: {
          '^/api': '/api'
        },
        changeOrigin: true,
        ws: trueS
      }
    }
  },
})
