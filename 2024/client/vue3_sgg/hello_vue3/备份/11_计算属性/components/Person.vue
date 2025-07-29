<template>
  <div class="person">
    <input v-model="firstName" placeholder="First Name" />
    <input v-model="lastName" placeholder="Last Name" />
    <p>Full Name: {{ fullName }}</p>
  </div>
</template>

<script lang="ts" setup name="Person">
import { reactive, toRefs, computed } from 'vue'

// 原始数据
const person = reactive({
  firstName: '',
  lastName: ''
})

// 使用 toRefs 将 reactive 对象转换为 ref
const { firstName, lastName } = toRefs(person)

// 计算属性：fullName
const fullName = computed(() => {
  return `${lastName.value} ${firstName.value}`.trim()
})
</script>

<style scoped>
.person {
  background-color: #f4f4f4;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
button {
  margin: 0 5px;
  padding: 8px 15px;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}
</style>
