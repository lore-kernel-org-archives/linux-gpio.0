From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 07/28] gpio: drop owner assignment from platform_drivers
Date: Sun, 21 Dec 2014 22:14:28 +0100
Message-ID: <1419196495-9626-8-git-send-email-wsa@the-dreams.de>
References: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This platform_driver does not need to set an owner, it will be populated by the
driver core.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Generated with coccinelle. SmPL file is in the introductory msg. The big
cleanup was pulled in this merge window. This series catches the bits fallen
through. The patches shall go in via the subsystem trees.

 drivers/gpio/gpio-vf610.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 4ee4cee832ec..971c73964ef1 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -278,7 +278,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 static struct platform_driver vf610_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-vf610",
-		.owner	= THIS_MODULE,
 		.of_match_table = vf610_gpio_dt_ids,
 	},
 	.probe		= vf610_gpio_probe,
-- 
2.1.3
