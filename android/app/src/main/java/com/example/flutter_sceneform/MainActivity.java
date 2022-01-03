package com.example.flutter_sceneform;

import android.content.Intent;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL =
    "com.example.flutter_sceneform/ar_viewer";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    new MethodChannel(
      flutterEngine.getDartExecutor().getBinaryMessenger(),
      CHANNEL
    )
    .setMethodCallHandler(
        (call, result) -> {
          if (call.method.equals("arv")) {
            Intent intent = new Intent(MainActivity.this, ARViewer.class);
            startActivity(intent);
          } else {
            result.notImplemented();
          }
        }
      );
  }
}
