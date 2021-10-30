package com.example.intent_test

import io.flutter.embedding.android.FlutterActivity

import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.os.Bundle
import android.content.Intent


class MainActivity: FlutterActivity() {
    private var sharedText : String? = null
    private val CHANNEL = "app.channel.shared.data"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        intent.type?.let  {
            if (intent.action.equals(Intent.ACTION_SEND) && it.equals("text/plain")) {
                handleSendText(intent)
            }
        }
    }

    fun handleSendText(intent: Intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine : FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        channel.setMethodCallHandler { call, result ->
            if (call.method.contentEquals("getSharedText")) {

            }

        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method.contentEquals("getSharedText")) {
                result.success(sharedText!!)
                sharedText = null
            }
        }
    }
}
