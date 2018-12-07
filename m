From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] gpio: max7301: fix driver for use with CONFIG_VMAP_STACK
Date: Fri,  7 Dec 2018 13:07:55 +0000 (UTC)
Message-ID: <3f9179c9a1c8e2486cdd15d28530cd2e381a8830.1544152023.git.christophe.leroy@c-s.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

spi_read() and spi_write() require DMA-safe memory. When
CONFIG_VMAP_STACK is selected, those functions cannot be used
with buffers on stack.

This patch replaces calls to spi_read() and spi_write() by
spi_write_then_read() which doesn't require DMA-safe buffers.

Fixes: 0c36ec314735 ("gpio: gpio driver for max7301 SPI GPIO expander")
Cc: <stable@vger.kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpio/gpio-max7301.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 68c7942d0a3c..6f7d12ba2f74 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -25,7 +25,7 @@ static int max7301_spi_write(struct device *dev, unsigned int reg,
 	struct spi_device *spi = to_spi_device(dev);
 	u16 word = ((reg & 0x7F) << 8) | (val & 0xFF);
 
-	return spi_write(spi, (const u8 *)&word, sizeof(word));
+	return spi_write_then_read(spi, &word, sizeof(word), NULL, 0);
 }
 
 /* A read from the MAX7301 means two transfers; here, one message each */
@@ -37,14 +37,8 @@ static int max7301_spi_read(struct device *dev, unsigned int reg)
 	struct spi_device *spi = to_spi_device(dev);
 
 	word = 0x8000 | (reg << 8);
-	ret = spi_write(spi, (const u8 *)&word, sizeof(word));
-	if (ret)
-		return ret;
-	/*
-	 * This relies on the fact, that a transfer with NULL tx_buf shifts out
-	 * zero bytes (=NOOP for MAX7301)
-	 */
-	ret = spi_read(spi, (u8 *)&word, sizeof(word));
+	ret = spi_write_then_read(spi, &word, sizeof(word), &word,
+				  sizeof(word));
 	if (ret)
 		return ret;
 	return word & 0xff;
-- 
2.13.3
