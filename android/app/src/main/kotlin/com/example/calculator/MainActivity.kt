package com.example.calculator

import androidx.annotation.NonNull
import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
  private val CHANNEL = "Anas.Calculator/appDir"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if(call.method == "getAppDirPath") {

        val path = dir();

        if (path != null) {
          result.success(path)
        } else {
          result.error("UNAVAILABLE", "App Dir. is not available.", null)
        }
      } else {
        result.notImplemented()
      }
    }     
  }

 fun dir(): String {

   return getFilesDir().getAbsolutePath();
   
   }
 
}
