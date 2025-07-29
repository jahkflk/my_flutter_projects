<template>
  <div class="person-details">
    <h3>子组件 Person</h3>
    <p>从父组件接收到的 Prop 'a': {{ a }}</p>
    <h4>人员列表:</h4>
    <ul v-if="list && list.length > 0">
      <li v-for="person in list" :key="person.id">
        ID: {{ person.id }} | 姓名: {{ person.name }} | 年龄: {{ person.age }} x:{{ person.x }}
      </li>
    </ul>
    <p v-else>没有人员信息。</p>
  </div>
</template>

<script lang="ts" setup name="PersonComponent"> // Changed name to avoid conflict if 'Person' is a native HTML element or other global.
import { defineOptions, defineProps, withDefaults } from 'vue';
import { type Persons } from '@/types/person'; // Assumes @ is aliased to src/

defineOptions({ name: 'PersonComponent' });

// 接收a,b
// let x = defineProps(['a','b'])
// console.log(x.a, x.b)

// 接收 props 并进行类型限制
// const props = defineProps<{
//   list: Persons;
//   a: string;
//   b: string;
// }>();

// 设置 props 并定义默认值
const props = withDefaults(
  defineProps<{
    list: Persons;
    a: string;
    b: string;
  }>(),
  {
    list: () => [
      { id: 'asudfysafd01', name: '张三', age: 18 } // 注意不要加 x 字段，除非类型允许
    ],
    a: 'a_default',
    b: 'b_default',
    x: 'x_default',
  }
);

console.log(props.a, props.b, props.list);

// Props (props.list, props.a) 会自动在模板中可用
// 如果需要在 script 中进一步操作 props，可以使用上面的 'props' 常量
// console.log('Received list in Person.vue:', props.list);
// console.log('Received "a" in Person.vue:', props.a);
</script>

<style scoped>
.p-4 {
  font-family: sans-serif;
}

.person {
  background-color: #f4f4f4;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-top: 20px;
  /* Added margin for separation */
}

input.border.p-1 {
  border: 1px solid #ccc;
  padding: 0.25rem;
  border-radius: 4px;
}

label.block.mb-2 {
  display: block;
  margin-bottom: 0.5rem;
}

h1,
h3 {
  margin-top: 0.5rem;
  margin-bottom: 0.5rem;
}

p.mt-4.text-lg {
  margin-top: 1rem;
  font-size: 1.125rem;
}

h2.text-xl.font-bold.mb-2 {
  font-size: 1.25rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

hr.my-6 {
  margin-top: 1.5rem;
  margin-bottom: 1.5rem;
  border: 0;
  border-top: 1px solid #eee;
}

button {
  margin: 0 5px;
  padding: 8px 15px;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}

button:hover {
  background-color: #0056b3;
}

button.mt-2 {
  margin-top: 0.5rem;
}

/* ----------------------- */
.person-details {
  border: 1px solid #ccc;
  padding: 15px;
  margin-top: 10px;
  border-radius: 5px;
  background-color: #f9f9f9;
}
.person-details h3 {
  color: green;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  background-color: #e9e9e9;
  margin-bottom: 5px;
  padding: 8px;
  border-radius: 3px;
}
</style>
