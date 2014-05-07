From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 3/7] gpio: mvebu: Make of_device_id array const
Date: Wed, 07 May 2014 18:06:08 +0900
Message-ID: <022901cf69d3$95828a90$c0879fb0$%han@samsung.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22736 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751838AbaEGJGJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 05:06:09 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700G9I5A8S880@mailout4.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 07 May 2014 18:06:08 +0900 (KST)
In-reply-to: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Jason Cooper' <jason@lakedaemon.net>, 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-mvebu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index d425094..b5d8645 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -535,7 +535,7 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define mvebu_gpio_dbg_show NULL
 #endif
 
-static struct of_device_id mvebu_gpio_of_match[] = {
+static const struct of_device_id mvebu_gpio_of_match[] = {
 	{
 		.compatible = "marvell,orion-gpio",
 		.data       = (void *) MVEBU_GPIO_SOC_VARIANT_ORION,
-- 
1.7.10.4


