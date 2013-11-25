From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2] gpiolib: add missing declarations
Date: Mon, 25 Nov 2013 18:34:24 +0900
Message-ID: <1385372064-16221-1-git-send-email-acourbot@nvidia.com>
References: <529317AB.1050600@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <529317AB.1050600@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Add declaration of 'struct of_phandle_args' to avoid the following
warning:

  In file included from arch/arm/mach-tegra/board-paz00.c:21:0:
  include/linux/gpio/driver.h:102:17: warning: 'struct of_phandle_args' declared inside parameter list
  include/linux/gpio/driver.h:102:17: warning: its scope is only this definition or declaration, which is probably not what you want

Also proactively add other definitions/includes that could be missing
in other contexts.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reported-by: Stephen Warren <swarren@wwwdotorg.org>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 include/linux/gpio/driver.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 82eac610ce1a..3ea2cf6b0e6c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -2,9 +2,12 @@
 #define __LINUX_GPIO_DRIVER_H
 
 #include <linux/types.h>
+#include <linux/module.h>
 
 struct device;
 struct gpio_desc;
+struct of_phandle_args;
+struct device_node;
 struct seq_file;
 
 /**
-- 
1.8.4.2
