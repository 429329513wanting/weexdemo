<template>
<div>

    <navbar title="取票" v-on:back = "onback"></navbar>
    <div class="content section">

        <text class="word bold">票型名称</text>
        <text class="word bold">已取票量/总量</text>
        <text class="word bold">游玩时间</text>
        <text class="word bold">下单时间</text>
        <text class="word bold">取票数量</text>



    </div>

    <list class="list">
        <cell class="cell" v-for="item in items">

            <div class="content">

                <text class="word">{{item.name}}</text>
                <text class="word">{{item.take}}</text>
                <text class="word">{{item.date}}</text>
                <text class="word">{{item.cratetime}}</text>
                <numvue></numvue>

            </div>

        </cell>

    </list>

</div>



</template>

<style>


    .word{

        color: #000;
        font-size: 30px;
        flex:1;
        text-align: center;
        height: 45px;
    }
    .blod{

        font-weight: bold;
        margin-left: 30px;
    }

    .content{

        padding-left:20px;
        padding-right:20px;
        flex-direction: row;
        text-align: center;
        justify-content: center;
        align-items: center;
        border-bottom-color: #ccc;
        border-bottom-width: 1px;

    }


    .list{

        width: 750px;
        
    }
    .cell{

        width: 750px;
        height: 90px;
    }
    .section{

        height: 65px;
    }

</style>

<script>

import navbar from './navbar.vue'
import numvue from './changenum.vue'

 var navigator = weex.requireModule('navigator')

export default {

    data(){

        return {

            items:[

                {name:'测试票型01',take:'1/5',date:'2017-08',cratetime:'2017-08-01',num:'1'},
                {name:'测试票型01',take:'1/5',date:'2017-08',cratetime:'2017-08-01',num:'1'}
            ]
        }

    },

    components:{

        navbar,
        numvue

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


