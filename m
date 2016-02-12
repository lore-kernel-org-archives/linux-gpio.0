From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] pinctrl: intel: Remove unneeded header includes
Date: Fri, 12 Feb 2016 11:13:13 +0100
Message-ID: <20160212111313.514dc4ee@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33802 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751929AbcBLKNQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 12 Feb 2016 05:13:16 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>

pinctrl-intel doesn't use anything from <linux/init.h>,
<linux/acpi.h>, <linux/gpio.h> or <linux/pm.h>, so it should not
include these header files.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-intel.c |    4 ----
 1 file changed, 4 deletions(-)

--- linux-4.5-rc3.orig/drivers/pinctrl/intel/pinctrl-intel.c	2016-02-02 09:02:08.805929741 +0100
+++ linux-4.5-rc3/drivers/pinctrl/intel/pinctrl-intel.c	2016-02-12 11:03:56.554164885 +0100
@@ -11,13 +11,9 @@
  */
 
 #include <linux/module.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/acpi.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
-#include <linux/pm.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>


-- 
Jean Delvare
SUSE L3 Support
