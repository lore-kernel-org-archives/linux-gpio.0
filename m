From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/2] gpio: lpc32xx: Make of_device_id array const
Date: Tue, 03 Jun 2014 21:09:02 +0900
Message-ID: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30157 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754966AbaFCMJj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jun 2014 08:09:39 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6L0078EDR4DO40@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 03 Jun 2014 21:09:04 +0900 (KST)
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Roland Stigge' <stigge@antcom.de>

Make of_device_id array const, because all OF functions handle
it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-lpc32xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 225344d..b9b9799 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -560,7 +560,7 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
-static struct of_device_id lpc32xx_gpio_of_match[] = {
+static const struct of_device_id lpc32xx_gpio_of_match[] = {
 	{ .compatible = "nxp,lpc3220-gpio", },
 	{ },
 };
-- 
1.7.10.4


