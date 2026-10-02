.class Lon/dev/shellv3/ShellAppFactoryV3$2;
.super Ljava/lang/Object;
.source "ShellAppFactoryV3.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lon/dev/shellv3/ShellAppFactoryV3;->maybeInstallCrashHandler(Landroid/content/pm/ApplicationInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lon/dev/shellv3/ShellAppFactoryV3;

.field final synthetic val$crashDir:Ljava/io/File;

.field final synthetic val$previous:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method constructor <init>(Lon/dev/shellv3/ShellAppFactoryV3;Ljava/io/File;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 350
    iput-object p1, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->this$0:Lon/dev/shellv3/ShellAppFactoryV3;

    iput-object p2, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->val$crashDir:Ljava/io/File;

    iput-object p3, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->val$previous:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 7

    const-string v0, "crash-"

    .line 354
    :try_start_0
    invoke-static {p1, p2}, Lon/dev/shellv3/ShellAppFactoryV3;->access$000(Ljava/lang/Thread;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    .line 355
    const-string v2, "OnDevCrash"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    iget-object v2, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->val$crashDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 357
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->val$crashDir:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ".txt"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2, v1}, Lon/dev/shellv3/ShellAppFactoryV3;->access$100(Ljava/io/File;Ljava/lang/String;)V

    .line 358
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->val$crashDir:Ljava/io/File;

    const-string v3, "crash-latest.txt"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lon/dev/shellv3/ShellAppFactoryV3;->access$100(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    :catchall_0
    iget-object v0, p0, Lon/dev/shellv3/ShellAppFactoryV3$2;->val$previous:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_0

    .line 362
    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 364
    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p1

    invoke-static {p1}, Landroid/os/Process;->killProcess(I)V

    const/16 p1, 0xa

    .line 365
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    :goto_0
    return-void
.end method
