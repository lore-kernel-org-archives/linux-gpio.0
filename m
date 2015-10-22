From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/6] gpio: add a userspace character device ABI
Date: Thu, 22 Oct 2015 10:32:29 +0200
Message-ID: <1445502750-22672-6-git-send-email-linus.walleij@linaro.org>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34087 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756712AbbJVIdG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 04:33:06 -0400
Received: by lfaz124 with SMTP id z124so39297449lfa.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 01:33:05 -0700 (PDT)
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Put in some documentation for the new character device ABI
so we can properly etch it in stone.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/ABI/testing/gpio-cdev | 26 ++++++++++++++++++++++++++
 MAINTAINERS                         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/ABI/testing/gpio-cdev

diff --git a/Documentation/ABI/testing/gpio-cdev b/Documentation/ABI/testing/gpio-cdev
new file mode 100644
index 000000000000..7b265fbb47e3
--- /dev/null
+++ b/Documentation/ABI/testing/gpio-cdev
@@ -0,0 +1,26 @@
+What:		/dev/gpiochip[0-9]+
+Date:		November 2015
+KernelVersion:	4.4
+Contact:	linux-gpio@vger.kernel.org
+Description:
+		The character device files /dev/gpiochip* are the interface
+		between GPIO chips and userspace.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include/uapi]<linux/gpio.h>.
+
+		The following file operations are supported:
+
+		open(2)
+		Currently the only useful flags are O_RDWR.
+
+		ioctl(2)
+		Initiate various actions.
+		See the inline documentation in [include/uapi]<linux/gpio.h>
+		for descriptions of all ioctls.
+
+		close(2)
+		Stops and free up the I/O contexts that was associated
+		with the file descriptor.
+
+Users:		TBD
diff --git a/MAINTAINERS b/MAINTAINERS
index 3bb1f52d54e0..23cd966cb974 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4642,6 +4642,7 @@ L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
 F:	Documentation/gpio/
+F:	Documentation/ABI/testing/gpio-cdev
 F:	drivers/gpio/
 F:	include/linux/gpio/
 F:	include/linux/gpio.h
-- 
2.4.3

