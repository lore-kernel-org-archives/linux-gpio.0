From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an architecture check
Date: Tue,  4 Jul 2017 07:49:47 +0100
Message-ID: <20170704064947.10792-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33494 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbdGDGty (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2017 02:49:54 -0400
Received: by mail-wm0-f67.google.com with SMTP id j85so24172983wmj.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2017 23:49:53 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

The Intel pin control drivers are architecture specific so add an if arch
to check for X86 or compile test to ensure continued test coverage.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/pinctrl/intel/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 396830a41127..0c7edc321415 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -1,6 +1,7 @@
 #
 # Intel pin control drivers
 #
+if (X86 || COMPILE_TEST)
 
 config PINCTRL_BAYTRAIL
 	bool "Intel Baytrail GPIO pin control"
@@ -72,3 +73,5 @@ config PINCTRL_SUNRISEPOINT
 	  Sunrisepoint is the PCH of Intel Skylake. This pinctrl driver
 	  provides an interface that allows configuring of PCH pins and
 	  using them as GPIOs.
+
+endif
-- 
2.13.0

