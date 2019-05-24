From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is not defined
Date: Fri, 24 May 2019 09:32:05 +0200
Message-ID: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org, Randy Dunlap <rdunlap@infradead.org>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: linux-gpio@vger.kernel.org

When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
not exist:
drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
     pctl->gpio_chip.of_node = np;

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1f380ca..7a33207 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -268,7 +268,7 @@ config PINCTRL_ST
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
-	depends on OF || COMPILE_TEST
+	depends on OF_GPIO
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
 	select MFD_STMFX
-- 
2.7.4
