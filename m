From: Ian Molton <ian.molton@codethink.co.uk>
Subject: [PATCH] emev2: GPIOLIB: Enable support for OF
Date: Mon,  2 Sep 2013 16:44:55 +0100
Message-ID: <1378136695-23203-2-git-send-email-ian.molton@codethink.co.uk>
References: <CACRpkdbeCU_WG4xXvoh76RZ-9UtbWJvB4PqYhSpTXSF4Hodf2A@mail.gmail.com>
 <1378136695-23203-1-git-send-email-ian.molton@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([37.128.190.40]:40208 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757140Ab3IBPwj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2013 11:52:39 -0400
In-Reply-To: <1378136695-23203-1-git-send-email-ian.molton@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: horms@verge.net.au, linux-gpio@vger.kernel.org, Ian Molton <ian.molton@codethink.co.uk>

EMEV2 is now a DT platform, however the GPIO driver cannot be used
from a DT file since it does not fill out the of_node field in its
gpio_chip structure.

Signed-off-by: Ian Molton <ian.molton@codethink.co.uk>
---
 drivers/gpio/Kconfig   |    2 +-
 drivers/gpio/gpio-em.c |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b2450ba..58e043d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -129,7 +129,7 @@ config GPIO_IT8761E
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on ARM
+	depends on ARM && OF_GPIO
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 5cba855..279821e 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -303,6 +303,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	}
 
 	gpio_chip = &p->gpio_chip;
+	gpio_chip->of_node = pdev->dev.of_node;
 	gpio_chip->direction_input = em_gio_direction_input;
 	gpio_chip->get = em_gio_get;
 	gpio_chip->direction_output = em_gio_direction_output;
-- 
1.7.10.4

