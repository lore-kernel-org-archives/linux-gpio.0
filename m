From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3] pinctrl: intel: merrifield: Introduce ACPI device table
Date: Fri, 10 Nov 2017 21:39:28 +0200
Message-ID: <20171110193928.28313-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:53739 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753648AbdKJTjb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Nov 2017 14:39:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Intel Merrifield the pin control device is a separate IP block
without any PCI ID assigned.

Though, recently we got an allocated ACPI ID for it, so, let's use fresh
ID.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 86c4b3fab7b0..d9357054d41d 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -931,10 +931,17 @@ static int mrfld_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct acpi_device_id mrfld_acpi_table[] = {
+	{ "INTC1002" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, mrfld_acpi_table);
+
 static struct platform_driver mrfld_pinctrl_driver = {
 	.probe = mrfld_pinctrl_probe,
 	.driver = {
 		.name = "pinctrl-merrifield",
+		.acpi_match_table = mrfld_acpi_table,
 	},
 };
 
-- 
2.14.2

