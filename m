From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/2] gpio: sch: Remove write-only core_base
Date: Thu, 18 Apr 2019 11:23:48 +0200
Message-ID: <1d2dafa4bfcd485cf28bb8e3a6e169d220edf555.1555579429.git.jan.kiszka@siemens.com>
References: <cover.1555579429.git.jan.kiszka@siemens.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1555579429.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1555579429.git.jan.kiszka@siemens.com>
References: <cover.1555579429.git.jan.kiszka@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/gpio/gpio-sch.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index c333046d02b8..fb143f28c386 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -23,7 +23,6 @@ struct sch_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	unsigned short iobase;
-	unsigned short core_base;
 	unsigned short resume_base;
 };
 
@@ -166,7 +165,6 @@ static int sch_gpio_probe(struct platform_device *pdev)
 
 	switch (pdev->id) {
 	case PCI_DEVICE_ID_INTEL_SCH_LPC:
-		sch->core_base = 0;
 		sch->resume_base = 10;
 		sch->chip.ngpio = 14;
 
@@ -185,19 +183,16 @@ static int sch_gpio_probe(struct platform_device *pdev)
 		break;
 
 	case PCI_DEVICE_ID_INTEL_ITC_LPC:
-		sch->core_base = 0;
 		sch->resume_base = 5;
 		sch->chip.ngpio = 14;
 		break;
 
 	case PCI_DEVICE_ID_INTEL_CENTERTON_ILB:
-		sch->core_base = 0;
 		sch->resume_base = 21;
 		sch->chip.ngpio = 30;
 		break;
 
 	case PCI_DEVICE_ID_INTEL_QUARK_X1000_ILB:
-		sch->core_base = 0;
 		sch->resume_base = 2;
 		sch->chip.ngpio = 8;
 		break;
-- 
2.16.4
