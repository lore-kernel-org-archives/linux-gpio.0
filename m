From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Add myself as designated reviewer of Intel PMIC GPIO
Date: Thu, 30 Aug 2018 19:49:35 +0300
Message-ID: <20180830164935.42791-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

There are few Intel PMIC GPIO device drivers which I would like
to review.

Note, Intel MSIC is old system controller that based mostly on PMIC
integrated in it. Thus, I included it as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cbbeee75ebb9..3031d76abaab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7358,6 +7358,12 @@ T:	git https://github.com/intel/gvt-linux.git
 S:	Supported
 F:	drivers/gpu/drm/i915/gvt/
 
+INTEL PMIC GPIO DRIVER
+R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+S:	Maintained
+F:	drivers/gpio/gpio-*cove.c
+F:	drivers/gpio/gpio-msic.c
+
 INTEL HID EVENT DRIVER
 M:	Alex Hung <alex.hung@canonical.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.18.0
