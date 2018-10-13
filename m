From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] gpio: fix SNPS_CREG kconfig dependency warning
Date: Fri, 12 Oct 2018 20:46:29 -0700
Message-ID: <8bfd2cd6-702a-878c-ac41-b61698835f1a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix kconfig warning for GPIO_SNPS_CREG:

WARNING: unmet direct dependencies detected for OF_GPIO
  Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - GPIO_SNPS_CREG [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC || COMPILE_TEST [=y])

Drivers in drivers/gpio/Kconfig depend on OF_GPIO, not select it.
This prevents attempting to build when OF is not enabled.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Found in mmotm but comes from/applies to linux-next.

 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20181012.orig/drivers/gpio/Kconfig
+++ linux-next-20181012/drivers/gpio/Kconfig
@@ -439,7 +439,7 @@ config GPIO_SIOX
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
-	select OF_GPIO
+	depends on OF_GPIO
 	help
 	  This driver supports GPIOs via CREG on various Synopsys SoCs.
 	  This is a single-register MMIO GPIO driver for complex cases
