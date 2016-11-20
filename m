From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] gpio: em: depnd on ARCH_SHMOBILE
Date: Sun, 20 Nov 2016 17:48:36 +0000
Message-ID: <20161120174836.1787-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36175 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbcKTRsl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Nov 2016 12:48:41 -0500
Received: by mail-wm0-f67.google.com with SMTP id m203so20643233wma.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Nov 2016 09:48:40 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>

The GPIO_EM is part of the Renesas SoCs so depend on the arch.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v1->v2:
        - Add COMPILE_TEST

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d011cb8..a09e237 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -171,7 +171,7 @@ config GPIO_DWAPB
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on ARM && OF_GPIO
+	depends on (ARCH_SHMOBILE || COMPILE_TEST) && OF_GPIO
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
-- 
2.9.3

