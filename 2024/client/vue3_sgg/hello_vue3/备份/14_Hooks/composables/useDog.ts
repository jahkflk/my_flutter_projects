import { ref, reactive } from 'vue'
import axios from 'axios'

export default function () {
    // https://picsum.photos/
    // https://picsum.photos/200/300
    // https://dog.ceo/api/breed/pembroke/images/random

    let dogList = reactive([
        'https://images.dog.ceo/breeds/pembroke/n02113023_292.jpg'
    ])

    async function addDog() {
        try {
            let result = await axios.get('https://dog.ceo/api/breed/pembroke/images/random')
            dogList.push(result.data.message)
        } catch (error) {
            alert(error)
        }
    }

    function clearDog() {
        dogList.length = 0;
    }

    return{dogList,addDog,clearDog}
}