.class public final synthetic Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/codex/iflyinkuploader/MainActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;->f$0:Lcom/codex/iflyinkuploader/MainActivity;

    iput-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;->f$2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;->f$0:Lcom/codex/iflyinkuploader/MainActivity;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda30;->f$2:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lcom/codex/iflyinkuploader/MainActivity;->lambda$downloadCloudFile$33$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
