<template>
  <div class="person">
    <h2>一辆{{ car.brand }}车，价值{{ car.price }}万</h2>
    <p>发动机类型：{{ car.engine.type }}，马力：{{ car.engine.horsepower }}</p>
    <button @click="changePrice">修改汽车的价格</button>
    <button @click="changeEngineType">修改发动机类型</button>
    <button @click="changeBrand">修改品牌</button> <!-- 新增按钮 -->
    <button @click="changeCar">修改汽车</button> <!-- 新增按钮 -->

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
import { ref } from 'vue'

// 用 ref 包裹 car 对象
const car = ref({
  brand: '奔驰',
  price: 100,
  engine: {
    type: 'V6',
    horsepower: 300
  }
})

// 用 ref 包裹游戏数组
const game = ref([
  { id: 1, name: '英雄联盟' },
  { id: 2, name: '原神' },
  { id: 3, name: '王者荣耀' }
])

// 修改汽车价格
function changePrice() {
  car.value.price += 10
}

// 修改发动机类型
function changeEngineType() {
  car.value.engine.type = 'V8'
}

// 修改品牌名称
function changeBrand() {
  car.value.brand = '宝马'
}

//ref
function changeCar() {
  car.value = {
    brand: '奥迪',
    price: 50,
    engine: {
      type: 'A5',
      horsepower: 500
    }
  }
}



//reactive
// function changeCar() {
//   debugger
//   Object.assign(car, {
//     brand: '奥迪',
//     price: 50,
//     engine: {
//       type: 'A5',
//       horsepower: 200
//     }
//   });
// }

// 修改第一个游戏名称
function changeFirstGameName() {
  if (game.value.length > 0) {
    game.value[0].name = '塞尔达传说'
  }
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
