From: Wang Hongcheng <annie.wang@amd.com>
Subject: [PATCH] pinctrl: amd:Add device HID for future AMD GPIO controller
Date: Fri, 11 Mar 2016 10:58:42 +0800
Message-ID: <1457665122-16365-1-git-send-email-annie.wang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>
Cc: Wang Hongcheng <annie.wang@amd.com>
List-Id: linux-gpio@vger.kernel.org

Add device HID AMDI0030 to match the AMD ACPI Vendor ID (AMDI) as
registered in http://www.uefi.org/acpi_id_list, and the GPIO controller
on future AMD paltform will use the HID instead of AMD0030.

Signed-off-by: Wang Hongcheng <annie.wang@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 3318f1d..d7eb9ad 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -849,6 +849,7 @@ static int amd_gpio_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id amd_gpio_acpi_match[] = {
 	{ "AMD0030", 0 },
+	{ "AMDI0030", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
-- 
1.9.1
