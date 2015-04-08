From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: arrange SPI Kconfig symbols alphabetically
Date: Wed,  8 Apr 2015 14:35:30 +0200
Message-ID: <1428496530-19981-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:34863 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752438AbbDHMff (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 08:35:35 -0400
Received: by labbd9 with SMTP id bd9so53323750lab.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 05:35:34 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Rearrange the SPI GPIO expanders in alphabetic order
as already indicated by the comment in the file.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c9e4c5dfd7c3..65acf322e86a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -862,6 +862,14 @@ config GPIO_TIMBERDALE
 
 comment "SPI GPIO expanders:"
 
+config GPIO_74X164
+	tristate "74x164 serial-in/parallel-out 8-bits shift register"
+	depends on SPI_MASTER && OF
+	help
+	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
+	  shift registers. This driver can be used to provide access
+	  to more gpio outputs.
+
 config GPIO_MAX7301
 	tristate "Maxim MAX7301 GPIO expander"
 	depends on SPI_MASTER
@@ -885,14 +893,6 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
-config GPIO_74X164
-	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on SPI_MASTER && OF
-	help
-	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
-	  shift registers. This driver can be used to provide access
-	  to more gpio outputs.
-
 comment "AC97 GPIO expanders:"
 
 config GPIO_UCB1400
-- 
1.9.3

