.class Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/codex/iflyinkuploader/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApiResponse"
.end annotation


# instance fields
.field final code:I

.field final raw:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 2023
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2024
    iput p1, p0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->code:I

    .line 2025
    iput-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity$ApiResponse;->raw:Ljava/lang/String;

    .line 2026
    return-void
.end method
