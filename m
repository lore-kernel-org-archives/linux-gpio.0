From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: denverton: Fix UART2 RTS pin mode
Date: Fri, 10 Nov 2017 19:55:18 +0200
Message-ID: <20171110175518.83719-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:6644 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750807AbdKJRzV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Nov 2017 12:55:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

UART2 RTS is mode 2 of the pin.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-denverton.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 4500880240f2..6572550cfe78 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -207,7 +207,7 @@ static const unsigned int dnv_uart0_pins[] = { 60, 61, 64, 65 };
 static const unsigned int dnv_uart0_modes[] = { 2, 3, 1, 1 };
 static const unsigned int dnv_uart1_pins[] = { 94, 95, 96, 97 };
 static const unsigned int dnv_uart2_pins[] = { 60, 61, 62, 63 };
-static const unsigned int dnv_uart2_modes[] = { 1, 1, 2, 2 };
+static const unsigned int dnv_uart2_modes[] = { 1, 2, 2, 2 };
 static const unsigned int dnv_emmc_pins[] = {
 	142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152,
 };
-- 
2.14.2

