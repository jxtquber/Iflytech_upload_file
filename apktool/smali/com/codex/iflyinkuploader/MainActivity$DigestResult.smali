.class Lcom/codex/iflyinkuploader/MainActivity$DigestResult;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/codex/iflyinkuploader/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DigestResult"
.end annotation


# instance fields
.field final md5:Ljava/lang/String;

.field final size:J


# direct methods
.method constructor <init>(Ljava/lang/String;J)V
    .locals 0

    .line 2033
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2034
    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;->md5:Ljava/lang/String;

    .line 2035
    iput-wide p2, p0, Lcom/codex/iflyinkuploader/MainActivity$DigestResult;->size:J

    .line 2036
    return-void
.end method
