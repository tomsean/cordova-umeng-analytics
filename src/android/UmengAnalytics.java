package com.laoxc.cordova.umenganalytics;

import com.umeng.analytics.AnalyticsConfig;
import com.umeng.analytics.MobclickAgent;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONException;

public class UmengAnalytics extends CordovaPlugin {
    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        boolean debugMode=preferences.getBoolean("UmengAnalyticsDebugMode",false);
        MobclickAgent.setDebugMode( debugMode );
        String appKey=preferences.getString("UMENG_APPKEY",null);
        String channel=preferences.getString("UMENG_CHANNEL",null);
        AnalyticsConfig.setAppkey(appKey);
        AnalyticsConfig.setChannel(channel);
        MobclickAgent.updateOnlineConfig(this.cordova.getActivity());
    }
    @Override
    public boolean execute(String action, CordovaArgs args, final CallbackContext callbackContext) throws JSONException {
       return false;
    }
    @Override
    public void onPause(boolean multitasking) {
        MobclickAgent.onPause(this.cordova.getActivity());
    }
    @Override
    public void onResume(boolean multitasking) {
        MobclickAgent.onResume(this.cordova.getActivity());
    }
}