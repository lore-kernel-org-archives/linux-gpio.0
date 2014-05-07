From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/7] gpio: mcp23s08: Make of_device_id array const
Date: Wed, 07 May 2014 18:05:17 +0900
Message-ID: <022801cf69d3$774c9fc0$65e5df40$%han@samsung.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22567 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751838AbaEGJFT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 05:05:19 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700H6B58UEL70@mailout4.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 07 May 2014 18:05:18 +0900 (KST)
In-reply-to: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-mcp23s08.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 3d53fd6..4d677f1 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -714,7 +714,7 @@ fail:
 
 #ifdef CONFIG_OF
 #ifdef CONFIG_SPI_MASTER
-static struct of_device_id mcp23s08_spi_of_match[] = {
+static const struct of_device_id mcp23s08_spi_of_match[] = {
 	{
 		.compatible = "microchip,mcp23s08",
 		.data = (void *) MCP_TYPE_S08,
@@ -738,7 +738,7 @@ MODULE_DEVICE_TABLE(of, mcp23s08_spi_of_match);
 #endif
 
 #if IS_ENABLED(CONFIG_I2C)
-static struct of_device_id mcp23s08_i2c_of_match[] = {
+static const struct of_device_id mcp23s08_i2c_of_match[] = {
 	{
 		.compatible = "microchip,mcp23008",
 		.data = (void *) MCP_TYPE_008,
-- 
1.7.10.4


