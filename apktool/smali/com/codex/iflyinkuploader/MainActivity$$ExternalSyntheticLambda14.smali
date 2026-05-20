.class public final synthetic Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/codex/iflyinkuploader/MainActivity;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/codex/iflyinkuploader/MainActivity;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;->f$0:Lcom/codex/iflyinkuploader/MainActivity;

    iput-object p2, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;->f$0:Lcom/codex/iflyinkuploader/MainActivity;

    iget-object v1, p0, Lcom/codex/iflyinkuploader/MainActivity$$ExternalSyntheticLambda14;->f$1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/codex/iflyinkuploader/MainActivity;->lambda$log$44$com-codex-iflyinkuploader-MainActivity(Ljava/lang/String;)V

    return-void
.end method
