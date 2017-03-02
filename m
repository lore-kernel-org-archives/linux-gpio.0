From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] pinctrl: ti: The IODelay driver is a DRA7xxx feature so depend on that SoC
Date: Thu,  2 Mar 2017 17:46:36 +0000
Message-ID: <20170302174636.6662-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32788 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753932AbdCBRz2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2017 12:55:28 -0500
Received: by mail-wm0-f67.google.com with SMTP id n11so6226340wma.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Mar 2017 09:55:23 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>

As the IODelay driver is a hardware feature of the  DRA7xxx SoC
depend on that SoC and compile test.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/pinctrl/ti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ti/Kconfig b/drivers/pinctrl/ti/Kconfig
index 815a886..5420770 100644
--- a/drivers/pinctrl/ti/Kconfig
+++ b/drivers/pinctrl/ti/Kconfig
@@ -1,6 +1,6 @@
 config PINCTRL_TI_IODELAY
 	tristate "TI IODelay Module pinconf driver"
-	depends on OF
+	depends on OF && (SOC_DRA7XX || COMPILE_TEST)
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
-- 
2.9.3

