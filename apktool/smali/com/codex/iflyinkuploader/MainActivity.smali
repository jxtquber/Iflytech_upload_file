.class public Lcom/codex/iflyinkuploader/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;,
        Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;,
        Lcom/codex/iflyinkuploader/MainActivity$DigestResult;
    }
.end annotation


# static fields
.field private static final APP_KEY:Ljava/lang/String; = "dxk-pc"

.field private static final APP_SECRET:Ljava/lang/String; = "2c8e320f948911eca3fafa163ec9"

.field private static final BASE_API:Ljava/lang/String; = "http://api.iflyink.com/xbew-api"

.field private static final BLUE:I

.field private static final BLUE_DARK:I

.field private static final BLUE_LIGHT:I

.field private static final BORDER:I

.field private static final BUTTON_HEIGHT:I = 0x28

.field private static final PASSWORD_KEY:Ljava/lang/String; = "CYS-b8f8"

.field private static final PICK_FILE:I = 0x65

.field private static final PREF:Ljava/lang/String; = "iflyink_upload"

.field private static final ROOT_DIR_ID:Ljava/lang/String; = "0"

.field private static final TEXT_MAIN:I

.field private static final TEXT_MUTED:I


# instance fields
.field private final allNotes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private volatile auth:Ljava/lang/String;

.field private final cloudDirStack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final cloudItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private cloudListLayout:Landroid/widget/LinearLayout;

.field private cloudLoaded:Z

.field private final cloudNameStack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private cloudPage:Landroid/widget/LinearLayout;

.field private cloudPathText:Landroid/widget/TextView;

.field private cloudProgressBar:Landroid/widget/ProgressBar;

.field private cloudProgressText:Landroid/widget/TextView;

.field private cloudStatusText:Landroid/widget/TextView;

.field private codeEdit:Landroid/widget/EditText;

.field private codeFields:Landroid/widget/LinearLayout;

.field private codeModeButton:Landroid/widget/Button;

.field private currentCloudDirId:Ljava/lang/String;

.field private currentCloudDirName:Ljava/lang/String;

.field private currentPage:I

.field private final expandedNoteDirIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fileListLayout:Landroid/widget/LinearLayout;

.field private fileText:Landroid/widget/TextView;

.field private headerLogoutButton:Landroid/widget/Button;

.field private loginMessageText:Landroid/widget/TextView;

.field private loginSection:Landroid/widget/LinearLayout;

.field private final mainHandler:Landroid/os/Handler;

.field private navCloudButton:Landroid/widget/Button;

.field private navNoteButton:Landroid/widget/Button;

.field private navUploadButton:Landroid/widget/Button;

.field private noteDirListLayout:Landroid/widget/LinearLayout;

.field private final noteDirs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private noteListLayout:Landroid/widget/LinearLayout;

.field private notePage:Landroid/widget/LinearLayout;

.field private noteStatusText:Landroid/widget/TextView;

.field private notesForceRefresh:Z

.field private notesLoaded:Z

.field private pageContainer:Landroid/widget/LinearLayout;

.field private passwordEdit:Landroid/widget/EditText;

.field private passwordFields:Landroid/widget/LinearLayout;

.field private passwordLoginMode:Z

.field private passwordModeButton:Landroid/widget/Button;

.field private phoneEdit:Landroid/widget/EditText;

.field private progressBar:Landroid/widget/ProgressBar;

.field private progressText:Landroid/widget/TextView;

.field private volatile refreshToken:Ljava/lang/String;

.field private final selectedFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;",
            ">;"
        }
    .end annotation
.end field

.field private selectedNoteDirId:Ljava/lang/String;

.field private volatile sn:Ljava/lang/String;

.field private statusText:Landroid/widget/TextView;

.field private uploadSection:Landroid/widget/LinearLayout;

.field private uploaderPage:Landroid/widget/LinearLayout;

.field private volatile uploading:Z

.field private volatile userId:Ljava/lang/String;

.field private volatile userToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 70
    const/16 v0, 0xa9

    const/16 v1, 0xf5

    const/16 v2, 0x44

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE:I

    .line 71
    const/16 v0, 0x7e

    const/16 v1, 0xd6

    const/16 v2, 0x14

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_DARK:I

    .line 72
    const/16 v0, 0xe8

    const/16 v1, 0xf6

    const/16 v2, 0xff

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_LIGHT:I

    .line 73
    const/16 v0, 0xc6

    const/16 v1, 0xe7

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    .line 74
    const/16 v0, 0x2d

    const/16 v1, 0x3d

    const/16 v2, 0x20

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    .line 75
    const/16 v0, 0x7c

    const/16 v1, 0x91

    const/16 v2, 0x69

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 62
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 109
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    .line 111
    iput v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentPage:I

    .line 112
    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->notesLoaded:Z

    .line 113
    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudLoaded:Z

    .line 114
    const-string v0, "0"

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    .line 115
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirId:Ljava/lang/String;

    .line 116
    const-string v0, "\u5168\u90e8\u6587\u4ef6"

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirName:Ljava/lang/String;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->allNotes:Ljava/util/List;

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudDirStack:Ljava/util/List;

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudNameStack:Ljava/util/List;

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    .line 125
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->mainHandler:Landroid/os/Handler;

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    .line 128
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    .line 129
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    .line 130
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    .line 131
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    return-void
.end method

