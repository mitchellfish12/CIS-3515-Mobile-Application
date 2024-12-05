package com.example.acomposeactivity2

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.sp
import com.example.acomposeactivity2.ui.theme.AComposeActivity2Theme
import com.google.firebase.perf.metrics.Counter

class MainActivity : ComponentActivity() {
    @SuppressLint("MissingSuperCall")
    override fun onCreate(savedInstanceState: Bundle?) {
        setContent{
            AComposeActivity2Theme {

            }
        }
    }
}

@Composable
fun Counter() {
    var counter by rememberSaveable { mutableIntStateOf(0) }

    Column (
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ){
        Button (
            onClick = { counter++}
        ){
            Text("Increase")
        }
        Text("0",
            fontSize = 64.sp)
        Button (
            onClick = {counter--}
        ){
            Text("Decrease")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    AComposeActivity2Theme {
        Counter("Android")
    }
}