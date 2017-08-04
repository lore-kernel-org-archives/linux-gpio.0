From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: merrifield: Correct UART pin lists
Date: Fri,  4 Aug 2017 19:26:34 +0300
Message-ID: <20170804162634.25854-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:13632 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753010AbdHDQ1h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Aug 2017 12:27:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

UART pin lists consist GPIO numbers which is simply wrong.
Replace it by pin numbers.

Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 4d4ef42a39b5..86c4b3fab7b0 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -343,9 +343,9 @@ static const struct pinctrl_pin_desc mrfld_pins[] = {
 
 static const unsigned int mrfld_sdio_pins[] = { 50, 51, 52, 53, 54, 55, 56 };
 static const unsigned int mrfld_spi5_pins[] = { 90, 91, 92, 93, 94, 95, 96 };
-static const unsigned int mrfld_uart0_pins[] = { 124, 125, 126, 127 };
-static const unsigned int mrfld_uart1_pins[] = { 128, 129, 130, 131 };
-static const unsigned int mrfld_uart2_pins[] = { 132, 133, 134, 135 };
+static const unsigned int mrfld_uart0_pins[] = { 115, 116, 117, 118 };
+static const unsigned int mrfld_uart1_pins[] = { 119, 120, 121, 122 };
+static const unsigned int mrfld_uart2_pins[] = { 123, 124, 125, 126 };
 static const unsigned int mrfld_pwm0_pins[] = { 144 };
 static const unsigned int mrfld_pwm1_pins[] = { 145 };
 static const unsigned int mrfld_pwm2_pins[] = { 132 };
-- 
2.13.2

