module.exports = {
  root: true,
  env: {
    node: true
  },
  'extends': [
    'plugin:vue/essential',
    '@vue/standard',
    'prettier'
  ],
  'plugins': ['prettier'],
  rules: {
    'semi': [2, 'always'],
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'prettier/prettier': ['error']
  },
  parserOptions: {
    parser: 'babel-eslint'
  }
}
