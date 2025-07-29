<!-- <script lang="ts">
  export default {
    name: 'App'
  }
</script> -->

<!-- <script setup> 中 不允许写 export default，这与传统的 <script> 写法不同。 -->
<!-- 正确的做法是：直接使用 defineOptions() 或 defineProps() 等组合式 API。 -->
<!-- <script lang="ts" setup name="App">
import Person from './components/Person.vue';
</script> -->

<template>
  <div id="app-container">
    <h1>父组件 App</h1>
    <!-- <PersonComponent a="哈哈" b="嘿嘿" :list="personList" /> -->
    <PersonComponent />

    <button @click="addPerson">添加人员</button>
  </div>
</template>


<script lang="ts" setup name="App">
defineOptions({
  name: 'App'
});


import PersonComponent from './components/Person.vue'; // Updated component name
import { reactive } from 'vue';
import { type Persons, type Person } from '@/types/person'; // Assumes @ is aliased to src/
import { v4 as uuidv4 } from 'uuid';

let x = 9; // 如果不使用可以删掉避免警告

let personList = reactive<Persons>([
  { id: 'asudfysafd01', name: '张三', age: 18 ,x:"aaa"},
  { id: 'asudfysafd02', name: '李四', age: 20 },
  { id: 'asudfysafd03', name: '王五', age: 22 }
]);


function addPerson() {
  const newPerson: Person = {
    // id: `asudfysafd${Date.now()}`, // 简单生成唯一ID
    id: uuidv4(),
    name: '新人',
    age: Math.floor(Math.random() * 30) + 20
  };
  personList.push(newPerson);
  console.log('Added new person. Current list:', personList);
}

// ✅ 追加処理
// const addPerson = () => {
//   if (!newPerson.value.name) return
//   const newEntry: PersonInter = {
//     id: uuidv4(),
//     ...newPerson.value,
//   }
//   personList.value.push(newEntry)
//   newPerson.value.name = ''
//   newPerson.value.age = 18
// }

</script>

<style scoped>


#app-container {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  padding: 20px;
}
#app-container h1 {
  color: blue;
}
button {
  margin-top: 15px;
  padding: 10px 15px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}

.app {
  background-color: skyblue;
  box-shadow: 0 0 10px;
  border-radius: 10px;
  padding: 20px;
}

/* .app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  font-weight: normal;
} */

/* .app {
  background-color: rgb(185, 179, 179);
  box-shadow: 0 0 10px;
  border-radius: 10px;
  padding: 20px;
} */

</style>

