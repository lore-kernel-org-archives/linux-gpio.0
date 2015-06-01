From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH 2/7] pinctrl: amd: Remove .owner field
Date: Mon, 1 Jun 2015 09:54:00 -0300
Message-ID: <1433163245-5780-2-git-send-email-fabio.estevam@freescale.com>
References: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bn0109.outbound.protection.outlook.com ([157.56.110.109]:31983
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751357AbbFAMyj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 08:54:39 -0400
In-Reply-To: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

platform_driver does not need to set the owner field, as it will be 
populated by the driver core, so just remove it.

The semantic patch that makes this change is available
in scripts/coccinelle/api/platform_no_drv_owner.cocci.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/pinctrl/pinctrl-amd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7de3b64..e747912 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -855,7 +855,6 @@ MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
 static struct platform_driver amd_gpio_driver = {
 	.driver		= {
 		.name	= "amd_gpio",
-		.owner	= THIS_MODULE,
 		.acpi_match_table = ACPI_PTR(amd_gpio_acpi_match),
 	},
 	.probe		= amd_gpio_probe,
-- 
1.9.1

