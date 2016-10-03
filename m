From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: make memory-mapped drivers depend on HAS_IOMEM
Date: Mon,  3 Oct 2016 09:52:51 +0200
Message-ID: <1475481171-4416-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33793 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751098AbcJCHwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 03:52:55 -0400
Received: by mail-lf0-f47.google.com with SMTP id b81so28214750lfe.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 00:52:54 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This one is pretty obvious: on UM Linux compilation of things
like allmodconfig and allyesconfig will fail due to the
absence of IO memory. Simply make these drivers depend on
HAS_IOMEM, it has been implicitly assumed all the time, so
just make it explicit.

The generic MMIO library also assumes that IOMEM is present
so make also this depend on HAS_IOMEM.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Also make GPIO_GENERIC depend on HAS_IOMEM
---
 drivers/gpio/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 59ba58b8ac13..2401443cbf28 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -65,6 +65,7 @@ config GPIO_SYSFS
 	  exported to userspace; this can be useful when debugging.
 
 config GPIO_GENERIC
+	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
 
 # put drivers in the right section, in alphabetical order
@@ -74,6 +75,7 @@ config GPIO_MAX730X
 	tristate
 
 menu "Memory mapped GPIO drivers"
+	depends on HAS_IOMEM
 
 config GPIO_74XX_MMIO
 	tristate "GPIO driver for 74xx-ICs with MMIO access"
-- 
2.7.4

