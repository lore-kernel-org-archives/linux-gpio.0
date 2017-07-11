From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] pinctrl: stm32: select IRQ_DOMAIN_HIERARCHY instead of
 depends on
Date: Wed, 12 Jul 2017 08:11:49 +0900
Message-ID: <1499814710-16686-2-git-send-email-yamada.masahiro@socionext.com>
References: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Drivers that need IRQ_DOMAIN_HIERARCHY should "select" it, but
drivers/pinctrl/stm32/Kconfig is the only exception that uses
"depends on" syntax.  This prevents GPIO drivers from select'ing
IRQ_DOMAIN_HIERARCHY.

For example, if I add "select IRQ_DOMAIN_HIERARCHY" to GPIO_XGENE_SB,
I get the following recursive dependency error.

drivers/gpio/Kconfig:13:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:13:	symbol GPIOLIB is selected by PINCTRL_STM32
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/stm32/Kconfig:3:	symbol PINCTRL_STM32 is selected by PINCTRL_STM32F429
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/stm32/Kconfig:11:	symbol PINCTRL_STM32F429 depends on IRQ_DOMAIN_HIERARCHY
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
kernel/irq/Kconfig:67:	symbol IRQ_DOMAIN_HIERARCHY is selected by GPIO_XGENE_SB
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:502:	symbol GPIO_XGENE_SB depends on GPIOLIB

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/stm32/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 3b8026fca057..7e1fe39a56a5 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -6,29 +6,30 @@ config PINCTRL_STM32
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select IRQ_DOMAIN_HIERARCHY
 	select MFD_SYSCON
 
 config PINCTRL_STM32F429
 	bool "STMicroelectronics STM32F429 pin control" if COMPILE_TEST && !MACH_STM32F429
-	depends on OF && IRQ_DOMAIN_HIERARCHY
+	depends on OF
 	default MACH_STM32F429
 	select PINCTRL_STM32
 
 config PINCTRL_STM32F469
 	bool "STMicroelectronics STM32F469 pin control" if COMPILE_TEST && !MACH_STM32F469
-	depends on OF && IRQ_DOMAIN_HIERARCHY
+	depends on OF
 	default MACH_STM32F469
 	select PINCTRL_STM32
 
 config PINCTRL_STM32F746
 	bool "STMicroelectronics STM32F746 pin control" if COMPILE_TEST && !MACH_STM32F746
-	depends on OF && IRQ_DOMAIN_HIERARCHY
+	depends on OF
 	default MACH_STM32F746
 	select PINCTRL_STM32
 
 config PINCTRL_STM32H743
 	bool "STMicroelectronics STM32H743 pin control" if COMPILE_TEST && !MACH_STM32H743
-	depends on OF && IRQ_DOMAIN_HIERARCHY
+	depends on OF
 	default MACH_STM32H743
 	select PINCTRL_STM32
 endif
-- 
2.7.4
