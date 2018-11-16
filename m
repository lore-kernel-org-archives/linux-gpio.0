From: Brajeswar Ghosh <brajeswar.linux@gmail.com>
Subject: [PATCH] drivers/gpio/gpio-grgpio.c: Remove duplicate header
Date: Fri, 16 Nov 2018 16:19:10 +0530
Message-ID: <20181116104910.GA10265@hp-pavilion-15-notebook-pc-brajeswar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: jrdr.linux@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sabyasachi.linux@gmail.com
List-Id: linux-gpio@vger.kernel.org

Remove linux/gpio/driver.h which is included more than once

Signed-off-by: Brajeswar Ghosh <brajeswar.linux@gmail.com>
---
 drivers/gpio/gpio-grgpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 60a1556c570a..45b8d6a02b87 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -30,7 +30,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/err.h>
-#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
-- 
2.17.1
