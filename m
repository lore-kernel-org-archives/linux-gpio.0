From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 6/7] gpio: xilinx: Make of_device_id array const
Date: Wed, 07 May 2014 18:08:20 +0900
Message-ID: <022c01cf69d3$e43d6b00$acb84100$%han@samsung.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17235 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754886AbaEGJIW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 05:08:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700KJB5DWAX50@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 07 May 2014 18:08:20 +0900 (KST)
In-reply-to: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Michal Simek' <michal.simek@xilinx.com>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-xilinx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 792a05a..1248186 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -289,7 +289,7 @@ static int xgpio_of_probe(struct device_node *np)
 	return 0;
 }
 
-static struct of_device_id xgpio_of_match[] = {
+static const struct of_device_id xgpio_of_match[] = {
 	{ .compatible = "xlnx,xps-gpio-1.00.a", },
 	{ /* end of list */ },
 };
-- 
1.7.10.4


