From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: zynq: add missing module_exit function
Date: Wed, 17 Jun 2015 17:51:41 +0900
Message-ID: <1434531101-2585-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:33563 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752561AbbFQIwz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2015 04:52:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org

This driver is tristate, so it should be cleanable.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-zynq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 184c4b1..1d38da7 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -722,6 +722,12 @@ static int __init zynq_gpio_init(void)
 }
 postcore_initcall(zynq_gpio_init);
 
+static void __exit zynq_gpio_exit(void)
+{
+	platform_driver_unregister(&zynq_gpio_driver);
+}
+module_exit(zynq_gpio_exit);
+
 MODULE_AUTHOR("Xilinx Inc.");
 MODULE_DESCRIPTION("Zynq GPIO driver");
 MODULE_LICENSE("GPL");
-- 
1.9.1

