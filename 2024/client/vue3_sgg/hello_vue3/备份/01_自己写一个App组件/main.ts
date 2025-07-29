// 引入一个 CSS 样式表，路径为 ./assets/main.css，用于全局样式设置。
import './assets/main.css'

// 从 vue 包中导入 createApp 方法，这是 Vue 3 的应用创建 API，用于创建一个 Vue 应用实例。
import { createApp } from 'vue'

// 引入根组件 App.vue，这是整个应用的起始组件，类似于页面的“主入口”。
import App from './App.vue'


// 1.createApp(App)：用 App.vue 创建一个 Vue 应用实例。
// 2..mount('#app')：把这个 Vue 应用挂载到页面中的 id="app" 的 DOM 元素上。
createApp(App).mount('#app')


// 总结：
// 这是 Vue 3 的标准启动代码，作用是：

// 引入全局 CSS。

// 创建 Vue 应用实例。

// 指定主组件 App.vue。

// 将组件挂载到 DOM 中，使其显示在浏览器页面上。