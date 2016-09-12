From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 6/8] gpio: loongson1: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:29 -0400
Message-ID: <20160912221631.15812-7-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Keguang Zhang <keguang.zhang@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig for this file is:

drivers/gpio/Kconfig:config GPIO_LOONGSON1
drivers/gpio/Kconfig:   tristate "Loongson1 GPIO support"

...but however it does not include module.h -- it in turn gets it from
another header (gpio/driver.h) and we'd like to replace that with a
forward delcaration of "struct module;" but if we do, this file will
fail to compile.

So we fix this first to avoid putting build failures into the bisect
commit history.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-mips@linux-mips.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-loongson1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index 10c09bdd8514..ad0a5958fcd0 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -8,6 +8,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 
-- 
2.8.4
