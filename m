From: Hoan Tran <hotran@apm.com>
Subject: [PATCH] MAINTAINERS: Add entry for Synopsys DesignWare APB GPIO driver
Date: Fri, 22 Sep 2017 14:33:22 -0700
Message-ID: <1506116002-10918-1-git-send-email-hotran@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, lho@apm.com, kdinh@apm.com, patches@apm.com, Hoan Tran <hotran@apm.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds maintainer for Synopsys DesignWare APB GPIO driver.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36cf85d..7ee8957 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12929,6 +12929,12 @@ F:	arch/arc/plat-axs10x
 F:	arch/arc/boot/dts/ax*
 F:	Documentation/devicetree/bindings/arc/axs10*
 
+SYNOPSYS DESIGNWARE APB GPIO DRIVER
+M:	Hoan Tran <hotran@apm.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-dwapb.c
+
 SYNOPSYS DESIGNWARE DMAC DRIVER
 M:	Viresh Kumar <vireshk@kernel.org>
 M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
1.9.1
