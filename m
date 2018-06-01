From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH] staging: mt7621-gpio: move out of staging
Date: Fri,  1 Jun 2018 14:02:50 +0200
Message-ID: <1527854570-17200-1-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org
Cc: neil@brown.name, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, driverdev-devel@linuxdriverproject.org
List-Id: linux-gpio@vger.kernel.org

Move the mt7621-gpio driver out of staging and into mainline

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/gpio}/mediatek,mt7621-gpio.txt             | 0
 drivers/gpio/Kconfig                                               | 7 +++++++
 drivers/gpio/Makefile                                              | 1 +
 drivers/{staging/mt7621-gpio => gpio}/gpio-mt7621.c                | 0
 drivers/staging/Kconfig                                            | 2 --
 drivers/staging/Makefile                                           | 1 -
 drivers/staging/mt7621-gpio/Kconfig                                | 6 ------
 drivers/staging/mt7621-gpio/Makefile                               | 3 ---
 drivers/staging/mt7621-gpio/TODO                                   | 3 ---
 9 files changed, 8 insertions(+), 15 deletions(-)
 rename {drivers/staging/mt7621-gpio => Documentation/devicetree/bindings/gpio}/mediatek,mt7621-gpio.txt (100%)
 rename drivers/{staging/mt7621-gpio => gpio}/gpio-mt7621.c (100%)
 delete mode 100644 drivers/staging/mt7621-gpio/Kconfig
 delete mode 100644 drivers/staging/mt7621-gpio/Makefile
 delete mode 100644 drivers/staging/mt7621-gpio/TODO

diff --git a/drivers/staging/mt7621-gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
similarity index 100%
rename from drivers/staging/mt7621-gpio/mediatek,mt7621-gpio.txt
rename to Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b960f6f..280c0a0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -347,6 +347,13 @@ config GPIO_MPC8XXX
 	  Say Y here if you're going to use hardware that connects to the
 	  MPC512x/831x/834x/837x/8572/8610/QorIQ GPIOs.
 
+config GPIO_MT7621
+	bool "Mediatek GPIO Support"
+	depends on SOC_MT7620 || SOC_MT7621
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the Mediatek SoC GPIO device
+
 config GPIO_MVEBU
 	def_bool y
 	depends on PLAT_ORION || ARCH_MVEBU
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1324c8f..03647ae 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
 obj-$(CONFIG_GPIO_MPC5200)	+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)	+= gpio-mpc8xxx.o
 obj-$(CONFIG_GPIO_MSIC)		+= gpio-msic.o
+obj-$(CONFIG_GPIO_MT7621)	+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)        += gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)		+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)		+= gpio-mxs.o
diff --git a/drivers/staging/mt7621-gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
similarity index 100%
rename from drivers/staging/mt7621-gpio/gpio-mt7621.c
rename to drivers/gpio/gpio-mt7621.c
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index d5926f0..3f0cbbd 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -120,8 +120,6 @@ source "drivers/staging/pi433/Kconfig"
 
 source "drivers/staging/mt7621-pinctrl/Kconfig"
 
-source "drivers/staging/mt7621-gpio/Kconfig"
-
 source "drivers/staging/mt7621-spi/Kconfig"
 
 source "drivers/staging/mt7621-dma/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 919753c..42a1268 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -51,7 +51,6 @@ obj-$(CONFIG_DRM_VBOXVIDEO)	+= vboxvideo/
 obj-$(CONFIG_PI433)		+= pi433/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-pci/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-pinctrl/
-obj-$(CONFIG_SOC_MT7621)	+= mt7621-gpio/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-spi/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-dma/
 obj-$(CONFIG_SOC_MT7621)	+= mt7621-mmc/
diff --git a/drivers/staging/mt7621-gpio/Kconfig b/drivers/staging/mt7621-gpio/Kconfig
deleted file mode 100644
index c741ec3..0000000
--- a/drivers/staging/mt7621-gpio/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-config GPIO_MT7621
-	bool "Mediatek GPIO Support"
-	depends on SOC_MT7620 || SOC_MT7621
-	select ARCH_REQUIRE_GPIOLIB
-	help
-	  Say yes here to support the Mediatek SoC GPIO device
diff --git a/drivers/staging/mt7621-gpio/Makefile b/drivers/staging/mt7621-gpio/Makefile
deleted file mode 100644
index e269ab1..0000000
--- a/drivers/staging/mt7621-gpio/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-$(CONFIG_GPIO_MT7621)	+= gpio-mt7621.o
-
-ccflags-y += -I$(srctree)/$(src)/include
diff --git a/drivers/staging/mt7621-gpio/TODO b/drivers/staging/mt7621-gpio/TODO
deleted file mode 100644
index 674930a..0000000
--- a/drivers/staging/mt7621-gpio/TODO
+++ /dev/null
@@ -1,3 +0,0 @@
-- general code review and clean up
-
-Cc:  NeilBrown <neil@brown.name>
-- 
2.7.4
