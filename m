From: "qipeng.zha" <qipeng.zha@intel.com>
Subject: [PATCH] gpiolib: change gpio pin from unsigned to signed in acpi callback
Date: Fri, 10 Apr 2015 06:25:10 +0800
Message-ID: <1428618310-10229-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:14232 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753055AbbDIOW1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Apr 2015 10:22:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, "qipeng.zha" <qipeng.zha@intel.com>, Alan Cox <alan@linux.intel.com>

From: "qipeng.zha" <qipeng.zha@intel.com>

The signed error will be wrongly used as valid gpio offset

Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index df990f2..9674066 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -550,7 +550,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 
 	length = min(agpio->pin_table_length, (u16)(pin_index + bits));
 	for (i = pin_index; i < length; ++i) {
-		unsigned pin = agpio->pin_table[i];
+		int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
 		struct gpio_desc *desc;
 		bool found;
-- 
1.8.3.2

