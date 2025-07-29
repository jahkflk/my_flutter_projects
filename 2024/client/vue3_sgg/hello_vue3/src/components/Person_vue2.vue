<template>
  <div class="person">
      <h2>name:{{ name }}</h2>
      <h2>age:{{ age }}</h2>
      <button @click="changeName">修改名字</button>
      <button @click="changeAge">年龄+1</button>
      <button @click="showTel">查看联系方式</button>
      <h2></h2>
      <h2></h2>
  </div>
</template>

<script lang="ts">
  export default {
    name: 'Person',
    data(){
       return{
        name: 'Jerry',
        age: 18,
        tel: '1388888888'
       }
    },
    methods:{
      changeName(){
        this.name = 'Tom'
      },
      changeAge(){
        this.age += 1
      },
      showTel(){
        alert(this.tel)
      }
    }
  }
</script>

<style scoped>
.person{
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
