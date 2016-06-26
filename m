From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 01/19] pinctrl: freescale: remove needless module.h include
Date: Sat, 25 Jun 2016 22:46:34 -0400
Message-ID: <20160626024652.5081-2-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:40543 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586AbcFZCrS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2016 22:47:18 -0400
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

None of these files have anything modular in them, so they
don't need to be bringing in module.h and all its dependencies.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c       | 1 -
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 491d2d244f56..71391757938b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 38d39388d7a4..a4e9f430d452 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -19,7 +19,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/machine.h>
-- 
2.8.4

