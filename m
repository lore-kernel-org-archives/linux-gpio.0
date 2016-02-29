From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/8] drivers/pinctrl: make stm32/pinctrl-stm32f429.c
 explicitly non-modular
Date: Mon, 29 Feb 2016 15:48:41 -0500
Message-ID: <1456778924-20730-6-git-send-email-paul.gortmaker@windriver.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/stm32/Kconfig:config PINCTRL_STM32F429
drivers/pinctrl/stm32/Kconfig:  bool "STMicroelectronics STM32F429 pin control" if COMPILE_TEST && !MACH_STM32F429

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32f429.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32f429.c b/drivers/pinctrl/stm32/pinctrl-stm32f429.c
index f34016b51375..e9b15dc0654b 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32f429.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32f429.c
@@ -4,7 +4,6 @@
  * License terms:  GNU General Public License (GPL), version 2
  */
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
@@ -1576,7 +1575,6 @@ static const struct of_device_id stm32f429_pctrl_match[] = {
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, stm32f429_pctrl_match);
 
 static struct platform_driver stm32f429_pinctrl_driver = {
 	.probe = stm32_pctl_probe,
@@ -1590,9 +1588,4 @@ static int __init stm32f429_pinctrl_init(void)
 {
 	return platform_driver_register(&stm32f429_pinctrl_driver);
 }
-
-module_init(stm32f429_pinctrl_init);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("STM32F429 Pinctrl Driver");
-MODULE_AUTHOR("Maxime Coquelin <mcoquelin.stm32@gmail.com>");
+device_initcall(stm32f429_pinctrl_init);
-- 
2.6.1
