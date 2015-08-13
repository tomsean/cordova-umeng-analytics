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
    },
    onPageStart:function(pageName){
        exec(null, null,'UmengAnalytics','onPageStart',[pageName]);
    },
    onPageEnd:function(pageName){
        exec(null, null,'UmengAnalytics','onPageEnd',[pageName]);
    }
}

if(!window.plugins){
    window.plugins = {};
}

if(!window.plugins.umengAnalytics){
    window.plugins.umengAnalytics = new UmengAnalytics();
}

module.exports = new UmengAnalytics();