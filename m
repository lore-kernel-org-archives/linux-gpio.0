From: Jan Kotas <jank@cadence.com>
Subject: [PATCH 1/1] gpio: mmio: Fix bgpio_get_set & bgpio_get_set_multiple
Date: Mon, 1 Apr 2019 10:09:42 +0100
Message-ID: <20190401090942.12408-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: linux-gpio@vger.kernel.org

During my regression testing I noticed the cadence GPIO driver
fails on the latest gpio for-next tree.

I think the reason is this patch:
commit 96cd559817f2 ("Merge branch 'devel' into for-next")

Here is a part of the test log:

Loopback 8 -> 24
TESTING: gpio: 488: output direction PASSED
TESTING: gpio: 504: input direction PASSED
TESTING: gpio: 488: 0 PASSED
TESTING: gpio: 488 -> 504: 0 PASSED
TESTING: gpio: 488: 1 FAILED
TESTING: gpio: 488 -> 504: 1 FAILED
TESTING: gpio: 488: 0 PASSED
TESTING: gpio: 488 -> 504: 0 PASSED

It looks like the issue is that gc->bgpio_dir has changed its meaning.
It used to be set to the register value (so it was being inverted).

Now it's always set to 1 for output and 0 for input.
However the bgpio_get_set functions were not updated.
So they invert the bit again, which means a wrong register
is being accessed.

This patch fixes that by removing the unnecessary inversion.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/gpio/gpio-mmio.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f172b4382d..04be18b954 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -134,17 +134,6 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 	unsigned long pinmask = bgpio_line2mask(gc, gpio);
 	bool dir = !!(gc->bgpio_dir & pinmask);
 
-	/*
-	 * If the direction is OUT we read the value from the SET
-	 * register, and if the direction is IN we read the value
-	 * from the DAT register.
-	 *
-	 * If the direction bits are inverted, naturally this gets
-	 * inverted too.
-	 */
-	if (gc->bgpio_dir_inverted)
-		dir = !dir;
-
 	if (dir)
 		return !!(gc->read_reg(gc->reg_set) & pinmask);
 	else
@@ -164,14 +153,8 @@ static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	/* Make sure we first clear any bits that are zero when we read the register */
 	*bits &= ~*mask;
 
-	/* Exploit the fact that we know which directions are set */
-	if (gc->bgpio_dir_inverted) {
-		set_mask = *mask & ~gc->bgpio_dir;
-		get_mask = *mask & gc->bgpio_dir;
-	} else {
-		set_mask = *mask & gc->bgpio_dir;
-		get_mask = *mask & ~gc->bgpio_dir;
-	}
+	set_mask = *mask & gc->bgpio_dir;
+	get_mask = *mask & ~gc->bgpio_dir;
 
 	if (set_mask)
 		*bits |= gc->read_reg(gc->reg_set) & set_mask;
-- 
2.15.0
