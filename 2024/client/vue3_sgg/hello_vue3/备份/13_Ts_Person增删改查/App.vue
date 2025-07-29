<!-- <script lang="ts">
  export default {
    name: 'App'
  }
</script> -->

<!-- <script setup> 中 不允许写 export default，这与传统的 <script> 写法不同。 -->
<!-- 正确的做法是：直接使用 defineOptions() 或 defineProps() 等组合式 API。 -->
<script lang="ts" setup name="App">
import Person from './components/Person2.vue';
</script>

<template>
  <div class="app">
    <h1>Hello vue3.0 &nbsp;&nbsp;&nbsp;&nbsp; App.vue</h1>
    <Person />
  </div>
</template>

<style scoped>
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
.app {
  background-color: skyblue;
  box-shadow: 0 0 10px;
  border-radius: 10px;
  padding: 20px;
}
</style>
