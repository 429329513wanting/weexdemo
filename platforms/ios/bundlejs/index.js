// { "framework": "Vue"} 

!function(e){function t(r){if(n[r])return n[r].exports;var o=n[r]={i:r,l:!1,exports:{}};return e[r].call(o.exports,o,o.exports,t),o.l=!0,o.exports}var n={};t.m=e,t.c=n,t.i=function(e){return e},t.d=function(e,n,r){t.o(e,n)||Object.defineProperty(e,n,{configurable:!1,enumerable:!0,get:r})},t.n=function(e){var n=e&&e.__esModule?function(){return e.default}:function(){return e};return t.d(n,"a",n),n},t.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},t.p="",t(t.s=24)}({14:function(e,t){e.exports={img:{width:225,height:225},flex:{flexDirection:"row",justifyContent:"space-around",alignItems:"center",backgroundColor:"#f1f1f1"},btn0:{width:225,height:225,backgroundColor:"#FF0000"},btn1:{backgroundColor:"#e9573f"}}},19:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:["flex"]},[n("div",{staticClass:["btn0"],on:{click:e.topageone}},[n("image",{staticClass:["img"],attrs:{src:"xcassets:home01"}})]),n("div",{staticClass:["btn0","btn1"],on:{click:e.topagetwo}},[n("image",{staticClass:["img"],attrs:{src:"xcassets:home02"}})])])},staticRenderFns:[]},e.exports.render._withStripped=!0},24:function(e,t,n){var r,o,s=[];s.push(n(14)),r=n(8);var i=n(19);o=r=r||{},"object"!=typeof r.default&&"function"!=typeof r.default||(Object.keys(r).some(function(e){return"default"!==e&&"__esModule"!==e})&&console.error("named exports are not supported in *.vue files."),o=r=r.default),"function"==typeof o&&(o=o.options),o.__file="/Users/ghwang/Desktop/weex/zzj/src/index.vue",o.render=i.render,o.staticRenderFns=i.staticRenderFns,o._scopeId="data-v-276b164a",o.style=o.style||{},s.forEach(function(e){for(var t in e)o.style[t]=e[t]}),"function"==typeof __register_static_styles__&&__register_static_styles__(o._scopeId,s),e.exports=r,e.exports.el="true",new Vue(e.exports)},8:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=(weex.requireModule("modal"),weex.requireModule("animation"),weex.requireModule("globalEvent"),weex.requireModule("navigator"));weex.requireModule("storage");t.default={data:function(){return{navbase:""}},methods:{topageone:function(e){r.push({url:this.navbase+"pageOne.js",animated:"true"},function(e){})},topagetwo:function(e){r.push({url:this.navbase+"pageTwo.js",animated:"true"},function(e){})}},created:function(){if(this.$getConfig){this.url=this.$getConfig().bundleUrl;var e=this.url.substring(0,this.url.lastIndexOf("/")+1);this.navbase=e}}}}});