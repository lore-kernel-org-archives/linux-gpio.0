From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 5/6] gpio: pci-idio-16: Mask read inputs for get_multiple
Date: Mon, 22 Oct 2018 21:10:06 +0900
Message-ID: <4e02f26b801f271e80b7738a851b52ab7ffde649.1540209293.git.vilhelm.gray@gmail.com>
References: <cover.1540209293.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1540209293.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux@rasmusvillemoes.dk, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

This patch masks the read inputs with the word mask in order to ensure
only requested input states are returned in the bits array.

Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-pci-idio-16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 25d16b2af1c3..6b7349783223 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -146,7 +146,7 @@ static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
 		port_state = ioread8(ports[i]);
 
 		/* store acquired bits at respective bits array offset */
-		bits[word_index] |= port_state << word_offset;
+		bits[word_index] |= (port_state << word_offset) & word_mask;
 	}
 
 	return 0;
-- 
2.19.1
