From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 1/6] gpio: 104-dio-48e: Mask read inputs for get_multiple
Date: Mon, 22 Oct 2018 21:08:59 +0900
Message-ID: <e43738f7158a62d0000df6ecdd9442c59bbeb9c3.1540209293.git.vilhelm.gray@gmail.com>
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
 drivers/gpio/gpio-104-dio-48e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 9c4e07fcb74b..92c8f944bf64 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -222,7 +222,7 @@ static int dio48e_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 		port_state = inb(dio48egpio->base + ports[i]);
 
 		/* store acquired bits at respective bits array offset */
-		bits[word_index] |= port_state << word_offset;
+		bits[word_index] |= (port_state << word_offset) & word_mask;
 	}
 
 	return 0;
-- 
2.19.1
