<!-- <script lang="ts">
  export default {
    name: 'App'
  }
</script> -->

 <!-- <script setup> 中 不允许写 export default，这与传统的 <script> 写法不同。 -->
 <!-- 正确的做法是：直接使用 defineOptions() 或 defineProps() 等组合式 API。 -->
<script setup lang="ts">
  defineOptions({
    name: 'App'
  })
</script>

<template>
  <div class="app">
    <h1>Hello vue3.0</h1>
  </div>
</template>

<style scoped>
.app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  font-weight: normal;
}
</style>
