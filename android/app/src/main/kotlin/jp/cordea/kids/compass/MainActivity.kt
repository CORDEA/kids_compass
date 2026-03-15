package jp.cordea.kids.compass

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private val channelName = "jp.cordea.kids.compass/heading"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setStreamHandler(HeadingStreamHandler(getSystemService(SENSOR_SERVICE) as SensorManager))
    }
}

private class HeadingStreamHandler(
    private val sensorManager: SensorManager,
) : EventChannel.StreamHandler, SensorEventListener {
    private var eventSink: EventChannel.EventSink? = null

    private val gravity = FloatArray(3)
    private val geomagnetic = FloatArray(3)

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        sensorManager.registerListener(
            this,
            sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),
            SensorManager.SENSOR_DELAY_GAME,
        )
        sensorManager.registerListener(
            this,
            sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD),
            SensorManager.SENSOR_DELAY_GAME,
        )
    }

    override fun onCancel(arguments: Any?) {
        sensorManager.unregisterListener(this)
        eventSink = null
    }

    override fun onSensorChanged(event: SensorEvent) {
        val alpha = 0.8f
        when (event.sensor.type) {
            Sensor.TYPE_ACCELEROMETER -> {
                gravity[0] = alpha * gravity[0] + (1 - alpha) * event.values[0]
                gravity[1] = alpha * gravity[1] + (1 - alpha) * event.values[1]
                gravity[2] = alpha * gravity[2] + (1 - alpha) * event.values[2]
            }
            Sensor.TYPE_MAGNETIC_FIELD -> {
                geomagnetic[0] = alpha * geomagnetic[0] + (1 - alpha) * event.values[0]
                geomagnetic[1] = alpha * geomagnetic[1] + (1 - alpha) * event.values[1]
                geomagnetic[2] = alpha * geomagnetic[2] + (1 - alpha) * event.values[2]
            }
        }
        val rotationMatrix = FloatArray(9)
        val inclinationMatrix = FloatArray(9)
        if (!SensorManager.getRotationMatrix(rotationMatrix, inclinationMatrix, gravity, geomagnetic)) {
            return
        }
        val orientation = FloatArray(3)
        SensorManager.getOrientation(rotationMatrix, orientation)
        val azimuthDegrees = (Math.toDegrees(orientation[0].toDouble()) + 360) % 360
        eventSink?.success(azimuthDegrees)
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) = Unit
}
