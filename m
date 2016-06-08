From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: select ANON_INODES
Date: Wed,  8 Jun 2016 13:46:56 +0200
Message-ID: <1465386416-31743-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34064 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635AbcFHLrA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 07:47:00 -0400
Received: by mail-lf0-f42.google.com with SMTP id s186so3948204lfs.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 04:47:00 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

The build servers found that gpiolib is using ANON_INODES but
has forgotten to select it. Fix this.

Fixes: 521a2ad6f862 ("gpio: add userspace ABI for GPIO line information")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 48da857f4774..a116609b1914 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -33,6 +33,7 @@ config ARCH_REQUIRE_GPIOLIB
 
 menuconfig GPIOLIB
 	bool "GPIO Support"
+	select ANON_INODES
 	help
 	  This enables GPIO support through the generic GPIO library.
 	  You only need to enable this, if you also want to enable
-- 
2.4.11

