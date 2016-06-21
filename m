From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v4 1/3] pinctrl/broxton: enable platform device in the absent of ACPI enumeration
Date: Tue, 21 Jun 2016 13:10:29 +0800
Message-ID: <1466485831-20416-2-git-send-email-jui.nee.tan@intel.com>
References: <1466485831-20416-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466485831-20416-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

This is to cater the need for non-ACPI system whereby
a platform device has to be created in order to bind
with the Apollo Lake Pinctrl GPIO platform driver.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Changes in V4:
	- added Mika's ACK

Changes in V3:
	- No change

Changes in V2:
	- No change

 drivers/pinctrl/intel/pinctrl-broxton.c | 43 ++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 5979d38..59cb7a6 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1,7 +1,7 @@
 /*
  * Intel Broxton SoC pinctrl/GPIO driver
  *
- * Copyright (C) 2015, Intel Corporation
+ * Copyright (C) 2015, 2016 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  *
  * This program is free software; you can redistribute it and/or modify
@@ -1003,29 +1003,46 @@ static const struct acpi_device_id bxt_pinctrl_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, bxt_pinctrl_acpi_match);
 
+static const struct platform_device_id bxt_pinctrl_platform_ids[] = {
+	{ "apl-pinctrl", (kernel_ulong_t)&apl_pinctrl_soc_data },
+	{ "broxton-pinctrl", (kernel_ulong_t)&bxt_pinctrl_soc_data },
+	{ },
+};
+
 static int bxt_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc_data = NULL;
 	const struct intel_pinctrl_soc_data **soc_table;
-	const struct acpi_device_id *id;
 	struct acpi_device *adev;
 	int i;
 
 	adev = ACPI_COMPANION(&pdev->dev);
-	if (!adev)
-		return -ENODEV;
+	if (adev) {
+		const struct acpi_device_id *id;
 
-	id = acpi_match_device(bxt_pinctrl_acpi_match, &pdev->dev);
-	if (!id)
-		return -ENODEV;
+		id = acpi_match_device(bxt_pinctrl_acpi_match, &pdev->dev);
+		if (!id)
+			return -ENODEV;
 
-	soc_table = (const struct intel_pinctrl_soc_data **)id->driver_data;
+		soc_table = (const struct intel_pinctrl_soc_data **)
+			id->driver_data;
 
-	for (i = 0; soc_table[i]; i++) {
-		if (!strcmp(adev->pnp.unique_id, soc_table[i]->uid)) {
-			soc_data = soc_table[i];
-			break;
+		for (i = 0; soc_table[i]; i++) {
+			if (!strcmp(adev->pnp.unique_id, soc_table[i]->uid)) {
+				soc_data = soc_table[i];
+				break;
+			}
 		}
+	} else {
+		const struct platform_device_id *pid;
+
+		pid = platform_get_device_id(pdev);
+		if (!pid)
+			return -ENODEV;
+
+		soc_table = (const struct intel_pinctrl_soc_data **)
+			pid->driver_data;
+		soc_data = soc_table[pdev->id];
 	}
 
 	if (!soc_data)
@@ -1047,6 +1064,7 @@ static struct platform_driver bxt_pinctrl_driver = {
 		.acpi_match_table = bxt_pinctrl_acpi_match,
 		.pm = &bxt_pinctrl_pm_ops,
 	},
+	.id_table = bxt_pinctrl_platform_ids,
 };
 
 static int __init bxt_pinctrl_init(void)
@@ -1064,3 +1082,4 @@ module_exit(bxt_pinctrl_exit);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Broxton SoC pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:broxton-pinctrl");
-- 
1.9.1
