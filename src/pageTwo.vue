<template>

    <div>

        <navbar title="取票查询" v-on:back = "onback"></navbar>

        <div class="content">

            <image class="img" src="xcassets:qr" @click="qrtake"></image>
            <image class="img" src="xcassets:help" @click="helptake"></image>
            <image class="img" src="xcassets:card" @click="cardtake"></image>

        </div>


    </div>

</template>

<style>

.img{
    
    width: 225px;height: 225px;
}

.content{

    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    margin-top: 300px;
}

</style>

<script>
import navbar from './navbar.vue'
 var navigator = weex.requireModule('navigator')

export default {

    components:{
        navbar
    },
    data(){

        return{
            navbase:''
        }
    },
    created(){

              //获取当前页面路径
        if (this.$getConfig) {

            this.url = this.$getConfig().bundleUrl
            var nativeBase = this.url.substring(0, this.url.lastIndexOf('/') + 1)
            this.navbase = nativeBase;

        }
    },
    methods:{

        onback:function(res){

            navigator.pop({

                animatied:'true'

            },function(){

        }) 

        },
        qrtake(event){

              navigator.push({

                url:this.navbase+'take.js',
                        animated:'true',

                    },function(e){

              })  

        },

        helptake(event){


              navigator.push({

                url:this.navbase+'take.js',
                        animated:'true',

                    },function(e){

              })  
        },
        cardtake(event){

              navigator.push({

                url:this.navbase+'take.js',
                        animated:'true',

                    },function(e){

              })  
        }

    }
  
}
</script>