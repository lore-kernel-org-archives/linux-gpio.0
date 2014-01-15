From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S5P[v210|c100|64x0]: Fix build error
Date: Wed, 15 Jan 2014 14:31:29 +0530
Message-ID: <1389776489-29853-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: linux-gpio@vger.kernel.org

gpio-samsung.h header file introduced by commit 93177be0910c
("ARM: S3C[24|64]xx: move includes back under <mach/> scope")
is required only by S3C[24|64]xx machines. Include them conditionally
to avoid the following build errors for other machine configurations.
drivers/gpio/gpio-samsung.c:35:31: fatal error: mach/gpio-samsung.h: No such file or directory
arch/arm/plat-samsung/pm-gpio.c:22:31: fatal error: mach/gpio-samsung.h: No such file or directory

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Only compile tested.
---
 arch/arm/plat-samsung/pm-gpio.c |    3 +++
 drivers/gpio/gpio-samsung.c     |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung/pm-gpio.c
index a9f7a37c4173..dd4c15d0d68f 100644
--- a/arch/arm/plat-samsung/pm-gpio.c
+++ b/arch/arm/plat-samsung/pm-gpio.c
@@ -19,7 +19,10 @@
 #include <linux/io.h>
 #include <linux/gpio.h>
 
+#if defined(CONFIG_ARCH_S3C24XX) || defined(CONFIG_ARCH_S3C64XX)
 #include <mach/gpio-samsung.h>
+#endif
+
 #include <plat/gpio-core.h>
 #include <plat/pm.h>
 
diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 9741cce11df5..a85e00bf9834 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -32,7 +32,10 @@
 
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
+
+#if defined(CONFIG_ARCH_S3C24XX) || defined(CONFIG_ARCH_S3C64XX)
 #include <mach/gpio-samsung.h>
+#endif
 
 #include <plat/cpu.h>
 #include <plat/gpio-core.h>
-- 
1.7.9.5
