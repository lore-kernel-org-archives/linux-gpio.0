From: Duc Dang <dhdang@apm.com>
Subject: [PATCH 1/1] gpio: dwapb: Add ACPI device ID for DWAPB GPIO controller on X-Gene platforms
Date: Tue,  3 May 2016 00:53:41 -0700
Message-ID: <1462262021-12538-1-git-send-email-dhdang@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@apm.com, Duc Dang <dhdang@apm.com>
List-Id: linux-gpio@vger.kernel.org

This patch enables DWAPB GPIO controller support on X-Gene
platforms in ACPI boot mode.

Signed-off-by: Duc Dang <dhdang@apm.com>
---
This patch needs to be applied on top of for-next branch
of linux-gpio tree.
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index b235d70..34779bb 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -588,6 +588,7 @@ MODULE_DEVICE_TABLE(of, dwapb_of_match);
 
 static const struct acpi_device_id dwapb_acpi_match[] = {
 	{"HISI0181", 0},
+	{"APMC0D07", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
-- 
1.9.1
