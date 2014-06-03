From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/2] gpio: pxa: Make of_device_id array const
Date: Tue, 03 Jun 2014 21:10:25 +0900
Message-ID: <002401cf7f24$cd028b80$6707a280$%han@samsung.com>
References: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30278 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961AbaFCMK0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jun 2014 08:10:26 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6L0094UDTD1430@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 03 Jun 2014 21:10:25 +0900 (KST)
In-reply-to: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Neil Zhang' <zhangwm@marvell.com>, 'Eric Miao' <eric.y.miao@gmail.com>

Make of_device_id array const, because all OF functions handle
it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-pxa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 42e6e64..52bbda0 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -498,7 +498,7 @@ static int pxa_gpio_nums(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
-static struct of_device_id pxa_gpio_dt_ids[] = {
+static const struct of_device_id pxa_gpio_dt_ids[] = {
 	{ .compatible = "intel,pxa25x-gpio",	.data = &pxa25x_id, },
 	{ .compatible = "intel,pxa26x-gpio",	.data = &pxa26x_id, },
 	{ .compatible = "intel,pxa27x-gpio",	.data = &pxa27x_id, },
-- 
1.7.10.4


