From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ACPI / gpio: make acpi_gpiochip_parse_own_gpio static
Date: Sat, 29 Oct 2016 16:13:12 +0000
Message-ID: <1477757592-26645-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36131 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932787AbcJ2QNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2016 12:13:21 -0400
Received: by mail-pf0-f193.google.com with SMTP id n85so4246227pfi.3
        for <linux-gpio@vger.kernel.org>; Sat, 29 Oct 2016 09:13:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Fixes the following sparse warning:

drivers/gpio/gpiolib-acpi.c:863:18: warning:
 symbol 'acpi_gpiochip_parse_own_gpio' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpiolib-acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 2d71ef6..b684220 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -860,9 +860,9 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 	}
 }
 
-struct gpio_desc *acpi_gpiochip_parse_own_gpio(struct acpi_gpio_chip *achip,
-	struct fwnode_handle *fwnode, const char **name, unsigned int *lflags,
-	unsigned int *dflags)
+static struct gpio_desc *acpi_gpiochip_parse_own_gpio(
+	struct acpi_gpio_chip *achip, struct fwnode_handle *fwnode,
+	const char **name, unsigned int *lflags, unsigned int *dflags)
 {
 	struct gpio_chip *chip = achip->chip;
 	struct gpio_desc *desc;



