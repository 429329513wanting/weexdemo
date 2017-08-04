<template>
  <div class="flex">

    <div class="btn0" @click="topageone">
       <image class="img" src="xcassets:home01"></image>

    </div>
    <div class="btn0 btn1" @click="topagetwo">
      <image class="img" src="xcassets:home02"></image>

    </div>


  </div>
</template>

<style>

  .img{
    width: 225px;height:225px;
  }

  .flex{
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    background-color: #f1f1f1;
  }

  .btn0{

    width: 225px;height: 225x;
    background-color: red;
  }
  .btn1{
    background-color: #e9573f;
  }


</style>

<script>

   const modal = weex.requireModule('modal')
    const animation = weex.requireModule('animation')
    var globalEvent = weex.requireModule('globalEvent');
    var navigator = weex.requireModule('navigator')
    var storage = weex.requireModule('storage')

  export default {



    data(){

      return{

        navbase:''

      }
    },
    methods:{

      topageone(event){
              navigator.push({

                url:this.navbase+'pageOne.js',
                        animated:'true',

                    },function(e){

              }) 
      },

      topagetwo(event){

              navigator.push({

                url:this.navbase+'pageTwo.js',
                        animated:'true',

                    },function(e){

              })    

      },
    },
    created(){

              //获取当前页面路径
        if (this.$getConfig) {

            this.url = this.$getConfig().bundleUrl
            var nativeBase = this.url.substring(0, this.url.lastIndexOf('/') + 1)
            this.navbase = nativeBase;

        }

    }
  }
</script>