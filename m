From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/7] gpio: grgpio: Make of_device_id array const
Date: Wed, 07 May 2014 18:03:30 +0900
Message-ID: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62568 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932211AbaEGJDc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 05:03:32 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N57002BM55VQ290@mailout2.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 07 May 2014 18:03:31 +0900 (KST)
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Andreas Larsson' <andreas@gaisler.com>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-grgpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 84d2478..3c3f515 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -481,7 +481,7 @@ out:
 	return ret;
 }
 
-static struct of_device_id grgpio_match[] = {
+static const struct of_device_id grgpio_match[] = {
 	{.name = "GAISLER_GPIO"},
 	{.name = "01_01a"},
 	{},
-- 
1.7.10.4


