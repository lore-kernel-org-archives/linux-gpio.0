From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 4/4] gpio: mxc: read output value from GPIO_DR register
Date: Wed, 29 Apr 2015 18:35:01 +0300
Message-ID: <1430321701-13758-5-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:52601 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753553AbbD2Pfk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 11:35:40 -0400
In-Reply-To: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

All supported iMX GPIO controllers store configured GPIO output value
in GPIO_DR data register, which is represented by GPIO generic reg_set.
Provide a BGPIOF_READ_OUTPUT_REG_SET flag to bgpio_init() to allow
correct getting of previously set output value.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/gpio/gpio-mxc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9f7446a..38daa64 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -450,7 +450,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	err = bgpio_init(&port->bgc, &pdev->dev, 4,
 			 port->base + GPIO_PSR,
 			 port->base + GPIO_DR, NULL,
-			 port->base + GPIO_GDIR, NULL, 0);
+			 port->base + GPIO_GDIR, NULL,
+			 BGPIOF_READ_OUTPUT_REG_SET);
 	if (err)
 		goto out_bgio;
 
-- 
1.7.10.4

