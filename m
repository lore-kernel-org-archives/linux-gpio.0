From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] gpio: mockup: move the driver out of the IOMEM drivers section
Date: Thu, 14 Mar 2019 16:07:50 +0100
Message-ID: <20190314150750.9371-2-brgl@bgdev.pl>
References: <20190314150750.9371-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314150750.9371-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The testing driver doesn't really depend on HAS_IOMEM. We may want to
build it for testing purposes on architectures not supporting IOMEM,
for example: on user-mode linux. Move it out of the "Memory Mapped GPIO
drivers" section.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e9473e968d9a..474ab3f7f9ce 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -330,18 +330,6 @@ config GPIO_MM_LANTIQ
 	  (EBU) found on Lantiq SoCs. The gpios are output only as they are
 	  created by attaching a 16bit latch to the bus.
 
-config GPIO_MOCKUP
-	tristate "GPIO Testing Driver"
-	depends on GPIOLIB
-	select IRQ_SIM
-	help
-	  This enables GPIO Testing driver, which provides a way to test GPIO
-	  subsystem through sysfs(or char device) and debugfs. GPIO_SYSFS
-	  must be selected for this test.
-	  User could use it through the script in
-	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
-	  it.
-
 config GPIO_MPC5200
 	def_bool y
 	depends on PPC_MPC52xx
@@ -1440,4 +1428,16 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+config GPIO_MOCKUP
+	tristate "GPIO Testing Driver"
+	depends on GPIOLIB
+	select IRQ_SIM
+	help
+	  This enables GPIO Testing driver, which provides a way to test GPIO
+	  subsystem through sysfs(or char device) and debugfs. GPIO_SYSFS
+	  must be selected for this test.
+	  User could use it through the script in
+	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
+	  it.
+
 endif
-- 
2.20.1
