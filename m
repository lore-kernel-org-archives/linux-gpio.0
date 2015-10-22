From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/6] gpio: ABI: mark the sysfs ABI as obsolete
Date: Thu, 22 Oct 2015 10:32:30 +0200
Message-ID: <1445502750-22672-7-git-send-email-linus.walleij@linaro.org>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33674 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756712AbbJVIdL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 04:33:11 -0400
Received: by lffv3 with SMTP id v3so39297207lff.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 01:33:09 -0700 (PDT)
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

This marks the (optional) sysfs GPIO ABI as obsolete and schedules
it for removal in 2020.

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio | 30 ++++++++++++++++++++++++++++++
 Documentation/ABI/testing/sysfs-gpio  | 28 ----------------------------
 MAINTAINERS                           |  1 +
 3 files changed, 31 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-gpio
 delete mode 100644 Documentation/ABI/testing/sysfs-gpio

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
new file mode 100644
index 000000000000..867c1fab20e2
--- /dev/null
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -0,0 +1,30 @@
+What:		/sys/class/gpio/
+Date:		July 2008
+KernelVersion:	2.6.27
+Contact:	Linus Walleij <linusw@kernel.org>
+Description:
+
+  As a Kconfig option, individual GPIO signals may be accessed from
+  userspace.  GPIOs are only made available to userspace by an explicit
+  "export" operation.  If a given GPIO is not claimed for use by
+  kernel code, it may be exported by userspace (and unexported later).
+  Kernel code may export it for complete or partial access.
+
+  GPIOs are identified as they are inside the kernel, using integers in
+  the range 0..INT_MAX.  See Documentation/gpio.txt for more information.
+
+    /sys/class/gpio
+	/export ... asks the kernel to export a GPIO to userspace
+	/unexport ... to return a GPIO to the kernel
+	/gpioN ... for each exported GPIO #N OR
+	/<LINE-NAME> ... for a properly named GPIO line
+	    /value ... always readable, writes fail for input GPIOs
+	    /direction ... r/w as: in, out (default low); write: high, low
+	    /edge ... r/w as: none, falling, rising, both
+	/gpiochipN ... for each gpiochip; #N is its first GPIO
+	    /base ... (r/o) same as N
+	    /label ... (r/o) descriptive, not necessarily unique
+	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+
+  This ABI is deprecated and will be removed after 2020. It is
+  replaced with the GPIO character device.
diff --git a/Documentation/ABI/testing/sysfs-gpio b/Documentation/ABI/testing/sysfs-gpio
deleted file mode 100644
index 55ffa2df1c10..000000000000
--- a/Documentation/ABI/testing/sysfs-gpio
+++ /dev/null
@@ -1,28 +0,0 @@
-What:		/sys/class/gpio/
-Date:		July 2008
-KernelVersion:	2.6.27
-Contact:	David Brownell <dbrownell@users.sourceforge.net>
-Description:
-
-  As a Kconfig option, individual GPIO signals may be accessed from
-  userspace.  GPIOs are only made available to userspace by an explicit
-  "export" operation.  If a given GPIO is not claimed for use by
-  kernel code, it may be exported by userspace (and unexported later).
-  Kernel code may export it for complete or partial access.
-
-  GPIOs are identified as they are inside the kernel, using integers in
-  the range 0..INT_MAX.  See Documentation/gpio.txt for more information.
-
-    /sys/class/gpio
-	/export ... asks the kernel to export a GPIO to userspace
-	/unexport ... to return a GPIO to the kernel
-	/gpioN ... for each exported GPIO #N OR
-	/<LINE-NAME> ... for a properly named GPIO line
-	    /value ... always readable, writes fail for input GPIOs
-	    /direction ... r/w as: in, out (default low); write: high, low
-	    /edge ... r/w as: none, falling, rising, both
-	/gpiochipN ... for each gpiochip; #N is its first GPIO
-	    /base ... (r/o) same as N
-	    /label ... (r/o) descriptive, not necessarily unique
-	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
-
diff --git a/MAINTAINERS b/MAINTAINERS
index 23cd966cb974..0efc993249a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4643,6 +4643,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
 F:	Documentation/gpio/
 F:	Documentation/ABI/testing/gpio-cdev
+F:	Documentation/ABI/obsolete/sysfs-gpio
 F:	drivers/gpio/
 F:	include/linux/gpio/
 F:	include/linux/gpio.h
-- 
2.4.3

