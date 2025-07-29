<template>
  <div class="person">
    <h2>名前: {{ name }}</h2>
    <h2>年齢: {{ age }}</h2>
    <button @click="changeName">名前を変更</button>
    <button @click="changeAge">年齢を変更</button>
  </div>
</template>

<script lang="ts" setup name="Person">
import { reactive, toRefs } from 'vue'

// データ
let person = reactive({
  name: '張三', // 初期名を指定
  age: 18     // 初期年齢を指定
})

// toRefsを使用して、personオブジェクトの各プロパティをリアクティブなrefに変換
let { name, age } = toRefs(person)

// メソッド
function changeName() {
  name.value += '~' // 名前にチルダを追加
}

function changeAge() {
  age.value += 1 // 年齢を1増やす
}
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