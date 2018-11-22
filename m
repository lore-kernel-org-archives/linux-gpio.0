From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpio: restore original GPLv2+ license of gpiolib-of.c sources
Date: Thu, 22 Nov 2018 15:59:01 +0200
Message-ID: <20181122135901.31849-1-vz@mleia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

It's easy to verify that the change of drivers/gpio/gpiolib-of.c license
header to SPDX standard changes the license from GPLv2+ to GPLv2, and
this change corrects it.

Fixes: dae5f0afcfc3 ("gpio: Use SPDX header for core library")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 7f1260c78270..59cb87325179 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * OF helpers for the GPIO API
  *
-- 
2.17.1
