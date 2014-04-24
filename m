From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Thu, 24 Apr 2014 10:13:49 +0800
Message-ID: <1398305629.14665.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:50575 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbaDXCNz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 22:13:55 -0400
Received: by mail-vc0-f178.google.com with SMTP id hu19so2151666vcb.23
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 19:13:54 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <florian@openwrt.org>, linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>

The valid gpio is GPIO0 ~ GPIO58, so ngpio should be 59.
This patch also renames RDC321X_MAX_GPIO to RDC321X_NUM_GPIO because it
actually means the number of available GPIOs.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Lee,
This actually fixes the ngpio setting in gpio-rdc321x driver.
So I think it makes sense to go via gpio tree.
Axel
 drivers/mfd/rdc321x-southbridge.c | 2 +-
 include/linux/mfd/rdc321x.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rdc321x-southbridge.c b/drivers/mfd/rdc321x-southbridge.c
index c795697..6575585 100644
--- a/drivers/mfd/rdc321x-southbridge.c
+++ b/drivers/mfd/rdc321x-southbridge.c
@@ -38,7 +38,7 @@ static struct resource rdc321x_wdt_resource[] = {
 };
 
 static struct rdc321x_gpio_pdata rdc321x_gpio_pdata = {
-	.max_gpios	= RDC321X_MAX_GPIO,
+	.max_gpios	= RDC321X_NUM_GPIO,
 };
 
 static struct resource rdc321x_gpio_resources[] = {
diff --git a/include/linux/mfd/rdc321x.h b/include/linux/mfd/rdc321x.h
index 4bdf19c..442743a 100644
--- a/include/linux/mfd/rdc321x.h
+++ b/include/linux/mfd/rdc321x.h
@@ -12,7 +12,7 @@
 #define RDC321X_GPIO_CTRL_REG2	0x84
 #define RDC321X_GPIO_DATA_REG2	0x88
 
-#define RDC321X_MAX_GPIO	58
+#define RDC321X_NUM_GPIO	59
 
 struct rdc321x_gpio_pdata {
 	struct pci_dev *sb_pdev;
-- 
1.8.3.2



