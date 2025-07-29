// src/shims-vue.d.ts
declare module '*.vue' {
  import { DefineComponent } from 'vue';
  const component: DefineComponent<{}, {}, any>;
  export default component;
}

//   这个声明表示：

//   任何 .vue 文件都默认是一个 Vue 组件模块
  
//   它导出的是 DefineComponent 类型
  
//   props, data, setup, methods 等类型暂时用 any 简化
  

// ✅ 步骤 2：确保 tsconfig.json 包含了这个声明文件
// 你的 tsconfig.json 应该包含类似设置：
// {
//     "compilerOptions": {
//       "types": ["vite/client"]  // 或其他类型声明
//     },
//     "include": [
//       "src/**/*",
//       "src/shims-vue.d.ts"     // 👈 加入这一行
//     ]
//   }
  