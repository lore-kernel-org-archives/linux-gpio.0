From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: zevio: depend on ARM and OF_GPIO
Date: Thu,  6 Mar 2014 10:28:05 +0800
Message-ID: <1394072885-27267-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:34238 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755704AbaCFC20 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Mar 2014 21:28:26 -0500
Received: by mail-pd0-f180.google.com with SMTP id v10so1873447pde.25
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2014 18:28:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Fabian Vogt <fabian@ritter-vogt.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>

Instead of just depending on OF and getting build failures,
depend on ARM && OF_GPIO.

Cc: Fabian Vogt <fabian@ritter-vogt.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This has been APPLIED to the GPIO tree to stop build
issues from happening.
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e9dda8658a9e..b56bd0c13ec3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -156,7 +156,7 @@ config GPIO_EP93XX
 
 config GPIO_ZEVIO
 	bool "LSI ZEVIO SoC memory mapped GPIOs"
-	depends on OF
+	depends on ARM && OF_GPIO
 	help
 	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
-- 
1.8.5.3