.method private addNoteDirRow(Lorg/json/JSONObject;I)V
    .locals 9

    .line 963
    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "dirId"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    const-string v4, "id"

    aput-object v4, v1, v3

    const/4 v4, 0x2

    const-string v5, "localId"

    aput-object v5, v1, v4

    invoke-direct {p0, p1, v1}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/String;

    aput-object v1, v5, v2

    const-string v1, "0"

    aput-object v1, v5, v3

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 964
    new-array v5, v4, [Ljava/lang/String;

    const-string v6, "dirName"

    aput-object v6, v5, v2

    const-string v6, "name"

    aput-object v6, v5, v3

    invoke-direct {p0, p1, v5}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v2

    const-string p1, "\u672a\u547d\u540d"

    aput-object p1, v4, v3

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 965
    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 966
    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->hasNoteDirChildren(Ljava/lang/String;)Z

    move-result v4

    .line 967
    iget-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {v5, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    .line 968
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 969
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 970
    const-string v7, "  "

    if-eqz v4, :cond_1

    if-eqz v5, :cond_0

    const-string v5, "\u25be "

    goto :goto_0

    :cond_0
    const-string v5, "\u25b8 "

    goto :goto_0

    :cond_1
    move-object v5, v7

    .line 971
    :goto_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-direct {p0, v7, p2}, Lcom/codex/iflyinkuploader/MainActivity;->repeat(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 972
    const/high16 p1, 0x41400000    # 12.0f

    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 973
    if-eqz v3, :cond_2

    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_DARK:I

    goto :goto_1

    :cond_2
    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    :goto_1
    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 974
    if-eqz v3, :cond_3

    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    goto :goto_2

    :cond_3
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    :goto_2
    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 975
    const/16 p1, 0x8

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p2

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p1

    invoke-virtual {v6, p2, v5, v7, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 976
    const/4 p1, -0x1

    if-eqz v3, :cond_4

    const/4 p2, -0x1

    goto :goto_3

    :cond_4
    sget p2, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_LIGHT:I

    :goto_3
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, p2, v3, v5}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {v6, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 977
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {p2, p1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 978
    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p1

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v0

    invoke-virtual {p2, v2, p1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 979
    new-instance p1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda46;

    invoke-direct {p1, p0, v1, v4}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda46;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Z)V

    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 991
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v6, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 992
    return-void
.end method

.method private addSelectedUri(Landroid/net/Uri;Landroid/content/Intent;)Z
    .locals 5

    .line 772
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 773
    :cond_0
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->queryName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 774
    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->isAllowedDocument(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_1

    return v3

    .line 775
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getFlags()I

    move-result p2

    and-int/2addr p2, v3

    .line 777
    :try_start_0
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 780
    goto :goto_0

    .line 778
    :catch_0
    move-exception p2

    .line 781
    :goto_0
    iget-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->querySize(Landroid/net/Uri;)J

    move-result-wide v3

    invoke-direct {v2, p1, v1, v3, v4}, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;-><init>(Landroid/net/Uri;Ljava/lang/String;J)V

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 782
    return v0
.end method

.method private appendImageIfPresent(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V
    .locals 10

    .line 1155
    nop

    .line 1156
    const-string v0, "image"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1157
    const-string v2, "imagePath"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1158
    const-string v3, "url"

    invoke-virtual {p1, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1159
    const-string v4, "src"

    invoke-virtual {p1, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1160
    const-string v5, "thumbnail"

    invoke-virtual {p1, v5, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1161
    const-string v6, "thumbnailUrl"

    invoke-virtual {p1, v6, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1162
    const-string v7, "objectName"

    invoke-virtual {p1, v7, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1163
    const-string v8, "image.png"

    invoke-virtual {p1, v8, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1164
    const-string v9, "thumbnail.jpeg"

    invoke-virtual {p1, v9, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v0, v1, v9

    const/4 v0, 0x1

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    const/4 v0, 0x3

    aput-object v4, v1, v0

    const/4 v0, 0x4

    aput-object v5, v1, v0

    const/4 v0, 0x5

    aput-object v6, v1, v0

    const/4 v0, 0x6

    aput-object v7, v1, v0

    const/4 v0, 0x7

    aput-object v8, v1, v0

    const/16 v0, 0x8

    aput-object p1, v1, v0

    .line 1155
    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1165
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1166
    :cond_0
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "data:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1168
    :cond_1
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 1169
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 1170
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".jpeg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 1171
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".webp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1172
    :cond_2
    const-string v0, "<p><img src=\'http://biji.iflyink.com/xbew-webserver/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 1173
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 1174
    const-string p2, "\'/></p>"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1167
    :cond_3
    :goto_0
    const-string v0, "<p><img src=\'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\'/></p>"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1176
    :cond_4
    :goto_1
    return-void
.end method

.method private buildCloudPage()V
    .locals 13

    .line 385
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    .line 386
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 387
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->pageContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 389
    const-string v0, "\u6b63\u5728\u51c6\u5907\u7f51\u76d8\u9875..."

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->pageStatus(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    .line 390
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 392
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 393
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 394
    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x2a

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {v5, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 396
    const-string v3, "\u4e0a\u4e00\u7ea7"

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 397
    new-instance v5, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda40;

    invoke-direct {v5, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda40;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 398
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x28

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v2, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 399
    const/4 v7, 0x4

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    const/16 v10, 0x8

    invoke-direct {p0, v10}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v11

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v12

    invoke-virtual {v5, v2, v9, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 400
    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 402
    const-string v3, "\u5237\u65b0"

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 403
    new-instance v5, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda41;

    invoke-direct {v5, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda41;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {v5, v2, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 405
    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-virtual {v5, v2, v6, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 406
    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 408
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    .line 409
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    const-string v3, "\u5f53\u524d\uff1a\u5168\u90e8\u6587\u4ef6"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 410
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 411
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 412
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 413
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v10}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v10}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-virtual {v0, v3, v5, v6, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 414
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 416
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 417
    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 418
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudListLayout:Landroid/widget/LinearLayout;

    .line 419
    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 420
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudListLayout:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 422
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    .line 423
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    const-string v1, "\u7b49\u5f85\u4e0b\u8f7d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 424
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 425
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    sget v1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 426
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/4 v3, 0x6

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v1, v3, v5, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 427
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 429
    new-instance v0, Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    const v2, 0x1010078

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressBar:Landroid/widget/ProgressBar;

    .line 430
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 431
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressBar:Landroid/widget/ProgressBar;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x18

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 432
    return-void
.end method

.method private buildDocJson(Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;Ljava/lang/String;J)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1603
    iget-object v0, p1, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->extension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "."

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 1604
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1605
    const-string v3, "docName"

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1606
    const-string p1, "docExt"

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1607
    const-string p1, "docType"

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1608
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "attachment/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "url"

    invoke-virtual {v1, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1609
    const-string p1, "docSize"

    invoke-virtual {v1, p1, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1610
    const-string p1, "thumbnail"

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1611
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private buildNotePage()V
    .locals 11

    .line 302
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->notePage:Landroid/widget/LinearLayout;

    .line 303
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->notePage:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 304
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->pageContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->notePage:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 306
    const-string v0, "\u6b63\u5728\u51c6\u5907\u7b14\u8bb0\u9875..."

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->pageStatus(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    .line 307
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->notePage:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 309
    const-string v0, "\u5237\u65b0\u7b14\u8bb0"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 310
    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda44;

    invoke-direct {v2, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda44;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 311
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->notePage:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buttonParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 313
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 314
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 315
    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->notePage:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v4, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 317
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 318
    sget v5, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_LIGHT:I

    sget v7, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    const/16 v8, 0xc

    invoke-direct {p0, v8}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v5, v7, v8}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 319
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x74

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {v5, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 320
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    .line 321
    iget-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 322
    iget-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    const/4 v7, 0x6

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-virtual {v5, v8, v9, v10, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 323
    iget-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 325
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 326
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v2, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 327
    const/16 v6, 0xa

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v5, v6, v2, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 328
    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 329
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteListLayout:Landroid/widget/LinearLayout;

    .line 330
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 331
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteListLayout:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v4, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 332
    return-void
.end method

.method private buildUi()V
    .locals 14

    .line 142
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    .line 143
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getNavigationBarHeight()I

    move-result v2

    .line 144
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 145
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 146
    add-int/2addr v2, v1

    invoke-virtual {v3, v1, v1, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 147
    const/16 v1, 0xfb

    const/16 v2, 0xff

    const/16 v5, 0xf7

    invoke-static {v5, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 149
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 150
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 151
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 152
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x3a

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v2, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 155
    const/high16 v6, 0x7f010000

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 156
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x2a

    invoke-direct {p0, v8}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-direct {p0, v8}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {v6, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 159
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 160
    const/16 v6, 0xa

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    invoke-virtual {v2, v8, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 161
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v8, v0, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 164
    const-string v10, "\u8baf\u98de\u6587\u4ef6"

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    sget v10, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 166
    const/high16 v10, 0x41b00000    # 22.0f

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 167
    sget-object v10, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 168
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v7, v0, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 171
    const-string v10, "\u4e0a\u4f20\u5230\u8bfb\u5199\u4e91\u76d8\u6839\u76ee\u5f55"

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    sget v10, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    const/high16 v10, 0x41500000    # 13.0f

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 174
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v7, v0, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    const-string v2, "\u6ce8\u9500"

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    .line 177
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    invoke-virtual {v2, v10}, Landroid/widget/Button;->setTextSize(F)V

    .line 178
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    new-instance v8, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda22;

    invoke-direct {v8, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda22;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v11, 0x4c

    invoke-direct {p0, v11}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v11

    const/16 v12, 0x28

    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v13

    invoke-direct {v8, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 181
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    .line 182
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 183
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v0, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    const-string v1, "\u624b\u673a\u53f7"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->input(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    .line 186
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 187
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 189
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 190
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 191
    const/4 v2, 0x6

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v1, v0, v2, v0, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 192
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    const-string v2, "\u5bc6\u7801\u767b\u5f55"

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordModeButton:Landroid/widget/Button;

    .line 195
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordModeButton:Landroid/widget/Button;

    new-instance v5, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda23;

    invoke-direct {v5, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda23;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    const-string v2, "\u9a8c\u8bc1\u7801\u767b\u5f55"

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeModeButton:Landroid/widget/Button;

    .line 200
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeModeButton:Landroid/widget/Button;

    new-instance v5, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda24;

    invoke-direct {v5, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda24;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v2, v0, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 205
    const/16 v5, 0x8

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v2, v0, v0, v6, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 206
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {v6, v0, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 207
    iget-object v8, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordModeButton:Landroid/widget/Button;

    invoke-virtual {v1, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeModeButton:Landroid/widget/Button;

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordFields:Landroid/widget/LinearLayout;

    .line 211
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordFields:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 212
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordFields:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 214
    const-string v1, "\u5bc6\u7801"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->input(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordEdit:Landroid/widget/EditText;

    .line 215
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordEdit:Landroid/widget/EditText;

    const/16 v2, 0x81

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 216
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordFields:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordEdit:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 218
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    .line 219
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 220
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 222
    const-string v1, "\u77ed\u4fe1\u9a8c\u8bc1\u7801"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->input(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeEdit:Landroid/widget/EditText;

    .line 223
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeEdit:Landroid/widget/EditText;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 224
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeEdit:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 226
    const-string v1, "\u53d1\u9001\u9a8c\u8bc1\u7801"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 227
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 228
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda25;

    invoke-direct {v1, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda25;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buttonParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    const-string v1, "\u767b\u5f55"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 232
    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda26;

    invoke-direct {v2, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda26;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 239
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buttonParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v2, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    .line 242
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 243
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    sget v2, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 244
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    const/16 v8, 0xc

    invoke-direct {p0, v8}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v10

    invoke-virtual {v1, v6, v8, v2, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 245
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 247
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    .line 248
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 249
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v0, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 251
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->pageContainer:Landroid/widget/LinearLayout;

    .line 252
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->pageContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 253
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->pageContainer:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v7, v0, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 256
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buildUploaderPage()V

    .line 257
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buildCloudPage()V

    .line 259
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 260
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 261
    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-virtual {v1, v0, v2, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 262
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x2e

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v4, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 264
    const-string v2, "\u7b14\u8bb0"

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->navButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navNoteButton:Landroid/widget/Button;

    .line 265
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navNoteButton:Landroid/widget/Button;

    new-instance v4, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda27;

    invoke-direct {v4, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda27;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 266
    const-string v2, "\u4e0a\u4f20"

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->navButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navUploadButton:Landroid/widget/Button;

    .line 267
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navUploadButton:Landroid/widget/Button;

    new-instance v4, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda28;

    invoke-direct {v4, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda28;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    const-string v2, "\u7f51\u76d8"

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->navButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navCloudButton:Landroid/widget/Button;

    .line 269
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navCloudButton:Landroid/widget/Button;

    new-instance v4, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda29;

    invoke-direct {v4, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda29;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navUploadButton:Landroid/widget/Button;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v4, v0, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 272
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->navCloudButton:Landroid/widget/Button;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v4, v0, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 274
    invoke-virtual {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->setContentView(Landroid/view/View;)V

    .line 275
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->updateLoginModeUi()V

    .line 276
    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->switchPage(I)V

    .line 277
    return-void
.end method

.method private buildUploaderPage()V
    .locals 13

    .line 335
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploaderPage:Landroid/widget/LinearLayout;

    .line 336
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploaderPage:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 337
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->pageContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploaderPage:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 339
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 340
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploaderPage:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v3, v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 342
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 343
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 344
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 346
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    .line 347
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 348
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    sget v7, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 349
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    const/4 v7, 0x4

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    const/16 v9, 0x8

    invoke-direct {p0, v9}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v11

    const/16 v12, 0xc

    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v12

    invoke-virtual {v0, v8, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 350
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 352
    const-string v0, "\u9009\u62e9\u6587\u6863"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 353
    new-instance v8, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda12;

    invoke-direct {v8, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda12;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 354
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buttonParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    invoke-virtual {v2, v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 356
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    .line 357
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    const-string v8, "\u672a\u9009\u62e9\u6587\u4ef6"

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 358
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    const/high16 v8, 0x41700000    # 15.0f

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 359
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    sget v8, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 360
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    sget-object v8, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 361
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v8

    const/16 v10, 0x10

    invoke-direct {p0, v10}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v11

    invoke-direct {p0, v9}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-virtual {v0, v8, v10, v11, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 362
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 364
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    .line 365
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 366
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 368
    const-string v0, "\u4e0a\u4f20\u5230\u6839\u76ee\u5f55"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 369
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda13;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buttonParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    .line 373
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    const-string v1, "\u7b49\u5f85\u4e0a\u4f20"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 374
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 375
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    sget v1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 376
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/16 v3, 0xa

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v1, v3, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 377
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 379
    new-instance v0, Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    const v3, 0x1010078

    invoke-direct {v0, p0, v1, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    .line 380
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 381
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x20

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v1, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 382
    return-void
.end method

.method private button(Ljava/lang/String;)Landroid/widget/Button;
    .locals 3

    .line 450
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 451
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 452
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 453
    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 454
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    .line 455
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setSingleLine(Z)V

    .line 456
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 457
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 458
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 459
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 460
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v2, p1, v1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 461
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    .line 462
    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->styleFilled(Landroid/widget/Button;)V

    .line 463
    return-object v0
.end method

.method private buttonParams()Landroid/widget/LinearLayout$LayoutParams;
    .locals 4

    .line 482
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v1, 0x28

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 483
    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 484
    return-object v0
.end method

.method private cloudName(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 6

    .line 1898
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "fileName"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v3, "docName"

    aput-object v3, v0, v2

    const/4 v3, 0x2

    const-string v4, "dirName"

    aput-object v4, v0, v3

    const-string v4, "name"

    const/4 v5, 0x3

    aput-object v4, v0, v5

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/String;

    aput-object p1, v0, v1

    const-string p1, "\u672a\u547d\u540d"

    aput-object p1, v0, v2

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private cloudRow(Lorg/json/JSONObject;)Landroid/view/View;
    .locals 10

    .line 1256
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1257
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1258
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1259
    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    const/16 v4, 0xa

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1260
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    const/4 v5, -0x1

    invoke-direct {p0, v5, v3, v2}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1261
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1262
    const/4 v6, 0x5

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v2, v1, v7, v1, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 1263
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1265
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->isCloudDir(Lorg/json/JSONObject;)Z

    move-result v2

    .line 1266
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->fileTypeColor(Lorg/json/JSONObject;)I

    move-result v6

    .line 1267
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1268
    if-eqz v2, :cond_0

    const-string v8, "\u76ee\u5f55"

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->fileExtLabel(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v8

    :goto_0
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1269
    const/16 v8, 0x11

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 1270
    const/high16 v8, 0x41400000    # 12.0f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1271
    if-eqz v2, :cond_1

    sget v5, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_DARK:I

    :cond_1
    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1272
    if-eqz v2, :cond_2

    sget v5, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_LIGHT:I

    goto :goto_1

    :cond_2
    move v5, v6

    :goto_1
    if-eqz v2, :cond_3

    sget v6, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    :cond_3
    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-direct {p0, v5, v6, v9}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1273
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x36

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    const/16 v9, 0x26

    invoke-direct {p0, v9}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v9

    invoke-direct {v5, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1274
    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {v5, v1, v1, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 1275
    invoke-virtual {v0, v7, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1277
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1278
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1279
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v1, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1281
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1282
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->cloudName(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1283
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1284
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1285
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1286
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1288
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1289
    const-string v3, "size"

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v3, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    const-string v3, "docSize"

    invoke-virtual {p1, v3, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    const-string v3, "fileSize"

    invoke-virtual {p1, v3, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1290
    if-eqz v2, :cond_4

    const-string v3, "\u6587\u4ef6\u5939"

    goto :goto_2

    :cond_4
    invoke-direct {p0, v5, v6}, Lcom/codex/iflyinkuploader/MainActivity;->formatBytes(J)Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1291
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1292
    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1293
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1295
    if-eqz v2, :cond_5

    .line 1296
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda16;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 1298
    :cond_5
    const-string v1, "\u4e0b\u8f7d"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 1299
    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 1300
    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda17;

    invoke-direct {v2, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda17;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1301
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x46

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x28

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1303
    :goto_3
    return-object v0
.end method

.method private collectObjects(Ljava/lang/Object;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 1815
    instance-of v0, p1, Lorg/json/JSONArray;

    if-eqz v0, :cond_1

    .line 1816
    check-cast p1, Lorg/json/JSONArray;

    .line 1817
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 1818
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v1

    .line 1819
    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_0

    check-cast v1, Lorg/json/JSONObject;

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1817
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1821
    :cond_1
    instance-of v0, p1, Lorg/json/JSONObject;

    if-eqz v0, :cond_5

    .line 1822
    check-cast p1, Lorg/json/JSONObject;

    .line 1823
    const-string v0, "list"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1824
    if-nez v0, :cond_2

    const-string v0, "records"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1825
    :cond_2
    if-nez v0, :cond_3

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1826
    :cond_3
    if-eqz v0, :cond_4

    .line 1827
    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectObjects(Ljava/lang/Object;Ljava/util/List;)V

    goto :goto_1

    .line 1829
    :cond_4
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1821
    :cond_5
    nop

    .line 1832
    :goto_1
    return-void
.end method

.method private collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 7

    .line 1120
    instance-of v0, p1, Lorg/json/JSONObject;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 1121
    check-cast p1, Lorg/json/JSONObject;

    .line 1122
    const-string v0, "html"

    const-string v2, ""

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "contentText"

    invoke-virtual {p1, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "text"

    invoke-virtual {p1, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "content"

    invoke-virtual {p1, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    aput-object v0, v6, v1

    const/4 v0, 0x1

    aput-object v3, v6, v0

    const/4 v0, 0x2

    aput-object v4, v6, v0

    const/4 v0, 0x3

    aput-object v2, v6, v0

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "pages"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_pre_blocks

    invoke-direct {p0, v1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_pre_blocks
    const-string v1, "blocks"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_pre_children

    invoke-direct {p0, v1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_pre_children
    const-string v1, "children"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_pre_text

    invoke-direct {p0, v1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_pre_text
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_do_text

    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->appendImageIfPresent(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V

    return-void

    .line 1123
    :cond_do_text
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->looksLikeJson(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->htmlFragment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1124
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->appendImageIfPresent(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V

    .line 1125
    const-string v0, "pages"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1126
    if-eqz v0, :cond_1

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 1127
    :cond_1
    const-string v0, "blocks"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1128
    if-eqz v0, :cond_2

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 1129
    :cond_2
    const-string v0, "children"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1130
    if-eqz v0, :cond_3

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 1131
    :cond_3
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1132
    if-eqz v0, :cond_4

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 1133
    :cond_4
    const-string v0, "src"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1134
    if-eqz v0, :cond_5

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->appendImageIfPresent(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V

    .line 1135
    :cond_5
    const-string v0, "paramsJSON"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 1136
    if-eqz p1, :cond_7

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    .line 1137
    :cond_6
    instance-of v0, p1, Lorg/json/JSONArray;

    if-eqz v0, :cond_7

    .line 1138
    check-cast p1, Lorg/json/JSONArray;

    .line 1139
    nop

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v1, v0, :cond_8

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1137
    :cond_7
    :goto_1
    nop

    .line 1141
    :cond_8
    return-void
.end method

.method private compact(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1985
    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    .line 1986
    :cond_0
    nop

    .line 1987
    const-string v0, "(\"(?:access_token|refresh_token|userToken|refreshToken|token)\"\\s*:\\s*\")[^\"]+\""

    const-string v1, "$1***\""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1988
    const-string v0, "([?&](?:access_token|refresh_token|token)=)[^&]+"

    const-string v1, "$1***"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1989
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x258

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "..."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1990
    :cond_1
    return-object p1
.end method

.method private configureSystemBars()V
    .locals 4

    .line 280
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 281
    const/16 v1, 0xfb

    const/16 v2, 0xff

    const/16 v3, 0xf7

    invoke-static {v3, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    .line 282
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 283
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 284
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_1

    .line 285
    nop

    .line 286
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    .line 287
    const/16 v1, 0x2010

    goto :goto_0

    .line 286
    :cond_0
    const/16 v1, 0x2000

    .line 289
    :goto_0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 291
    :cond_1
    return-void
.end method

.method private confirmDownload(Lorg/json/JSONObject;)V
    .locals 4

    .line 1324
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->cloudName(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    .line 1325
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1326
    const-string v2, "\u4e0b\u8f7d\u6587\u4ef6"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5c06\u6587\u4ef6\u4e0b\u8f7d\u5230\u624b\u673a Download \u76ee\u5f55\uff1a\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1327
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1328
    const-string v1, "\u53d6\u6d88"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Lorg/json/JSONObject;)V

    .line 1329
    const-string p1, "\u786e\u8ba4\u4e0b\u8f7d"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 1330
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1331
    return-void
.end method

.method private confirmLogout()V
    .locals 3

    .line 587
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 588
    const-string v1, "\u6ce8\u9500\u767b\u5f55"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 589
    const-string v1, "\u786e\u8ba4\u9000\u51fa\u5f53\u524d\u8d26\u53f7\u5417\uff1f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 590
    const-string v1, "\u53d6\u6d88"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda42;

    invoke-direct {v1, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda42;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    .line 591
    const-string v2, "\u786e\u8ba4\u6ce8\u9500"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 592
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 593
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda43;

    invoke-direct {v1, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda43;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 597
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 598
    return-void
.end method

.method private digest(Landroid/net/Uri;)Lcom/codex/iflyinkuploader/MainActivity$DigestResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1627
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 1628
    nop

    .line 1629
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    .line 1630
    const/high16 v1, 0x40000

    :try_start_0
    new-array v1, v1, [B

    const-wide/16 v2, 0x0

    .line 1632
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 1633
    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5, v4}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1634
    int-to-long v4, v4

    add-long/2addr v2, v4

    goto :goto_0

    .line 1636
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 1637
    :cond_1
    new-instance p1, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->hex([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0, v2, v3}, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;-><init>(Ljava/lang/String;J)V

    return-object p1

    .line 1629
    :catchall_0
    move-exception v0

    if-eqz p1, :cond_2

    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    invoke-static {v0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method private downloadCloudFile(Lorg/json/JSONObject;)V
    .locals 2

    .line 1334
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    const-string v1, "\u6b63\u5728\u83b7\u53d6\u4e0b\u8f7d\u94fe\u63a5..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1335
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda48;

    invoke-direct {v1, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda48;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Lorg/json/JSONObject;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1354
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1355
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 543
    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private emptyRow(Ljava/lang/String;)Landroid/view/View;
    .locals 5

    .line 1872
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1873
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1874
    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1875
    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1876
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 1877
    const/16 p1, 0xc

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/16 v2, 0x16

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1878
    sget v1, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p1

    const/4 v2, -0x1

    invoke-direct {p0, v2, v1, p1}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1879
    return-object v0
.end method

.method private encryptPassword(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1702
    const-string v0, "DES/ECB/PKCS5Padding"

    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 1703
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    const-string v2, "CYS-b8f8"

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    const-string v3, "DES"

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 1704
    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 1705
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->hex([B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private escapeHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1863
    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    .line 1864
    :cond_0
    const-string v0, "&"

    const-string v1, "&amp;"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1865
    const-string v0, "<"

    const-string v1, "&lt;"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1866
    const-string v0, ">"

    const-string v1, "&gt;"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1867
    const-string v0, "\""

    const-string v1, "&quot;"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1868
    const-string v0, "\'"

    const-string v1, "&#39;"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1864
    return-object p1
.end method

.method private extension(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1621
    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1622
    if-gez v0, :cond_0

    const-string p1, ""

    return-object p1

    .line 1623
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private extractDownloadUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1925
    const-string v0, "url"

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1926
    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1927
    if-eqz v1, :cond_1

    .line 1928
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1929
    const-string v3, ""

    if-eqz v2, :cond_0

    :try_start_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1930
    :cond_0
    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1931
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v2, :cond_1

    return-object v1

    .line 1934
    :cond_1
    goto :goto_0

    .line 1933
    :catch_0
    move-exception v1

    .line 1935
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private extractInt(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 0

    .line 1774
    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->extractRaw(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1775
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    return p3

    .line 1777
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 1778
    :catch_0
    move-exception p1

    .line 1779
    return p3
.end method

.method private extractObjectList(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 1805
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1807
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1808
    const-string p1, "data"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->collectObjects(Ljava/lang/Object;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1810
    goto :goto_0

    .line 1809
    :catch_0
    move-exception p1

    .line 1811
    :goto_0
    return-object v0
.end method

.method private extractRaw(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1965
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1966
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1967
    const-string v1, ""

    if-gez v0, :cond_0

    return-object v1

    .line 1968
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v0, p2

    const/16 p2, 0x3a

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result p2

    .line 1969
    if-gez p2, :cond_1

    return-object v1

    .line 1970
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 1971
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p2, v0, :cond_2

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 1972
    :cond_2
    move v0, p2

    .line 1973
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_3

    const-string v1, "-0123456789"

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_3

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1974
    :cond_3
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 1939
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1940
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1941
    const-string v1, ""

    if-gez v0, :cond_0

    return-object v1

    .line 1942
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v0, p2

    const/16 p2, 0x3a

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result p2

    .line 1943
    if-gez p2, :cond_1

    return-object v1

    .line 1944
    :cond_1
    const/4 v0, 0x1

    add-int/2addr p2, v0

    const/16 v2, 0x22

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->indexOf(II)I

    move-result p2

    .line 1945
    if-gez p2, :cond_2

    return-object v1

    .line 1946
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1947
    nop

    .line 1948
    add-int/2addr p2, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge p2, v6, :cond_6

    .line 1949
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 1950
    if-eqz v5, :cond_3

    .line 1951
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1952
    const/4 v5, 0x0

    goto :goto_1

    .line 1953
    :cond_3
    const/16 v7, 0x5c

    if-ne v6, v7, :cond_4

    .line 1954
    const/4 v5, 0x1

    goto :goto_1

    .line 1955
    :cond_4
    if-ne v6, v2, :cond_5

    .line 1956
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1958
    :cond_5
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1948
    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 1961
    :cond_6
    return-object v1
.end method

.method private fetchAllNotes()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 903
    nop

    .line 904
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 905
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    const-string v2, "userId"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    const-string v1, "syntime"

    const-string v3, "0"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 907
    const-string v4, "supportType"

    const-string v5, "1,2,10,21,20"

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    const-string v6, "http://api.iflyink.com/xbew-api/note/dxk/getAllNotePages"

    invoke-direct {p0, v6, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 909
    iget v6, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/4 v7, 0x1

    const/16 v8, 0xc8

    if-ne v6, v8, :cond_0

    iget-object v0, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    const-string v6, "pages"

    invoke-direct {p0, v0, v6, v7}, Lcom/codex/iflyinkuploader/MainActivity;->extractInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 911
    :goto_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 912
    nop

    :goto_1
    if-gt v7, v0, :cond_2

    const/16 v9, 0x14

    if-gt v7, v9, :cond_2

    .line 913
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    .line 914
    iget-object v10, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-interface {v9, v2, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    const-string v10, "page"

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 916
    const-string v10, "sn"

    iget-object v11, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    invoke-interface {v9, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    invoke-interface {v9, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 918
    invoke-interface {v9, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 919
    const-string v10, "http://api.iflyink.com/xbew-api/note/dxk/getAllNoteByPage"

    invoke-direct {p0, v10, v9}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v9

    .line 920
    iget v10, v9, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    if-ne v10, v8, :cond_1

    iget-object v9, v9, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, v9}, Lcom/codex/iflyinkuploader/MainActivity;->extractObjectList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 912
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 922
    :cond_2
    return-object v6
.end method

.method private fetchCloudItems(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1230
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1231
    const-string v1, "userId"

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1232
    const-string v1, "page"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1233
    const-string v1, "limit"

    const-string v2, "10000"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1234
    const-string v1, "type"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1235
    const-string v1, "dirId"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1236
    const-string p1, "name"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1237
    const-string p1, "sortField"

    const-string v1, "updateTime"

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1238
    const-string p1, "sortType"

    const-string v1, "descending"

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1239
    const-string p1, "http://api.iflyink.com/xbew-api/note/doc/getCloudFileList"

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object p1

    .line 1240
    iget v0, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 1241
    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->extractObjectList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 1240
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private fetchNoteDirs()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 889
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 890
    const-string v1, "userId"

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    const-string v1, "http://api.iflyink.com/xbew-api/note/dir/getListAllByUserIdPc"

    invoke-direct {p0, v1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 892
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 893
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 894
    const-string v3, "dirId"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 895
    const-string v3, "dirName"

    const-string v4, "\u5168\u90e8"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 896
    const-string v3, "level"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 897
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 898
    iget v2, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_0

    iget-object v0, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->extractObjectList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 899
    :cond_0
    return-object v1
.end method

.method private fetchNoteDetailRaw(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v1, "id"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "http://api.iflyink.com/xbew-api/note/dxk/getNoteDetail"

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object p1

    iget v0, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7b14\u8bb0\u8be6\u60c5\u83b7\u53d6\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private applyNoteDetailCache(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3

    const-string v0, "\u7b14\u8bb0\u8be6\u60c5"

    invoke-direct {p0, p2, v0}, Lcom/codex/iflyinkuploader/MainActivity;->noteDetailTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_0
    const-string v1, "__title"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string v0, "__rawDetail"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "__html"

    invoke-direct {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->noteHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 3

    instance-of v0, p1, Lorg/json/JSONObject;

    if-eqz v0, :cond_json_array

    check-cast p1, Lorg/json/JSONObject;

    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->appendImageIfPresent(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V

    const-string v0, "pages"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_blocks

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_blocks
    const-string v0, "blocks"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_children

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_children
    const-string v0, "children"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_content

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_content
    const-string v0, "content"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_src

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_src
    const-string v0, "src"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_params

    invoke-direct {p0, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    :cond_params
    const-string v0, "paramsJSON"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_done

    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    goto :cond_done

    :cond_json_array
    instance-of v0, p1, Lorg/json/JSONArray;

    if-eqz v0, :cond_done

    check-cast p1, Lorg/json/JSONArray;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_done

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_done
    return-void
.end method

.method private warmNoteDetailCache(Ljava/util/List;)V
    .locals 4

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "noteId"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "id"

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    :try_start_0
    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->fetchNoteDetailRaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->applyNoteDetailCache(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    :cond_0
    goto :goto_0

    :cond_1
    return-void
.end method

.method private fileExtLabel(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 6

    .line 1902
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "fileExt"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v3, "docExt"

    aput-object v3, v0, v2

    const/4 v3, 0x2

    const-string v4, "docType"

    aput-object v4, v0, v3

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->cloudName(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->extension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v4, "."

    const-string v5, ""

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    new-array v3, v3, [Ljava/lang/String;

    aput-object v0, v3, v1

    aput-object p1, v3, v2

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1903
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "\u6587\u4ef6"

    return-object p1

    .line 1904
    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private fileRow(ILcom/codex/iflyinkuploader/MainActivity$SelectedFile;)Landroid/view/View;
    .locals 8

    .line 807
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 808
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 809
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 810
    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    const/16 v4, 0xa

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 811
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    const/4 v5, -0x1

    invoke-direct {p0, v5, v3, v2}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 812
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 813
    const/4 v6, 0x5

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v2, v1, v7, v1, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 814
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 816
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 817
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 818
    const/16 p1, 0x11

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 819
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 820
    const/high16 p1, 0x41500000    # 13.0f

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 821
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 822
    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->BLUE:I

    sget v5, Lcom/codex/iflyinkuploader/MainActivity;->BLUE:I

    const/16 v6, 0xf

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, p1, v5, v6}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 823
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x1e

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p1, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 824
    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {p1, v1, v1, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 825
    invoke-virtual {v0, v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 827
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 828
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 829
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 831
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 832
    iget-object v3, p2, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 833
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 834
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 835
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 836
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 838
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 839
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p2, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->extension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "."

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p2, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->size:J

    invoke-direct {p0, v3, v4}, Lcom/codex/iflyinkuploader/MainActivity;->formatBytes(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 840
    sget p2, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 841
    const/high16 p2, 0x41400000    # 12.0f

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 842
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 843
    return-object v0
.end method

.method private fileTypeColor(Lorg/json/JSONObject;)I
    .locals 2

    .line 1908
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->fileExtLabel(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 1909
    const-string v0, "pdf"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, 0xec

    const/16 v0, 0x52

    invoke-static {p1, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    .line 1910
    :cond_0
    const-string v0, "doc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "docx"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "word"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_4

    .line 1911
    :cond_1
    const-string v0, "ppt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x34

    if-nez v0, :cond_9

    const-string v0, "pptx"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_3

    .line 1912
    :cond_2
    const-string v0, "xls"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "xlsx"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "excel"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_2

    .line 1913
    :cond_3
    const-string v0, "epub"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "mobi"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "azw3"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "txt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    .line 1914
    :cond_4
    const-string v0, "jpg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "jpeg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "png"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    .line 1915
    :cond_5
    const/16 p1, 0x7c

    const/16 v0, 0x94

    const/16 v1, 0x66

    invoke-static {v1, p1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    .line 1914
    :cond_6
    :goto_0
    const/16 p1, 0xa9

    const/16 v0, 0xb9

    const/16 v1, 0x2a

    invoke-static {v1, p1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    .line 1913
    :cond_7
    :goto_1
    const/16 p1, 0x64

    const/16 v0, 0xd6

    const/16 v1, 0x84

    invoke-static {v1, p1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    .line 1912
    :cond_8
    :goto_2
    const/16 p1, 0xa4

    const/16 v0, 0x62

    invoke-static {v1, p1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    .line 1911
    :cond_9
    :goto_3
    const/16 p1, 0xeb

    const/16 v0, 0x83

    invoke-static {p1, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    .line 1910
    :cond_a
    :goto_4
    const/16 p1, 0x7e

    const/16 v0, 0xe8

    const/16 v1, 0x43

    invoke-static {v1, p1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1
.end method

.method private varargs firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1978
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1979
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    return-object v2

    .line 1978
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1981
    :cond_1
    const-string p1, ""

    return-object p1
.end method

.method private formEncode(Ljava/util/Map;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1715
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1716
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1717
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-static {v3, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1718
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1717
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1719
    goto :goto_0

    .line 1720
    :cond_0
    const-string p1, "&"

    invoke-static {p1, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport1;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private formatBytes(J)Ljava/lang/String;
    .locals 5

    .line 847
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    const-string p1, "\u672a\u77e5\u5927\u5c0f"

    return-object p1

    .line 848
    :cond_0
    const-wide/16 v0, 0x400

    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " B"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 849
    :cond_1
    long-to-double p1, p1

    const-wide/high16 v0, 0x4090000000000000L    # 1024.0

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p1, v0

    .line 850
    const/4 v2, 0x0

    const/4 v3, 0x1

    cmpg-double v4, p1, v0

    if-gez v4, :cond_2

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "%.1f KB"

    invoke-static {v0, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 851
    :cond_2
    div-double/2addr p1, v0

    .line 852
    cmpg-double v4, p1, v0

    if-gez v4, :cond_3

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "%.1f MB"

    invoke-static {v0, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 853
    :cond_3
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-double/2addr p1, v0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "%.1f GB"

    invoke-static {v4, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getNavigationBarHeight()I
    .locals 4

    .line 294
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "dimen"

    const-string v2, "android"

    const-string v3, "navigation_bar_height"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 295
    if-lez v0, :cond_0

    .line 296
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0

    .line 298
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private goCloudParent()V
    .locals 3

    .line 1314
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudDirStack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1315
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    const-string v1, "\u5df2\u5728\u6839\u76ee\u5f55"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1316
    return-void

    .line 1318
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudDirStack:Ljava/util/List;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudDirStack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1319
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudNameStack:Ljava/util/List;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudNameStack:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1320
    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->loadCloud(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1321
    return-void
.end method

.method private handleLoginResponse(Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 697
    iget v0, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_0

    .line 698
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u767b\u5f55\u5931\u8d25: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 699
    return-void

    .line 702
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 703
    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 704
    if-nez v1, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    const-string v2, "detail"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 705
    :goto_0
    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    move-object v1, v2

    .line 706
    :goto_1
    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    move-object v0, v1

    .line 708
    :goto_2
    nop

    .line 709
    const-string v1, "userId"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 710
    const-string v4, "id"

    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 711
    invoke-direct {p0, v5, v1}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    const/4 v3, 0x1

    aput-object v4, v5, v3

    const/4 v4, 0x2

    aput-object v1, v5, v4

    .line 708
    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 712
    nop

    .line 713
    const-string v5, "userToken"

    invoke-virtual {v0, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 714
    invoke-direct {p0, v8, v5}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-array v8, v4, [Ljava/lang/String;

    aput-object v7, v8, v6

    aput-object v5, v8, v3

    .line 712
    invoke-direct {p0, v8}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 715
    nop

    .line 716
    const-string v7, "refreshToken"

    invoke-virtual {v0, v7, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 717
    invoke-direct {p0, v9, v7}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v9, v4, [Ljava/lang/String;

    aput-object v8, v9, v6

    aput-object v7, v9, v3

    .line 715
    invoke-direct {p0, v9}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 718
    nop

    .line 719
    const-string v8, "sn"

    invoke-virtual {v0, v8, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 720
    invoke-direct {p0, p1, v8}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-array v2, v4, [Ljava/lang/String;

    aput-object v0, v2, v6

    aput-object p1, v2, v3

    .line 718
    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 722
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_3

    .line 727
    :cond_4
    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    .line 728
    iput-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    .line 729
    iput-object v7, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    .line 730
    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    .line 731
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshAccessToken()Z

    .line 732
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->saveSession()V

    .line 733
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->updateLoginStatus()V

    .line 734
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u767b\u5f55\u6210\u529f\uff0cuserId="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 735
    return-void

    .line 723
    :cond_5
    :goto_3
    const-string p1, "\u767b\u5f55\u5931\u8d25: \u8fd4\u56de\u7f3a\u5c11 userId \u6216 userToken"

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 724
    return-void
.end method

.method private hasNoteDirChildren(Ljava/lang/String;)Z
    .locals 9

    .line 995
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 996
    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "parentId"

    aput-object v4, v3, v2

    const-string v4, "pid"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "pId"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    const-string v4, "parentDirId"

    const/4 v7, 0x3

    aput-object v4, v3, v7

    invoke-direct {p0, v1, v3}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v6, [Ljava/lang/String;

    aput-object v3, v4, v2

    const-string v3, "0"

    aput-object v3, v4, v5

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 997
    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "dirId"

    aput-object v8, v7, v2

    const-string v8, "id"

    aput-object v8, v7, v5

    const-string v8, "localId"

    aput-object v8, v7, v6

    invoke-direct {p0, v1, v7}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-array v6, v6, [Ljava/lang/String;

    aput-object v1, v6, v2

    aput-object v3, v6, v5

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 998
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v5

    .line 999
    :cond_0
    goto :goto_0

    .line 1000
    :cond_1
    return v2
.end method

.method private hasRenderedDir(Ljava/lang/String;)Z
    .locals 3

    .line 954
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 955
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 956
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 957
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    return p1

    .line 954
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 959
    :cond_1
    return v0
.end method

.method private hex([B)Ljava/lang/String;
    .locals 7

    .line 1709
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1710
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-byte v4, p1, v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    const-string v4, "%02x"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1711
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private htmlFragment(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1149
    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    .line 1150
    :cond_0
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    .line 1151
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<p>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\n"

    const-string v2, "<br/>"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "</p>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private input(Ljava/lang/String;)Landroid/widget/EditText;
    .locals 4

    .line 435
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 436
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 437
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 438
    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 439
    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 440
    const/16 p1, 0xa4

    const/16 v1, 0xb8

    const/16 v2, 0x91

    invoke-static {v2, p1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 441
    const/16 p1, 0xc

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 442
    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/4 v3, -0x1

    invoke-direct {p0, v3, p1, v1}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 443
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v1, 0x32

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    invoke-direct {p1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 444
    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {p1, v2, v3, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 445
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 446
    return-object v0
.end method

.method private isAllowedDocument(Ljava/lang/String;)Z
    .locals 1

    const/4 p1, 0x1

    return p1
.end method

.method private isCloudDir(Lorg/json/JSONObject;)Z
    .locals 5

    .line 1892
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "docType"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v3, "fileType"

    aput-object v3, v0, v2

    const-string v3, "type"

    const/4 v4, 0x2

    aput-object v3, v0, v4

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1893
    const-string v3, "dir"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "folder"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v2, [Ljava/lang/String;

    const-string v3, "dirName"

    aput-object v3, v0, v1

    .line 1894
    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 1893
    :cond_1
    return v1
.end method

.method static synthetic lambda$confirmLogout$15(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 1

    .line 594
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    sget v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_DARK:I

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 595
    const/4 p1, -0x2

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 596
    return-void
.end method

.method static synthetic lambda$uploadSelectedFiles$41(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1459
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    sget v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_DARK:I

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 1460
    const/4 p1, -0x2

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 1461
    return-void
.end method

.method private loadCloud(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 4

    .line 1203
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1204
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    const-string v1, "\u6b63\u5728\u52a0\u8f7d\u7f51\u76d8..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1205
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "0"

    const/4 v3, 0x1

    aput-object p1, v1, v3

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirId:Ljava/lang/String;

    .line 1206
    new-array p1, v0, [Ljava/lang/String;

    aput-object p2, p1, v2

    const-string p2, "\u5168\u90e8\u6587\u4ef6"

    aput-object p2, p1, v3

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirName:Ljava/lang/String;

    .line 1207
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPathText:Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5f53\u524d\uff1a"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1208
    if-eqz p3, :cond_1

    .line 1209
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudDirStack:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 1210
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudNameStack:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 1212
    :cond_1
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda19;

    invoke-direct {p2, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda19;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1226
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 1227
    return-void
.end method

.method private loadNotes(Z)V
    .locals 1

    .line 857
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 858
    :cond_0
    iget-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->notesLoaded:Z

    if-eqz v0, :cond_1

    if-nez p1, :cond_1

    .line 859
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->renderNoteDirs()V

    .line 860
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->renderNotesForDir(Ljava/lang/String;)V

    .line 861
    return-void

    .line 863
    :cond_1
    iput-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->notesForceRefresh:Z

    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    const-string v0, "\u6b63\u5728\u52a0\u8f7d\u7b14\u8bb0..."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 864
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda35;

    invoke-direct {v0, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda35;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 885
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 886
    return-void
.end method

.method private loadPrefs()V
    .locals 4

    .line 547
    const-string v0, "iflyink_upload"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 548
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    const-string v2, "phone"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 549
    const-string v1, "userId"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    .line 550
    const-string v1, "auth"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    .line 551
    const-string v1, "userToken"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    .line 552
    const-string v1, "refreshToken"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    .line 553
    const-string v1, "sn"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    .line 554
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->updateLoginStatus()V

    .line 555
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 1

    .line 2001
    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2008
    return-void
.end method

.method private loginByCode()V
    .locals 4

    .line 672
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 673
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeEdit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 674
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 675
    const-string v0, "\u8bf7\u5148\u586b\u5199\u624b\u673a\u53f7"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 676
    return-void

    .line 678
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 679
    const-string v0, "\u8bf7\u586b\u5199\u77ed\u4fe1\u9a8c\u8bc1\u7801"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 680
    return-void

    .line 682
    :cond_1
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda2;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 693
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 694
    return-void
.end method

.method private loginByPassword()V
    .locals 4

    .line 647
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 648
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordEdit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 649
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 650
    const-string v0, "\u8bf7\u5148\u586b\u5199\u624b\u673a\u53f7"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 651
    return-void

    .line 653
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 654
    const-string v0, "\u8bf7\u586b\u5199\u5bc6\u7801"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 655
    return-void

    .line 657
    :cond_1
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda18;

    invoke-direct {v3, p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda18;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 668
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 669
    return-void
.end method

.method private logout()V
    .locals 3

    .line 601
    const-string v0, ""

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    .line 602
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    .line 603
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    .line 604
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    .line 605
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    .line 606
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->notesLoaded:Z

    .line 607
    iput-boolean v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudLoaded:Z

    .line 608
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 609
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->allNotes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 610
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 611
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordEdit:Landroid/widget/EditText;

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 612
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeEdit:Landroid/widget/EditText;

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 613
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 614
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 615
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    const-string v1, "\u672a\u9009\u62e9\u6587\u4ef6"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 616
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 617
    :cond_1
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    const-string v1, "\u7b49\u5f85\u4e0a\u4f20"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 618
    :cond_2
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->saveSession()V

    .line 619
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->updateLoginStatus()V

    .line 620
    return-void
.end method

.method private looksLikeJson(Ljava/lang/String;)Z
    .locals 1

    .line 1144
    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1145
    :goto_0
    const-string v0, "{"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "["

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p1, 0x1

    :goto_2
    return p1
.end method

.method private md5Text(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1687
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 1688
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->hex([B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private navButton(Ljava/lang/String;)Landroid/widget/Button;
    .locals 1

    .line 467
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->button(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    .line 468
    const/high16 v0, 0x41600000    # 14.0f

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextSize(F)V

    .line 469
    return-object p1
.end method

.method private normalizeHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1179
    if-nez p1, :cond_0

    const-string p1, ""

    .line 1180
    :cond_0
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\n"

    const-string v1, "<br/>"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1181
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<html><head><meta name=\'viewport\' content=\'width=device-width,initial-scale=1\'/><style>body{font-family:sans-serif;color:#202d3d;line-height:1.65;padding:12px;font-size:15px;}img{max-width:100%;height:auto;}table{max-width:100%;border-collapse:collapse;}td,th{border:1px solid #d7eafa;padding:4px;}pre{white-space:pre-wrap;word-break:break-word;}</style></head><body>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "</body></html>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private noteDetailTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1094
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1095
    const-string p1, "data"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 1096
    if-nez p1, :cond_0

    return-object p2

    .line 1097
    :cond_0
    const-string v0, "prop"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1098
    if-eqz v0, :cond_1

    .line 1099
    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->noteTitle(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1100
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    .line 1102
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->noteTitle(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 1103
    :catch_0
    move-exception p1

    .line 1104
    return-object p2
.end method

.method private noteHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 12

    .line 1072
    const-string v0, "content"

    const-string v1, "contentText"

    const-string v2, "html"

    const-string v3, "</pre>"

    const-string v4, "<pre>"

    const-string v5, ""

    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1073
    const-string v7, "data"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 1074
    if-nez v6, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1075
    :cond_0
    const-string v7, "note"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 1076
    if-nez v7, :cond_1

    move-object v7, v6

    .line 1077
    :cond_1
    nop

    const-string v8, "type"

    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "1"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_not_writing_note

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v7, v8}, Lcom/codex/iflyinkuploader/MainActivity;->collectImagesOnly(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-lez v9, :cond_not_writing_note

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->normalizeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_not_writing_note

    .line 1078
    invoke-virtual {v7, v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1079
    invoke-virtual {v7, v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1080
    invoke-virtual {v7, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "<"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-virtual {v7, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v5

    .line 1081
    :goto_0
    invoke-virtual {v6, v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1082
    invoke-virtual {v6, v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1083
    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->richTextFromJson(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    .line 1084
    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->richTextFromJson(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    const/4 v10, 0x7

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v8, v10, v11

    const/4 v8, 0x1

    aput-object v5, v10, v8

    const/4 v8, 0x2

    aput-object v0, v10, v8

    const/4 v0, 0x3

    aput-object v7, v10, v0

    const/4 v0, 0x4

    aput-object v2, v10, v0

    const/4 v0, 0x5

    aput-object v9, v10, v0

    const/4 v0, 0x6

    aput-object v1, v10, v0

    .line 1077
    invoke-direct {p0, v10}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1085
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->normalizeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1086
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 1087
    :catch_0
    move-exception v0

    .line 1088
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private noteRow(Lorg/json/JSONObject;)Landroid/view/View;
    .locals 8

    .line 1019
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1020
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1021
    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    const/16 v4, 0xa

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v6, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1022
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    const/4 v4, -0x1

    invoke-direct {p0, v4, v3, v2}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1023
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1024
    const/4 v3, 0x5

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 1025
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1027
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1028
    const-string v3, "\u65e0\u6807\u9898"

    invoke-direct {p0, p1, v3}, Lcom/codex/iflyinkuploader/MainActivity;->noteTitle(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1029
    sget v3, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MAIN:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1030
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1031
    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1032
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1034
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1035
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    new-array v4, v1, [Ljava/lang/String;

    const-string v6, "type"

    aput-object v6, v4, v5

    invoke-direct {p0, p1, v4}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->noteTypeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string v6, "summary"

    aput-object v6, v4, v5

    const-string v6, "noteSummary"

    aput-object v6, v4, v1

    const/4 v6, 0x2

    const-string v7, "contentText"

    aput-object v7, v4, v6

    invoke-direct {p0, p1, v4}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v6, v6, [Ljava/lang/String;

    aput-object v4, v6, v5

    const-string v4, "\u70b9\u51fb\u67e5\u770b\u8be6\u60c5"

    aput-object v4, v6, v1

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1036
    sget v1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1037
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1038
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {v2, v5, v1, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1039
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1041
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda10;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1042
    return-object v0
.end method

.method private noteTitle(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1109
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "__title"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v2, "noteName"

    const/4 v3, 0x1

    aput-object v2, v0, v3

    const/4 v2, 0x2

    const-string v3, "noteTitle"

    aput-object v3, v0, v2

    const-string v3, "name"

    const/4 v4, 0x3

    aput-object v3, v0, v4

    const/4 v3, 0x4

    const-string v4, "title"

    aput-object v4, v0, v3

    const-string v4, "fileName"

    const/4 v5, 0x5

    aput-object v4, v0, v5

    const-string v4, "docName"

    const/4 v5, 0x6

    aput-object v4, v0, v5

    const-string v4, "subject"

    const/4 v5, 0x7

    aput-object v4, v0, v5

    const-string v4, "summaryTitle"

    const/16 v5, 0x8

    aput-object v4, v0, v5

    const-string v4, "createTimeText"

    const/16 v5, 0x9

    aput-object v4, v0, v5

    const-string v4, "date"

    const/16 v5, 0xa

    aput-object v4, v0, v5

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x2

    new-array v0, v3, [Ljava/lang/String;

    aput-object p1, v0, v1

    const/4 v2, 0x1

    aput-object p2, v0, v2

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private noteTypeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1883
    const-string v0, "1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "\u5199\u4f5c\u7b14\u8bb0"

    return-object p1

    .line 1884
    :cond_0
    const-string v0, "2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "\u5f55\u97f3\u7b14\u8bb0"

    return-object p1

    .line 1885
    :cond_1
    const-string v0, "10"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "\u6587\u5b57\u7b14\u8bb0"

    return-object p1

    .line 1886
    :cond_2
    const-string v0, "20"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p1, "\u878d\u5408\u7b14\u8bb0"

    return-object p1

    .line 1887
    :cond_3
    const-string v0, "21"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "\u601d\u7ef4\u5bfc\u56fe"

    return-object p1

    .line 1888
    :cond_4
    const-string p1, "\u7b14\u8bb0"

    return-object p1
.end method

.method private varargs objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1835
    const-string v0, ""

    if-nez p1, :cond_0

    return-object v0

    .line 1836
    :cond_0
    array-length v1, p2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p2, v2

    .line 1837
    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1838
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "null"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    return-object v3

    .line 1836
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1840
    :cond_2
    return-object v0
.end method

.method private openCloudDir(Lorg/json/JSONObject;)V
    .locals 5

    .line 1307
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudDirStack:Ljava/util/List;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirId:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1308
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudNameStack:Ljava/util/List;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirName:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1309
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "dirId"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v3, "fileId"

    aput-object v3, v0, v2

    const/4 v3, 0x2

    const-string v4, "id"

    aput-object v4, v0, v3

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-array v3, v3, [Ljava/lang/String;

    aput-object v0, v3, v1

    const-string v0, "0"

    aput-object v0, v3, v2

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1310
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->cloudName(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1, v1}, Lcom/codex/iflyinkuploader/MainActivity;->loadCloud(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1311
    return-void
.end method

.method private varargs optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1793
    const-string v0, ""

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1794
    const/4 p1, 0x0

    :goto_0
    array-length v2, p2

    add-int/lit8 v2, v2, -0x1

    if-ge p1, v2, :cond_1

    .line 1795
    aget-object v2, p2, p1

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1796
    if-nez v1, :cond_0

    return-object v0

    .line 1794
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 1798
    :cond_1
    array-length p1, p2

    add-int/lit8 p1, p1, -0x1

    aget-object p1, p2, p1

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 1799
    :catch_0
    move-exception p1

    .line 1800
    return-object v0
.end method

.method private optRootString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1785
    const-string v0, ""

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 1786
    :catch_0
    move-exception p1

    .line 1787
    return-object v0
.end method

.method private pageStatus(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    .line 473
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 474
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 475
    const/high16 p1, 0x41500000    # 13.0f

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 476
    sget p1, Lcom/codex/iflyinkuploader/MainActivity;->TEXT_MUTED:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 477
    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v1

    const/16 v2, 0x8

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p1

    const/16 v3, 0xa

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v1, v2, p1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 478
    return-object v0
.end method

.method private pickFile()V
    .locals 3

    .line 738
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 739
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 740
    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 741
    const-string v1, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 750
    const/16 v1, 0x65

    invoke-virtual {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 751
    return-void
.end method

.method private postBeforeLogin(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1552
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    const-string v1, ""

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1553
    iget v2, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v3, 0x191

    if-ne v2, v3, :cond_0

    .line 1554
    const-string v2, "\u767b\u5f55\u6001\u8fc7\u671f\uff0c\u6b63\u5728\u5237\u65b0..."

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 1555
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshAccessToken()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1557
    :cond_0
    return-object v0
.end method

.method private postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1641
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 1642
    const-string p2, "istv"

    const-string v1, "s"

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1643
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    .line 1644
    const-string v1, "timestamp"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1645
    const-string v1, "appKey"

    const-string v2, "dxk-pc"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1646
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->randomDigits(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->md5Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "nonce"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1647
    const-string p2, "sign"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->sign(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1648
    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->formEncode(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 1650
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 1651
    const-string v0, "POST"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1652
    const/16 v0, 0x7530

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1653
    const v0, 0x2bf20

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 1654
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 1655
    const-string v0, "Content-Type"

    const-string v1, "application/x-www-form-urlencoded; charset=utf-8;"

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1656
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Authorization"

    invoke-virtual {p1, v0, p3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1657
    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_1

    const-string p3, "userToken"

    invoke-virtual {p1, p3, p4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1658
    :cond_1
    const-string p3, "ainoteVersion"

    const-string p4, ""

    invoke-virtual {p1, p3, p4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1659
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p3

    .line 1660
    :try_start_0
    invoke-virtual {p3, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1661
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V

    .line 1662
    :cond_2
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->readResponse(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object p2

    .line 1663
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    invoke-direct {p0, p2, p1}, Lcom/codex/iflyinkuploader/MainActivity;->responseCode(Ljava/lang/String;I)I

    move-result p1

    .line 1664
    new-instance p3, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    invoke-direct {p3, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;-><init>(ILjava/lang/String;)V

    return-object p3

    .line 1659
    :catchall_0
    move-exception p1

    if-eqz p3, :cond_3

    :try_start_1
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p2

    invoke-static {p1, p2}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    throw p1
.end method

.method private postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1539
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1540
    iget v1, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v2, 0x191

    if-ne v1, v2, :cond_0

    .line 1541
    const-string v1, "\u767b\u5f55\u6001\u8fc7\u671f\uff0c\u6b63\u5728\u5237\u65b0..."

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 1542
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshAccessToken()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1544
    :cond_0
    iget v1, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v2, 0x196

    if-ne v1, v2, :cond_1

    .line 1545
    const-string v1, "userToken \u8fc7\u671f\uff0c\u6b63\u5728\u5237\u65b0..."

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 1546
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshUserToken()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1548
    :cond_1
    return-object v0
.end method

.method private putFile(Ljava/lang/String;Landroid/net/Uri;JIILjava/lang/String;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1724
    move/from16 v0, p6

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    .line 1725
    const-string v1, "PUT"

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1726
    const/16 v1, 0x7530

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1727
    const v1, 0x2bf20

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 1728
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 1729
    const-string v1, "Content-Type"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1730
    const/high16 v1, 0x40000

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 1731
    nop

    .line 1732
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2

    .line 1733
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 1734
    :try_start_1
    new-array v1, v1, [B

    const-wide/16 v3, 0x0

    move-wide v5, v3

    .line 1736
    :goto_0
    invoke-virtual {p2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1

    .line 1737
    const/4 v8, 0x0

    invoke-virtual {v2, v1, v8, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 1738
    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 1739
    cmp-long v7, p3, v3

    if-lez v7, :cond_0

    .line 1740
    const-wide/16 v7, 0x5f

    mul-long v9, v5, v7

    div-long/2addr v9, p3

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    .line 1741
    mul-int/lit8 v9, p5, 0x64

    int-to-long v9, v9

    add-long/2addr v9, v7

    int-to-long v7, v0

    div-long/2addr v9, v7

    const-wide/16 v7, 0x63

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v8, v7

    .line 1742
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u6b63\u5728\u4e0a\u4f20 "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v9, p5, 0x1

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "/"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "\uff1a"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v9, p7

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, "  "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, "%"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v8, v7}, Lcom/codex/iflyinkuploader/MainActivity;->updateProgress(ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1744
    goto :goto_0

    .line 1739
    :cond_0
    move-object/from16 v9, p7

    goto :goto_0

    .line 1746
    :cond_1
    if-eqz v2, :cond_2

    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    .line 1747
    :cond_3
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p2

    .line 1748
    const/16 v0, 0xc8

    if-lt p2, v0, :cond_4

    const/16 v0, 0x12c

    if-ge p2, v0, :cond_4

    .line 1751
    return-void

    .line 1749
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PUT upload failed HTTP "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, ": "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->readResponse(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1732
    :catchall_0
    move-exception v0

    move-object p1, v0

    if-eqz v2, :cond_5

    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-static {p1, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v0

    move-object p1, v0

    if-eqz p2, :cond_6

    :try_start_5
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v0

    move-object p2, v0

    invoke-static {p1, p2}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_6
    :goto_2
    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method private queryName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 6

    .line 1424
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 1425
    if-eqz p1, :cond_2

    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1426
    const-string v0, "_display_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 1427
    if-ltz v0, :cond_2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1429
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1427
    :cond_0
    return-object v0

    .line 1424
    :catchall_0
    move-exception v0

    move-object v1, v0

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v0

    invoke-static {v1, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1

    .line 1429
    :cond_2
    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1430
    :cond_3
    const-string p1, "upload.bin"

    return-object p1
.end method

.method private querySize(Landroid/net/Uri;)J
    .locals 6

    .line 1434
    invoke-virtual {p0}, Lcom/codex/iflyinkuploader/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 1435
    if-eqz p1, :cond_2

    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1436
    const-string v0, "_size"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 1437
    if-ltz v0, :cond_2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1439
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1437
    :cond_0
    return-wide v0

    .line 1434
    :catchall_0
    move-exception v0

    move-object v1, v0

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v0

    invoke-static {v1, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1

    .line 1439
    :cond_2
    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1440
    :cond_3
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private randomDigits(I)Ljava/lang/String;
    .locals 5

    .line 1692
    nop

    .line 1693
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 1694
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1695
    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    .line 1696
    const-string v3, "0123456789"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1695
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1698
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private readResponse(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1754
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v1, 0x190

    if-lt v0, v1, :cond_0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    .line 1755
    :goto_0
    if-nez p1, :cond_1

    const-string p1, ""

    return-object p1

    .line 1756
    :cond_1
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 1757
    :try_start_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1759
    :goto_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1760
    :cond_2
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1761
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 1760
    return-object p1

    .line 1756
    :catchall_0
    move-exception p1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    invoke-static {p1, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_2
    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method private refreshAccessToken()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1561
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    const-string v3, "http://api.iflyink.com/xbew-api/auth/oauth/token"

    invoke-direct {p0, v3, v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1562
    iget v1, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v2, 0xc8

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    return v3

    .line 1563
    :cond_0
    iget-object v1, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 1564
    const-string v2, "access_token"

    invoke-direct {p0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->optRootString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v4, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/String;

    const-string v7, "data"

    aput-object v7, v6, v3

    const/4 v8, 0x1

    aput-object v2, v6, v8

    .line 1565
    invoke-direct {p0, v4, v6}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v6, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    new-array v9, v5, [Ljava/lang/String;

    aput-object v7, v9, v3

    const-string v7, "token"

    aput-object v7, v9, v8

    .line 1566
    invoke-direct {p0, v6, v9}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v0, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 1567
    invoke-direct {p0, v0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    aput-object v1, v2, v3

    aput-object v4, v2, v8

    aput-object v6, v2, v5

    const/4 v1, 0x3

    aput-object v0, v2, v1

    .line 1563
    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1568
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    return v3

    .line 1569
    :cond_1
    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    .line 1570
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->saveSession()V

    .line 1571
    return v8
.end method

.method private refreshUserToken()Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1575
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 1576
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1577
    const-string v2, "userId"

    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1578
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    const-string v3, "refreshToken"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1579
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    const-string v4, "sn"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1580
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    iget-object v5, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    const-string v6, "http://api.iflyink.com/xbew-api/user/refreshToken"

    invoke-direct {p0, v6, v0, v2, v5}, Lcom/codex/iflyinkuploader/MainActivity;->postSigned(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1581
    iget v2, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v5, 0xc8

    if-eq v2, v5, :cond_1

    return v1

    .line 1582
    :cond_1
    iget-object v2, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v6, v5, [Ljava/lang/String;

    const-string v7, "data"

    aput-object v7, v6, v1

    const/4 v8, 0x1

    const-string v9, "detail"

    aput-object v9, v6, v8

    const/4 v10, 0x2

    const-string v11, "userToken"

    aput-object v11, v6, v10

    .line 1583
    invoke-direct {p0, v2, v6}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v6, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    new-array v12, v10, [Ljava/lang/String;

    aput-object v7, v12, v1

    aput-object v11, v12, v8

    .line 1584
    invoke-direct {p0, v6, v12}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v12, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 1585
    invoke-direct {p0, v12, v11}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-array v12, v5, [Ljava/lang/String;

    aput-object v2, v12, v1

    aput-object v6, v12, v8

    aput-object v11, v12, v10

    .line 1582
    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1586
    iget-object v6, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    new-array v11, v5, [Ljava/lang/String;

    aput-object v7, v11, v1

    aput-object v9, v11, v8

    aput-object v3, v11, v10

    .line 1587
    invoke-direct {p0, v6, v11}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v11, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    new-array v12, v10, [Ljava/lang/String;

    aput-object v7, v12, v1

    aput-object v3, v12, v8

    .line 1588
    invoke-direct {p0, v11, v12}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iget-object v12, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 1589
    invoke-direct {p0, v12, v3}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-array v12, v5, [Ljava/lang/String;

    aput-object v6, v12, v1

    aput-object v11, v12, v8

    aput-object v3, v12, v10

    .line 1586
    invoke-direct {p0, v12}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1590
    iget-object v6, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    new-array v11, v5, [Ljava/lang/String;

    aput-object v7, v11, v1

    aput-object v9, v11, v8

    aput-object v4, v11, v10

    .line 1591
    invoke-direct {p0, v6, v11}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v9, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    new-array v11, v10, [Ljava/lang/String;

    aput-object v7, v11, v1

    aput-object v4, v11, v8

    .line 1592
    invoke-direct {p0, v9, v11}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v0, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 1593
    invoke-direct {p0, v0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-array v4, v5, [Ljava/lang/String;

    aput-object v6, v4, v1

    aput-object v7, v4, v8

    aput-object v0, v4, v10

    .line 1590
    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1594
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    return v1

    .line 1595
    :cond_2
    iput-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    .line 1596
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iput-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    .line 1597
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    iput-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    .line 1598
    :cond_4
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->saveSession()V

    .line 1599
    return v8

    .line 1575
    :cond_5
    :goto_0
    return v1
.end method

.method private renderCloudItems()V
    .locals 3

    .line 1245
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1246
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1247
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudListLayout:Landroid/widget/LinearLayout;

    const-string v1, "\u5f53\u524d\u76ee\u5f55\u6682\u65e0\u6587\u4ef6"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->emptyRow(Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1248
    return-void

    .line 1250
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 1251
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudListLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->cloudRow(Lorg/json/JSONObject;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1252
    goto :goto_0

    .line 1253
    :cond_1
    return-void
.end method

.method private renderNoteDirChildren(Ljava/lang/String;I)V
    .locals 10

    .line 939
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 940
    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "dirId"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "id"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "localId"

    const/4 v7, 0x2

    aput-object v4, v3, v7

    invoke-direct {p0, v1, v3}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v7, [Ljava/lang/String;

    aput-object v3, v4, v5

    const-string v3, "0"

    aput-object v3, v4, v6

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 941
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 942
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-nez p2, :cond_0

    invoke-direct {p0, v1, v5}, Lcom/codex/iflyinkuploader/MainActivity;->addNoteDirRow(Lorg/json/JSONObject;I)V

    goto :goto_0

    .line 945
    :cond_1
    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/String;

    const-string v9, "parentId"

    aput-object v9, v8, v5

    const-string v9, "pid"

    aput-object v9, v8, v6

    const-string v9, "pId"

    aput-object v9, v8, v7

    const-string v9, "parentDirId"

    aput-object v9, v8, v2

    invoke-direct {p0, v1, v8}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-array v7, v7, [Ljava/lang/String;

    aput-object v2, v7, v5

    aput-object v3, v7, v6

    invoke-direct {p0, v7}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 946
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->hasRenderedDir(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 947
    invoke-direct {p0, v1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->addNoteDirRow(Lorg/json/JSONObject;I)V

    .line 948
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    add-int/lit8 v1, p2, 0x1

    invoke-direct {p0, v4, v1}, Lcom/codex/iflyinkuploader/MainActivity;->renderNoteDirChildren(Ljava/lang/String;I)V

    .line 950
    :cond_2
    goto :goto_0

    .line 951
    :cond_3
    return-void
.end method

.method private renderNoteDirs()V
    .locals 10

    .line 926
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 927
    const-string v0, "0"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->renderNoteDirChildren(Ljava/lang/String;I)V

    .line 928
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 929
    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/String;

    const-string v6, "dirId"

    aput-object v6, v5, v1

    const-string v6, "id"

    const/4 v7, 0x1

    aput-object v6, v5, v7

    const-string v6, "localId"

    const/4 v8, 0x2

    aput-object v6, v5, v8

    invoke-direct {p0, v3, v5}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v8, [Ljava/lang/String;

    aput-object v5, v6, v1

    aput-object v0, v6, v7

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 930
    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const-string v9, "parentId"

    aput-object v9, v6, v1

    const-string v9, "pid"

    aput-object v9, v6, v7

    const-string v9, "pId"

    aput-object v9, v6, v8

    const-string v9, "parentDirId"

    aput-object v9, v6, v4

    invoke-direct {p0, v3, v6}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v6, v8, [Ljava/lang/String;

    aput-object v4, v6, v1

    aput-object v0, v6, v7

    invoke-direct {p0, v6}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 931
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->hasRenderedDir(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 932
    invoke-direct {p0, v3, v1}, Lcom/codex/iflyinkuploader/MainActivity;->addNoteDirRow(Lorg/json/JSONObject;I)V

    .line 933
    invoke-direct {p0, v5, v7}, Lcom/codex/iflyinkuploader/MainActivity;->renderNoteDirChildren(Ljava/lang/String;I)V

    .line 935
    :cond_0
    goto :goto_0

    .line 936
    :cond_1
    return-void
.end method

.method private renderNotesForDir(Ljava/lang/String;)V
    .locals 8

    .line 1004
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1005
    nop

    .line 1006
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->allNotes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 1007
    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/String;

    const-string v6, "dir"

    aput-object v6, v5, v1

    const-string v6, "dirId"

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-direct {p0, v3, v5}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-array v4, v4, [Ljava/lang/String;

    aput-object v5, v4, v1

    const-string v5, "0"

    aput-object v5, v4, v7

    invoke-direct {p0, v4}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1008
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0

    .line 1009
    :cond_0
    iget-object v4, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteListLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->noteRow(Lorg/json/JSONObject;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1010
    add-int/lit8 v2, v2, 0x1

    .line 1011
    goto :goto_0

    .line 1012
    :cond_1
    if-nez v2, :cond_2

    .line 1013
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteListLayout:Landroid/widget/LinearLayout;

    const-string v0, "\u8fd9\u4e2a\u6587\u4ef6\u5939\u6682\u65e0\u7b14\u8bb0"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->emptyRow(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1015
    :cond_2
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f53\u524d\u663e\u793a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u6761\u7b14\u8bb0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1016
    return-void
.end method

.method private repeat(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1844
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1845
    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1846
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private responseCode(Ljava/lang/String;I)I
    .locals 3

    .line 1766
    const-string v0, "code"

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1767
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 1769
    :cond_0
    goto :goto_0

    .line 1768
    :catch_0
    move-exception v1

    .line 1770
    :goto_0
    invoke-direct {p0, p1, v0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->extractInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private richTextFromJson(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    .line 1114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1115
    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->collectRichText(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 1116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private rounded(III)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 498
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 499
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 500
    int-to-float p1, p3

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 501
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result p1

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 502
    return-object v0
.end method

.method private safeFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1919
    const-string v0, "[\\\\/:*?\"<>|]"

    const-string v1, "_"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1920
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "download.bin"

    :cond_0
    return-object p1
.end method

.method private saveSession()V
    .locals 3

    .line 558
    const-string v0, "iflyink_upload"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    .line 559
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "phone"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    .line 560
    const-string v2, "userId"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    .line 561
    const-string v2, "auth"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    .line 562
    const-string v2, "userToken"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->refreshToken:Ljava/lang/String;

    .line 563
    const-string v2, "refreshToken"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->sn:Ljava/lang/String;

    .line 564
    const-string v2, "sn"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 565
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 566
    return-void
.end method

.method private sendSmsCode()V
    .locals 3

    .line 623
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->phoneEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 624
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 625
    const-string v0, "\u8bf7\u5148\u586b\u5199\u624b\u673a\u53f7"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 626
    return-void

    .line 628
    :cond_0
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->saveSession()V

    .line 629
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda8;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 643
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 644
    return-void
.end method

.method private showDownloadSuccessToast()V
    .locals 5

    .line 1418
    const-string v0, "\u6210\u529f\u4e0b\u8f7d"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1419
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1420
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->mainHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda4;-><init>(Landroid/widget/Toast;)V

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1421
    return-void
.end method

.method private showNoteDetail(Lorg/json/JSONObject;)V
    .locals 4

    move-object v3, p1

    .line 1046
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "noteId"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "id"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1047
    const-string v1, "\u7b14\u8bb0\u8be6\u60c5"

    invoke-direct {p0, p1, v1}, Lcom/codex/iflyinkuploader/MainActivity;->noteTitle(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "__html"

    const-string p1, ""

    invoke-virtual {v3, v2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_cache_miss

    invoke-direct {p0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->showRichNoteDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1048
    :cond_cache_miss
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1049
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<pre>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "</pre>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lcom/codex/iflyinkuploader/MainActivity;->showRichNoteDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1050
    return-void

    .line 1052
    :cond_0
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    const-string v2, "\u6b63\u5728\u52a0\u8f7d\u7b14\u8bb0\u8be6\u60c5..."

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1053
    new-instance p1, Ljava/lang/Thread;

    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda11;

    invoke-direct {v2, p0, v0, v1, v3}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda11;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {p1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1067
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 1068
    return-void
.end method

.method private showRichNoteDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1187
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 1188
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 1189
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 1190
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 1191
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 1192
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 1193
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 1194
    const-string v4, "UTF-8"

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-string v3, "text/html"

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1195
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1196
    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 1197
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 1198
    const-string p2, "\u5173\u95ed"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 1199
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1200
    return-void
.end method

.method private showSuccessToast()V
    .locals 1

    .line 2011
    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda47;

    invoke-direct {v0, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda47;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2017
    return-void
.end method

.method private sign(Ljava/util/Map;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1668
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1669
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1670
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1671
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1672
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1673
    const-string v4, "sign"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1674
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1676
    :cond_0
    goto :goto_0

    .line 1677
    :cond_1
    const-string p1, "secret"

    const-string v1, "2c8e320f948911eca3fafa163ec9"

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1678
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1679
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1680
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1681
    goto :goto_1

    .line 1682
    :cond_2
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 1683
    const-string v1, "&"

    invoke-static {v1, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport1;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->hex([B)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private startDirectDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1358
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1359
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5f00\u59cb\u4e0b\u8f7d\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1360
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, p2, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda15;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1390
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1391
    return-void
.end method

.method private startUploadSelectedFiles()V
    .locals 2

    .line 1466
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    .line 1467
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1468
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    const-string v1, "\u51c6\u5907\u4e0a\u4f20..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1469
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda34;

    invoke-direct {v1, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda34;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1493
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1494
    return-void
.end method

.method private stripHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1850
    const-string v0, ""

    if-nez p1, :cond_0

    return-object v0

    .line 1851
    :cond_0
    nop

    .line 1852
    const-string v1, "\\n"

    const-string v2, "\n"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1853
    const-string v1, "<br\\s*/?>"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1854
    const-string v1, "<[^>]+>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1855
    const-string v0, "&nbsp;"

    const-string v1, " "

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1856
    const-string v0, "&lt;"

    const-string v1, "<"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1857
    const-string v0, "&gt;"

    const-string v1, ">"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1858
    const-string v0, "&amp;"

    const-string v1, "&"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1859
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1851
    return-object p1
.end method

.method private styleFilled(Landroid/widget/Button;)V
    .locals 3

    .line 488
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 489
    sget v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE:I

    sget v1, Lcom/codex/iflyinkuploader/MainActivity;->BLUE:I

    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 490
    return-void
.end method

.method private styleNav(Landroid/widget/Button;Z)V
    .locals 0

    .line 534
    if-nez p1, :cond_0

    return-void

    .line 535
    :cond_0
    if-eqz p2, :cond_1

    .line 536
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->styleFilled(Landroid/widget/Button;)V

    goto :goto_0

    .line 538
    :cond_1
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->styleOutlined(Landroid/widget/Button;)V

    .line 540
    :goto_0
    return-void
.end method

.method private styleOutlined(Landroid/widget/Button;)V
    .locals 3

    .line 493
    sget v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_DARK:I

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 494
    sget v0, Lcom/codex/iflyinkuploader/MainActivity;->BLUE_LIGHT:I

    sget v1, Lcom/codex/iflyinkuploader/MainActivity;->BORDER:I

    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->rounded(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 495
    return-void
.end method

.method private switchPage(I)V
    .locals 4

    .line 519
    iput p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentPage:I

    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 522
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploaderPage:Landroid/widget/LinearLayout;

    if-nez p1, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 523
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudPage:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    if-ne p1, v3, :cond_1

    const/4 v1, 0x0

    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 525
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->navUploadButton:Landroid/widget/Button;

    if-nez p1, :cond_2

    const/4 v1, 0x1

    goto :goto_3

    :cond_2
    const/4 v1, 0x0

    :goto_3
    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->styleNav(Landroid/widget/Button;Z)V

    .line 526
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->navCloudButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_3

    const/4 v1, 0x1

    goto :goto_4

    :cond_3
    const/4 v1, 0x0

    :goto_4
    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->styleNav(Landroid/widget/Button;Z)V

    .line 527
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 529
    if-ne p1, v3, :cond_5

    iget-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudLoaded:Z

    if-nez p1, :cond_5

    const-string p1, "0"

    const-string v0, "\u5168\u90e8\u6587\u4ef6"

    invoke-direct {p0, p1, v0, v3}, Lcom/codex/iflyinkuploader/MainActivity;->loadCloud(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 531
    :cond_5
    return-void
.end method

.method private uniqueFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 5

    .line 1394
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1395
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 1396
    :cond_0
    nop

    .line 1397
    nop

    .line 1398
    const/16 v0, 0x2e

    invoke-virtual {p2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1399
    if-lez v0, :cond_1

    .line 1400
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1401
    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    move-object v0, p2

    move-object p2, v1

    goto :goto_0

    .line 1399
    :cond_1
    const-string v0, ""

    .line 1403
    :goto_0
    const/4 v1, 0x1

    :goto_1
    const/16 v2, 0x3e8

    if-ge v1, v2, :cond_3

    .line 1404
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1405
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    return-object v2

    .line 1403
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1407
    :cond_3
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v2, "_"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method private updateCloudProgress(ILjava/lang/String;)V
    .locals 1

    .line 1411
    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda45;

    invoke-direct {v0, p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda45;-><init>(Lcom/codex/iflyinkuploader/MainActivity;ILjava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1415
    return-void
.end method

.method private updateLoginModeUi()V
    .locals 4

    .line 506
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordFields:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    goto :goto_2

    .line 507
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordFields:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 508
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeFields:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    if-eqz v1, :cond_2

    const/16 v2, 0x8

    :cond_2
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 509
    iget-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    if-eqz v0, :cond_3

    .line 510
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordModeButton:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->styleFilled(Landroid/widget/Button;)V

    .line 511
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeModeButton:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->styleOutlined(Landroid/widget/Button;)V

    goto :goto_1

    .line 513
    :cond_3
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordModeButton:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->styleOutlined(Landroid/widget/Button;)V

    .line 514
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->codeModeButton:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->styleFilled(Landroid/widget/Button;)V

    .line 516
    :goto_1
    return-void

    .line 506
    :cond_4
    :goto_2
    return-void
.end method

.method private updateLoginStatus()V
    .locals 1

    .line 569
    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda3;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 584
    return-void
.end method

.method private updateProgress(ILjava/lang/String;)V
    .locals 1

    .line 1994
    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda9;-><init>(Lcom/codex/iflyinkuploader/MainActivity;ILjava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1998
    return-void
.end method

.method private updateSelectedFileText(I)V
    .locals 4

    .line 786
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 787
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 788
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    const-string v1, "\u672a\u9009\u62e9\u6587\u4ef6"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 789
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    if-lez p1, :cond_0

    .line 790
    const-string p1, "\u672a\u9009\u62e9\u6587\u4ef6"

    goto :goto_0

    .line 791
    :cond_0
    const-string p1, "\u8bf7\u9009\u62e9\u8981\u4e0a\u4f20\u7684\u6587\u4ef6"

    .line 789
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 792
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    const-string v0, "\u7b49\u5f85\u4e0a\u4f20"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 793
    return-void

    .line 795
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5df2\u9009\u62e9 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u4e2a\u6587\u4ef6"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 796
    if-lez p1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 797
    :cond_2
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileText:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 798
    const/4 p1, 0x0

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 799
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->fileListLayout:Landroid/widget/LinearLayout;

    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;

    invoke-direct {p0, v2, v0}, Lcom/codex/iflyinkuploader/MainActivity;->fileRow(ILcom/codex/iflyinkuploader/MainActivity$SelectedFile;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 798
    move v0, v2

    goto :goto_1

    .line 801
    :cond_3
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    const-string v1, "\u6587\u4ef6\u5c06\u4e0a\u4f20\u5230\u6839\u76ee\u5f55"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 802
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    const-string v1, "\u5c1a\u672a\u5f00\u59cb\u4e0a\u4f20"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 803
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 804
    return-void
.end method

.method private uploadOneFile(Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;II)V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1497
    move-object/from16 v0, p0

    move-object/from16 v8, p1

    move/from16 v6, p3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u6b63\u5728\u4e0a\u4f20 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v9, p2, 0x1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, "/"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, "\uff1a"

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 1498
    mul-int/lit8 v1, p2, 0x64

    div-int/2addr v1, v6

    const/4 v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6b63\u5728\u5904\u7406 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v3}, Lcom/codex/iflyinkuploader/MainActivity;->updateProgress(ILjava/lang/String;)V

    .line 1499
    iget-object v1, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->uri:Landroid/net/Uri;

    invoke-direct {v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->digest(Landroid/net/Uri;)Lcom/codex/iflyinkuploader/MainActivity$DigestResult;

    move-result-object v1

    .line 1500
    iget-wide v3, v1, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;->size:J

    const-wide/16 v12, 0x0

    cmp-long v5, v3, v12

    if-lez v5, :cond_0

    iget-wide v3, v1, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;->size:J

    goto :goto_0

    :cond_0
    iget-wide v3, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->size:J

    .line 1501
    :goto_0
    iget-object v5, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-direct {v0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->extension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1502
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, v1, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;->md5:Ljava/lang/String;

    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v12}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1504
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1505
    iget-object v5, v0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    const-string v13, "userId"

    invoke-interface {v1, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1506
    const-string v5, "dir"

    const-string v7, "attachment"

    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1507
    const-string v5, "objectName"

    invoke-interface {v1, v5, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1508
    const-string v5, "size"

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1509
    const-string v5, "expiration"

    const-string v7, "86400"

    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1510
    const-string v5, "increment"

    const-string v14, "0"

    invoke-interface {v1, v5, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1511
    const-string v5, "http://api.iflyink.com/xbew-api/common/common/getUploadUrl"

    invoke-direct {v0, v5, v1}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v1

    .line 1512
    iget v5, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v15, 0xc8

    if-ne v5, v15, :cond_3

    .line 1515
    iget-object v5, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    const/4 v7, 0x2

    const/16 v16, 0x1

    new-array v2, v7, [Ljava/lang/String;

    const/16 v17, 0x0

    const-string v18, "data"

    aput-object v18, v2, v17

    const-string v15, "url"

    aput-object v15, v2, v16

    .line 1516
    invoke-direct {v0, v5, v2}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    move-object/from16 v19, v2

    new-array v2, v7, [Ljava/lang/String;

    aput-object v18, v2, v17

    const-string v18, "uploadUrl"

    aput-object v18, v2, v16

    .line 1517
    invoke-direct {v0, v5, v2}, Lcom/codex/iflyinkuploader/MainActivity;->optNestedString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 1518
    invoke-direct {v0, v5, v15}, Lcom/codex/iflyinkuploader/MainActivity;->extractString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/String;

    aput-object v19, v15, v17

    aput-object v2, v15, v16

    aput-object v5, v15, v7

    .line 1515
    invoke-direct {v0, v15}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1519
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1523
    move-object v1, v2

    iget-object v2, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->uri:Landroid/net/Uri;

    iget-object v7, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    move/from16 v5, p2

    invoke-direct/range {v0 .. v7}, Lcom/codex/iflyinkuploader/MainActivity;->putFile(Ljava/lang/String;Landroid/net/Uri;JIILjava/lang/String;)V

    .line 1525
    invoke-direct {v0, v8, v12, v3, v4}, Lcom/codex/iflyinkuploader/MainActivity;->buildDocJson(Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v1

    .line 1526
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1527
    iget-object v3, v0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-interface {v2, v13, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1528
    const-string v3, "doc"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1529
    const-string v1, "dirId"

    invoke-interface {v2, v1, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1530
    const-string v1, "checkFileExist"

    const-string v3, "true"

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1531
    const-string v1, "http://api.iflyink.com/xbew-api/note/doc/addDoc"

    invoke-direct {v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v1

    .line 1532
    iget v2, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 1535
    mul-int/lit8 v1, v9, 0x64

    div-int/2addr v1, v6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5df2\u5b8c\u6210 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v8, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->updateProgress(ILjava/lang/String;)V

    .line 1536
    return-void

    .line 1533
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u767b\u8bb0\u4e91\u76d8\u5931\u8d25: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1520
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u4e0a\u4f20\u5730\u5740\u4e3a\u7a7a: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1513
    :cond_3
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u83b7\u53d6\u4e0a\u4f20\u5730\u5740\u5931\u8d25: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, v1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private uploadSelectedFiles()V
    .locals 4

    .line 1444
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1445
    const-string v0, "\u8bf7\u5148\u9009\u62e9\u6587\u4ef6"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 1446
    return-void

    .line 1448
    :cond_0
    iget-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    if-eqz v0, :cond_1

    .line 1449
    const-string v0, "\u6b63\u5728\u4e0a\u4f20\uff0c\u8bf7\u7a0d\u5019"

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 1450
    return-void

    .line 1452
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1453
    const-string v1, "\u786e\u8ba4\u4e0a\u4f20"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5c06 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    .line 1454
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u4e2a\u6587\u6863\u4e0a\u4f20\u5230\u8bfb\u5199\u4e91\u76d8\u6839\u76ee\u5f55\uff0c\u786e\u8ba4\u7ee7\u7eed\u5417\uff1f"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1455
    const-string v2, "\u53d6\u6d88"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda5;-><init>(Lcom/codex/iflyinkuploader/MainActivity;)V

    .line 1456
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1457
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1458
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda6;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 1462
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1463
    return-void
.end method


# virtual methods
.method synthetic lambda$addNoteDirRow$22$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;ZLandroid/view/View;)V
    .locals 0

    .line 980
    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    .line 981
    if-eqz p2, :cond_1

    .line 982
    iget-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 983
    const-string p2, "0"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 985
    :cond_0
    iget-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 988
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->renderNoteDirs()V

    .line 989
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->renderNotesForDir(Ljava/lang/String;)V

    .line 990
    return-void
.end method

.method synthetic lambda$buildCloudPage$11$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 397
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->goCloudParent()V

    return-void
.end method

.method synthetic lambda$buildCloudPage$12$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 2

    .line 403
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirId:Ljava/lang/String;

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirName:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->loadCloud(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$buildNotePage$8$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 310
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->loadNotes(Z)V

    return-void
.end method

.method synthetic lambda$buildUi$0$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 178
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->confirmLogout()V

    return-void
.end method

.method synthetic lambda$buildUi$1$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 196
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    .line 197
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->updateLoginModeUi()V

    .line 198
    return-void
.end method

.method synthetic lambda$buildUi$2$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 201
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    .line 202
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->updateLoginModeUi()V

    .line 203
    return-void
.end method

.method synthetic lambda$buildUi$3$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 228
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->sendSmsCode()V

    return-void
.end method

.method synthetic lambda$buildUi$4$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 233
    iget-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->passwordLoginMode:Z

    if-eqz p1, :cond_0

    .line 234
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->loginByPassword()V

    goto :goto_0

    .line 236
    :cond_0
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->loginByCode()V

    .line 238
    :goto_0
    return-void
.end method

.method synthetic lambda$buildUi$5$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 265
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->switchPage(I)V

    return-void
.end method

.method synthetic lambda$buildUi$6$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 267
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->switchPage(I)V

    return-void
.end method

.method synthetic lambda$buildUi$7$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 269
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->switchPage(I)V

    return-void
.end method

.method synthetic lambda$buildUploaderPage$10$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 369
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->uploadSelectedFiles()V

    return-void
.end method

.method synthetic lambda$buildUploaderPage$9$com-codex-iflyinkuploader-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 353
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->pickFile()V

    return-void
.end method

.method synthetic lambda$cloudRow$30$com-codex-iflyinkuploader-MainActivity(Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 0

    .line 1296
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->openCloudDir(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$cloudRow$31$com-codex-iflyinkuploader-MainActivity(Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 0

    .line 1300
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->confirmDownload(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$confirmDownload$32$com-codex-iflyinkuploader-MainActivity(Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1329
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->downloadCloudFile(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$confirmLogout$14$com-codex-iflyinkuploader-MainActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 591
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->logout()V

    return-void
.end method

.method synthetic lambda$downloadCloudFile$33$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1350
    invoke-direct {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->cloudName(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->startDirectDownload(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$downloadCloudFile$34$com-codex-iflyinkuploader-MainActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 1352
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u4e0b\u8f7d\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$downloadCloudFile$35$com-codex-iflyinkuploader-MainActivity(Lorg/json/JSONObject;)V
    .locals 7

    .line 1337
    const-string v0, "attachment/"

    const-string v1, "objectName"

    const/4 v2, 0x3

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "url"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v1, v2, v3

    const-string v5, "filePath"

    const/4 v6, 0x2

    aput-object v5, v2, v6

    invoke-direct {p0, p1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->objString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-array v5, v6, [Ljava/lang/String;

    aput-object v2, v5, v4

    const-string v2, ""

    aput-object v2, v5, v3

    invoke-direct {p0, v5}, Lcom/codex/iflyinkuploader/MainActivity;->firstNonEmpty([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1338
    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 1339
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1340
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1341
    const-string v3, "userId"

    iget-object v4, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1342
    const-string v3, "dir"

    const-string v4, "attachment"

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1343
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1344
    const-string v1, "expiration"

    const-string v2, "86400"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1345
    const-string v1, "increment"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1346
    const-string v1, "http://api.iflyink.com/xbew-api/common/common/getDownloadUrl"

    invoke-direct {p0, v1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postWithSession(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object v0

    .line 1347
    iget v1, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_2

    .line 1348
    iget-object v0, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->extractDownloadUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1349
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1350
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;

    invoke-direct {v1, p0, v0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1353
    goto :goto_0

    .line 1349
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "\u4e0b\u8f7d\u94fe\u63a5\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1347
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    iget-object v0, v0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1339
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "\u6587\u4ef6 objectName \u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1351
    :catch_0
    move-exception p1

    .line 1352
    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda31;

    invoke-direct {v0, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda31;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1354
    :goto_0
    return-void
.end method

.method synthetic lambda$loadCloud$27$com-codex-iflyinkuploader-MainActivity(Ljava/util/List;)V
    .locals 2

    .line 1217
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1218
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1219
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudLoaded:Z

    .line 1220
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->renderCloudItems()V

    .line 1221
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5df2\u52a0\u8f7d "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u9879"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1222
    return-void
.end method

.method synthetic lambda$loadCloud$28$com-codex-iflyinkuploader-MainActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 1224
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudStatusText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7f51\u76d8\u52a0\u8f7d\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$loadCloud$29$com-codex-iflyinkuploader-MainActivity()V
    .locals 2

    .line 1214
    :try_start_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshAccessToken()Z

    .line 1215
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentCloudDirId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->fetchCloudItems(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 1216
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda36;

    invoke-direct {v1, p0, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda36;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/util/List;)V

    invoke-virtual {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1225
    goto :goto_0

    .line 1223
    :catch_0
    move-exception v0

    .line 1224
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda37;

    invoke-direct {v1, p0, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda37;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1226
    :goto_0
    return-void
.end method

.method synthetic lambda$loadNotes$19$com-codex-iflyinkuploader-MainActivity(Ljava/util/List;Ljava/util/List;)V
    .locals 1

    .line 870
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 871
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteDirs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 872
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->allNotes:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 873
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->allNotes:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 874
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->notesLoaded:Z

    .line 875
    const-string p1, "0"

    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    .line 876
    iget-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->clear()V

    .line 877
    iget-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity;->expandedNoteDirIds:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 878
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5df2\u52a0\u8f7d "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->allNotes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " \u6761\u7b14\u8bb0"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 879
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->renderNoteDirs()V

    .line 880
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->renderNotesForDir(Ljava/lang/String;)V

    .line 881
    return-void
.end method

.method synthetic lambda$loadNotes$20$com-codex-iflyinkuploader-MainActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 883
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7b14\u8bb0\u52a0\u8f7d\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$loadNotes$21$com-codex-iflyinkuploader-MainActivity()V
    .locals 3

    .line 866
    :try_start_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshAccessToken()Z

    .line 867
    :cond_0
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->fetchNoteDirs()Ljava/util/List;

    move-result-object v0

    .line 868
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->fetchAllNotes()Ljava/util/List;

    move-result-object v1

    iget-boolean v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->notesForceRefresh:Z

    if-eqz v2, :cond_1

    const-string v2, "\u6b63\u5728\u5237\u65b0\u7b14\u8bb0\u8be6\u60c5\u7f13\u5b58..."

    invoke-direct {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->warmNoteDetailCache(Ljava/util/List;)V

    :cond_1

    .line 869
    new-instance v2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda20;

    invoke-direct {v2, p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda20;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v2}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 884
    goto :goto_0

    .line 882
    :catch_0
    move-exception v0

    .line 883
    new-instance v1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda21;

    invoke-direct {v1, p0, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda21;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 885
    :goto_0
    return-void
.end method

.method synthetic lambda$log$44$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;)V
    .locals 1

    .line 2002
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2003
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2005
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2007
    :goto_0
    return-void
.end method

.method synthetic lambda$loginByCode$18$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 684
    :try_start_0
    const-string v0, "\u6b63\u5728\u9a8c\u8bc1\u7801\u767b\u5f55..."

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 685
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 686
    const-string v1, "account"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    const-string p1, "code"

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    const-string p1, "http://api.iflyink.com/xbew-api/user/codeLogin"

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postBeforeLogin(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object p1

    .line 689
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->handleLoginResponse(Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 692
    goto :goto_0

    .line 690
    :catch_0
    move-exception p1

    .line 691
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5f02\u5e38: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 693
    :goto_0
    return-void
.end method

.method synthetic lambda$loginByPassword$17$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 659
    :try_start_0
    const-string v0, "\u6b63\u5728\u5bc6\u7801\u767b\u5f55..."

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 660
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 661
    const-string v1, "account"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 662
    const-string p1, "pwd"

    invoke-direct {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->encryptPassword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    const-string p1, "http://api.iflyink.com/xbew-api/user/dxkLogin"

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postBeforeLogin(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object p1

    .line 664
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->handleLoginResponse(Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 667
    goto :goto_0

    .line 665
    :catch_0
    move-exception p1

    .line 666
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5f02\u5e38: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 668
    :goto_0
    return-void
.end method

.method synthetic lambda$noteRow$23$com-codex-iflyinkuploader-MainActivity(Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 0

    .line 1041
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->showNoteDetail(Lorg/json/JSONObject;)V

    return-void
.end method

.method synthetic lambda$sendSmsCode$16$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;)V
    .locals 2

    .line 631
    :try_start_0
    const-string v0, "\u6b63\u5728\u53d1\u9001\u9a8c\u8bc1\u7801..."

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 632
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 633
    const-string v1, "mobile"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 634
    const-string p1, "http://api.iflyink.com/xbew-api/common/sms/pushLogin"

    invoke-direct {p0, p1, v0}, Lcom/codex/iflyinkuploader/MainActivity;->postBeforeLogin(Ljava/lang/String;Ljava/util/Map;)Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;

    move-result-object p1

    .line 635
    iget v0, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 636
    const-string p1, "\u9a8c\u8bc1\u7801\u5df2\u53d1\u9001\uff0c\u8bf7\u67e5\u770b\u77ed\u4fe1"

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 638
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u53d1\u9001\u9a8c\u8bc1\u7801\u5931\u8d25: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p1, p1, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->compact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 642
    :goto_0
    goto :goto_1

    .line 640
    :catch_0
    move-exception p1

    .line 641
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f02\u5e38: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V

    .line 643
    :goto_1
    return-void
.end method

.method synthetic lambda$showNoteDetail$24$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1061
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5df2\u6253\u5f00\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedNoteDirId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->renderNotesForDir(Ljava/lang/String;)V

    .line 1062
    invoke-direct {p0, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->showRichNoteDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1063
    return-void
.end method

.method synthetic lambda$showNoteDetail$25$com-codex-iflyinkuploader-MainActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 1065
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->noteStatusText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7b14\u8bb0\u8be6\u60c5\u52a0\u8f7d\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$showNoteDetail$26$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3

    .line 1055
    :try_start_0
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->fetchNoteDetailRaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/codex/iflyinkuploader/MainActivity;->applyNoteDetailCache(Lorg/json/JSONObject;Ljava/lang/String;)V

    const-string v0, "__title"

    invoke-virtual {p3, v0, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "__html"

    const-string v1, ""

    invoke-virtual {p3, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->noteHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1060
    :cond_0
    move-object p1, v0

    new-instance v0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda38;

    invoke-direct {v0, p0, p2, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda38;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1066
    goto :goto_1

    .line 1064
    :catch_0
    move-exception p1

    .line 1065
    new-instance p2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda39;

    invoke-direct {p2, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda39;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1067
    :goto_1
    return-void
.end method

.method synthetic lambda$showSuccessToast$45$com-codex-iflyinkuploader-MainActivity()V
    .locals 6

    .line 2012
    const/4 v0, 0x1

    const-string v1, "\u6210\u529f\u4e0a\u4f20"

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 2013
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2014
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v3, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda4;-><init>(Landroid/widget/Toast;)V

    const-wide/16 v4, 0xbb8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2015
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2016
    return-void
.end method

.method synthetic lambda$startDirectDownload$36$com-codex-iflyinkuploader-MainActivity(Ljava/io/File;)V
    .locals 2

    .line 1384
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5df2\u4e0b\u8f7d\u5230 Download\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x64

    invoke-direct {p0, v0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->updateCloudProgress(ILjava/lang/String;)V

    .line 1385
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->showDownloadSuccessToast()V

    .line 1386
    return-void
.end method

.method synthetic lambda$startDirectDownload$37$com-codex-iflyinkuploader-MainActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 1388
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u4e0b\u8f7d\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$startDirectDownload$38$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    .line 1362
    :try_start_0
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1363
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 1364
    :cond_0
    invoke-direct {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->safeFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->uniqueFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1365
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p2

    check-cast p2, Ljava/net/HttpURLConnection;

    .line 1366
    const/16 v1, 0x7530

    invoke-virtual {p2, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1367
    const v1, 0x2bf20

    invoke-virtual {p2, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 1368
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1

    .line 1369
    nop

    .line 1370
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1371
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1372
    const/high16 v3, 0x20000

    :try_start_2
    new-array v3, v3, [B

    const-wide/16 v4, 0x0

    .line 1374
    :cond_1
    :goto_0
    invoke-virtual {p2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_2

    .line 1375
    const/4 v7, 0x0

    invoke-virtual {v2, v3, v7, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 1376
    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 1377
    if-lez v1, :cond_1

    .line 1378
    const-wide/16 v6, 0x64

    mul-long v8, v4, v6

    int-to-long v10, v1

    div-long/2addr v8, v10

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v7, v6

    .line 1379
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u6b63\u5728\u4e0b\u8f7d "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "%\uff1a"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v7, v6}, Lcom/codex/iflyinkuploader/MainActivity;->updateCloudProgress(ILjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1380
    goto :goto_0

    .line 1382
    :cond_2
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz p2, :cond_3

    :try_start_4
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    .line 1383
    :cond_3
    new-instance p1, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda32;

    invoke-direct {p1, p0, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda32;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/io/File;)V

    invoke-virtual {p0, p1}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 1389
    goto :goto_3

    .line 1370
    :catchall_0
    move-exception p1

    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_6
    invoke-static {p1, v0}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz p2, :cond_4

    :try_start_7
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p2

    :try_start_8
    invoke-static {p1, p2}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    throw p1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 1387
    :catch_0
    move-exception p1

    .line 1388
    new-instance p2, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda33;

    invoke-direct {p2, p0, p1}, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda33;-><init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1390
    :goto_3
    return-void
.end method

.method synthetic lambda$startUploadSelectedFiles$42$com-codex-iflyinkuploader-MainActivity()V
    .locals 4

    .line 1471
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->userToken:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 1475
    :cond_0
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1476
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->refreshAccessToken()Z

    .line 1477
    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity;->auth:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1478
    const-string v1, "\u5237\u65b0\u767b\u5f55\u6001\u5931\u8d25: Authorization \u4e3a\u7a7a"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1491
    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    .line 1479
    return-void

    .line 1483
    :cond_1
    const/4 v1, 0x0

    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1484
    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;

    iget-object v3, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {p0, v2, v1, v3}, Lcom/codex/iflyinkuploader/MainActivity;->uploadOneFile(Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;II)V

    .line 1483
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1486
    :cond_2
    const-string v1, "\u5168\u90e8\u4e0a\u4f20\u5b8c\u6210"

    const/16 v2, 0x64

    invoke-direct {p0, v2, v1}, Lcom/codex/iflyinkuploader/MainActivity;->updateProgress(ILjava/lang/String;)V

    .line 1487
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->showSuccessToast()V

    goto :goto_2

    .line 1472
    :cond_3
    :goto_1
    const-string v1, "\u8bf7\u5148\u767b\u5f55"

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1491
    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    .line 1473
    return-void

    .line 1491
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 1488
    :catch_0
    move-exception v1

    .line 1489
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5f02\u5e38: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1491
    :goto_2
    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    .line 1492
    nop

    .line 1493
    return-void

    .line 1491
    :goto_3
    iput-boolean v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploading:Z

    .line 1492
    goto :goto_5

    :goto_4
    throw v1

    :goto_5
    goto :goto_4
.end method

.method synthetic lambda$updateCloudProgress$39$com-codex-iflyinkuploader-MainActivity(ILjava/lang/String;)V
    .locals 1

    .line 1412
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1413
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->cloudProgressText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1414
    return-void
.end method

.method synthetic lambda$updateLoginStatus$13$com-codex-iflyinkuploader-MainActivity()V
    .locals 3

    .line 570
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_1

    .line 571
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 572
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 573
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 574
    :cond_0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginMessageText:Landroid/widget/TextView;

    const-string v1, "\u672a\u767b\u5f55"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 576
    :cond_1
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->loginSection:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 577
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->uploadSection:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 578
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->headerLogoutButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 579
    :cond_2
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->statusText:Landroid/widget/TextView;

    const-string v1, "\u5df2\u767b\u5f55\uff0c\u53ef\u4e0a\u4f20\u6587\u4ef6\u5230\u6839\u76ee\u5f55"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 580
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    const-string v1, "\u7b49\u5f85\u4e0a\u4f20"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 581
    :cond_3
    iget v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->currentPage:I

    invoke-direct {p0, v0}, Lcom/codex/iflyinkuploader/MainActivity;->switchPage(I)V

    .line 583
    :goto_0
    return-void
.end method

.method synthetic lambda$updateProgress$43$com-codex-iflyinkuploader-MainActivity(ILjava/lang/String;)V
    .locals 1

    .line 1995
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1996
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->progressText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1997
    return-void
.end method

.method synthetic lambda$uploadSelectedFiles$40$com-codex-iflyinkuploader-MainActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1456
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->startUploadSelectedFiles()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 755
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 756
    const/16 v0, 0x65

    if-ne p1, v0, :cond_4

    const/4 p1, -0x1

    if-ne p2, p1, :cond_4

    if-eqz p3, :cond_4

    .line 757
    iget-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity;->selectedFiles:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 758
    nop

    .line 759
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object p1

    .line 760
    const/4 p2, 0x0

    if-eqz p1, :cond_2

    .line 761
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/content/ClipData;->getItemCount()I

    move-result v1

    if-ge p2, v1, :cond_1

    .line 762
    invoke-virtual {p1, p2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1, p3}, Lcom/codex/iflyinkuploader/MainActivity;->addSelectedUri(Landroid/net/Uri;Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 761
    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    move p2, v0

    goto :goto_1

    .line 764
    :cond_2
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 765
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1, p3}, Lcom/codex/iflyinkuploader/MainActivity;->addSelectedUri(Landroid/net/Uri;Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p2, 0x1

    .line 767
    :cond_3
    :goto_1
    invoke-direct {p0, p2}, Lcom/codex/iflyinkuploader/MainActivity;->updateSelectedFileText(I)V

    .line 769
    :cond_4
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 135
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 136
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->configureSystemBars()V

    .line 137
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->buildUi()V

    .line 138
    invoke-direct {p0}, Lcom/codex/iflyinkuploader/MainActivity;->loadPrefs()V

    .line 139
    return-void
.end method
