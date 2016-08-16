From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Fix OF build problem on UM
Date: Tue, 16 Aug 2016 10:06:41 +0200
Message-ID: <1471334801-2814-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35432 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928AbcHPIGq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2016 04:06:46 -0400
Received: by mail-wm0-f49.google.com with SMTP id f65so128178902wmi.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2016 01:06:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org

The UserMode (UM) Linux build was failing in gpiolib-of as it requires
ioremap()/iounmap() to exist, which is absent from UM. The non-existence
of IO memory is negatively defined as CONFIG_NO_IOMEM so put a reverse
dependency on !NO_IOMEM for OF_GPIO to fix the build.

Cc: stable@vger.kernel.org
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98dd47a30fc7..a6026f2fe7f5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -50,6 +50,7 @@ config GPIO_DEVRES
 config OF_GPIO
 	def_bool y
 	depends on OF
+	depends on !NO_IOMEM
 
 config GPIO_ACPI
 	def_bool y
-- 
2.7.4

