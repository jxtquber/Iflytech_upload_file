.class Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/codex/iflyinkuploader/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SelectedFile"
.end annotation


# instance fields
.field final name:Ljava/lang/String;

.field final size:J

.field final uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/net/Uri;Ljava/lang/String;J)V
    .locals 0

    .line 2044
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2045
    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->uri:Landroid/net/Uri;

    .line 2046
    iput-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->name:Ljava/lang/String;

    .line 2047
    iput-wide p3, p0, Lcom/codex/iflyinkuploader/MainActivity$SelectedFile;->size:J

    .line 2048
    return-void
.end method
