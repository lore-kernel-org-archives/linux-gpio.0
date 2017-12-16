From: Pravin Shedge <pravin.shedge4linux@gmail.com>
Subject: [PATCH] drivers: gpio: remove duplicate includes
Date: Sat, 16 Dec 2017 18:26:52 +0530
Message-ID: <1513429012-8327-1-git-send-email-pravin.shedge4linux@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44709 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756321AbdLPM5C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Dec 2017 07:57:02 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gregory.0xf0@gmail.com, linus.walleij@linaro.org, computersforpeace@gmail.com, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: pravin.shedge4linux@gmail.com

These duplicate includes have been found with scripts/checkincludes.pl
but they have been removed manually to avoid removing false positives.

Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 545d43a..3dcbead 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -19,7 +19,6 @@
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/interrupt.h>
-#include <linux/bitops.h>
 
 enum gio_reg_index {
 	GIO_REG_ODEN = 0,
-- 
2.7.4

