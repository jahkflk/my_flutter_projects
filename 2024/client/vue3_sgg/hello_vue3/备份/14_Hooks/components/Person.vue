<template>
  <div class="person">
      <h2>age:{{ age }},   bigAge:{{ bigAge }}</h2>
      <button @click="changeAge">年龄+1</button>
      <hr>
      <img v-for="(dog,index) in dogList" :src="dog" :key="index"/><br>
      <button @click="addDog">add dog</button>
      <button @click="clearDog">clear dog</button>
  </div>
</template>

<script lang="ts" setup name="Person">
import useDog from '@/composables/useDog';
import useSum from '@/composables/useSum';
  const {age, changeAge, bigAge} = useSum()
  const {dogList, addDog, clearDog} = useDog()

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

img {
  height: 100px;
}
</style>
