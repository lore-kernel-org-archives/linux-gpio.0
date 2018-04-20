From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: pcie-idio-24: Fix off-by-one error in get_multiple loop
Date: Fri, 20 Apr 2018 09:50:20 -0400
Message-ID: <20180420135020.23423-1-vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The PCIe-IDIO-24 features 8 bits of TTL GPIO which may be configured for
output or input. This patch fixes an off-by-one error in the loop
conditional for the get_multiple callback so that the TTL GPIO are
handled.

Fixes: ca37081595a2 ("gpio: pcie-idio-24: Implement get_multiple/set_multiple callbacks")
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-pcie-idio-24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 835607ecf658..32bcbd9a52aa 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -217,7 +217,7 @@ static int idio_24_gpio_get_multiple(struct gpio_chip *chip,
 	bitmap_zero(bits, chip->ngpio);
 
 	/* get bits are evaluated a gpio port register at a time */
-	for (i = 0; i < ARRAY_SIZE(ports); i++) {
+	for (i = 0; i < ARRAY_SIZE(ports) + 1; i++) {
 		/* gpio offset in bits array */
 		bits_offset = i * gpio_reg_size;
 
-- 
2.16.2
