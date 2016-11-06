From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] gpio: em: depnd on ARCH_SHMOBILE
Date: Sun,  6 Nov 2016 18:53:22 +0000
Message-ID: <20161106185322.28372-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34305 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbcKFTJJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2016 14:09:09 -0500
Received: by mail-wm0-f68.google.com with SMTP id p190so12965494wmp.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2016 11:09:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>

The GPIO_EM is part of the Renesas SoCs so depend on the arch.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d011cb8..76e6c80 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -171,7 +171,7 @@ config GPIO_DWAPB
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on ARM && OF_GPIO
+	depends on ARCH_SHMOBILE && OF_GPIO
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
-- 
2.9.3

