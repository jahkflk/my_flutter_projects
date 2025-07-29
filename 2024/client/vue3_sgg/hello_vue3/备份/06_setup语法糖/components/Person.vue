<template>
  <div class="person">
    <h2>name:{{ name }}</h2>
      <h2>age:{{ age }}</h2>
      <button @click="changeName">修改名字</button>
      <button @click="changeAge">年龄+1</button>
      <button @click="showTel">查看联系方式</button>

  </div>
</template>

<script lang="ts">
import { ref } from 'vue'

// setup 与 OptionsAPI
// export default {
//   name: 'Person',
//   // setup(){
//   //   // 响应式变量
//   //   const name = ref('Jerry')
//   //   const age = ref(18)
//   //   const tel = '1399999999' // 不需要响应式

//   //   //let x = d   setup不可以读出旧写法的东西

//   //   function changeName(){
//   //     name.value = 'Tom'
//   //   }

//   //   function changeAge(){
//   //     age.value += 1
//   //   }

//   //   function showTel(){
//   //     alert(tel)
//   //   }

//   //   return {
//   //     name,
//   //     age,
//   //     changeName,
//   //     changeAge,
//   //     showTel
//   //   }
//   // }
// }
</script>

<script lang="ts" setup name="Person234">
  //相当于 export default中写setup()，且不用return

  // 响应式变量
  const name = ref('Jerry')
  const age = ref(18)
  const tel = '1399999999' // 不需要响应式

  //let x = d   setup不可以读出旧写法的东西

  function changeName() {
    name.value = 'Tom'
  }

  function changeAge() {
    age.value += 1
  }

  function showTel() {
    alert(tel)
  }

</script>



<style scoped>
.person {
  background-color: skyblue;
  box-shadow: 0 0 10px;
  border-radius: 10px;
  padding: 20px;
}

button {
  margin: 0 5px
}

h1 {
  font-weight: 500;
  font-size: 2.6rem;
  position: relative;
  top: -10px;
}

h3 {
  font-size: 1.2rem;
}
</style>
