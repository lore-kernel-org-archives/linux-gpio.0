From: Colin King <colin.king@canonical.com>
Subject: [PATCH] gpio: 104-dio-48e: make array 'ports' static, shrinks object size
Date: Thu,  5 Apr 2018 13:00:12 +0100
Message-ID: <20180405120012.7671-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const read-only array 'ports' on the stack but instead
make it static. Makes the object code smaller by over 100 buytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  10959	   4952	    832	  16743	   4167	drivers/gpio/gpio-104-dio-48e.o

After:
   text	   data	    bss	    dec	    hex	filename
  10790	   5008	    832	  16630	   40f6	drivers/gpio/gpio-104-dio-48e.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 31e22c93e844..9c4e07fcb74b 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -188,7 +188,7 @@ static int dio48e_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
 	size_t i;
-	const size_t ports[] = { 0, 1, 2, 4, 5, 6 };
+	static const size_t ports[] = { 0, 1, 2, 4, 5, 6 };
 	const unsigned int gpio_reg_size = 8;
 	unsigned int bits_offset;
 	size_t word_index;
-- 
2.15.1
