<template>
  <div class="p-4">
    <h2 class="text-xl font-bold mb-2">watch 示例 (基础类型和计算属性)</h2>

    <label class="block mb-2">
      姓：
      <input v-model="firstName" class="border p-1" placeholder="请输入姓" />
    </label>

    <label class="block mb-2">
      名：
      <input v-model="lastName" class="border p-1" placeholder="请输入名" />
    </label><br>
    <h1>姓：{{ firstName }}</h1>
    <h1>名：{{ lastName }}</h1>

    <p class="mt-4 text-lg">全名：{{ fullName }}</p>

    <hr class="my-6">

    <div class="person">
      <h2 class="text-xl font-bold mb-2">watch 示例 (ref 定义的对象类型数据)</h2>
      <h3 class="text-lg">姓名：{{ person.name }}</h3>
      <h3 class="text-lg">年龄：{{ person.age }}</h3>
      <button @click="changeName" class="mt-2">修改名字</button>
      <button @click="changeAge" class="mt-2">修改年龄</button>
    </div>
  </div>
</template>

<script setup>
// watch 的基本语法
// watch(source, callback, options?)
// source：要监听的响应式数据（可以是 ref、reactive 的属性、getter 函数、数组等）
// callback：数据变化时调用的函数 (newValue, oldValue) => {}
// options：可选配置（如 immediate, deep )

import { ref, computed, watch } from 'vue'

// --- 示例1: 监听基本类型和计算属性 ---
// 1. 响应式数据 (基本类型)
const firstName = ref('')
const lastName = ref('')

// 2. 计算属性：全名
const fullName = computed(() => `${firstName.value} ${lastName.value}`)

// 3. 监听姓或名的变化，打印全名
watch([firstName, lastName], ([newFirst, newLast], [oldFirst, oldLast]) => {
  console.log(`基础类型 watch: 姓名从 "${oldFirst} ${oldLast}" 改为 "${newFirst} ${newLast}"`)
  console.log(`当前全名是: ${fullName.value}`)
})

// --- 示例2: 监听 ref 定义的对象类型数据 (来自图片) ---
// 1. 响应式数据 (对象类型)
const person = ref({
  name: '张三',
  age: 18
})

// 2. 方法
function changeName() {
  person.value.name += '~' // 可以根据需要修改为其他名字或逻辑
}

function changeAge() {
  person.value.age += 1
}

function changePerson() {
  person = {
    name: '李四',
    age: 19
  }
}

// 3. 监听 person 对象的变化
// 对于 ref 定义的对象，直接监听 ref 本身，需要开启 deep: true 才能监听到对象内部属性的变化
watch(person, (newValue, oldValue) => {
  console.log('对象类型 watch: person 对象发生了变化')
  // newValue 和 oldValue 将是同一个对象的引用，除非 person 被重新赋值为一个新对象
  // 为了更清晰地看到变化，可以比较具体属性
  if (newValue.name !== oldValue.name) { // 这个比较在 deep watch 中可能不准确，因为 oldValue 也是更新后的
    // 更可靠的方式是克隆 oldValue，或者在回调中直接使用 newValue
    console.log(`  姓名从 "${oldValue.name}" (旧值可能已更新) 改为 "${newValue.name}"`);
  }
  if (newValue.age !== oldValue.age) { // 同上
    console.log(`  年龄从 ${oldValue.age} (旧值可能已更新) 改为 ${newValue.age}`);
  }
  // 更准确的日志，直接显示新旧对象快照 (如果需要比较，应在 watch 外部或 getter 中进行)
  console.log('  新 person 值:', JSON.parse(JSON.stringify(newValue))); // 使用 JSON.parse(JSON.stringify()) 来获取快照
  // oldValue 在 deep watch 中通常与 newValue 相同，除非你替换整个 person ref
  // console.log('  旧 person 值 (在 deep watch 中通常与 newValue 相同):', JSON.parse(JSON.stringify(oldValue)));
}, { deep: true }) // deep: true 是必须的，用于侦听对象内部值的变化

// 另一个侦听对象属性的例子，使用 getter 函数作为 source
watch(() => person.value.name, (newName, oldName) => {
  console.log(`对象属性 watch (name): 姓名从 "${oldName}" 改为 "${newName}"`)
})

watch(() => person.value.age, (newAge, oldAge) => {
  console.log(`对象属性 watch (age): 年龄从 ${oldAge} 改为 ${newAge}`)
})

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
  /* Adjusted h1 from original to h3 for person details for better hierarchy */
  margin-top: 0.5rem;
  margin-bottom: 0.5rem;
}

p.mt-4.text-lg {
  margin-top: 1rem;
  font-size: 1.125rem;
  /* TailwindCSS text-lg */
}

h2.text-xl.font-bold.mb-2 {
  font-size: 1.25rem;
  /* TailwindCSS text-xl */
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
  /* Added transition */
}

button:hover {
  background-color: #0056b3;
}

button.mt-2 {
  margin-top: 0.5rem;
}
</style>