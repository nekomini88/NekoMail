package com.nekomini.mail;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SettingsActivity extends Activity {

    private EditText domainEditText;
    private Button saveButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        domainEditText = findViewById(R.id.domainEditText);
        saveButton = findViewById(R.id.saveButton);

        // Load current domain
        SharedPreferences prefs = getSharedPreferences("NekoMailPrefs", Context.MODE_PRIVATE);
        String currentDomain = prefs.getString("email_domain", "mail.nekomini.dpdns.org");
        domainEditText.setText(currentDomain);

        saveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String newDomain = domainEditText.getText().toString().trim();
                if (!newDomain.isEmpty()) {
                    SharedPreferences.Editor editor = getSharedPreferences("NekoMailPrefs", Context.MODE_PRIVATE).edit();
                    editor.putString("email_domain", newDomain);
                    editor.apply();
                    Toast.makeText(SettingsActivity.this, "域名已保存，请重启应用生效", Toast.LENGTH_LONG).show();
                    finish();
                } else {
                    Toast.makeText(SettingsActivity.this, "域名不能为空", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}
