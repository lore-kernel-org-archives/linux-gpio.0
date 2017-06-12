From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Take maintainership for GPIO ACPI support
Date: Mon, 12 Jun 2017 11:52:12 +0300
Message-ID: <20170612085212.64831-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:41588 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750730AbdFLIwq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Jun 2017 04:52:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

We will help Linus to maintain GPIO ACPI support.

Append a dedicated record to the MAINTAINERS data base.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0037e75bc3f8..166660958f0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5738,6 +5738,15 @@ F:	include/asm-generic/gpio.h
 F:	include/uapi/linux/gpio.h
 F:	tools/gpio/
 
+GPIO ACPI SUPPORT
+M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+L:	linux-gpio@vger.kernel.org
+L:	linux-acpi@vger.kernel.org
+S:	Maintained
+F:	Documentation/acpi/gpio-properties.txt
+F:	drivers/gpio/gpiolib-acpi.c
+
 GRE DEMULTIPLEXER DRIVER
 M:	Dmitry Kozlov <xeb@mail.ru>
 L:	netdev@vger.kernel.org
-- 
2.11.0

