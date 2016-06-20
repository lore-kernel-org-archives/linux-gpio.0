From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: Flag strict is a field in struct pinmux_ops
Date: Tue, 21 Jun 2016 01:40:48 +0300
Message-ID: <1466462448-98833-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:21840 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752500AbcFTWkx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jun 2016 18:40:53 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Documentation incorrectly refers to struct pinctrl_desc, where no such flag is
available. Replace the name of the struct.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index 4976389e..dd15a69 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -831,7 +831,7 @@ separate memory range only intended for GPIO driving, and the register
 range dealing with pin config and pin multiplexing get placed into a
 different memory range and a separate section of the data sheet.
 
-A flag "strict" in struct pinctrl_desc is available to check and deny
+A flag "strict" in struct pinmux_ops is available to check and deny
 simultaneous access to the same pin from GPIO and pin multiplexing
 consumers on hardware of this type. The pinctrl driver should set this flag
 accordingly.
-- 
2.8.1

