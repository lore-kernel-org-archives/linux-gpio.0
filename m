From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v1 2/2] gpio: gpio-wcove: fix irq pending status bit width
Date: Fri, 14 Apr 2017 10:29:25 -0700
Message-ID: <197e6ca51bb83ae865022d7ffd085d06dfee7795.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Whiskey cove PMIC has three GPIO banks with total number of 13 GPIO
pins. But when checking for the pending status, for_each_set_bit() uses
bit width of 7 and hence it only checks the status for first 7 GPIO pins
missing to check/clear the status of rest of the GPIO pins. This patch
fixes this issue.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/gpio/gpio-wcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 68ef061..48c1504 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -319,7 +319,7 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 	while (pending) {
 		/* One iteration is for all pending bits */
 		for_each_set_bit(gpio, (const unsigned long *)&pending,
-						 GROUP0_NR_IRQS) {
+						 WCOVE_GPIO_NUM) {
 			offset = (gpio > GROUP0_NR_IRQS) ? 1 : 0;
 			mask = (offset == 1) ? BIT(gpio - GROUP0_NR_IRQS) :
 								BIT(gpio);
-- 
2.7.4
