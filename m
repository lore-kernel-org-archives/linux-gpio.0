From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: make memory-mapped drivers depend on HAS_IOMEM
Date: Mon,  3 Oct 2016 09:49:03 +0200
Message-ID: <1475480943-3985-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35539 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750839AbcJCHtK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 03:49:10 -0400
Received: by mail-lf0-f53.google.com with SMTP id l131so147662612lfl.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 00:49:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This one is pretty obvious: on UM Linux compilation of things
like allmodconfig and allyesconfig will fail due to the
absence of IO memory. Simply make these drivers depend on
HAS_IOMEM, it has been implicitly assumed all the time, so
just make it explicit.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 59ba58b8ac13..6cb816b3aab5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -74,6 +74,7 @@ config GPIO_MAX730X
 	tristate
 
 menu "Memory mapped GPIO drivers"
+	depends on HAS_IOMEM
 
 config GPIO_74XX_MMIO
 	tristate "GPIO driver for 74xx-ICs with MMIO access"
-- 
2.7.4

