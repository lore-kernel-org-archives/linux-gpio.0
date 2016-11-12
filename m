From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: do not double-check direction on sleeping chips
Date: Sat, 12 Nov 2016 15:01:09 +0100
Message-ID: <1478959269-18531-1-git-send-email-linus.walleij@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>
List-Id: linux-gpio@vger.kernel.org

When locking a GPIO line as IRQ, we go to lengths to
double-check that the line is really set as input before
marking it as used for IRQ. This is not good on GPIO chips
that can sleep, because this function is called in IRQ-safe
context. Just skip this if it can't be checked quickly.

Currently this happens on sleeping expanders such as STMPE
or TC3589x:

BUG: scheduling while atomic: swapper/1/0x00000002
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.0-rc1+ #38
Hardware name: Nomadik STn8815
[<c000f2e0>] (unwind_backtrace) from [<c000d244>] (show_stack+0x10/0x14)
[<c000d244>] (show_stack) from [<c0037b78>] (__schedule_bug+0x54/0x80)
[<c0037b78>] (__schedule_bug) from [<c042df14>] (__schedule+0x3a0/0x460)
[<c042df14>] (__schedule) from [<c042e028>] (schedule+0x54/0xb8)
(...)

This patch fixes that problem and relies on the direction
read from the chip when it was added.

Cc: stable@vger.kernel.org
Fixes: 9c10280d85c1 ("gpio: flush direction status in gpiochip_lock_as_irq()")
Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f0fc3a0d37c8..4575c2c5f293 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2664,8 +2664,11 @@ int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
-	/* Flush direction if something changed behind our back */
-	if (chip->get_direction) {
+	/*
+	 * If it's fast: flush the direction setting if something changed
+	 * behind our back
+	 */
+	if (!chip->can_sleep && chip->get_direction) {
 		int dir = chip->get_direction(chip, offset);
 
 		if (dir)
-- 
2.7.4
