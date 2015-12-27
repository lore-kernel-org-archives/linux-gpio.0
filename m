From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/2] pinctrl: intel: on enable on x86 arches and COMPILE_TEST
Date: Sun, 27 Dec 2015 12:22:51 +0000
Message-ID: <1451218972-22156-2-git-send-email-pbrobinson@gmail.com>
References: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:35057 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647AbbL0MXT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 07:23:19 -0500
Received: by mail-pf0-f172.google.com with SMTP id 78so98851723pfw.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 04:23:18 -0800 (PST)
In-Reply-To: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Peter Robinson <pbrobinson@gmail.com>

If you select CONFIG_PINCTR for another unrelated architecture
you need to set all the Intel pinctrl options even though they're not
required. Mask them if not required.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/pinctrl/intel/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 4d2efad..68fa13a 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -2,6 +2,8 @@
 # Intel pin control drivers
 #
 
+if X86_GENERIC || COMPILE_TEST
+
 config PINCTRL_BAYTRAIL
 	bool "Intel Baytrail GPIO pin control"
 	depends on GPIOLIB && ACPI
@@ -50,3 +52,5 @@ config PINCTRL_SUNRISEPOINT
 	  Sunrisepoint is the PCH of Intel Skylake. This pinctrl driver
 	  provides an interface that allows configuring of PCH pins and
 	  using them as GPIOs.
+
+endif
-- 
2.5.0

