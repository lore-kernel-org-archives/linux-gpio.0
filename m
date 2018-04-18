From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 1/2] gpio: pci-idio-16: Fix port memory offset for get_multiple callback
Date: Wed, 18 Apr 2018 08:53:10 -0400
Message-ID: <8d1e6c1c2b04815928fab78e1e2984b18ae516f4.1524000042.git.vilhelm.gray@gmail.com>
References: <cover.1524000042.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1524000042.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The ioread8 function expects a memory offset argument. This patch fixes
the ports array to provide the memory addresses of the respective device
I/O registers.

Fixes: 810ebfc5efca ("gpio: pci-idio-16: Implement get_multiple callback")
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-pci-idio-16.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 1948724d8c36..25d16b2af1c3 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -116,9 +116,9 @@ static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
 	unsigned long word_mask;
 	const unsigned long port_mask = GENMASK(gpio_reg_size - 1, 0);
 	unsigned long port_state;
-	u8 __iomem ports[] = {
-		idio16gpio->reg->out0_7, idio16gpio->reg->out8_15,
-		idio16gpio->reg->in0_7, idio16gpio->reg->in8_15,
+	void __iomem *ports[] = {
+		&idio16gpio->reg->out0_7, &idio16gpio->reg->out8_15,
+		&idio16gpio->reg->in0_7, &idio16gpio->reg->in8_15,
 	};
 
 	/* clear bits array to a clean slate */
@@ -143,7 +143,7 @@ static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
 		}
 
 		/* read bits from current gpio port */
-		port_state = ioread8(ports + i);
+		port_state = ioread8(ports[i]);
 
 		/* store acquired bits at respective bits array offset */
 		bits[word_index] |= port_state << word_offset;
-- 
2.16.2
