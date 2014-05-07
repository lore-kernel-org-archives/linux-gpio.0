From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 4/7] gpio: palmas: Make of_device_id array const
Date: Wed, 07 May 2014 18:06:50 +0900
Message-ID: <022a01cf69d3$aeb9c5a0$0c2d50e0$%han@samsung.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22873 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755727AbaEGJGv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 05:06:51 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700HBA5BFEL70@mailout4.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 07 May 2014 18:06:51 +0900 (KST)
In-reply-to: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Laxman Dewangan' <ldewangan@nvidia.com>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-palmas.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index da9d332..0860b74 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -148,7 +148,7 @@ static const struct palmas_device_data tps80036_dev_data = {
 	.ngpio = 16,
 };
 
-static struct of_device_id of_palmas_gpio_match[] = {
+static const struct of_device_id of_palmas_gpio_match[] = {
 	{ .compatible = "ti,palmas-gpio", .data = &palmas_dev_data,},
 	{ .compatible = "ti,tps65913-gpio", .data = &palmas_dev_data,},
 	{ .compatible = "ti,tps65914-gpio", .data = &palmas_dev_data,},
-- 
1.7.10.4


