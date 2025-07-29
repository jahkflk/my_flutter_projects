import { ref, reactive, computed, onMounted } from 'vue'
import axios from 'axios'


export default function(){
    
let age = ref(18)

let bigAge = computed(() => {
    return age.value * 10
})

function changeAge() {
    age.value += 1
}

onMounted(()=>{
    changeAge()
})

return {age, changeAge,bigAge}
}

