From: Duc Dang <dhdang@apm.com>
Subject: [PATCH 1/1] gpio: xgene: Enable ACPI support for X-Gene GFC GPIO driver
Date: Sat, 30 Apr 2016 13:49:27 -0700
Message-ID: <1462049367-10028-1-git-send-email-dhdang@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34300 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbcD3UuG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Apr 2016 16:50:06 -0400
Received: by mail-pa0-f54.google.com with SMTP id r5so60057446pag.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Apr 2016 13:50:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@apm.com, Duc Dang <dhdang@apm.com>

This patch enables ACPI support for X-Gene GFC GPIO driver.

Signed-off-by: Duc Dang <dhdang@apm.com>
---
 drivers/gpio/gpio-xgene.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 0dc9161..c00c408 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -17,6 +17,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -218,10 +219,18 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id xgene_gpio_acpi_match[] = {
+	{ "APMC0D14", 0 },
+	{ },
+};
+#endif
+
 static struct platform_driver xgene_gpio_driver = {
 	.driver = {
 		.name = "xgene-gpio",
 		.of_match_table = xgene_gpio_of_match,
+		.acpi_match_table = ACPI_PTR(xgene_gpio_acpi_match),
 		.pm     = XGENE_GPIO_PM_OPS,
 	},
 	.probe = xgene_gpio_probe,
-- 
1.9.1

