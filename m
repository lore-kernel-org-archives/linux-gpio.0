From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68k/gpio: remove arch specific sysfs bus device
Date: Wed,  6 Apr 2016 12:32:10 +1000
Message-ID: <1459909950-26077-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
To: linux-m68k@vger.kernel.org, linux@roeck-us.net, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, linus.walleij@linaro.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-gpio@vger.kernel.org

From: Greg Ungerer <gerg@gumby.(none)>

The ColdFire architecture specific gpio support code registers a sysfs
bus device named "gpio". This clashes with the new generic API device
added in commit 3c702e99 ("gpio: add a userspace chardev ABI for GPIOs").

The old ColdFire sysfs gpio device was never used for anything specific,
and no links or other nodes were created under it. The new API sysfs gpio
device has all the same default sysfs links (device, drivers, etc) and
they are properly populated.

Remove the old ColdFire sysfs gpio registration.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/coldfire/gpio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
index 8832083..b515809 100644
--- a/arch/m68k/coldfire/gpio.c
+++ b/arch/m68k/coldfire/gpio.c
@@ -158,11 +158,6 @@ static int mcfgpio_to_irq(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 }
 
-static struct bus_type mcfgpio_subsys = {
-	.name		= "gpio",
-	.dev_name	= "gpio",
-};
-
 static struct gpio_chip mcfgpio_chip = {
 	.label			= "mcfgpio",
 	.request		= mcfgpio_request,
@@ -178,8 +173,7 @@ static struct gpio_chip mcfgpio_chip = {
 
 static int __init mcfgpio_sysinit(void)
 {
-	gpiochip_add_data(&mcfgpio_chip, NULL);
-	return subsys_system_register(&mcfgpio_subsys, NULL);
+	return gpiochip_add_data(&mcfgpio_chip, NULL);
 }
 
 core_initcall(mcfgpio_sysinit);
-- 
1.9.1
