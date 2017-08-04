<template>
<div>

        <navbar title="扫描结果" v-on:back = "onback"></navbar>
        <text class="content">回到weex:{{result}}</text>

</div>
  
</template>

<style>

    .content{

        font-size: 45px;
        text-align: center;
        margin-top: 155px;
        flex:1;
        color: #000 0.86;
    }

</style>

<script>
import navbar from './navbar.vue'
 var navigator = weex.requireModule('navigator')
 var storage = weex.requireModule('storage')



export default {

    components:{

        navbar,

    },

    data(){

        return {

            result:''


        }

    },

    created(){


    },

    mounted(){

            console.log('get data handle ')

            storage.getItem('result',event => {

            this.result = event.data
            console.log('result'+ event.result)
            console.log('get data handle result data:'+this.content)

            })
    },

    methods:{

        onback(){

            console.log("back..........")
            navigator.pop({

                    animatied:'true'

                },function(){
            }) 
        }
    }
  
}
</script>


