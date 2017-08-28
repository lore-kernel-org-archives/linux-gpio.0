From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: merrifield: Introduce OF device table
Date: Mon, 28 Aug 2017 16:42:27 +0300
Message-ID: <20170828134227.65736-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:1698 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750866AbdH1Nna (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Aug 2017 09:43:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Intel Merrifield the pin control device is a separate IP block
without any PCI or ACPI ID assigned. We need some means to allow the
device be enumerated in ACPI environment (*).

To achieve this without allocation special ACPI ID, which is really long
and pretty much unachievable procedure, we just re-use special ACPI ID
and standard compatible string.

(*) ACPI is enabled via second bootloader, i.e. U-Boot,
    firmware is still left untouched and being SFI enabled.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 86c4b3fab7b0..46fe30702a79 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -931,10 +931,17 @@ static int mrfld_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mrfld_of_table[] = {
+	{ .compatible = "intel,merrifield-pinctrl" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mrfld_of_table);
+
 static struct platform_driver mrfld_pinctrl_driver = {
 	.probe = mrfld_pinctrl_probe,
 	.driver = {
 		.name = "pinctrl-merrifield",
+		.of_match_table = mrfld_of_table,
 	},
 };
 
-- 
2.14.1

