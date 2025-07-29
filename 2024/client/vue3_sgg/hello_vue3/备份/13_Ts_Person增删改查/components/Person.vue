<template>
  <div class="p-4">
    <h2 class="text-xl font-bold mb-2">Typescript 接口，泛型，与自定义类型</h2>

    <!-- 遍历 personList 并展示信息 -->
    <div
      v-for="person in personList"
      :key="person.id"
      class="person"
    >
      <h3 class="text-lg font-semibold">姓名：{{ person.name }}</h3>
      <p>年龄：{{ person.age }}</p>
      <p>ID：{{ person.id }}</p>
    </div>
  </div>
</template>

<script lang="ts" setup name="Person">
import { ref, computed, watch } from 'vue'
// ✅ 正确导入：不要加 .ts 后缀，类型用 import type
import type { PersonInter, Persons } from '@/types/person';
import { ageLimit, greet } from '@/types/person';

// 使用类型别名 Persons
const personList: Persons = [
  { id: 'uuid1', name: '张三', age: 18 },
  { id: 'uuid2', name: '李四', age: 19 },
  { id: 'uuid3', name: '王五', age: 20 },
];

console.log(greet(personList[0])); // ✅ 使用 greet，避免“未使用”提示
console.log(`Age limit is ${ageLimit}`);
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
</style>
