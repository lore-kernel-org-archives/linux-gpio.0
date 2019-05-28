From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: bcm2835: Fix build error without CONFIG_OF
Date: Tue, 28 May 2019 17:13:04 +0800
Message-ID: <20190528091304.9932-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, rafal@milecki.pl, gregkh@linuxfoundation.org, opendmb@gmail.com, eric@anholt.net, tglx@linutronix.de, matheus@castello.eng.br
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-gpio@vger.kernel.org

drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pctl_dt_node_to_map:
drivers/pinctrl/bcm/pinctrl-bcm2835.c:720:8: error: implicit declaration of function pinconf_generic_dt_node_to_map_all;
drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pinctrl_probe:
drivers/pinctrl/bcm/pinctrl-bcm2835.c:1022:15: error: struct gpio_chip has no member named of_node
  pc->gpio_chip.of_node = np;

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl binding")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/bcm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 4b5842c..dcf7df7 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -19,7 +19,7 @@ config PINCTRL_BCM281XX
 
 config PINCTRL_BCM2835
 	bool "Broadcom BCM2835 GPIO (with PINCONF) driver"
-	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
+	depends on OF && (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.7.4
