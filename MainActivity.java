package com.example.resumeapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.appcompat.widget.SwitchCompat;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {
    //Initialize variables
    ImageView img_twitter, img_github, img_linkedln;
    SwitchCompat switchCompat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        //Check condition
        if(AppCompatDelegate.getDefaultNightMode()==AppCompatDelegate.MODE_NIGHT_YES){
            //When night mode is equal to yes
            //Set Dark theme
            setTheme(R.style.Theme_Dark);
        }else{
            //When  night mode is equal to no
            //Set light theme
            setTheme(R.style.Theme_Light);
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Assign Variable
        switchCompat=findViewById(R.id.bt_switch);

        switchCompat.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                //Check condition
                if(switchCompat.isChecked()){
                    //When switch button is checked
                    //set night mode
                    AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES);

                }else{
                    //When switch button is unchecked
                    //set light mode
                    AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
                }
            }
        });
        img_github=findViewById(R.id.ic_github);
        img_twitter=findViewById(R.id.ic_twitter);
        img_linkedln=findViewById(R.id.ic_linkedln);

        //Set on click listeners

        img_linkedln.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Initialize link and package
                String sAppLink = "https://ke.linkedin.com/in/emmanuel-kimutai-a91209231" ;
                String sPackage = "com.linkedin.android" ;
                String sWebLink = "https://www.linkedin.com/in/emmanuel-kimutai-a91209231";

                //Call Method
                openLink(sAppLink,sPackage,sWebLink);

            }
        });


        img_github.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Initialize link and package
                String sAppLink = "https://www.github.com/STARKthegreat" ;
                String sPackage = "com.github.android" ;
                String sWebLink = "https://www.github.com/STARKthegreat";

                //Call Method
                openLink(sAppLink,sPackage,sWebLink);

            }
        });

        img_twitter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Initialize link and package
                String sAppLink = "twitter://user?screen name=2Kabej" ;
                String sPackage = "com.twitter.android" ;
                String sWebLink = "https://www.twitter.com/2kabej";

                //Call Method
                openLink(sAppLink,sPackage,sWebLink);

            }
        });
    }

    //Create Method
    private void openLink(String sAppLink, String sPackage, String sWebLink){
        //try and catch
        try {
            //When application is installed
            //Initialize Uri
            Uri uri = Uri.parse(sAppLink);
            //Initialize intent
            Intent intent = new Intent(Intent.ACTION_VIEW);
            //set data
            intent.setData(uri);
            //Set package
            intent.setPackage(sPackage);
            //Set flag
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            //Start Activity
            startActivity(intent);
        }catch (ActivityNotFoundException activityNotFoundException){
            //Open link in browser
            //Initialize uri
            Uri uri2 = Uri.parse(sWebLink);
            //Initialize intent
            Intent intent = new Intent(Intent.ACTION_VIEW);
            //Set Data
            intent.setData(uri2);
            //Set flag
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            //Start activity
            startActivity(intent);
        }
    }
}