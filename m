From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: 74x164: Fix crash during .remove()
Date: Tue, 21 Nov 2017 15:18:10 +0100
Message-ID: <1511273890-552-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Commit 7ebc194d0fd4bb0f ("gpio: 74x164: Introduce 'enable-gpios'
property") added a new member gpiod_oe to the end of the struct
gen_74x164_chip, after the zero-length buffer array.

However, this buffer is a flexible array, allocated together with the
structure during .probe().  As the buffer is no longer the last member,
writing to it corrupts the newly added member after it.
During device removal, the corrupted member will be used as a pointer,
leading to a crash.

This went unnoticed, as the flexible array was declared as "buffer[0]"
instead of "buffer[]", and thus did not trigger a "flexible array member
not at end of struct" error from gcc.

Move the gpiod_oe field up to fix this, and drop the zero from the array
size to prevent future similar bugs.

Fixes: 7ebc194d0fd4bb0f ("gpio: 74x164: Introduce 'enable-gpios' property")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-74x164.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 6b535ec858cc3533..15a1f4b348c41b29 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -23,6 +23,7 @@
 struct gen_74x164_chip {
 	struct gpio_chip	gpio_chip;
 	struct mutex		lock;
+	struct gpio_desc	*gpiod_oe;
 	u32			registers;
 	/*
 	 * Since the registers are chained, every byte sent will make
@@ -31,8 +32,7 @@ struct gen_74x164_chip {
 	 * register at the end of the transfer. So, to have a logical
 	 * numbering, store the bytes in reverse order.
 	 */
-	u8			buffer[0];
-	struct gpio_desc	*gpiod_oe;
+	u8			buffer[];
 };
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
-- 
2.7.4
