<template>
  <div class="p-4">
    <h2 class="text-xl font-bold mb-2">Typescript 接口，泛型，与自定义类型</h2>

    <!-- フィルター -->
    <label class="block mb-2">
      <input type="checkbox" v-model="showAdultsOnly" />
      18歳以上のみ表示
    </label>

    <!-- 名前検索 -->
<label class="block mb-2">
  <input
    v-model="searchKeyword"
    placeholder="名前で検索..."
    class="border p-1"
  />
</label>

    <!-- フォーム追加 -->
    <div class="person">
      <label class="block mb-2">名前：
        <input v-model="newPerson.name" class="border p-1" />
      </label>
      <label class="block mb-2">年齢：
        <input type="number" v-model.number="newPerson.age" class="border p-1" />
      </label>
      <button @click="addPerson" class="mt-2">追加</button>
    </div>

    <!-- 一覧表示 -->
    <div v-for="person in filteredList" :key="person.id" class="person">
      <h3 class="text-lg font-semibold">姓名：{{ person.name }}</h3>
      <p>年龄：{{ person.age }}</p>
      <p>ID：{{ person.id }}</p>
      <button @click="deletePerson(person.id)">削除</button>
    </div>
  </div>
</template>


<script lang="ts" setup name="Person">
import { ref, computed } from 'vue'
import { v4 as uuidv4 } from 'uuid';
import type { PersonInter, Persons } from '@/types/person'
import { ageLimit, greet } from '@/types/person'

const id = uuidv4();
console.log(id);

// ✅ 初期リスト
const personList = ref<Persons>([
  { id: 'uuid1', name: '张三', age: 18 },
  { id: 'uuid2', name: '李四', age: 19 },
  { id: 'uuid3', name: '王五', age: 20 },
])

console.log(greet(personList.value[0]))
console.log(`Age limit is ${ageLimit}`)

// ✅ 新規登録フォーム
const newPerson = ref<Pick<PersonInter, 'name' | 'age'>>({ name: '', age: 18 })

// ✅ フィルター条件
const showAdultsOnly = ref(false)

// ✅ 名前検索キーワード
const searchKeyword = ref('')

// const filteredList = computed(() =>
//   showAdultsOnly.value
//     ? personList.value.filter(p => p.age >= 18)
//     : personList.value
// )

// ✅ フィルター条件（年齢 + 名前）
const filteredList = computed(() => {
  return personList.value.filter(p => {
    const ageOk = !showAdultsOnly.value || p.age >= 18
    const nameOk = p.name.includes(searchKeyword.value.trim())
    return ageOk && nameOk
  })
})


// ✅ 追加処理
const addPerson = () => {
  if (!newPerson.value.name) return
  const newEntry: PersonInter = {
    id: uuidv4(),
    ...newPerson.value,
  }
  personList.value.push(newEntry)
  newPerson.value.name = ''
  newPerson.value.age = 18
}

// ✅ 削除処理
const deletePerson = (id: string) => {
  personList.value = personList.value.filter(p => p.id !== id)
}

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
  /* Added margin for separation */
}

input.border.p-1 {
  border: 1px solid #ccc;
  padding: 0.25rem;
  border-radius: 4px;
}

label.block.mb-2 {
  display: block;
  margin-bottom: 0.5rem;
}

h1,
h3 {
  margin-top: 0.5rem;
  margin-bottom: 0.5rem;
}

p.mt-4.text-lg {
  margin-top: 1rem;
  font-size: 1.125rem;
}

h2.text-xl.font-bold.mb-2 {
  font-size: 1.25rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

hr.my-6 {
  margin-top: 1.5rem;
  margin-bottom: 1.5rem;
  border: 0;
  border-top: 1px solid #eee;
}

button {
  margin: 0 5px;
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

button.mt-2 {
  margin-top: 0.5rem;
}
</style>
