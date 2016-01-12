From: Peter Hung <hpeter@gmail.com>
Subject: [PATCH 1/2] gpio-f7188x: add Fintek F81866 SuperIO support
Date: Tue, 12 Jan 2016 15:41:38 +0800
Message-ID: <1452584499-13939-2-git-send-email-hpeter+linux_kernel@gmail.com>
References: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33078 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761778AbcALHlo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2016 02:41:44 -0500
In-Reply-To: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>

add basic F81866 SuperIO gpio support

Signed-off-by: Peter Hung <hpeter+linux_kernel@gmail.com>
---
 drivers/gpio/gpio-f7188x.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 5e3c4fa..a6a9641 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -36,14 +36,16 @@
 #define SIO_F71869A_ID		0x1007	/* F71869A chipset ID */
 #define SIO_F71882_ID		0x0541	/* F71882 chipset ID */
 #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
+#define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
 
-enum chips { f71869, f71869a, f71882fg, f71889f };
+enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
 
 static const char * const f7188x_names[] = {
 	"f71869",
 	"f71869a",
 	"f71882fg",
 	"f71889f",
+	"f81866",
 };
 
 struct f7188x_sio {
@@ -190,6 +192,18 @@ static struct f7188x_gpio_bank f71889_gpio_bank[] = {
 	F7188X_GPIO_BANK(70, 8, 0x80),
 };
 
+static struct f7188x_gpio_bank f81866_gpio_bank[] = {
+	F7188X_GPIO_BANK(0, 8, 0xF0),
+	F7188X_GPIO_BANK(10, 8, 0xE0),
+	F7188X_GPIO_BANK(20, 8, 0xD0),
+	F7188X_GPIO_BANK(30, 8, 0xC0),
+	F7188X_GPIO_BANK(40, 8, 0xB0),
+	F7188X_GPIO_BANK(50, 8, 0xA0),
+	F7188X_GPIO_BANK(60, 8, 0x90),
+	F7188X_GPIO_BANK(70, 8, 0x80),
+	F7188X_GPIO_BANK(80, 8, 0x88),
+};
+
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
@@ -322,6 +336,10 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		data->nr_bank = ARRAY_SIZE(f71889_gpio_bank);
 		data->bank = f71889_gpio_bank;
 		break;
+	case f81866:
+		data->nr_bank = ARRAY_SIZE(f81866_gpio_bank);
+		data->bank = f81866_gpio_bank;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -399,6 +417,9 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	case SIO_F71889_ID:
 		sio->type = f71889f;
 		break;
+	case SIO_F81866_ID:
+		sio->type = f81866;
+		break;
 	default:
 		pr_info(DRVNAME ": Unsupported Fintek device 0x%04x\n", devid);
 		goto err;
-- 
1.9.1

