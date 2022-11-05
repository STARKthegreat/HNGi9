package com.example.resumeapp

import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.View
import android.widget.CompoundButton
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.app.AppCompatDelegate
import androidx.appcompat.widget.SwitchCompat


class MainActivity : AppCompatActivity() {
    //Initialize variables

    override fun onCreate(savedInstanceState: Bundle?) {
        //Check condition
        if (AppCompatDelegate.getDefaultNightMode() == AppCompatDelegate.MODE_NIGHT_YES) {
            //When night mode is equal to yes
            //Set Dark theme
            setTheme(R.style.Theme_Dark)
        } else {
            //When  night mode is equal to no
            //Set light theme
            setTheme(R.style.Theme_Light)
        }
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val switchCompat = findViewById<SwitchCompat>(R.id.bt_switch)
        val img_github = findViewById<ImageView>(R.id.ic_github)
        val img_twitter = findViewById<ImageView>(R.id.ic_twitter)
        val ic_linkedln = findViewById<ImageView>(R.id.ic_linkedln)

        //Assign Variable
        switchCompat.setOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener { compoundButton, b ->
            //Check condition
            if (switchCompat.isChecked()) {
                //When switch button is checked
                //set night mode
                AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
            } else {
                //When switch button is unchecked
                //set light mode
                AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)
            }
        })


        //Set on click listeners
        ic_linkedln.setOnClickListener(View.OnClickListener { //Initialize link and package
            val sAppLink = "https://ke.linkedin.com/in/emmanuel-kimutai-a91209231"
            val sPackage = "com.linkedin.android"
            val sWebLink = "https://www.linkedin.com/in/emmanuel-kimutai-a91209231"

            //Call Method
            openLink(sAppLink, sPackage, sWebLink)
        })
        img_github.setOnClickListener(View.OnClickListener { //Initialize link and package
            val sAppLink = "https://www.github.com/STARKthegreat"
            val sPackage = "com.github.android"
            val sWebLink = "https://www.github.com/STARKthegreat"

            //Call Method
            openLink(sAppLink, sPackage, sWebLink)
        })
        img_twitter.setOnClickListener(View.OnClickListener { //Initialize link and package
            val sAppLink = "twitter://user?screen name=2Kabej"
            val sPackage = "com.twitter.android"
            val sWebLink = "https://www.twitter.com/2kabej"

            //Call Method
            openLink(sAppLink, sPackage, sWebLink)
        })
    }

    //Create Method
    private fun openLink(sAppLink: String, sPackage: String, sWebLink: String) {
        //try and catch
        try {
            //When application is installed
            //Initialize Uri
            val uri = Uri.parse(sAppLink)
            //Initialize intent
            val intent = Intent(Intent.ACTION_VIEW)
            //set data
            intent.data = uri
            //Set package
            intent.setPackage(sPackage)
            //Set flag
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            //Start Activity
            startActivity(intent)
        } catch (activityNotFoundException: ActivityNotFoundException) {
            //Open link in browser
            //Initialize uri
            val uri2 = Uri.parse(sWebLink)
            //Initialize intent
            val intent = Intent(Intent.ACTION_VIEW)
            //Set Data
            intent.data = uri2
            //Set flag
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            //Start activity
            startActivity(intent)
        }
    }
}
