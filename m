From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: [PATCH] gpio:ts4800: Add IMX51 dependency
Date: Fri, 26 Feb 2016 18:06:59 -0500
Message-ID: <1456528019-25872-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:60665 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755128AbcBZXHQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 18:07:16 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

The TS-4800 is an i.MX515 board. Its GPIO driver should only be compiled
for this CPU or for test builds.

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 619767b..4d292ad 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -395,6 +395,7 @@ config GPIO_TB10X
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
 	depends on OF_GPIO
+	depends on SOC_IMX51 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  This driver support TS-4800 FPGA GPIO controllers.
-- 
2.5.0

