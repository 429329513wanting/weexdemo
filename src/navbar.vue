<template>

     <div class="topbar">

            <text v-if="backshow" class="back" @click="onclickleft">返回</text>
            <text class="title">{{title}}</text>
            <div class="line"></div> 
    </div>
  
</template>

<style>

    .line{
        width: 750px;
        height: 1px;
        position: absolute;
        bottom:0px;
        background-color: #bbb;
    }
    .back{
        color: #000 0.86;
        font-size: 32px;
        height: 38px;
        left:25px;
        top:25px;
        position: absolute;

    }
    
    .topbar{

        width: 750px;
        height:88px;
        background-color: #f8f8f8;

    }
    .title{
        color:#000 0.86;
        font-size: 32px;
        height: 38px;
        text-align: center;
        top:25px;  
        position: absolute;
        left: 300px;  
 
    }

</style>

<script>
export default {

    props:{

        title:{default:''},
        backshow:{default:true},
        backgroundColor:{default:'#e9573f'}

    },

    methods:{

            onclickleft(event){


                this.$emit('back',{result:'from children data success'})
              

            }
    },


  
}
</script>


