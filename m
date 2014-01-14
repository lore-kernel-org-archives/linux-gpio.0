From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 7/7] drivers/gpio: don't check resource with devm_ioremap_resource
Date: Tue, 14 Jan 2014 12:58:58 +0100
Message-ID: <1389700739-3696-7-git-send-email-wsa@the-dreams.de>
References: <1389700739-3696-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389700739-3696-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

Should go via subsystem tree

 drivers/gpio/gpio-davinci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 84be701..a5e1a56 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -172,11 +172,6 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "Invalid memory resource\n");
-		return -EBUSY;
-	}
-
 	gpio_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(gpio_base))
 		return PTR_ERR(gpio_base);
-- 
1.8.5.1
