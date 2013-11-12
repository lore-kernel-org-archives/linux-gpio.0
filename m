From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] gpio/lynxpoint: add new ACPI ID
Date: Tue, 12 Nov 2013 11:52:32 +0200
Message-ID: <1384249952-10085-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Newer Intel PCHs have the same GPIO controller than Haswell but the ACPI ID
is different. Add this ID to the driver supported IDs list.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-lynxpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 41b5913ddabe..c3d9999bcdb3 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -437,6 +437,7 @@ static const struct dev_pm_ops lp_gpio_pm_ops = {
 
 static const struct acpi_device_id lynxpoint_gpio_acpi_match[] = {
 	{ "INT33C7", 0 },
+	{ "INT3437", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, lynxpoint_gpio_acpi_match);
-- 
1.8.4.2
