package com.beliya.platform_buttons_handler

import android.view.MotionEvent
import android.view.View

class ButtonClickStream {
    private val buttonClicks = mutableListOf<ButtonClick>()

    fun addButtonClick(buttonClick: ButtonClick) {
        buttonClicks.add(buttonClick)
    }

    fun getButtonClickStream(): Flow<ButtonClick> {
        return buttonClicks.asFlow()
    }
}

data class ButtonClick(val view: View, val event: MotionEvent)