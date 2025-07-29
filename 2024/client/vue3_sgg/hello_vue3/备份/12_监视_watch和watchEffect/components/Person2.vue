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
    </label>

    <h1>姓：{{ firstName }}</h1>
    <h1>名：{{ lastName }}</h1>

    <p class="mt-4 text-lg">全名：{{ fullName }}</p>

    <hr class="my-6" />

    <div class="person">
      <h2 class="text-xl font-bold mb-2">watch 示例 (reactive 定义的对象类型数据)</h2>
      <h3 class="text-lg">姓名：{{ person.name }}</h3>
      <h3 class="text-lg">年龄：{{ person.age }}</h3>
      <h3 class="text-lg">汽车1：{{ person.car.c1 }}</h3>
      <h3 class="text-lg">汽车2：{{ person.car.c2 }}</h3>

      <button @click="changeName" class="mt-2">修改名字</button>
      <button @click="changeAge" class="mt-2">修改年龄</button>
      <button @click="changeCar1" class="mt-2">修改汽车1</button>
      <button @click="changeCar2" class="mt-2">修改汽车2</button>
      <button @click="replacePerson" class="mt-2">替换整个 person 对象</button>
    </div>
  </div>
</template>

<script lang="ts" setup name="Person2">
import { ref, reactive, computed, watch } from 'vue'

// 基础类型
const firstName = ref('')
const lastName = ref('')

// 计算属性
const fullName = computed(() => `${firstName.value} ${lastName.value}`)

// 监听基础类型
watch([firstName, lastName], ([newFirst, newLast], [oldFirst, oldLast]) => {
  console.log(`基础类型 watch: 姓名从 "${oldFirst} ${oldLast}" 改为 "${newFirst} ${newLast}"`)
})

// reactive 对象
const person = reactive({
  name: '张三',
  age: 18,
  car: {
    c1: '奔驰',
    c2: '宝马'
  }
})

// 修改方法
function changeName() {
  person.name += '~'
}

function changeAge() {
  person.age += 1
}

function changeCar1() {
  person.car.c1 = '奥迪'
}

function changeCar2() {
  person.car.c2 = '特斯拉'
}

function replacePerson() {
  person.name = '李四'
  person.age = 20
  person.car.c1 = '比亚迪'
  person.car.c2 = '蔚来'
}

// ✅ 使用 getter 修正 watch
watch(() => person, (newVal, oldVal) => {
  console.log('🌟 深度监听 person:')
  console.log('新值：', JSON.parse(JSON.stringify(newVal)))
  console.log('旧值：', JSON.parse(JSON.stringify(oldVal)))
}, { deep: true })

// 监听 person 的属性变化
watch(() => person.name, (newName, oldName) => {
  console.log(`对象属性 watch (name): 姓名从 "${oldName}" 改为 "${newName}"`)
})

watch(() => person.age, (newAge, oldAge) => {
  console.log(`对象属性 watch (age): 年龄从 ${oldAge} 改为 ${newAge}`)
})

// 深度监听 person.car
watch(() => person.car, (newVal, oldVal) => {
  console.log('🚗 深度监听 person.car:')
  console.log('新值：', JSON.parse(JSON.stringify(newVal)))
  console.log('旧值：', JSON.parse(JSON.stringify(oldVal)))
}, { deep: true })
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
  margin: 5px 5px 0 0;
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
