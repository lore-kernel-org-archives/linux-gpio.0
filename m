From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 5/7] gpio: tegra: Make of_device_id array const
Date: Wed, 07 May 2014 18:07:42 +0900
Message-ID: <022b01cf69d3$cd65f1e0$6831d5a0$%han@samsung.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46215 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932200AbaEGJHn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 05:07:43 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N57000EM5CUCUA0@mailout1.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 07 May 2014 18:07:42 +0900 (KST)
In-reply-to: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Stephen Warren' <swarren@nvidia.com>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-tegra.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 2b49f87..c2ea6f4 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -408,7 +408,7 @@ static struct tegra_gpio_soc_config tegra30_gpio_config = {
 	.upper_offset = 0x80,
 };
 
-static struct of_device_id tegra_gpio_of_match[] = {
+static const struct of_device_id tegra_gpio_of_match[] = {
 	{ .compatible = "nvidia,tegra30-gpio", .data = &tegra30_gpio_config },
 	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
 	{ },
-- 
1.7.10.4


