<template>
  <div class="person">
    <h2>一辆{{ car.brand }}车，价值{{ car.price }}万</h2>
    <p>发动机类型：{{ car.engine.type }}，马力：{{ car.engine.horsepower }}</p>
    <button @click="changePrice">修改汽车的价格</button>
    <button @click="changeEngineType">修改发动机类型</button>

    <h3>游戏列表：</h3>
    <ul>
      <li v-for="g in game" :key="g.id">
        {{ g.id }} - {{ g.name }}
      </li>
    </ul>
    <button @click="changeFirstGameName">修改第一个游戏的名称</button>
  </div>
</template>

<script lang="ts" setup name="Person">
import { reactive } from 'vue'

// 响应式对象
let car = reactive({
  brand: '奔驰',
  price: 100,
  engine: {
    type: 'V6',
    horsepower: 300
  }
})

// 响应式数组
let game = reactive([
  { id: 1, name: '英雄联盟' },
  { id: 2, name: '原神' },
  { id: 3, name: '王者荣耀' }
])

// 修改价格
function changePrice() {
  car.price += 10
}

// 修改第一个游戏名称
function changeFirstGameName() {
  if (game.length > 0) {
    game[0].name = '塞尔达传说'
  }
}

// 修改嵌套对象中的属性
function changeEngineType() {
  console.log('原发动机类型:', car.engine.type)
  car.engine.type = 'V8'
  console.log('新发动机类型:', car.engine.type)
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
