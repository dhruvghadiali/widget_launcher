package com.example.widget_launcher

import android.os.Bundle
import android.util.Base64
import android.content.Intent
import android.graphics.Bitmap
import androidx.annotation.NonNull
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.ApplicationInfo
import android.graphics.drawable.Drawable
import android.graphics.drawable.BitmapDrawable

import java.io.ByteArrayOutputStream

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

import android.content.Context
import android.graphics.drawable.AdaptiveIconDrawable
import android.graphics.Canvas



class MainActivity: FlutterActivity(){
    private val CHANNEL_NAME = "com.example.widget_launcher/android";
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME).setMethodCallHandler {
                call, result ->
                if (call.method == "installedApps") {
                    val installedApps = getInstalledApps()
                    result.success(installedApps)
                } else if (call.method == "openApp") {
                    val value = openApplicarion(call.argument<String>("packageName").toString())
                    result.success(value)
                }else {
                    result.notImplemented()
                }
        }
    }

    private fun getInstalledApps(): List<Map<String, String?>> {
        val packageManager: PackageManager = packageManager
        val packages: List<PackageInfo> = packageManager.getInstalledPackages(PackageManager.GET_META_DATA)
        val apps = mutableListOf<Map<String, String?>>()

        for (packageInfo in packages) {
            
            var iconBase64: String? = null

            val installedFromPlayStore = isInstalledFromPlayStore(packageInfo)
            val installedFromDeviceManufacturer = isInstalledFromDeviceManufacturer(packageInfo)
            val launchIntent: Intent? = packageManager.getLaunchIntentForPackage(packageInfo.packageName)
            val isLaunchable = launchIntent != null
            // val iconBase64 = getAppIconBase64(packageInfo.packageName)

            val icon = packageInfo.applicationInfo.loadIcon(packageManager)
            val bitmap = getBitmapFromDrawable(icon)
            if (bitmap != null) {
                val byteArrayOutputStream = ByteArrayOutputStream()
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)
                val byteArray: ByteArray = byteArrayOutputStream.toByteArray()
                iconBase64 = Base64.encodeToString(byteArray, Base64.DEFAULT)
            }

            val app = mapOf(
                "appName" to packageInfo.applicationInfo.loadLabel(packageManager).toString(),
                "packageName" to packageInfo.packageName,
                "source" to packageInfo.applicationInfo.sourceDir.toString(),
                "installedFromPlayStore" to installedFromPlayStore.toString(),
                "installedFromDeviceManufacturer" to installedFromDeviceManufacturer.toString(),
                "isLaunchable" to isLaunchable.toString(),
                "iconBase64" to iconBase64
            )
            apps.add(app)
        }

        return apps
    }

    private fun isInstalledFromPlayStore(packageInfo: PackageInfo): Boolean {
        val packageManager = packageManager
        return packageManager.getInstallerPackageName(packageInfo.packageName) == "com.android.vending"
    }

    private fun isInstalledFromDeviceManufacturer(packageInfo: PackageInfo): Boolean {
        val applicationInfo1 = packageInfo.applicationInfo
        return (applicationInfo1.flags and ApplicationInfo.FLAG_SYSTEM) != 0
    }

    // private fun getAppIconBase64(packageName: String): String {
    //     return try {
    //         val packageInfo = packageManager.getPackageInfo(packageName, 0)
    //         val appIcon = packageInfo.applicationInfo.loadIcon(packageManager) as BitmapDrawable
    //         val bitmap = appIcon.bitmap
    //         val outputStream = ByteArrayOutputStream()
    //         bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
    //         val byteArray = outputStream.toByteArray()
    //         Base64.encodeToString(byteArray, Base64.DEFAULT)
    //     } catch (e: Exception) {
    //         e.toString()
    //     }
    // }

    private fun getBitmapFromDrawable(drawable: android.graphics.drawable.Drawable): Bitmap? {
        return when (drawable) {
            is BitmapDrawable -> drawable.bitmap
            is AdaptiveIconDrawable -> {
                val bitmap = Bitmap.createBitmap(
                    drawable.intrinsicWidth,
                    drawable.intrinsicHeight,
                    Bitmap.Config.ARGB_8888
                )
                val canvas = Canvas(bitmap)
                drawable.setBounds(0, 0, canvas.width, canvas.height)
                drawable.draw(canvas)
                bitmap
            }
            else -> null
        }
    }

    private fun openApplicarion(packageName: String): Boolean {
        if (packageName != null) {
            val packageManager = applicationContext.packageManager
            val intent = packageManager.getLaunchIntentForPackage(packageName)
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                applicationContext.startActivity(intent)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}

