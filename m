From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] MAINTAINERS: belong Documentation/pinctrl.txt properly
Date: Tue, 21 Jun 2016 01:52:36 +0300
Message-ID: <1466463156-99056-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:21489 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752382AbcFTWwj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jun 2016 18:52:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'm pretty sure that Documentation/pinctrl.txt would be better maintained by
pinctrl subsystem.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9040236..c59d978 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9088,6 +9088,7 @@ L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/
+F:	Documentation/pinctrl.txt
 F:	drivers/pinctrl/
 F:	include/linux/pinctrl/
 
-- 
2.8.1

