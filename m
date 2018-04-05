From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: 104-dio-48e: make array 'ports' static, shrinks
 object size
Date: Thu, 5 Apr 2018 08:19:06 -0400
Message-ID: <20180405121906.GA6274@sophia>
References: <20180405120012.7671-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180405120012.7671-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 05, 2018 at 01:00:12PM +0100, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Don't populate the const read-only array 'ports' on the stack but instead
>make it static. Makes the object code smaller by over 100 buytes:
>
>Before:
>   text	   data	    bss	    dec	    hex	filename
>  10959	   4952	    832	  16743	   4167	drivers/gpio/gpio-104-dio-48e.o
>
>After:
>   text	   data	    bss	    dec	    hex	filename
>  10790	   5008	    832	  16630	   40f6	drivers/gpio/gpio-104-dio-48e.o
>
>(gcc version 7.2.0 x86_64)
>
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> drivers/gpio/gpio-104-dio-48e.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
>index 31e22c93e844..9c4e07fcb74b 100644
>--- a/drivers/gpio/gpio-104-dio-48e.c
>+++ b/drivers/gpio/gpio-104-dio-48e.c
>@@ -188,7 +188,7 @@ static int dio48e_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> {
> 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
> 	size_t i;
>-	const size_t ports[] = { 0, 1, 2, 4, 5, 6 };
>+	static const size_t ports[] = { 0, 1, 2, 4, 5, 6 };
> 	const unsigned int gpio_reg_size = 8;
> 	unsigned int bits_offset;
> 	size_t word_index;
>-- 
>2.15.1
>

If this makes gpio-104-dio-48e.o smaller, then it may be worthwhile to
apply similar changes to gpio-104-idi-48.c and gpio-gpio-mm.c which have
similar get_multiple callback implementations.

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
