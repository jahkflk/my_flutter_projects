<template>
  <div class="p-4">
    <div class="person">
      <h2 class="text-xl font-bold mb-2">watchEffect 示例</h2>
      <h2>当前水温: {{ temp }}</h2>
      <h2>当前水位: {{ height }}</h2>

      <!-- 提示信息 -->
      <p v-if="tempWarning" class="warning">⚠ 水温过高</p>
      <p v-if="heightWarning" class="warning">⚠ 水位过高</p>

      <!-- 控制按钮 -->
      <button @click="changeTemp">水温 +10</button>
      <button @click="reduceTemp">水温 -10</button>
      <button @click="changeHeight">水位 +10</button>
      <button @click="reduceHeight">水位 -10</button>
    </div>
  </div>
</template>

<script lang="ts" setup name="Person3">
import { ref, watchEffect } from 'vue'

// 数据
const temp = ref(10)
const height = ref(0)

// 状态提示
const tempWarning = ref(false)
const heightWarning = ref(false)

// 方法：增加/减少
function changeTemp() {
  temp.value += 10
}
function reduceTemp() {
  temp.value -= 10
}
function changeHeight() {
  height.value += 10
}
function reduceHeight() {
  height.value -= 10
}

// 统一 watchEffect 实现
watchEffect(() => {
  console.log(`水温变化：${temp.value}，水位变化：${height.value}`)

  // 水温过高处理
  if (temp.value >= 60) {
    if (!tempWarning.value) {
      console.log('⚠ 水温过高')
    }
    tempWarning.value = true
  } else {
    tempWarning.value = false
  }

  // 水位过高处理
  if (height.value >= 80) {
    if (!heightWarning.value) {
      console.log('⚠ 水位过高')
    }
    heightWarning.value = true
  } else {
    heightWarning.value = false
  }
})

// 条件 watch：超过阈值则通知服务器
// watch([temp, height], ([newTemp, newHeight]) => {
//   if ((newTemp >= 60 || newHeight >= 80) && !notified.value) {
//     console.log('⚠ 给服务器发送请求')
//     notified.value = true
//   }
// })

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

.warning {
  color: red;
  font-weight: bold;
  margin: 10px 0;
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
</style>
