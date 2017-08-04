<template>
<div class="bg">
    <image class="numstyle" @click="minusclick" src="xcassets:minus"></image>
    <text class="num">{{num}}</text>
    <image class="numstyle" @click="plusclick" src="xcassets:add"></image>

</div>
  
</template>

<style>
.num{

    color: #000;
    font-size: 30px;
    text-align: center;
    flex: 1;
}
.numstyle{

    width: 40px;height: 40px;
}
.bg{

    flex-direction: row;
    width: 125px;
    height: 45px;
    align-items: center;

}

</style>

<script>
export default {

    data(){
        return{

            num:0
        }
    },
    methods:{

        minusclick(event){

            this.num--;
            if (this.num <= 0) {
                this.num = 0
            } 

        },

        plusclick(event){


            this.num++;
            if (this.num >= 10) {

                this.num = 10
            }

        }

    }
  
}
</script>


