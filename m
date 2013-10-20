From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 2/3] gpiolib: devres: add missing headers
Date: Sun, 20 Oct 2013 15:14:58 -0700
Message-ID: <1382307299-22587-3-git-send-email-acourbot@nvidia.com>
References: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Add missing headers for drivers/gpiolib/devres.c.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/devres.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index fceebdc..307464f 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -15,7 +15,9 @@
  */
 
 #include <linux/module.h>
+#include <linux/err.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
 
-- 
1.8.4.1
