From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] gpio: xtensa: fix build when XCHAL_HAVE_CP is 0
Date: Thu, 23 Jan 2014 08:50:38 +0200
Message-ID: <4fa4f5ee7ded179ab42bb1b028955252e4e307c2.1390459838.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:36572 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753826AbaAWGv2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 23 Jan 2014 01:51:28 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org, Baruch Siach <baruch@tkos.co.il>

In xtensa coprocessors may exist without coprocessor context, i.e. they cannot
be disabled/enabled. In this case the RSR_CPENABLE/WSR_CPENABLE are undefined,
thus breaking the build. Fix the build by adding dummy versions of
enable_cp/disable_cp in this case.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/gpio/gpio-xtensa.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 1d136eceda62..7081304d6797 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -40,6 +40,8 @@
 #error GPIO32 option is not enabled for your xtensa core variant
 #endif
 
+#if XCHAL_HAVE_CP
+
 static inline unsigned long enable_cp(unsigned long *cpenable)
 {
 	unsigned long flags;
@@ -57,6 +59,20 @@ static inline void disable_cp(unsigned long flags, unsigned long cpenable)
 	local_irq_restore(flags);
 }
 
+#else
+
+static inline unsigned long enable_cp(unsigned long *cpenable)
+{
+	*cpenable = 0; /* avoid uninitialized value warning */
+	return 0;
+}
+
+static inline void disable_cp(unsigned long flags, unsigned long cpenable)
+{
+}
+
+#endif /* XCHAL_HAVE_CP */
+
 static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	return 1; /* input only */
-- 
1.8.5.2

