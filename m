From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 8/8] gpio: don't include module.h in shared driver header
Date: Mon, 12 Sep 2016 18:16:31 -0400
Message-ID: <20160912221631.15812-9-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:38244 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757415AbcILWQ7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Sep 2016 18:16:59 -0400
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Most shared headers in include/linux don't need to know what the
internals of a struct module are; all they care about is that it
is a struct and hence they may require a pointer to one.

The advantage in this is that module.h is including a lot of stuff
itself, and an otherwise empty C file that just contains module.h
will result in ~750kB from CPP (compared to say 12kB from init.h)

So we have approximately 50 instances of "struct module;" in the
various include/linux headers already that help us keep module.h
out of other headers; here we do the same for gpio.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 include/linux/gpio/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 50882e09289b..216e6f275aa8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -3,7 +3,6 @@
 
 #include <linux/device.h>
 #include <linux/types.h>
-#include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -16,6 +15,7 @@ struct of_phandle_args;
 struct device_node;
 struct seq_file;
 struct gpio_device;
+struct module;
 
 #ifdef CONFIG_GPIOLIB
 
-- 
2.8.4

