From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/2] pinctrl: AMD: depend on Seattle or x86
Date: Sun, 27 Dec 2015 12:22:52 +0000
Message-ID: <1451218972-22156-3-git-send-email-pbrobinson@gmail.com>
References: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:36181 "EHLO
	mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647AbbL0MXX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 07:23:23 -0500
Received: by mail-pf0-f182.google.com with SMTP id 65so55436575pff.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 04:23:22 -0800 (PST)
In-Reply-To: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Peter Robinson <pbrobinson@gmail.com>

Add a dependency on the ARM64 Seatle SoC or generic x86 so we're not
prompted if we enable pinctrl for another platform.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 312c78b..e02d1d4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -80,7 +80,7 @@ config PINCTRL_AT91PIO4
 
 config PINCTRL_AMD
 	bool "AMD GPIO pin control"
-	depends on GPIOLIB
+	depends on GPIOLIB && (ARCH_SEATTLE || X86_GENERIC || COMPILE_TEST)
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.5.0

