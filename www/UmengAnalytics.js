var exec = require('cordova/exec');

function UmengAnalytics() {

}

UmengAnalytics.prototype = {
    onResume:function(){
        exec(null, null,'UmengAnalytics','onResume',[]);
    },
    onPause:function(){
        exec(null, null,'UmengAnalytics','onPause',[]);
    },
    setDebugMode:function(model){
        exec(null, null,'UmengAnalytics','setDebugMode',[model]);
    }
}

if(!window.plugins){
    window.plugins = {};
}

if(!window.plugins.umengAnalytics){
    window.plugins.umengAnalytics = new UmengAnalytics();
}

module.exports = new UmengAnalytics();