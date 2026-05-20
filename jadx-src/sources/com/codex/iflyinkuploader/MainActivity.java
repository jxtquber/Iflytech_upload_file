package com.codex.iflyinkuploader;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.Window;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends Activity {
    private static final String APP_KEY = "dxk-pc";
    private static final String APP_SECRET = "2c8e320f948911eca3fafa163ec9";
    private static final String BASE_API = "http://api.iflyink.com/xbew-api";
    private static final int BUTTON_HEIGHT = 40;
    private static final String PASSWORD_KEY = "CYS-b8f8";
    private static final int PICK_FILE = 101;
    private static final String PREF = "iflyink_upload";
    private static final String ROOT_DIR_ID = "0";
    private LinearLayout cloudListLayout;
    private LinearLayout cloudPage;
    private TextView cloudPathText;
    private ProgressBar cloudProgressBar;
    private TextView cloudProgressText;
    private TextView cloudStatusText;
    private EditText codeEdit;
    private LinearLayout codeFields;
    private Button codeModeButton;
    private LinearLayout fileListLayout;
    private TextView fileText;
    private Button headerLogoutButton;
    private TextView loginMessageText;
    private LinearLayout loginSection;
    private Button navCloudButton;
    private Button navNoteButton;
    private Button navUploadButton;
    private LinearLayout noteDirListLayout;
    private LinearLayout noteListLayout;
    private LinearLayout notePage;
    private TextView noteStatusText;
    private LinearLayout pageContainer;
    private EditText passwordEdit;
    private LinearLayout passwordFields;
    private Button passwordModeButton;
    private EditText phoneEdit;
    private ProgressBar progressBar;
    private TextView progressText;
    private TextView statusText;
    private LinearLayout uploadSection;
    private LinearLayout uploaderPage;
    private static final int BLUE = Color.rgb(68, 169, 245);
    private static final int BLUE_DARK = Color.rgb(20, 126, 214);
    private static final int BLUE_LIGHT = Color.rgb(232, 246, 255);
    private static final int BORDER = Color.rgb(198, 231, 255);
    private static final int TEXT_MAIN = Color.rgb(32, 45, 61);
    private static final int TEXT_MUTED = Color.rgb(105, 124, 145);
    private boolean passwordLoginMode = true;
    private volatile boolean uploading = false;
    private int currentPage = 0;
    private boolean notesLoaded = false;
    private boolean cloudLoaded = false;
    private String selectedNoteDirId = ROOT_DIR_ID;
    private String currentCloudDirId = ROOT_DIR_ID;
    private String currentCloudDirName = "全部文件";
    private final List<SelectedFile> selectedFiles = new ArrayList();
    private final List<JSONObject> noteDirs = new ArrayList();
    private final List<JSONObject> allNotes = new ArrayList();
    private final List<JSONObject> cloudItems = new ArrayList();
    private final List<String> cloudDirStack = new ArrayList();
    private final List<String> cloudNameStack = new ArrayList();
    private final Set<String> expandedNoteDirIds = new HashSet();
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private volatile String userId = "";
    private volatile String auth = "";
    private volatile String userToken = "";
    private volatile String refreshToken = "";
    private volatile String sn = "";

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        configureSystemBars();
        buildUi();
        loadPrefs();
    }

    private void buildUi() {
        int iDp = dp(16);
        int navigationBarHeight = getNavigationBarHeight();
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(iDp, iDp, iDp, navigationBarHeight + iDp);
        linearLayout.setBackgroundColor(Color.rgb(247, 251, 255));
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setGravity(16);
        linearLayout2.setOrientation(0);
        linearLayout.addView(linearLayout2, new LinearLayout.LayoutParams(-1, dp(58)));
        ImageView imageView = new ImageView(this);
        imageView.setImageResource(R.mipmap.ic_launcher);
        linearLayout2.addView(imageView, new LinearLayout.LayoutParams(dp(42), dp(42)));
        LinearLayout linearLayout3 = new LinearLayout(this);
        linearLayout3.setOrientation(1);
        linearLayout3.setPadding(dp(10), 0, 0, 0);
        linearLayout2.addView(linearLayout3, new LinearLayout.LayoutParams(0, -1, 1.0f));
        TextView textView = new TextView(this);
        textView.setText("讯飞文件");
        textView.setTextColor(TEXT_MAIN);
        textView.setTextSize(22.0f);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        linearLayout3.addView(textView, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        TextView textView2 = new TextView(this);
        textView2.setText("上传到读写云盘根目录");
        textView2.setTextColor(TEXT_MUTED);
        textView2.setTextSize(13.0f);
        linearLayout3.addView(textView2, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        this.headerLogoutButton = button("注销");
        this.headerLogoutButton.setTextSize(13.0f);
        this.headerLogoutButton.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda22
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m4lambda$buildUi$0$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        linearLayout2.addView(this.headerLogoutButton, new LinearLayout.LayoutParams(dp(76), dp(BUTTON_HEIGHT)));
        this.loginSection = new LinearLayout(this);
        this.loginSection.setOrientation(1);
        linearLayout.addView(this.loginSection, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        this.phoneEdit = input("手机号");
        this.phoneEdit.setInputType(3);
        this.loginSection.addView(this.phoneEdit);
        LinearLayout linearLayout4 = new LinearLayout(this);
        linearLayout4.setOrientation(0);
        linearLayout4.setPadding(0, dp(6), 0, dp(10));
        this.loginSection.addView(linearLayout4, new LinearLayout.LayoutParams(-1, dp(58)));
        this.passwordModeButton = button("密码登录");
        this.passwordModeButton.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda23
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m5lambda$buildUi$1$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        this.codeModeButton = button("验证码登录");
        this.codeModeButton.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda24
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m6lambda$buildUi$2$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f);
        layoutParams.setMargins(0, 0, dp(8), 0);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f);
        linearLayout4.addView(this.passwordModeButton, layoutParams);
        linearLayout4.addView(this.codeModeButton, layoutParams2);
        this.passwordFields = new LinearLayout(this);
        this.passwordFields.setOrientation(1);
        this.loginSection.addView(this.passwordFields, new LinearLayout.LayoutParams(-1, -2));
        this.passwordEdit = input("密码");
        this.passwordEdit.setInputType(129);
        this.passwordFields.addView(this.passwordEdit);
        this.codeFields = new LinearLayout(this);
        this.codeFields.setOrientation(1);
        this.loginSection.addView(this.codeFields, new LinearLayout.LayoutParams(-1, -2));
        this.codeEdit = input("短信验证码");
        this.codeEdit.setInputType(2);
        this.codeFields.addView(this.codeEdit);
        Button button = button("发送验证码");
        button.setText("发送验证码");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda25
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m7lambda$buildUi$3$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        this.codeFields.addView(button, buttonParams());
        Button button2 = button("登录");
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda26
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m8lambda$buildUi$4$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        this.loginSection.addView(button2, buttonParams());
        this.loginMessageText = new TextView(this);
        this.loginMessageText.setTextSize(13.0f);
        this.loginMessageText.setTextColor(TEXT_MUTED);
        this.loginMessageText.setPadding(dp(4), dp(12), dp(4), dp(8));
        this.loginSection.addView(this.loginMessageText);
        this.uploadSection = new LinearLayout(this);
        this.uploadSection.setOrientation(1);
        linearLayout.addView(this.uploadSection, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        this.pageContainer = new LinearLayout(this);
        this.pageContainer.setOrientation(1);
        this.uploadSection.addView(this.pageContainer, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        buildNotePage();
        buildUploaderPage();
        buildCloudPage();
        LinearLayout linearLayout5 = new LinearLayout(this);
        linearLayout5.setOrientation(0);
        linearLayout5.setPadding(0, dp(8), 0, 0);
        this.uploadSection.addView(linearLayout5, new LinearLayout.LayoutParams(-1, dp(46)));
        this.navNoteButton = navButton("笔记");
        this.navNoteButton.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda27
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m9lambda$buildUi$5$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        this.navUploadButton = navButton("上传");
        this.navUploadButton.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda28
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m10lambda$buildUi$6$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        this.navCloudButton = navButton("网盘");
        this.navCloudButton.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda29
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m11lambda$buildUi$7$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        linearLayout5.addView(this.navNoteButton, new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f));
        linearLayout5.addView(this.navUploadButton, new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f));
        linearLayout5.addView(this.navCloudButton, new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f));
        setContentView(linearLayout);
        updateLoginModeUi();
        switchPage(0);
    }

    /* JADX INFO: renamed from: lambda$buildUi$0$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m4lambda$buildUi$0$comcodexiflyinkuploaderMainActivity(View view) {
        confirmLogout();
    }

    /* JADX INFO: renamed from: lambda$buildUi$1$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m5lambda$buildUi$1$comcodexiflyinkuploaderMainActivity(View view) {
        this.passwordLoginMode = true;
        updateLoginModeUi();
    }

    /* JADX INFO: renamed from: lambda$buildUi$2$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m6lambda$buildUi$2$comcodexiflyinkuploaderMainActivity(View view) {
        this.passwordLoginMode = false;
        updateLoginModeUi();
    }

    /* JADX INFO: renamed from: lambda$buildUi$3$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m7lambda$buildUi$3$comcodexiflyinkuploaderMainActivity(View view) {
        sendSmsCode();
    }

    /* JADX INFO: renamed from: lambda$buildUi$4$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m8lambda$buildUi$4$comcodexiflyinkuploaderMainActivity(View view) {
        if (this.passwordLoginMode) {
            loginByPassword();
        } else {
            loginByCode();
        }
    }

    /* JADX INFO: renamed from: lambda$buildUi$5$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m9lambda$buildUi$5$comcodexiflyinkuploaderMainActivity(View view) {
        switchPage(0);
    }

    /* JADX INFO: renamed from: lambda$buildUi$6$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m10lambda$buildUi$6$comcodexiflyinkuploaderMainActivity(View view) {
        switchPage(1);
    }

    /* JADX INFO: renamed from: lambda$buildUi$7$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m11lambda$buildUi$7$comcodexiflyinkuploaderMainActivity(View view) {
        switchPage(2);
    }

    private void configureSystemBars() {
        int i;
        Window window = getWindow();
        int iRgb = Color.rgb(247, 251, 255);
        window.setStatusBarColor(iRgb);
        window.setNavigationBarColor(iRgb);
        if (Build.VERSION.SDK_INT >= 23) {
            if (Build.VERSION.SDK_INT < 26) {
                i = 8192;
            } else {
                i = 8208;
            }
            window.getDecorView().setSystemUiVisibility(i);
        }
    }

    private int getNavigationBarHeight() {
        int identifier = getResources().getIdentifier("navigation_bar_height", "dimen", "android");
        if (identifier > 0) {
            return getResources().getDimensionPixelSize(identifier);
        }
        return 0;
    }

    private void buildNotePage() {
        this.notePage = new LinearLayout(this);
        this.notePage.setOrientation(1);
        this.pageContainer.addView(this.notePage, new LinearLayout.LayoutParams(-1, -1));
        this.noteStatusText = pageStatus("正在准备笔记页...");
        this.notePage.addView(this.noteStatusText);
        Button button = button("刷新笔记");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda44
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m3lambda$buildNotePage$8$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        this.notePage.addView(button, buttonParams());
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(0);
        this.notePage.addView(linearLayout, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        ScrollView scrollView = new ScrollView(this);
        scrollView.setBackground(rounded(BLUE_LIGHT, BORDER, dp(12)));
        linearLayout.addView(scrollView, new LinearLayout.LayoutParams(dp(116), -1));
        this.noteDirListLayout = new LinearLayout(this);
        this.noteDirListLayout.setOrientation(1);
        this.noteDirListLayout.setPadding(dp(6), dp(6), dp(6), dp(6));
        scrollView.addView(this.noteDirListLayout);
        ScrollView scrollView2 = new ScrollView(this);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -1, 1.0f);
        layoutParams.setMargins(dp(10), 0, 0, 0);
        linearLayout.addView(scrollView2, layoutParams);
        this.noteListLayout = new LinearLayout(this);
        this.noteListLayout.setOrientation(1);
        scrollView2.addView(this.noteListLayout, new FrameLayout.LayoutParams(-1, -2));
    }

    /* JADX INFO: renamed from: lambda$buildNotePage$8$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m3lambda$buildNotePage$8$comcodexiflyinkuploaderMainActivity(View view) {
        loadNotes(true);
    }

    private void buildUploaderPage() {
        this.uploaderPage = new LinearLayout(this);
        this.uploaderPage.setOrientation(1);
        this.pageContainer.addView(this.uploaderPage, new LinearLayout.LayoutParams(-1, -1));
        ScrollView scrollView = new ScrollView(this);
        this.uploaderPage.addView(scrollView, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        scrollView.addView(linearLayout, new FrameLayout.LayoutParams(-1, -2));
        this.statusText = new TextView(this);
        this.statusText.setTextSize(13.0f);
        this.statusText.setTextColor(TEXT_MUTED);
        this.statusText.setPadding(dp(4), dp(8), dp(4), dp(12));
        linearLayout.addView(this.statusText);
        Button button = button("选择文档");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda12
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m13x7e11e31a(view);
            }
        });
        linearLayout.addView(button, buttonParams());
        this.fileText = new TextView(this);
        this.fileText.setText("未选择文件");
        this.fileText.setTextSize(15.0f);
        this.fileText.setTextColor(TEXT_MAIN);
        this.fileText.setTypeface(Typeface.DEFAULT_BOLD);
        this.fileText.setPadding(dp(4), dp(16), dp(4), dp(8));
        linearLayout.addView(this.fileText);
        this.fileListLayout = new LinearLayout(this);
        this.fileListLayout.setOrientation(1);
        linearLayout.addView(this.fileListLayout, new LinearLayout.LayoutParams(-1, -2));
        Button button2 = button("上传到根目录");
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda13
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m12x7088d988(view);
            }
        });
        linearLayout.addView(button2, buttonParams());
        this.progressText = new TextView(this);
        this.progressText.setText("等待上传");
        this.progressText.setTextSize(13.0f);
        this.progressText.setTextColor(TEXT_MUTED);
        this.progressText.setPadding(dp(4), dp(10), dp(4), 0);
        linearLayout.addView(this.progressText);
        this.progressBar = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        this.progressBar.setMax(100);
        linearLayout.addView(this.progressBar, new LinearLayout.LayoutParams(-1, dp(32)));
    }

    /* JADX INFO: renamed from: lambda$buildUploaderPage$9$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m13x7e11e31a(View view) {
        pickFile();
    }

    /* JADX INFO: renamed from: lambda$buildUploaderPage$10$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m12x7088d988(View view) {
        uploadSelectedFiles();
    }

    private void buildCloudPage() {
        this.cloudPage = new LinearLayout(this);
        this.cloudPage.setOrientation(1);
        this.pageContainer.addView(this.cloudPage, new LinearLayout.LayoutParams(-1, -1));
        this.cloudStatusText = pageStatus("正在准备网盘页...");
        this.cloudPage.addView(this.cloudStatusText);
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(0);
        this.cloudPage.addView(linearLayout, new LinearLayout.LayoutParams(-1, dp(42)));
        Button button = button("上一级");
        button.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda40
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m1lambda$buildCloudPage$11$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f);
        layoutParams.setMargins(0, dp(4), dp(8), dp(4));
        linearLayout.addView(button, layoutParams);
        Button button2 = button("刷新");
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda41
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m2lambda$buildCloudPage$12$comcodexiflyinkuploaderMainActivity(view);
            }
        });
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(0, dp(BUTTON_HEIGHT), 1.0f);
        layoutParams2.setMargins(0, dp(4), 0, dp(4));
        linearLayout.addView(button2, layoutParams2);
        this.cloudPathText = new TextView(this);
        this.cloudPathText.setText("当前：全部文件");
        this.cloudPathText.setTextColor(TEXT_MAIN);
        this.cloudPathText.setTypeface(Typeface.DEFAULT_BOLD);
        this.cloudPathText.setTextSize(14.0f);
        this.cloudPathText.setPadding(dp(4), dp(8), dp(4), dp(8));
        this.cloudPage.addView(this.cloudPathText);
        ScrollView scrollView = new ScrollView(this);
        this.cloudPage.addView(scrollView, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        this.cloudListLayout = new LinearLayout(this);
        this.cloudListLayout.setOrientation(1);
        scrollView.addView(this.cloudListLayout, new FrameLayout.LayoutParams(-1, -2));
        this.cloudProgressText = new TextView(this);
        this.cloudProgressText.setText("等待下载");
        this.cloudProgressText.setTextSize(12.0f);
        this.cloudProgressText.setTextColor(TEXT_MUTED);
        this.cloudProgressText.setPadding(dp(4), dp(6), dp(4), 0);
        this.cloudPage.addView(this.cloudProgressText);
        this.cloudProgressBar = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        this.cloudProgressBar.setMax(100);
        this.cloudPage.addView(this.cloudProgressBar, new LinearLayout.LayoutParams(-1, dp(24)));
    }

    /* JADX INFO: renamed from: lambda$buildCloudPage$11$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m1lambda$buildCloudPage$11$comcodexiflyinkuploaderMainActivity(View view) {
        goCloudParent();
    }

    /* JADX INFO: renamed from: lambda$buildCloudPage$12$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m2lambda$buildCloudPage$12$comcodexiflyinkuploaderMainActivity(View view) {
        loadCloud(this.currentCloudDirId, this.currentCloudDirName, false);
    }

    private EditText input(String str) {
        EditText editText = new EditText(this);
        editText.setSingleLine(true);
        editText.setHint(str);
        editText.setTextSize(14.0f);
        editText.setTextColor(TEXT_MAIN);
        editText.setHintTextColor(Color.rgb(145, 164, 184));
        editText.setPadding(dp(12), 0, dp(12), 0);
        editText.setBackground(rounded(-1, BORDER, dp(10)));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, dp(50));
        layoutParams.setMargins(0, dp(6), 0, dp(6));
        editText.setLayoutParams(layoutParams);
        return editText;
    }

    private Button button(String str) {
        Button button = new Button(this);
        button.setText(str);
        button.setAllCaps(false);
        button.setTextSize(13.0f);
        button.setIncludeFontPadding(false);
        button.setSingleLine(false);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setMinWidth(0);
        button.setMinimumWidth(0);
        button.setPadding(dp(8), 0, dp(8), 0);
        button.setGravity(17);
        styleFilled(button);
        return button;
    }

    private Button navButton(String str) {
        Button button = button(str);
        button.setTextSize(14.0f);
        return button;
    }

    private TextView pageStatus(String str) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTextSize(13.0f);
        textView.setTextColor(TEXT_MUTED);
        textView.setPadding(dp(4), dp(8), dp(4), dp(10));
        return textView;
    }

    private LinearLayout.LayoutParams buttonParams() {
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, dp(BUTTON_HEIGHT));
        layoutParams.setMargins(0, dp(6), 0, dp(6));
        return layoutParams;
    }

    private void styleFilled(Button button) {
        button.setTextColor(-1);
        button.setBackground(rounded(BLUE, BLUE, dp(12)));
    }

    private void styleOutlined(Button button) {
        button.setTextColor(BLUE_DARK);
        button.setBackground(rounded(BLUE_LIGHT, BORDER, dp(12)));
    }

    private GradientDrawable rounded(int i, int i2, int i3) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(i);
        gradientDrawable.setCornerRadius(i3);
        gradientDrawable.setStroke(dp(1), i2);
        return gradientDrawable;
    }

    private void updateLoginModeUi() {
        if (this.passwordFields == null || this.codeFields == null) {
            return;
        }
        this.passwordFields.setVisibility(this.passwordLoginMode ? 0 : 8);
        this.codeFields.setVisibility(this.passwordLoginMode ? 8 : 0);
        if (this.passwordLoginMode) {
            styleFilled(this.passwordModeButton);
            styleOutlined(this.codeModeButton);
        } else {
            styleOutlined(this.passwordModeButton);
            styleFilled(this.codeModeButton);
        }
    }

    private void switchPage(int i) {
        this.currentPage = i;
        if (this.notePage == null) {
            return;
        }
        this.notePage.setVisibility(i == 0 ? 0 : 8);
        this.uploaderPage.setVisibility(i == 1 ? 0 : 8);
        this.cloudPage.setVisibility(i == 2 ? 0 : 8);
        styleNav(this.navNoteButton, i == 0);
        styleNav(this.navUploadButton, i == 1);
        styleNav(this.navCloudButton, i == 2);
        if (!this.userId.isEmpty()) {
            if (i == 0 && !this.notesLoaded) {
                loadNotes(false);
            }
            if (i != 2 || this.cloudLoaded) {
                return;
            }
            loadCloud(ROOT_DIR_ID, "全部文件", true);
        }
    }

    private void styleNav(Button button, boolean z) {
        if (button == null) {
            return;
        }
        if (z) {
            styleFilled(button);
        } else {
            styleOutlined(button);
        }
    }

    private int dp(int i) {
        return (int) ((i * getResources().getDisplayMetrics().density) + 0.5f);
    }

    private void loadPrefs() {
        SharedPreferences sharedPreferences = getSharedPreferences(PREF, 0);
        this.phoneEdit.setText(sharedPreferences.getString("phone", ""));
        this.userId = sharedPreferences.getString("userId", "");
        this.auth = sharedPreferences.getString("auth", "");
        this.userToken = sharedPreferences.getString("userToken", "");
        this.refreshToken = sharedPreferences.getString("refreshToken", "");
        this.sn = sharedPreferences.getString("sn", "");
        updateLoginStatus();
    }

    private void saveSession() {
        getSharedPreferences(PREF, 0).edit().putString("phone", this.phoneEdit.getText().toString().trim()).putString("userId", this.userId).putString("auth", this.auth).putString("userToken", this.userToken).putString("refreshToken", this.refreshToken).putString("sn", this.sn).apply();
    }

    private void updateLoginStatus() {
        runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m41x52359fec();
            }
        });
    }

    /* JADX INFO: renamed from: lambda$updateLoginStatus$13$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m41x52359fec() {
        if (this.userId.isEmpty()) {
            this.loginSection.setVisibility(0);
            this.uploadSection.setVisibility(8);
            if (this.headerLogoutButton != null) {
                this.headerLogoutButton.setVisibility(8);
            }
            this.loginMessageText.setText("未登录");
            return;
        }
        this.loginSection.setVisibility(8);
        this.uploadSection.setVisibility(0);
        if (this.headerLogoutButton != null) {
            this.headerLogoutButton.setVisibility(0);
        }
        this.statusText.setText("已登录，可上传 PDF、Word、PPT、EPUB 到根目录");
        if (this.progressText != null) {
            this.progressText.setText("等待上传");
        }
        switchPage(this.currentPage);
    }

    private void confirmLogout() {
        final AlertDialog alertDialogCreate = new AlertDialog.Builder(this).setTitle("注销登录").setMessage("确认退出当前账号吗？").setNegativeButton("取消", (DialogInterface.OnClickListener) null).setPositiveButton("确认注销", new DialogInterface.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda42
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m17lambda$confirmLogout$14$comcodexiflyinkuploaderMainActivity(dialogInterface, i);
            }
        }).create();
        alertDialogCreate.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda43
            @Override // android.content.DialogInterface.OnShowListener
            public final void onShow(DialogInterface dialogInterface) {
                MainActivity.lambda$confirmLogout$15(alertDialogCreate, dialogInterface);
            }
        });
        alertDialogCreate.show();
    }

    /* JADX INFO: renamed from: lambda$confirmLogout$14$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m17lambda$confirmLogout$14$comcodexiflyinkuploaderMainActivity(DialogInterface dialogInterface, int i) {
        logout();
    }

    static /* synthetic */ void lambda$confirmLogout$15(AlertDialog alertDialog, DialogInterface dialogInterface) {
        alertDialog.getButton(-1).setTextColor(BLUE_DARK);
        alertDialog.getButton(-2).setTextColor(TEXT_MUTED);
    }

    private void logout() {
        this.userId = "";
        this.auth = "";
        this.userToken = "";
        this.refreshToken = "";
        this.sn = "";
        this.notesLoaded = false;
        this.cloudLoaded = false;
        this.noteDirs.clear();
        this.allNotes.clear();
        this.cloudItems.clear();
        this.passwordEdit.setText("");
        this.codeEdit.setText("");
        this.selectedFiles.clear();
        this.progressBar.setProgress(0);
        if (this.fileText != null) {
            this.fileText.setText("未选择文件");
        }
        if (this.fileListLayout != null) {
            this.fileListLayout.removeAllViews();
        }
        if (this.progressText != null) {
            this.progressText.setText("等待上传");
        }
        saveSession();
        updateLoginStatus();
    }

    private void sendSmsCode() {
        final String strTrim = this.phoneEdit.getText().toString().trim();
        if (strTrim.isEmpty()) {
            log("请先填写手机号");
        } else {
            saveSession();
            new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda8
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m31lambda$sendSmsCode$16$comcodexiflyinkuploaderMainActivity(strTrim);
                }
            }).start();
        }
    }

    /* JADX INFO: renamed from: lambda$sendSmsCode$16$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m31lambda$sendSmsCode$16$comcodexiflyinkuploaderMainActivity(String str) {
        try {
            log("正在发送验证码...");
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.put("mobile", str);
            ApiResponse apiResponsePostBeforeLogin = postBeforeLogin("http://api.iflyink.com/xbew-api/common/sms/pushLogin", linkedHashMap);
            if (apiResponsePostBeforeLogin.code == 200) {
                log("验证码已发送，请查看短信");
            } else {
                log("发送验证码失败: " + compact(apiResponsePostBeforeLogin.raw));
            }
        } catch (Exception e) {
            log("异常: " + e.getMessage());
        }
    }

    private void loginByPassword() {
        final String strTrim = this.phoneEdit.getText().toString().trim();
        final String string = this.passwordEdit.getText().toString();
        if (strTrim.isEmpty()) {
            log("请先填写手机号");
        } else if (string.isEmpty()) {
            log("请填写密码");
        } else {
            new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda18
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m29lambda$loginByPassword$17$comcodexiflyinkuploaderMainActivity(strTrim, string);
                }
            }).start();
        }
    }

    /* JADX INFO: renamed from: lambda$loginByPassword$17$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m29lambda$loginByPassword$17$comcodexiflyinkuploaderMainActivity(String str, String str2) {
        try {
            log("正在密码登录...");
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.put("account", str);
            linkedHashMap.put("pwd", encryptPassword(str2));
            handleLoginResponse(postBeforeLogin("http://api.iflyink.com/xbew-api/user/dxkLogin", linkedHashMap));
        } catch (Exception e) {
            log("异常: " + e.getMessage());
        }
    }

    private void loginByCode() {
        final String strTrim = this.phoneEdit.getText().toString().trim();
        final String strTrim2 = this.codeEdit.getText().toString().trim();
        if (strTrim.isEmpty()) {
            log("请先填写手机号");
        } else if (strTrim2.isEmpty()) {
            log("请填写短信验证码");
        } else {
            new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m28lambda$loginByCode$18$comcodexiflyinkuploaderMainActivity(strTrim, strTrim2);
                }
            }).start();
        }
    }

    /* JADX INFO: renamed from: lambda$loginByCode$18$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m28lambda$loginByCode$18$comcodexiflyinkuploaderMainActivity(String str, String str2) {
        try {
            log("正在验证码登录...");
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.put("account", str);
            linkedHashMap.put("code", str2);
            handleLoginResponse(postBeforeLogin("http://api.iflyink.com/xbew-api/user/codeLogin", linkedHashMap));
        } catch (Exception e) {
            log("异常: " + e.getMessage());
        }
    }

    private void handleLoginResponse(ApiResponse apiResponse) throws Exception {
        if (apiResponse.code != 200) {
            log("登录失败: " + compact(apiResponse.raw));
            return;
        }
        JSONObject jSONObject = new JSONObject(apiResponse.raw);
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("data");
        JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject == null ? null : jSONObjectOptJSONObject.optJSONObject("detail");
        if (jSONObjectOptJSONObject2 != null) {
            jSONObjectOptJSONObject = jSONObjectOptJSONObject2;
        }
        if (jSONObjectOptJSONObject != null) {
            jSONObject = jSONObjectOptJSONObject;
        }
        String strFirstNonEmpty = firstNonEmpty(jSONObject.optString("userId", ""), jSONObject.optString("id", ""), extractString(apiResponse.raw, "userId"));
        String strFirstNonEmpty2 = firstNonEmpty(jSONObject.optString("userToken", ""), extractString(apiResponse.raw, "userToken"));
        String strFirstNonEmpty3 = firstNonEmpty(jSONObject.optString("refreshToken", ""), extractString(apiResponse.raw, "refreshToken"));
        String strFirstNonEmpty4 = firstNonEmpty(jSONObject.optString("sn", ""), extractString(apiResponse.raw, "sn"));
        if (strFirstNonEmpty.isEmpty() || strFirstNonEmpty2.isEmpty()) {
            log("登录失败: 返回缺少 userId 或 userToken");
            return;
        }
        this.userId = strFirstNonEmpty;
        this.userToken = strFirstNonEmpty2;
        this.refreshToken = strFirstNonEmpty3;
        this.sn = strFirstNonEmpty4;
        refreshAccessToken();
        saveSession();
        updateLoginStatus();
        log("登录成功，userId=" + this.userId);
    }

    private void pickFile() {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
        intent.addCategory("android.intent.category.OPENABLE");
        intent.setType("*/*");
        intent.putExtra("android.intent.extra.ALLOW_MULTIPLE", true);
        intent.putExtra("android.intent.extra.MIME_TYPES", new String[]{"application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation", "application/epub+zip"});
        startActivityForResult(intent, PICK_FILE);
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == PICK_FILE && i2 == -1 && intent != null) {
            this.selectedFiles.clear();
            ClipData clipData = intent.getClipData();
            int i3 = 0;
            if (clipData != null) {
                int i4 = 0;
                while (i3 < clipData.getItemCount()) {
                    if (addSelectedUri(clipData.getItemAt(i3).getUri(), intent)) {
                        i4++;
                    }
                    i3++;
                }
                i3 = i4;
            } else if (intent.getData() != null && addSelectedUri(intent.getData(), intent)) {
                i3 = 1;
            }
            updateSelectedFileText(i3);
        }
    }

    private boolean addSelectedUri(Uri uri, Intent intent) throws IllegalAccessException, InvocationTargetException {
        if (uri == null) {
            return false;
        }
        String strQueryName = queryName(uri);
        if (!isAllowedDocument(strQueryName)) {
            return true;
        }
        try {
            getContentResolver().takePersistableUriPermission(uri, intent.getFlags() & 1);
        } catch (Exception e) {
        }
        this.selectedFiles.add(new SelectedFile(uri, strQueryName, querySize(uri)));
        return false;
    }

    private void updateSelectedFileText(int i) {
        String str;
        this.fileListLayout.removeAllViews();
        if (this.selectedFiles.isEmpty()) {
            this.fileText.setText("未选择支持的文档（PDF/Word/PPT/EPUB）");
            TextView textView = this.statusText;
            if (i > 0) {
                str = "已忽略不支持的文件";
            } else {
                str = "请选择 PDF、Word、PPT、EPUB 文档";
            }
            textView.setText(str);
            this.progressText.setText("等待上传");
            return;
        }
        String str2 = "已选择 " + this.selectedFiles.size() + " 个文档";
        if (i > 0) {
            str2 = str2 + "，已忽略 " + i + " 个不支持文件";
        }
        this.fileText.setText(str2);
        int i2 = 0;
        while (i2 < this.selectedFiles.size()) {
            int i3 = i2 + 1;
            this.fileListLayout.addView(fileRow(i3, this.selectedFiles.get(i2)));
            i2 = i3;
        }
        this.statusText.setText("文档将上传到根目录");
        this.progressText.setText("尚未开始上传");
        this.progressBar.setProgress(0);
    }

    private View fileRow(int i, SelectedFile selectedFile) {
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        linearLayout.setPadding(dp(12), dp(10), dp(12), dp(10));
        linearLayout.setBackground(rounded(-1, BORDER, dp(12)));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, dp(5), 0, dp(5));
        linearLayout.setLayoutParams(layoutParams);
        TextView textView = new TextView(this);
        textView.setText(String.valueOf(i));
        textView.setGravity(17);
        textView.setTextColor(-1);
        textView.setTextSize(13.0f);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setBackground(rounded(BLUE, BLUE, dp(15)));
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(dp(30), dp(30));
        layoutParams2.setMargins(0, 0, dp(10), 0);
        linearLayout.addView(textView, layoutParams2);
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setOrientation(1);
        linearLayout.addView(linearLayout2, new LinearLayout.LayoutParams(0, -2, 1.0f));
        TextView textView2 = new TextView(this);
        textView2.setText(selectedFile.name);
        textView2.setTextColor(TEXT_MAIN);
        textView2.setTextSize(14.0f);
        textView2.setSingleLine(false);
        linearLayout2.addView(textView2);
        TextView textView3 = new TextView(this);
        textView3.setText(extension(selectedFile.name).replace(".", "").toUpperCase(Locale.ROOT) + "  " + formatBytes(selectedFile.size));
        textView3.setTextColor(TEXT_MUTED);
        textView3.setTextSize(12.0f);
        linearLayout2.addView(textView3);
        return linearLayout;
    }

    private String formatBytes(long j) {
        if (j <= 0) {
            return "未知大小";
        }
        if (j < 1024) {
            return j + " B";
        }
        double d = j;
        Double.isNaN(d);
        double d2 = d / 1024.0d;
        if (d2 < 1024.0d) {
            return String.format(Locale.ROOT, "%.1f KB", Double.valueOf(d2));
        }
        double d3 = d2 / 1024.0d;
        return d3 < 1024.0d ? String.format(Locale.ROOT, "%.1f MB", Double.valueOf(d3)) : String.format(Locale.ROOT, "%.1f GB", Double.valueOf(d3 / 1024.0d));
    }

    private void loadNotes(boolean z) {
        if (this.userId.isEmpty()) {
            return;
        }
        if (this.notesLoaded && !z) {
            renderNoteDirs();
            renderNotesForDir(this.selectedNoteDirId);
        } else {
            this.noteStatusText.setText("正在加载笔记...");
            new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda35
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m26lambda$loadNotes$21$comcodexiflyinkuploaderMainActivity();
                }
            }).start();
        }
    }

    /* JADX INFO: renamed from: lambda$loadNotes$21$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m26lambda$loadNotes$21$comcodexiflyinkuploaderMainActivity() {
        try {
            if (this.auth.isEmpty()) {
                refreshAccessToken();
            }
            final List<JSONObject> listFetchNoteDirs = fetchNoteDirs();
            final List<JSONObject> listFetchAllNotes = fetchAllNotes();
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda20
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m24lambda$loadNotes$19$comcodexiflyinkuploaderMainActivity(listFetchNoteDirs, listFetchAllNotes);
                }
            });
        } catch (Exception e) {
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda21
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m25lambda$loadNotes$20$comcodexiflyinkuploaderMainActivity(e);
                }
            });
        }
    }

    /* JADX INFO: renamed from: lambda$loadNotes$19$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m24lambda$loadNotes$19$comcodexiflyinkuploaderMainActivity(List list, List list2) {
        this.noteDirs.clear();
        this.noteDirs.addAll(list);
        this.allNotes.clear();
        this.allNotes.addAll(list2);
        this.notesLoaded = true;
        this.selectedNoteDirId = ROOT_DIR_ID;
        this.expandedNoteDirIds.clear();
        this.expandedNoteDirIds.add(ROOT_DIR_ID);
        this.noteStatusText.setText("已加载 " + this.allNotes.size() + " 条笔记");
        renderNoteDirs();
        renderNotesForDir(this.selectedNoteDirId);
    }

    /* JADX INFO: renamed from: lambda$loadNotes$20$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m25lambda$loadNotes$20$comcodexiflyinkuploaderMainActivity(Exception exc) {
        this.noteStatusText.setText("笔记加载失败: " + exc.getMessage());
    }

    private List<JSONObject> fetchNoteDirs() throws Exception {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("userId", this.userId);
        ApiResponse apiResponsePostWithSession = postWithSession("http://api.iflyink.com/xbew-api/note/dir/getListAllByUserIdPc", linkedHashMap);
        ArrayList arrayList = new ArrayList();
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("dirId", ROOT_DIR_ID);
        jSONObject.put("dirName", "全部");
        jSONObject.put("level", 0);
        arrayList.add(jSONObject);
        if (apiResponsePostWithSession.code == 200) {
            arrayList.addAll(extractObjectList(apiResponsePostWithSession.raw));
        }
        return arrayList;
    }

    private List<JSONObject> fetchAllNotes() throws Exception {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("userId", this.userId);
        linkedHashMap.put("syntime", ROOT_DIR_ID);
        linkedHashMap.put("supportType", "1,2,10,21,20");
        ApiResponse apiResponsePostWithSession = postWithSession("http://api.iflyink.com/xbew-api/note/dxk/getAllNotePages", linkedHashMap);
        int iMax = apiResponsePostWithSession.code == 200 ? Math.max(1, extractInt(apiResponsePostWithSession.raw, "pages", 1)) : 1;
        ArrayList arrayList = new ArrayList();
        for (int i = 1; i <= iMax && i <= 20; i++) {
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            linkedHashMap2.put("userId", this.userId);
            linkedHashMap2.put("page", String.valueOf(i));
            linkedHashMap2.put("sn", this.sn);
            linkedHashMap2.put("syntime", ROOT_DIR_ID);
            linkedHashMap2.put("supportType", "1,2,10,21,20");
            ApiResponse apiResponsePostWithSession2 = postWithSession("http://api.iflyink.com/xbew-api/note/dxk/getAllNoteByPage", linkedHashMap2);
            if (apiResponsePostWithSession2.code == 200) {
                arrayList.addAll(extractObjectList(apiResponsePostWithSession2.raw));
            }
        }
        return arrayList;
    }

    private void renderNoteDirs() {
        this.noteDirListLayout.removeAllViews();
        renderNoteDirChildren(ROOT_DIR_ID, 0);
        for (JSONObject jSONObject : this.noteDirs) {
            String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "dirId", "id", "localId"), ROOT_DIR_ID);
            String strFirstNonEmpty2 = firstNonEmpty(objString(jSONObject, "parentId", "pid", "pId", "parentDirId"), ROOT_DIR_ID);
            if (!ROOT_DIR_ID.equals(strFirstNonEmpty) && ROOT_DIR_ID.equals(strFirstNonEmpty2) && !hasRenderedDir(strFirstNonEmpty)) {
                addNoteDirRow(jSONObject, 0);
                renderNoteDirChildren(strFirstNonEmpty, 1);
            }
        }
    }

    private void renderNoteDirChildren(String str, int i) {
        for (JSONObject jSONObject : this.noteDirs) {
            String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "dirId", "id", "localId"), ROOT_DIR_ID);
            if (ROOT_DIR_ID.equals(strFirstNonEmpty)) {
                if (ROOT_DIR_ID.equals(str) && i == 0) {
                    addNoteDirRow(jSONObject, 0);
                }
            } else if (str.equals(firstNonEmpty(objString(jSONObject, "parentId", "pid", "pId", "parentDirId"), ROOT_DIR_ID)) && !hasRenderedDir(strFirstNonEmpty)) {
                addNoteDirRow(jSONObject, i);
                if (this.expandedNoteDirIds.contains(strFirstNonEmpty)) {
                    renderNoteDirChildren(strFirstNonEmpty, i + 1);
                }
            }
        }
    }

    private boolean hasRenderedDir(String str) {
        for (int i = 0; i < this.noteDirListLayout.getChildCount(); i++) {
            if (str.equals(this.noteDirListLayout.getChildAt(i).getTag())) {
                return true;
            }
        }
        return false;
    }

    private void addNoteDirRow(JSONObject jSONObject, int i) {
        String str;
        final String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "dirId", "id", "localId"), ROOT_DIR_ID);
        String strFirstNonEmpty2 = firstNonEmpty(objString(jSONObject, "dirName", "name"), "未命名");
        boolean zEquals = strFirstNonEmpty.equals(this.selectedNoteDirId);
        final boolean zHasNoteDirChildren = hasNoteDirChildren(strFirstNonEmpty);
        boolean zContains = this.expandedNoteDirIds.contains(strFirstNonEmpty);
        TextView textView = new TextView(this);
        textView.setTag(strFirstNonEmpty);
        if (zHasNoteDirChildren) {
            str = zContains ? "▾ " : "▸ ";
        } else {
            str = "  ";
        }
        textView.setText(repeat("  ", Math.max(0, i)) + str + strFirstNonEmpty2);
        textView.setTextSize(12.0f);
        textView.setTextColor(zEquals ? BLUE_DARK : TEXT_MAIN);
        textView.setTypeface(zEquals ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
        textView.setPadding(dp(8), dp(8), dp(8), dp(8));
        textView.setBackground(rounded(zEquals ? -1 : BLUE_LIGHT, BORDER, dp(10)));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, dp(3), 0, dp(3));
        textView.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda46
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m0lambda$addNoteDirRow$22$comcodexiflyinkuploaderMainActivity(strFirstNonEmpty, zHasNoteDirChildren, view);
            }
        });
        this.noteDirListLayout.addView(textView, layoutParams);
    }

    /* JADX INFO: renamed from: lambda$addNoteDirRow$22$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m0lambda$addNoteDirRow$22$comcodexiflyinkuploaderMainActivity(String str, boolean z, View view) {
        this.selectedNoteDirId = str;
        if (z) {
            if (this.expandedNoteDirIds.contains(str)) {
                if (!ROOT_DIR_ID.equals(str)) {
                    this.expandedNoteDirIds.remove(str);
                }
            } else {
                this.expandedNoteDirIds.add(str);
            }
        }
        renderNoteDirs();
        renderNotesForDir(str);
    }

    private boolean hasNoteDirChildren(String str) {
        for (JSONObject jSONObject : this.noteDirs) {
            String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "parentId", "pid", "pId", "parentDirId"), ROOT_DIR_ID);
            if (!ROOT_DIR_ID.equals(firstNonEmpty(objString(jSONObject, "dirId", "id", "localId"), ROOT_DIR_ID)) && str.equals(strFirstNonEmpty)) {
                return true;
            }
        }
        return false;
    }

    private void renderNotesForDir(String str) {
        this.noteListLayout.removeAllViews();
        int i = 0;
        for (JSONObject jSONObject : this.allNotes) {
            String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "dir", "dirId"), ROOT_DIR_ID);
            if (ROOT_DIR_ID.equals(str) || str.equals(strFirstNonEmpty)) {
                this.noteListLayout.addView(noteRow(jSONObject));
                i++;
            }
        }
        if (i == 0) {
            this.noteListLayout.addView(emptyRow("这个文件夹暂无笔记"));
        }
        this.noteStatusText.setText("当前显示 " + i + " 条笔记");
    }

    private View noteRow(final JSONObject jSONObject) {
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(dp(12), dp(10), dp(12), dp(10));
        linearLayout.setBackground(rounded(-1, BORDER, dp(12)));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, dp(5), 0, dp(5));
        linearLayout.setLayoutParams(layoutParams);
        TextView textView = new TextView(this);
        textView.setText(noteTitle(jSONObject, "无标题"));
        textView.setTextColor(TEXT_MAIN);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setTextSize(15.0f);
        linearLayout.addView(textView);
        TextView textView2 = new TextView(this);
        textView2.setText(noteTypeName(objString(jSONObject, "type")) + "  " + firstNonEmpty(objString(jSONObject, "summary", "noteSummary", "contentText"), "点击查看详情"));
        textView2.setTextColor(TEXT_MUTED);
        textView2.setTextSize(12.0f);
        textView2.setPadding(0, dp(4), 0, 0);
        linearLayout.addView(textView2);
        linearLayout.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda10
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m30lambda$noteRow$23$comcodexiflyinkuploaderMainActivity(jSONObject, view);
            }
        });
        return linearLayout;
    }

    /* JADX INFO: renamed from: lambda$noteRow$23$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m30lambda$noteRow$23$comcodexiflyinkuploaderMainActivity(JSONObject jSONObject, View view) {
        showNoteDetail(jSONObject);
    }

    private void showNoteDetail(JSONObject jSONObject) {
        final String strObjString = objString(jSONObject, "noteId", "id");
        final String strNoteTitle = noteTitle(jSONObject, "笔记详情");
        if (strObjString.isEmpty()) {
            showRichNoteDialog(strNoteTitle, "<pre>" + escapeHtml(jSONObject.toString()) + "</pre>");
        } else {
            this.noteStatusText.setText("正在加载笔记详情...");
            new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda11
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m34lambda$showNoteDetail$26$comcodexiflyinkuploaderMainActivity(strObjString, strNoteTitle);
                }
            }).start();
        }
    }

    /* JADX INFO: renamed from: lambda$showNoteDetail$26$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m34lambda$showNoteDetail$26$comcodexiflyinkuploaderMainActivity(String str, final String str2) {
        try {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.put("id", str);
            ApiResponse apiResponsePostWithSession = postWithSession("http://api.iflyink.com/xbew-api/note/dxk/getNoteDetail", linkedHashMap);
            if (apiResponsePostWithSession.code == 200) {
                str2 = noteDetailTitle(apiResponsePostWithSession.raw, str2);
            }
            final String strNoteHtml = apiResponsePostWithSession.code == 200 ? noteHtml(apiResponsePostWithSession.raw) : "<pre>" + escapeHtml(compact(apiResponsePostWithSession.raw)) + "</pre>";
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda38
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m32lambda$showNoteDetail$24$comcodexiflyinkuploaderMainActivity(str2, strNoteHtml);
                }
            });
        } catch (Exception e) {
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda39
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m33lambda$showNoteDetail$25$comcodexiflyinkuploaderMainActivity(e);
                }
            });
        }
    }

    /* JADX INFO: renamed from: lambda$showNoteDetail$24$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m32lambda$showNoteDetail$24$comcodexiflyinkuploaderMainActivity(String str, String str2) {
        this.noteStatusText.setText("已打开：" + str);
        showRichNoteDialog(str, str2);
    }

    /* JADX INFO: renamed from: lambda$showNoteDetail$25$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m33lambda$showNoteDetail$25$comcodexiflyinkuploaderMainActivity(Exception exc) {
        this.noteStatusText.setText("笔记详情加载失败: " + exc.getMessage());
    }

    private String noteHtml(String str) {
        try {
            JSONObject jSONObjectOptJSONObject = new JSONObject(str).optJSONObject("data");
            if (jSONObjectOptJSONObject == null) {
                return "<pre>" + escapeHtml(compact(str)) + "</pre>";
            }
            JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject("note");
            if (jSONObjectOptJSONObject2 == null) {
                jSONObjectOptJSONObject2 = jSONObjectOptJSONObject;
            }
            String strFirstNonEmpty = firstNonEmpty(jSONObjectOptJSONObject2.optString("html", ""), jSONObjectOptJSONObject2.optString("contentText", ""), jSONObjectOptJSONObject2.optString("content", "").startsWith("<") ? jSONObjectOptJSONObject2.optString("content", "") : "", jSONObjectOptJSONObject.optString("html", ""), jSONObjectOptJSONObject.optString("contentText", ""), richTextFromJson(jSONObjectOptJSONObject2), richTextFromJson(jSONObjectOptJSONObject));
            return !strFirstNonEmpty.isEmpty() ? normalizeHtml(strFirstNonEmpty) : "<pre>" + escapeHtml(jSONObjectOptJSONObject.toString(2)) + "</pre>";
        } catch (Exception e) {
            return "<pre>" + escapeHtml(compact(str)) + "</pre>";
        }
    }

    private String noteDetailTitle(String str, String str2) {
        try {
            JSONObject jSONObjectOptJSONObject = new JSONObject(str).optJSONObject("data");
            if (jSONObjectOptJSONObject == null) {
                return str2;
            }
            JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject("prop");
            if (jSONObjectOptJSONObject2 != null) {
                String strNoteTitle = noteTitle(jSONObjectOptJSONObject2, "");
                if (!strNoteTitle.isEmpty()) {
                    return strNoteTitle;
                }
            }
            return noteTitle(jSONObjectOptJSONObject, str2);
        } catch (Exception e) {
            return str2;
        }
    }

    private String noteTitle(JSONObject jSONObject, String str) {
        return firstNonEmpty(objString(jSONObject, "noteName", "name", "title", "fileName", "docName", "subject", "summaryTitle"), str);
    }

    private String richTextFromJson(JSONObject jSONObject) {
        StringBuilder sb = new StringBuilder();
        collectRichText(jSONObject, sb);
        return sb.toString();
    }

    private void collectRichText(Object obj, StringBuilder sb) {
        if (obj instanceof JSONObject) {
            JSONObject jSONObject = (JSONObject) obj;
            String strFirstNonEmpty = firstNonEmpty(jSONObject.optString("html", ""), jSONObject.optString("contentText", ""), jSONObject.optString("text", ""), jSONObject.optString("content", ""));
            if (!strFirstNonEmpty.isEmpty() && !looksLikeJson(strFirstNonEmpty)) {
                sb.append(htmlFragment(strFirstNonEmpty)).append("<hr/>");
            }
            appendImageIfPresent(jSONObject, sb);
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("pages");
            if (jSONArrayOptJSONArray != null) {
                collectRichText(jSONArrayOptJSONArray, sb);
            }
            JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray("blocks");
            if (jSONArrayOptJSONArray2 != null) {
                collectRichText(jSONArrayOptJSONArray2, sb);
            }
            JSONArray jSONArrayOptJSONArray3 = jSONObject.optJSONArray("children");
            if (jSONArrayOptJSONArray3 != null) {
                collectRichText(jSONArrayOptJSONArray3, sb);
            }
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("content");
            if (jSONObjectOptJSONObject != null) {
                collectRichText(jSONObjectOptJSONObject, sb);
            }
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("src");
            if (jSONObjectOptJSONObject2 != null) {
                appendImageIfPresent(jSONObjectOptJSONObject2, sb);
            }
            JSONObject jSONObjectOptJSONObject3 = jSONObject.optJSONObject("paramsJSON");
            if (jSONObjectOptJSONObject3 != null) {
                collectRichText(jSONObjectOptJSONObject3, sb);
                return;
            }
            return;
        }
        if (obj instanceof JSONArray) {
            JSONArray jSONArray = (JSONArray) obj;
            for (int i = 0; i < jSONArray.length(); i++) {
                collectRichText(jSONArray.opt(i), sb);
            }
        }
    }

    private boolean looksLikeJson(String str) {
        String strTrim = str == null ? "" : str.trim();
        return strTrim.startsWith("{") || strTrim.startsWith("[");
    }

    private String htmlFragment(String str) {
        return str == null ? "" : str.contains("<") ? str : "<p>" + escapeHtml(str).replace("\n", "<br/>") + "</p>";
    }

    private void appendImageIfPresent(JSONObject jSONObject, StringBuilder sb) {
        String strFirstNonEmpty = firstNonEmpty(jSONObject.optString("image", ""), jSONObject.optString("imagePath", ""), jSONObject.optString("url", ""), jSONObject.optString("src", ""), jSONObject.optString("thumbnail", ""), jSONObject.optString("thumbnailUrl", ""), jSONObject.optString("objectName", ""), jSONObject.optString("image.png", ""), jSONObject.optString("thumbnail.jpeg", ""));
        if (strFirstNonEmpty.isEmpty()) {
            return;
        }
        if (strFirstNonEmpty.startsWith("http://") || strFirstNonEmpty.startsWith("https://") || strFirstNonEmpty.startsWith("data:")) {
            sb.append("<p><img src='").append(escapeHtml(strFirstNonEmpty)).append("'/></p>");
        } else if (strFirstNonEmpty.toLowerCase(Locale.ROOT).endsWith(".png") || strFirstNonEmpty.toLowerCase(Locale.ROOT).endsWith(".jpg") || strFirstNonEmpty.toLowerCase(Locale.ROOT).endsWith(".jpeg") || strFirstNonEmpty.toLowerCase(Locale.ROOT).endsWith(".webp")) {
            sb.append("<p style='color:#697c91'>[图片附件] ").append(escapeHtml(strFirstNonEmpty)).append("</p>");
        }
    }

    private String normalizeHtml(String str) {
        if (str == null) {
            str = "";
        }
        if (!str.contains("<")) {
            str = escapeHtml(str).replace("\n", "<br/>");
        }
        return "<html><head><meta name='viewport' content='width=device-width,initial-scale=1'/><style>body{font-family:sans-serif;color:#202d3d;line-height:1.65;padding:12px;font-size:15px;}img{max-width:100%;height:auto;}table{max-width:100%;border-collapse:collapse;}td,th{border:1px solid #d7eafa;padding:4px;}pre{white-space:pre-wrap;word-break:break-word;}</style></head><body>" + str + "</body></html>";
    }

    private void showRichNoteDialog(String str, String str2) {
        WebView webView = new WebView(this);
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(false);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);
        webView.loadDataWithBaseURL(null, str2, "text/html", "UTF-8", null);
        new AlertDialog.Builder(this).setTitle(str).setView(webView).setPositiveButton("关闭", (DialogInterface.OnClickListener) null).show();
    }

    private void loadCloud(String str, String str2, boolean z) {
        if (this.userId.isEmpty()) {
            return;
        }
        this.cloudStatusText.setText("正在加载网盘...");
        this.currentCloudDirId = firstNonEmpty(str, ROOT_DIR_ID);
        this.currentCloudDirName = firstNonEmpty(str2, "全部文件");
        this.cloudPathText.setText("当前：" + this.currentCloudDirName);
        if (z) {
            this.cloudDirStack.clear();
            this.cloudNameStack.clear();
        }
        new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda19
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m23lambda$loadCloud$29$comcodexiflyinkuploaderMainActivity();
            }
        }).start();
    }

    /* JADX INFO: renamed from: lambda$loadCloud$29$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m23lambda$loadCloud$29$comcodexiflyinkuploaderMainActivity() {
        try {
            if (this.auth.isEmpty()) {
                refreshAccessToken();
            }
            final List<JSONObject> listFetchCloudItems = fetchCloudItems(this.currentCloudDirId);
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda36
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m21lambda$loadCloud$27$comcodexiflyinkuploaderMainActivity(listFetchCloudItems);
                }
            });
        } catch (Exception e) {
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda37
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m22lambda$loadCloud$28$comcodexiflyinkuploaderMainActivity(e);
                }
            });
        }
    }

    /* JADX INFO: renamed from: lambda$loadCloud$27$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m21lambda$loadCloud$27$comcodexiflyinkuploaderMainActivity(List list) {
        this.cloudItems.clear();
        this.cloudItems.addAll(list);
        this.cloudLoaded = true;
        renderCloudItems();
        this.cloudStatusText.setText("已加载 " + this.cloudItems.size() + " 项");
    }

    /* JADX INFO: renamed from: lambda$loadCloud$28$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m22lambda$loadCloud$28$comcodexiflyinkuploaderMainActivity(Exception exc) {
        this.cloudStatusText.setText("网盘加载失败: " + exc.getMessage());
    }

    private List<JSONObject> fetchCloudItems(String str) throws Exception {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("userId", this.userId);
        linkedHashMap.put("page", ROOT_DIR_ID);
        linkedHashMap.put("limit", "10000");
        linkedHashMap.put("type", "");
        linkedHashMap.put("dirId", str);
        linkedHashMap.put("name", "");
        linkedHashMap.put("sortField", "updateTime");
        linkedHashMap.put("sortType", "descending");
        ApiResponse apiResponsePostWithSession = postWithSession("http://api.iflyink.com/xbew-api/note/doc/getCloudFileList", linkedHashMap);
        if (apiResponsePostWithSession.code != 200) {
            throw new IllegalStateException(compact(apiResponsePostWithSession.raw));
        }
        return extractObjectList(apiResponsePostWithSession.raw);
    }

    private void renderCloudItems() {
        this.cloudListLayout.removeAllViews();
        if (this.cloudItems.isEmpty()) {
            this.cloudListLayout.addView(emptyRow("当前目录暂无文件"));
            return;
        }
        Iterator<JSONObject> it = this.cloudItems.iterator();
        while (it.hasNext()) {
            this.cloudListLayout.addView(cloudRow(it.next()));
        }
    }

    private View cloudRow(final JSONObject jSONObject) {
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        linearLayout.setPadding(dp(12), dp(10), dp(12), dp(10));
        linearLayout.setBackground(rounded(-1, BORDER, dp(12)));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, dp(5), 0, dp(5));
        linearLayout.setLayoutParams(layoutParams);
        boolean zIsCloudDir = isCloudDir(jSONObject);
        int iFileTypeColor = fileTypeColor(jSONObject);
        TextView textView = new TextView(this);
        textView.setText(zIsCloudDir ? "目录" : fileExtLabel(jSONObject));
        textView.setGravity(17);
        textView.setTextSize(12.0f);
        textView.setTextColor(zIsCloudDir ? BLUE_DARK : -1);
        int i = zIsCloudDir ? BLUE_LIGHT : iFileTypeColor;
        if (zIsCloudDir) {
            iFileTypeColor = BORDER;
        }
        textView.setBackground(rounded(i, iFileTypeColor, dp(10)));
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(dp(54), dp(38));
        layoutParams2.setMargins(0, 0, dp(10), 0);
        linearLayout.addView(textView, layoutParams2);
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setOrientation(1);
        linearLayout.addView(linearLayout2, new LinearLayout.LayoutParams(0, -2, 1.0f));
        TextView textView2 = new TextView(this);
        textView2.setText(cloudName(jSONObject));
        textView2.setTextColor(TEXT_MAIN);
        textView2.setTypeface(Typeface.DEFAULT_BOLD);
        textView2.setTextSize(14.0f);
        linearLayout2.addView(textView2);
        TextView textView3 = new TextView(this);
        textView3.setText(zIsCloudDir ? "文件夹" : formatBytes(jSONObject.optLong("fileSize", jSONObject.optLong("docSize", jSONObject.optLong("size", 0L)))));
        textView3.setTextColor(TEXT_MUTED);
        textView3.setTextSize(12.0f);
        linearLayout2.addView(textView3);
        if (zIsCloudDir) {
            linearLayout.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda16
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.f$0.m14lambda$cloudRow$30$comcodexiflyinkuploaderMainActivity(jSONObject, view);
                }
            });
        } else {
            Button button = button("下载");
            button.setTextSize(13.0f);
            button.setOnClickListener(new View.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda17
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.f$0.m15lambda$cloudRow$31$comcodexiflyinkuploaderMainActivity(jSONObject, view);
                }
            });
            linearLayout.addView(button, new LinearLayout.LayoutParams(dp(70), dp(BUTTON_HEIGHT)));
        }
        return linearLayout;
    }

    /* JADX INFO: renamed from: lambda$cloudRow$30$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m14lambda$cloudRow$30$comcodexiflyinkuploaderMainActivity(JSONObject jSONObject, View view) {
        openCloudDir(jSONObject);
    }

    /* JADX INFO: renamed from: lambda$cloudRow$31$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m15lambda$cloudRow$31$comcodexiflyinkuploaderMainActivity(JSONObject jSONObject, View view) {
        confirmDownload(jSONObject);
    }

    private void openCloudDir(JSONObject jSONObject) {
        this.cloudDirStack.add(this.currentCloudDirId);
        this.cloudNameStack.add(this.currentCloudDirName);
        loadCloud(firstNonEmpty(objString(jSONObject, "dirId", "fileId", "id"), ROOT_DIR_ID), cloudName(jSONObject), false);
    }

    private void goCloudParent() {
        if (this.cloudDirStack.isEmpty()) {
            this.cloudStatusText.setText("已在根目录");
        } else {
            loadCloud(this.cloudDirStack.remove(this.cloudDirStack.size() - 1), this.cloudNameStack.remove(this.cloudNameStack.size() - 1), false);
        }
    }

    private void confirmDownload(final JSONObject jSONObject) {
        new AlertDialog.Builder(this).setTitle("下载文件").setMessage("将文件下载到手机 Download 目录：\n" + cloudName(jSONObject)).setNegativeButton("取消", (DialogInterface.OnClickListener) null).setPositiveButton("确认下载", new DialogInterface.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda7
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.m16lambda$confirmDownload$32$comcodexiflyinkuploaderMainActivity(jSONObject, dialogInterface, i);
            }
        }).show();
    }

    /* JADX INFO: renamed from: lambda$confirmDownload$32$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m16lambda$confirmDownload$32$comcodexiflyinkuploaderMainActivity(JSONObject jSONObject, DialogInterface dialogInterface, int i) {
        downloadCloudFile(jSONObject);
    }

    private void downloadCloudFile(final JSONObject jSONObject) {
        this.cloudStatusText.setText("正在获取下载链接...");
        new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda48
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m20xb438a863(jSONObject);
            }
        }).start();
    }

    /* JADX INFO: renamed from: lambda$downloadCloudFile$35$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m20xb438a863(final JSONObject jSONObject) {
        try {
            String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "url", "objectName", "filePath"), "");
            if (strFirstNonEmpty.startsWith("attachment/")) {
                strFirstNonEmpty = strFirstNonEmpty.substring("attachment/".length());
            }
            if (strFirstNonEmpty.isEmpty()) {
                throw new IllegalStateException("文件 objectName 为空");
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.put("userId", this.userId);
            linkedHashMap.put("dir", "attachment");
            linkedHashMap.put("objectName", strFirstNonEmpty);
            linkedHashMap.put("expiration", "86400");
            linkedHashMap.put("increment", ROOT_DIR_ID);
            ApiResponse apiResponsePostWithSession = postWithSession("http://api.iflyink.com/xbew-api/common/common/getDownloadUrl", linkedHashMap);
            if (apiResponsePostWithSession.code != 200) {
                throw new IllegalStateException(compact(apiResponsePostWithSession.raw));
            }
            final String strExtractDownloadUrl = extractDownloadUrl(apiResponsePostWithSession.raw);
            if (strExtractDownloadUrl.isEmpty()) {
                throw new IllegalStateException("下载链接为空");
            }
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda30
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m18x5fcc6a5(strExtractDownloadUrl, jSONObject);
                }
            });
        } catch (Exception e) {
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda31
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m19x5d1ab784(e);
                }
            });
        }
    }

    /* JADX INFO: renamed from: lambda$downloadCloudFile$33$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m18x5fcc6a5(String str, JSONObject jSONObject) {
        startDirectDownload(str, cloudName(jSONObject));
    }

    /* JADX INFO: renamed from: lambda$downloadCloudFile$34$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m19x5d1ab784(Exception exc) {
        this.cloudStatusText.setText("下载失败: " + exc.getMessage());
    }

    private void startDirectDownload(final String str, final String str2) {
        this.cloudProgressBar.setProgress(0);
        this.cloudProgressText.setText("开始下载：" + str2);
        new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda15
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m38xff1310aa(str2, str);
            }
        }).start();
    }

    /* JADX INFO: renamed from: lambda$startDirectDownload$38$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m38xff1310aa(String str, String str2) {
        try {
            File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (!externalStoragePublicDirectory.exists()) {
                externalStoragePublicDirectory.mkdirs();
            }
            final File fileUniqueFile = uniqueFile(externalStoragePublicDirectory, safeFileName(str));
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str2).openConnection();
            httpURLConnection.setConnectTimeout(30000);
            httpURLConnection.setReadTimeout(180000);
            int contentLength = httpURLConnection.getContentLength();
            InputStream inputStream = httpURLConnection.getInputStream();
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(fileUniqueFile);
                try {
                    byte[] bArr = new byte[131072];
                    long j = 0;
                    while (true) {
                        int i = inputStream.read(bArr);
                        if (i == -1) {
                            break;
                        }
                        fileOutputStream.write(bArr, 0, i);
                        j += (long) i;
                        if (contentLength > 0) {
                            int iMin = (int) Math.min(100L, (j * 100) / ((long) contentLength));
                            updateCloudProgress(iMin, "正在下载 " + iMin + "%：" + str);
                        }
                    }
                    fileOutputStream.close();
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda32
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.f$0.m36x50d72eec(fileUniqueFile);
                        }
                    });
                } finally {
                }
            } finally {
            }
        } catch (Exception e) {
            runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda33
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m37xa7f51fcb(e);
                }
            });
        }
    }

    /* JADX INFO: renamed from: lambda$startDirectDownload$36$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m36x50d72eec(File file) {
        updateCloudProgress(100, "已下载到 Download：" + file.getName());
        showDownloadSuccessToast();
    }

    /* JADX INFO: renamed from: lambda$startDirectDownload$37$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m37xa7f51fcb(Exception exc) {
        this.cloudProgressText.setText("下载失败: " + exc.getMessage());
    }

    private File uniqueFile(File file, String str) {
        String strSubstring;
        File file2 = new File(file, str);
        if (!file2.exists()) {
            return file2;
        }
        int iLastIndexOf = str.lastIndexOf(46);
        if (iLastIndexOf <= 0) {
            strSubstring = "";
        } else {
            String strSubstring2 = str.substring(0, iLastIndexOf);
            strSubstring = str.substring(iLastIndexOf);
            str = strSubstring2;
        }
        for (int i = 1; i < 1000; i++) {
            File file3 = new File(file, str + "(" + i + ")" + strSubstring);
            if (!file3.exists()) {
                return file3;
            }
        }
        return new File(file, str + "_" + System.currentTimeMillis() + strSubstring);
    }

    private void updateCloudProgress(final int i, final String str) {
        runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda45
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m40x36fa0aaf(i, str);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$updateCloudProgress$39$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m40x36fa0aaf(int i, String str) {
        this.cloudProgressBar.setProgress(i);
        this.cloudProgressText.setText(str);
    }

    private void showDownloadSuccessToast() {
        Toast toastMakeText = Toast.makeText(this, "成功下载", 0);
        toastMakeText.show();
        Handler handler = this.mainHandler;
        toastMakeText.getClass();
        handler.postDelayed(new MainActivity$$ExternalSyntheticLambda4(toastMakeText), 2000L);
    }

    private String queryName(Uri uri) throws IllegalAccessException, InvocationTargetException {
        int columnIndex;
        Cursor cursorQuery = getContentResolver().query(uri, null, null, null, null);
        if (cursorQuery != null) {
            try {
                if (cursorQuery.moveToFirst() && (columnIndex = cursorQuery.getColumnIndex("_display_name")) >= 0) {
                    String string = cursorQuery.getString(columnIndex);
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    return string;
                }
            } finally {
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
            return "upload.bin";
        }
        return "upload.bin";
    }

    private long querySize(Uri uri) throws IllegalAccessException, InvocationTargetException {
        int columnIndex;
        Cursor cursorQuery = getContentResolver().query(uri, null, null, null, null);
        if (cursorQuery != null) {
            try {
                if (cursorQuery.moveToFirst() && (columnIndex = cursorQuery.getColumnIndex("_size")) >= 0) {
                    long j = cursorQuery.getLong(columnIndex);
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    return j;
                }
            } finally {
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
            return 0L;
        }
        return 0L;
    }

    private void uploadSelectedFiles() {
        if (this.selectedFiles.isEmpty()) {
            log("请先选择文件");
        } else {
            if (this.uploading) {
                log("正在上传，请稍候");
                return;
            }
            final AlertDialog alertDialogCreate = new AlertDialog.Builder(this).setTitle("确认上传").setMessage("将 " + this.selectedFiles.size() + " 个文档上传到读写云盘根目录，确认继续吗？").setNegativeButton("取消", (DialogInterface.OnClickListener) null).setPositiveButton("确认上传", new DialogInterface.OnClickListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda5
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    this.f$0.m43xa66daa3b(dialogInterface, i);
                }
            }).create();
            alertDialogCreate.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda6
                @Override // android.content.DialogInterface.OnShowListener
                public final void onShow(DialogInterface dialogInterface) {
                    MainActivity.lambda$uploadSelectedFiles$41(alertDialogCreate, dialogInterface);
                }
            });
            alertDialogCreate.show();
        }
    }

    /* JADX INFO: renamed from: lambda$uploadSelectedFiles$40$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m43xa66daa3b(DialogInterface dialogInterface, int i) {
        startUploadSelectedFiles();
    }

    static /* synthetic */ void lambda$uploadSelectedFiles$41(AlertDialog alertDialog, DialogInterface dialogInterface) {
        alertDialog.getButton(-1).setTextColor(BLUE_DARK);
        alertDialog.getButton(-2).setTextColor(TEXT_MUTED);
    }

    private void startUploadSelectedFiles() {
        this.uploading = true;
        this.progressBar.setProgress(0);
        this.progressText.setText("准备上传...");
        new Thread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda34
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m39x44cc0d1();
            }
        }).start();
    }

    /* JADX INFO: renamed from: lambda$startUploadSelectedFiles$42$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m39x44cc0d1() {
        try {
            try {
            } catch (Exception e) {
                log("异常: " + e.getMessage());
            }
            if (!this.userId.isEmpty() && !this.userToken.isEmpty()) {
                if (this.auth.isEmpty()) {
                    refreshAccessToken();
                    if (this.auth.isEmpty()) {
                        log("刷新登录态失败: Authorization 为空");
                        return;
                    }
                }
                for (int i = 0; i < this.selectedFiles.size(); i++) {
                    uploadOneFile(this.selectedFiles.get(i), i, this.selectedFiles.size());
                }
                updateProgress(100, "全部上传完成");
                showSuccessToast();
                return;
            }
            log("请先登录");
        } finally {
            this.uploading = false;
        }
    }

    private void uploadOneFile(SelectedFile selectedFile, int i, int i2) throws Exception {
        int i3 = i + 1;
        log("正在上传 " + i3 + "/" + i2 + "：" + selectedFile.name);
        updateProgress(Math.max(1, (i * 100) / i2), "正在处理 " + i3 + "/" + i2 + "：" + selectedFile.name);
        DigestResult digestResultDigest = digest(selectedFile.uri);
        long j = digestResultDigest.size > 0 ? digestResultDigest.size : selectedFile.size;
        String str = digestResultDigest.md5.toUpperCase(Locale.ROOT) + extension(selectedFile.name);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("userId", this.userId);
        linkedHashMap.put("dir", "attachment");
        linkedHashMap.put("objectName", str);
        linkedHashMap.put("size", String.valueOf(j));
        linkedHashMap.put("expiration", "86400");
        linkedHashMap.put("increment", ROOT_DIR_ID);
        ApiResponse apiResponsePostWithSession = postWithSession("http://api.iflyink.com/xbew-api/common/common/getUploadUrl", linkedHashMap);
        if (apiResponsePostWithSession.code != 200) {
            throw new IllegalStateException("获取上传地址失败: " + compact(apiResponsePostWithSession.raw));
        }
        String strFirstNonEmpty = firstNonEmpty(optNestedString(apiResponsePostWithSession.raw, "data", "url"), optNestedString(apiResponsePostWithSession.raw, "data", "uploadUrl"), extractString(apiResponsePostWithSession.raw, "url"));
        if (!strFirstNonEmpty.isEmpty()) {
            putFile(strFirstNonEmpty, selectedFile.uri, j, i, i2, selectedFile.name);
            String strBuildDocJson = buildDocJson(selectedFile, str, j);
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            linkedHashMap2.put("userId", this.userId);
            linkedHashMap2.put("doc", strBuildDocJson);
            linkedHashMap2.put("dirId", ROOT_DIR_ID);
            linkedHashMap2.put("checkFileExist", "true");
            ApiResponse apiResponsePostWithSession2 = postWithSession("http://api.iflyink.com/xbew-api/note/doc/addDoc", linkedHashMap2);
            if (apiResponsePostWithSession2.code == 200) {
                updateProgress((i3 * 100) / i2, "已完成 " + i3 + "/" + i2 + "：" + selectedFile.name);
                return;
            }
            throw new IllegalStateException("登记云盘失败: " + compact(apiResponsePostWithSession2.raw));
        }
        throw new IllegalStateException("上传地址为空: " + compact(apiResponsePostWithSession.raw));
    }

    private ApiResponse postWithSession(String str, Map<String, String> map) throws Exception {
        ApiResponse apiResponsePostSigned = postSigned(str, map, this.auth, this.userToken);
        if (apiResponsePostSigned.code == 401) {
            log("登录态过期，正在刷新...");
            if (refreshAccessToken()) {
                apiResponsePostSigned = postSigned(str, map, this.auth, this.userToken);
            }
        }
        if (apiResponsePostSigned.code == 406) {
            log("userToken 过期，正在刷新...");
            return refreshUserToken() ? postSigned(str, map, this.auth, this.userToken) : apiResponsePostSigned;
        }
        return apiResponsePostSigned;
    }

    private ApiResponse postBeforeLogin(String str, Map<String, String> map) throws Exception {
        ApiResponse apiResponsePostSigned = postSigned(str, map, this.auth, "");
        if (apiResponsePostSigned.code == 401) {
            log("登录态过期，正在刷新...");
            return refreshAccessToken() ? postSigned(str, map, this.auth, "") : apiResponsePostSigned;
        }
        return apiResponsePostSigned;
    }

    private boolean refreshAccessToken() throws Exception {
        ApiResponse apiResponsePostSigned = postSigned("http://api.iflyink.com/xbew-api/auth/oauth/token", new LinkedHashMap(), this.auth, this.userToken);
        if (apiResponsePostSigned.code != 200) {
            return false;
        }
        String strFirstNonEmpty = firstNonEmpty(optRootString(apiResponsePostSigned.raw, "access_token"), optNestedString(apiResponsePostSigned.raw, "data", "access_token"), optNestedString(apiResponsePostSigned.raw, "data", "token"), extractString(apiResponsePostSigned.raw, "access_token"));
        if (strFirstNonEmpty.isEmpty()) {
            return false;
        }
        this.auth = strFirstNonEmpty;
        saveSession();
        return true;
    }

    private boolean refreshUserToken() throws Exception {
        if (this.userId.isEmpty() || this.refreshToken.isEmpty() || this.sn.isEmpty()) {
            return false;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("userId", this.userId);
        linkedHashMap.put("refreshToken", this.refreshToken);
        linkedHashMap.put("sn", this.sn);
        ApiResponse apiResponsePostSigned = postSigned("http://api.iflyink.com/xbew-api/user/refreshToken", linkedHashMap, this.auth, this.userToken);
        if (apiResponsePostSigned.code != 200) {
            return false;
        }
        String strFirstNonEmpty = firstNonEmpty(optNestedString(apiResponsePostSigned.raw, "data", "detail", "userToken"), optNestedString(apiResponsePostSigned.raw, "data", "userToken"), extractString(apiResponsePostSigned.raw, "userToken"));
        String strFirstNonEmpty2 = firstNonEmpty(optNestedString(apiResponsePostSigned.raw, "data", "detail", "refreshToken"), optNestedString(apiResponsePostSigned.raw, "data", "refreshToken"), extractString(apiResponsePostSigned.raw, "refreshToken"));
        String strFirstNonEmpty3 = firstNonEmpty(optNestedString(apiResponsePostSigned.raw, "data", "detail", "sn"), optNestedString(apiResponsePostSigned.raw, "data", "sn"), extractString(apiResponsePostSigned.raw, "sn"));
        if (strFirstNonEmpty.isEmpty()) {
            return false;
        }
        this.userToken = strFirstNonEmpty;
        if (!strFirstNonEmpty2.isEmpty()) {
            this.refreshToken = strFirstNonEmpty2;
        }
        if (!strFirstNonEmpty3.isEmpty()) {
            this.sn = strFirstNonEmpty3;
        }
        saveSession();
        return true;
    }

    private String buildDocJson(SelectedFile selectedFile, String str, long j) throws Exception {
        String lowerCase = extension(selectedFile.name).replace(".", "").toLowerCase(Locale.ROOT);
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("docName", selectedFile.name);
        jSONObject.put("docExt", lowerCase);
        jSONObject.put("docType", lowerCase);
        jSONObject.put("url", "attachment/" + str);
        jSONObject.put("docSize", j);
        jSONObject.put("thumbnail", "");
        return jSONObject.toString();
    }

    private boolean isAllowedDocument(String str) {
        String lowerCase = extension(str).replace(".", "").toLowerCase(Locale.ROOT);
        return lowerCase.equals("pdf") || lowerCase.equals("doc") || lowerCase.equals("docx") || lowerCase.equals("ppt") || lowerCase.equals("pptx") || lowerCase.equals("epub");
    }

    private String extension(String str) {
        int iLastIndexOf = str.lastIndexOf(46);
        return iLastIndexOf < 0 ? "" : str.substring(iLastIndexOf);
    }

    private DigestResult digest(Uri uri) throws Exception {
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        InputStream inputStreamOpenInputStream = getContentResolver().openInputStream(uri);
        try {
            byte[] bArr = new byte[262144];
            long j = 0;
            while (true) {
                int i = inputStreamOpenInputStream.read(bArr);
                if (i == -1) {
                    break;
                }
                messageDigest.update(bArr, 0, i);
                j += (long) i;
            }
            if (inputStreamOpenInputStream != null) {
                inputStreamOpenInputStream.close();
            }
            return new DigestResult(hex(messageDigest.digest()), j);
        } catch (Throwable th) {
            if (inputStreamOpenInputStream != null) {
                try {
                    inputStreamOpenInputStream.close();
                } catch (Throwable th2) {
                    Throwable.class.getDeclaredMethod("addSuppressed", Throwable.class).invoke(th, th2);
                }
            }
            throw th;
        }
    }

    private ApiResponse postSigned(String str, Map<String, String> map, String str2, String str3) throws Exception {
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        linkedHashMap.put("istv", "s");
        String strValueOf = String.valueOf(System.currentTimeMillis());
        linkedHashMap.put("timestamp", strValueOf);
        linkedHashMap.put("appKey", APP_KEY);
        linkedHashMap.put("nonce", md5Text(strValueOf + randomDigits(10)));
        linkedHashMap.put("sign", sign(linkedHashMap));
        byte[] bytes = formEncode(linkedHashMap).getBytes(StandardCharsets.UTF_8);
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setConnectTimeout(30000);
        httpURLConnection.setReadTimeout(180000);
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8;");
        if (str2 != null && !str2.isEmpty()) {
            httpURLConnection.setRequestProperty("Authorization", str2);
        }
        if (str3 != null && !str3.isEmpty()) {
            httpURLConnection.setRequestProperty("userToken", str3);
        }
        httpURLConnection.setRequestProperty("ainoteVersion", "");
        OutputStream outputStream = httpURLConnection.getOutputStream();
        try {
            outputStream.write(bytes);
            if (outputStream != null) {
                outputStream.close();
            }
            String response = readResponse(httpURLConnection);
            return new ApiResponse(responseCode(response, httpURLConnection.getResponseCode()), response);
        } catch (Throwable th) {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (Throwable th2) {
                    Throwable.class.getDeclaredMethod("addSuppressed", Throwable.class).invoke(th, th2);
                }
            }
            throw th;
        }
    }

    private String sign(Map<String, String> map) throws Exception {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList<String> arrayList = new ArrayList(map.keySet());
        Collections.sort(arrayList);
        for (String str : arrayList) {
            String str2 = map.get(str);
            if (!"sign".equals(str) && str2 != null && !str2.isEmpty()) {
                linkedHashMap.put(str, str2);
            }
        }
        linkedHashMap.put("secret", APP_SECRET);
        ArrayList arrayList2 = new ArrayList();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            arrayList2.add(((String) entry.getKey()) + "=" + ((String) entry.getValue()));
        }
        return hex(MessageDigest.getInstance("SHA-256").digest(MainActivity$$ExternalSyntheticBackport1.m("&", arrayList2).getBytes(StandardCharsets.UTF_8))).toUpperCase(Locale.ROOT);
    }

    private String md5Text(String str) throws Exception {
        return hex(MessageDigest.getInstance("MD5").digest(str.getBytes(StandardCharsets.UTF_8)));
    }

    private String randomDigits(int i) {
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < i; i2++) {
            sb.append("0123456789".charAt(secureRandom.nextInt("0123456789".length())));
        }
        return sb.toString();
    }

    private String encryptPassword(String str) throws Exception {
        Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
        cipher.init(1, new SecretKeySpec(PASSWORD_KEY.getBytes(StandardCharsets.UTF_8), "DES"));
        return hex(cipher.doFinal(str.getBytes(StandardCharsets.UTF_8)));
    }

    private String hex(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            sb.append(String.format(Locale.ROOT, "%02x", Byte.valueOf(b)));
        }
        return sb.toString();
    }

    private String formEncode(Map<String, String> map) throws Exception {
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            arrayList.add(URLEncoder.encode(entry.getKey(), "UTF-8") + "=" + URLEncoder.encode(entry.getValue(), "UTF-8"));
        }
        return MainActivity$$ExternalSyntheticBackport1.m("&", arrayList);
    }

    private void putFile(String str, Uri uri, long j, int i, int i2, String str2) throws Exception {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
        httpURLConnection.setRequestMethod("PUT");
        httpURLConnection.setConnectTimeout(30000);
        httpURLConnection.setReadTimeout(180000);
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestProperty("Content-Type", "");
        httpURLConnection.setChunkedStreamingMode(262144);
        InputStream inputStreamOpenInputStream = getContentResolver().openInputStream(uri);
        try {
            OutputStream outputStream = httpURLConnection.getOutputStream();
            try {
                byte[] bArr = new byte[262144];
                long j2 = 0;
                while (true) {
                    int i3 = inputStreamOpenInputStream.read(bArr);
                    if (i3 == -1) {
                        break;
                    }
                    outputStream.write(bArr, 0, i3);
                    j2 += (long) i3;
                    if (j > 0) {
                        int iMin = (int) Math.min(99L, (((long) (i * 100)) + Math.min(95L, (j2 * 95) / j)) / ((long) i2));
                        updateProgress(iMin, "正在上传 " + (i + 1) + "/" + i2 + "：" + str2 + "  " + iMin + "%");
                    }
                }
                if (outputStream != null) {
                    outputStream.close();
                }
                if (inputStreamOpenInputStream != null) {
                    inputStreamOpenInputStream.close();
                }
                int responseCode = httpURLConnection.getResponseCode();
                if (responseCode < 200 || responseCode >= 300) {
                    throw new IllegalStateException("PUT upload failed HTTP " + responseCode + ": " + compact(readResponse(httpURLConnection)));
                }
            } finally {
            }
        } finally {
        }
    }

    private String readResponse(HttpURLConnection httpURLConnection) throws Exception {
        InputStream errorStream = httpURLConnection.getResponseCode() >= 400 ? httpURLConnection.getErrorStream() : httpURLConnection.getInputStream();
        if (errorStream == null) {
            return "";
        }
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(errorStream, StandardCharsets.UTF_8));
        try {
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    String string = sb.toString();
                    bufferedReader.close();
                    return string;
                }
                sb.append(line);
            }
        } catch (Throwable th) {
            try {
                bufferedReader.close();
            } catch (Throwable th2) {
                Throwable.class.getDeclaredMethod("addSuppressed", Throwable.class).invoke(th, th2);
            }
            throw th;
        }
    }

    private int responseCode(String str, int i) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.has("code")) {
                return jSONObject.optInt("code", i);
            }
        } catch (Exception e) {
        }
        return extractInt(str, "code", i);
    }

    private int extractInt(String str, String str2, int i) {
        String strExtractRaw = extractRaw(str, str2);
        if (strExtractRaw.isEmpty()) {
            return i;
        }
        try {
            return Integer.parseInt(strExtractRaw);
        } catch (NumberFormatException e) {
            return i;
        }
    }

    private String optRootString(String str, String str2) {
        try {
            return new JSONObject(str).optString(str2, "");
        } catch (Exception e) {
            return "";
        }
    }

    private String optNestedString(String str, String... strArr) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            for (int i = 0; i < strArr.length - 1; i++) {
                jSONObject = jSONObject.optJSONObject(strArr[i]);
                if (jSONObject == null) {
                    return "";
                }
            }
            return jSONObject.optString(strArr[strArr.length - 1], "");
        } catch (Exception e) {
            return "";
        }
    }

    private List<JSONObject> extractObjectList(String str) {
        ArrayList arrayList = new ArrayList();
        try {
            collectObjects(new JSONObject(str).opt("data"), arrayList);
        } catch (Exception e) {
        }
        return arrayList;
    }

    private void collectObjects(Object obj, List<JSONObject> list) {
        if (obj instanceof JSONArray) {
            JSONArray jSONArray = (JSONArray) obj;
            for (int i = 0; i < jSONArray.length(); i++) {
                Object objOpt = jSONArray.opt(i);
                if (objOpt instanceof JSONObject) {
                    list.add((JSONObject) objOpt);
                }
            }
            return;
        }
        if (obj instanceof JSONObject) {
            JSONObject jSONObject = (JSONObject) obj;
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("list");
            if (jSONArrayOptJSONArray == null) {
                jSONArrayOptJSONArray = jSONObject.optJSONArray("records");
            }
            if (jSONArrayOptJSONArray == null) {
                jSONArrayOptJSONArray = jSONObject.optJSONArray("data");
            }
            if (jSONArrayOptJSONArray != null) {
                collectObjects(jSONArrayOptJSONArray, list);
            } else {
                list.add(jSONObject);
            }
        }
    }

    private String objString(JSONObject jSONObject, String... strArr) {
        if (jSONObject == null) {
            return "";
        }
        for (String str : strArr) {
            String strOptString = jSONObject.optString(str, "");
            if (strOptString != null && !strOptString.isEmpty() && !"null".equals(strOptString)) {
                return strOptString;
            }
        }
        return "";
    }

    private String repeat(String str, int i) {
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < i; i2++) {
            sb.append(str);
        }
        return sb.toString();
    }

    private String stripHtml(String str) {
        if (str == null) {
            return "";
        }
        return str.replace("\\n", "\n").replaceAll("<br\\s*/?>", "\n").replaceAll("<[^>]+>", "").replace("&nbsp;", " ").replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&").trim();
    }

    private String escapeHtml(String str) {
        return str == null ? "" : str.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }

    private View emptyRow(String str) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTextColor(TEXT_MUTED);
        textView.setTextSize(14.0f);
        textView.setGravity(17);
        textView.setPadding(dp(12), dp(22), dp(12), dp(22));
        textView.setBackground(rounded(-1, BORDER, dp(12)));
        return textView;
    }

    private String noteTypeName(String str) {
        return "1".equals(str) ? "写作笔记" : "2".equals(str) ? "录音笔记" : "10".equals(str) ? "文字笔记" : "20".equals(str) ? "融合笔记" : "21".equals(str) ? "思维导图" : "笔记";
    }

    private boolean isCloudDir(JSONObject jSONObject) {
        String strObjString = objString(jSONObject, "docType", "fileType", "type");
        return "dir".equalsIgnoreCase(strObjString) || "folder".equalsIgnoreCase(strObjString) || !objString(jSONObject, "dirName").isEmpty();
    }

    private String cloudName(JSONObject jSONObject) {
        return firstNonEmpty(objString(jSONObject, "fileName", "docName", "dirName", "name"), "未命名");
    }

    private String fileExtLabel(JSONObject jSONObject) {
        String strFirstNonEmpty = firstNonEmpty(objString(jSONObject, "fileExt", "docExt", "docType"), extension(cloudName(jSONObject)).replace(".", ""));
        return strFirstNonEmpty.isEmpty() ? "文件" : strFirstNonEmpty.toUpperCase(Locale.ROOT);
    }

    private int fileTypeColor(JSONObject jSONObject) {
        String lowerCase = fileExtLabel(jSONObject).toLowerCase(Locale.ROOT);
        if (lowerCase.equals("pdf")) {
            return Color.rgb(236, 82, 82);
        }
        if (lowerCase.equals("doc") || lowerCase.equals("docx") || lowerCase.equals("word")) {
            return Color.rgb(67, 126, 232);
        }
        if (lowerCase.equals("ppt") || lowerCase.equals("pptx")) {
            return Color.rgb(235, 131, 52);
        }
        if (lowerCase.equals("xls") || lowerCase.equals("xlsx") || lowerCase.equals("excel")) {
            return Color.rgb(52, 164, 98);
        }
        if (lowerCase.equals("epub") || lowerCase.equals("mobi") || lowerCase.equals("azw3") || lowerCase.equals("txt")) {
            return Color.rgb(132, 100, 214);
        }
        if (lowerCase.equals("jpg") || lowerCase.equals("jpeg") || lowerCase.equals("png")) {
            return Color.rgb(42, 169, 185);
        }
        return Color.rgb(102, 124, 148);
    }

    private String safeFileName(String str) {
        String strTrim = str.replaceAll("[\\\\/:*?\"<>|]", "_").trim();
        return strTrim.isEmpty() ? "download.bin" : strTrim;
    }

    private String extractDownloadUrl(String str) {
        try {
            JSONObject jSONObjectOptJSONObject = new JSONObject(str).optJSONObject("data");
            if (jSONObjectOptJSONObject != null) {
                JSONArray jSONArrayOptJSONArray = jSONObjectOptJSONObject.optJSONArray("url");
                if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                    return jSONArrayOptJSONArray.optString(0, "");
                }
                String strOptString = jSONObjectOptJSONObject.optString("url", "");
                if (!strOptString.isEmpty()) {
                    return strOptString;
                }
            }
        } catch (Exception e) {
        }
        return extractString(str, "url");
    }

    private String extractString(String str, String str2) {
        int iIndexOf;
        int iIndexOf2;
        String str3 = "\"" + str2 + "\"";
        int iIndexOf3 = str.indexOf(str3);
        if (iIndexOf3 < 0 || (iIndexOf = str.indexOf(58, iIndexOf3 + str3.length())) < 0 || (iIndexOf2 = str.indexOf(34, iIndexOf + 1)) < 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        boolean z = false;
        for (int i = iIndexOf2 + 1; i < str.length(); i++) {
            char cCharAt = str.charAt(i);
            if (z) {
                sb.append(cCharAt);
                z = false;
            } else if (cCharAt == '\\') {
                z = true;
            } else {
                if (cCharAt == '\"') {
                    return sb.toString();
                }
                sb.append(cCharAt);
            }
        }
        return "";
    }

    private String extractRaw(String str, String str2) {
        int iIndexOf;
        String str3 = "\"" + str2 + "\"";
        int iIndexOf2 = str.indexOf(str3);
        if (iIndexOf2 < 0 || (iIndexOf = str.indexOf(58, iIndexOf2 + str3.length())) < 0) {
            return "";
        }
        do {
            iIndexOf++;
            if (iIndexOf >= str.length()) {
                break;
            }
        } while (Character.isWhitespace(str.charAt(iIndexOf)));
        int i = iIndexOf;
        while (i < str.length() && "-0123456789".indexOf(str.charAt(i)) >= 0) {
            i++;
        }
        return str.substring(iIndexOf, i);
    }

    private String firstNonEmpty(String... strArr) {
        for (String str : strArr) {
            if (str != null && !str.isEmpty()) {
                return str;
            }
        }
        return "";
    }

    private String compact(String str) {
        if (str == null) {
            return "";
        }
        String strReplaceAll = str.replaceAll("(\"(?:access_token|refresh_token|userToken|refreshToken|token)\"\\s*:\\s*\")[^\"]+\"", "$1***\"").replaceAll("([?&](?:access_token|refresh_token|token)=)[^&]+", "$1***");
        return strReplaceAll.length() > 600 ? strReplaceAll.substring(0, 600) + "..." : strReplaceAll;
    }

    private void updateProgress(final int i, final String str) {
        runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m42lambda$updateProgress$43$comcodexiflyinkuploaderMainActivity(i, str);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$updateProgress$43$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m42lambda$updateProgress$43$comcodexiflyinkuploaderMainActivity(int i, String str) {
        this.progressBar.setProgress(i);
        this.progressText.setText(str);
    }

    private void log(final String str) {
        runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda14
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m27lambda$log$44$comcodexiflyinkuploaderMainActivity(str);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$log$44$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m27lambda$log$44$comcodexiflyinkuploaderMainActivity(String str) {
        if (this.userId.isEmpty()) {
            this.loginMessageText.setText(str);
        } else {
            this.statusText.setText(str);
        }
    }

    private void showSuccessToast() {
        runOnUiThread(new Runnable() { // from class: com.codex.iflyinkuploader.MainActivity$$ExternalSyntheticLambda47
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m35x11b07996();
            }
        });
    }

    /* JADX INFO: renamed from: lambda$showSuccessToast$45$com-codex-iflyinkuploader-MainActivity, reason: not valid java name */
    /* synthetic */ void m35x11b07996() {
        Toast toastMakeText = Toast.makeText(this, "成功上传", 1);
        toastMakeText.show();
        Handler handler = new Handler(Looper.getMainLooper());
        toastMakeText.getClass();
        handler.postDelayed(new MainActivity$$ExternalSyntheticLambda4(toastMakeText), 3000L);
        this.statusText.setText("成功上传");
    }

    private static class ApiResponse {
        final int code;
        final String raw;

        ApiResponse(int i, String str) {
            this.code = i;
            this.raw = str;
        }
    }

    private static class DigestResult {
        final String md5;
        final long size;

        DigestResult(String str, long j) {
            this.md5 = str;
            this.size = j;
        }
    }

    private static class SelectedFile {
        final String name;
        final long size;
        final Uri uri;

        SelectedFile(Uri uri, String str, long j) {
            this.uri = uri;
            this.name = str;
            this.size = j;
        }
    }
}
