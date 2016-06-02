From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-dio-48e: Fix control port offset computation off-by-one error
Date: Thu,  2 Jun 2016 16:00:09 -0400
Message-ID: <1464897609-7389-1-git-send-email-vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

There are only two control ports, each controlling three distinct I/O
ports. To compute the control port address offset for a respective I/O
port, the I/O port address offset should be divided by 3; dividing by 2
may result in not only the wrong address offset but possibly also an
out-of-bounds array memory access for a non-existent third control port.

Fixes: 1b06d64f7374 ("gpio: Add GPIO support for the ACCES 104-DIO-48E")
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 1a647c0..fcf7769 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -75,7 +75,7 @@ static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
 	const unsigned io_port = offset / 8;
-	const unsigned control_port = io_port / 2;
+	const unsigned int control_port = io_port / 3;
 	const unsigned control_addr = dio48egpio->base + 3 + control_port*4;
 	unsigned long flags;
 	unsigned control;
@@ -115,7 +115,7 @@ static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
 	const unsigned io_port = offset / 8;
-	const unsigned control_port = io_port / 2;
+	const unsigned int control_port = io_port / 3;
 	const unsigned mask = BIT(offset % 8);
 	const unsigned control_addr = dio48egpio->base + 3 + control_port*4;
 	const unsigned out_port = (io_port > 2) ? io_port + 1 : io_port;
-- 
2.7.3
