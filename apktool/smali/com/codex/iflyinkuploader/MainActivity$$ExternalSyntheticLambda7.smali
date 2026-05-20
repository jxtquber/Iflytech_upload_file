.class public final synthetic Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/codex/iflyinkuploader/MainActivity;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lcom/codex/iflyinkuploader/MainActivity;Lorg/json/JSONObject;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;->f$0:Lcom/codex/iflyinkuploader/MainActivity;

    iput-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;->f$0:Lcom/codex/iflyinkuploader/MainActivity;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda7;->f$1:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1, p2}, Lcom/codex/iflyinkuploader/MainActivity;->lambda$confirmDownload$32$com-codex-iflyinkuploader-MainActivity(Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V

    return-void
.end method
