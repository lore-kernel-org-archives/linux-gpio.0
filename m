From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: Fix OF build problem on UM
Date: Fri, 19 Aug 2016 14:52:36 +0200
Message-ID: <1471611156-4220-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35150 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750889AbcHSMwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2016 08:52:43 -0400
Received: by mail-lf0-f46.google.com with SMTP id f93so32211727lfi.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2016 05:52:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The UserMode (UM) Linux build was failing in gpiolib-of as it requires
ioremap()/iounmap() to exist, which is absent from UM. The non-existence
of IO memory is negatively defined as CONFIG_NO_IOMEM which means we
need to depend on HAS_IOMEM.

Cc: stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Depend on HAS_IOMEM rather than !NO_IOMEM
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98dd47a30fc7..24f833c3d3ba 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -50,6 +50,7 @@ config GPIO_DEVRES
 config OF_GPIO
 	def_bool y
 	depends on OF
+	depends on HAS_IOMEM
 
 config GPIO_ACPI
 	def_bool y
-- 
2.7.4

