package com.example.widget_launcher

import android.net.Uri
import android.Manifest
import android.os.Bundle
import android.util.Base64
import kotlinx.coroutines.*
import android.content.Intent
import android.graphics.Bitmap
import android.content.Context
import android.graphics.Canvas
import android.database.Cursor
import android.provider.Telephony
import android.content.pm.PackageInfo
import android.annotation.SuppressLint
import android.content.ContentResolver
import android.provider.ContactsContract
import android.content.pm.PackageManager
import android.content.pm.ApplicationInfo
import android.graphics.drawable.Drawable
import androidx.core.app.ActivityOptionsCompat
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.AdaptiveIconDrawable

import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

import android.os.Build

import java.util.*
import java.text.SimpleDateFormat
import java.io.ByteArrayOutputStream

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel.MethodCallHandler





class MainActivity: FlutterActivity(){
    private val CHANNEL_NAME = "com.example.widget_launcher/android";
    private val SMS_PERMISSION_CODE = 1

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
                } else if (call.method == "getTextMessages") {
                    CoroutineScope(Dispatchers.IO).launch {
                        val smsList = getSmsGroupedBySender()
                        withContext(Dispatchers.Main) {
                            result.success(smsList)
                        }
                    }
                }
                else {
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
                val options = ActivityOptionsCompat.makeCustomAnimation(
                    this,
                    R.anim.fade_in,
                    R.anim.fade_out
                )
                applicationContext.startActivity(intent, options.toBundle())
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }

    private fun getSmsGroupedBySender(): Map<String, List<Map<String, String>>> {
        val smsMap = mutableMapOf<String, MutableList<Map<String, String>>>()
        val projection = arrayOf(
            Telephony.Sms.ADDRESS,
            Telephony.Sms.BODY,
            Telephony.Sms.DATE,
            Telephony.Sms.TYPE,
            Telephony.Sms.READ
        )
        val cursor: Cursor? = context.contentResolver.query(
           Telephony.Sms.CONTENT_URI,
            projection,
            null,
            null,
            Telephony.Sms.DATE + " DESC"
        )

        cursor?.use {
            val addressIdx = it.getColumnIndex(Telephony.Sms.ADDRESS)
            val dateIdx = it.getColumnIndex(Telephony.Sms.DATE)
            val bodyIdx = it.getColumnIndex(Telephony.Sms.BODY)
            val typeIdx = it.getColumnIndex(Telephony.Sms.TYPE)
            val readIdx = it.getColumnIndex(Telephony.Sms.READ)

            while (it.moveToNext()) {
                val address = it.getString(addressIdx)
                val dateMillis = it.getLong(dateIdx)
                val body = it.getString(bodyIdx)
                val type = it.getString(typeIdx)
                val read  = it.getString(readIdx)

                val dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault())
                val date = dateFormat.format(Date(dateMillis))
                val contactName = getContactName(address)

                val smsData = mapOf(
                    "message" to body,
                    "read" to read,
                    "type" to type,
                    "date" to date,
                    "contactName" to contactName,
                )

                if (smsMap.containsKey(address)) {
                    smsMap[address]?.add(smsData)
                } else {
                    smsMap[address] = mutableListOf(smsData)
                }
            }
        }
        return smsMap
    }

    private fun getContactName(phoneNumber: String): String {
        val uri = ContactsContract.CommonDataKinds.Phone.CONTENT_URI
        val projection = arrayOf(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME)
        val selection = "${ContactsContract.CommonDataKinds.Phone.NUMBER} = ?"
        val selectionArgs = arrayOf(phoneNumber)

        val cursor: Cursor? = contentResolver.query(uri, projection, selection, selectionArgs, null)
        cursor?.let {
            if (it.moveToFirst()) {
                val contactName = it.getString(it.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME))
                it.close()
                return contactName
            }
        }
        return phoneNumber
    }
}

