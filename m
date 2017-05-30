From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpiolib: remove unused variable
Date: Tue, 30 May 2017 13:07:47 +0300
Message-ID: <1496138867.28981.21.camel@linux.intel.com>
References: <20170530092128.1180841-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:56167 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751153AbdE3KHv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 May 2017 06:07:51 -0400
In-Reply-To: <20170530092128.1180841-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-05-30 at 11:21 +0200, Arnd Bergmann wrote:
> This was left behind by a cleanup patch:
> 
> drivers/gpio/gpiolib.c: In function
> 'gpiochip_irqchip_init_valid_mask':
> drivers/gpio/gpiolib.c:1474:6: error: unused variable 'i' [-
> Werror=unused-variable]


Right, thanks for it!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Fixes: 923a654c186c ("gpiolib: Re-use bitmap_fill() instead of open
> coded loop")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/gpiolib.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index be8097097326..62ffb4e293d2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1471,8 +1471,6 @@ static struct gpio_chip *find_chip_by_name(const
> char *name)
>  
>  static int gpiochip_irqchip_init_valid_mask(struct gpio_chip
> *gpiochip)
>  {
> -	int i;
> -
>  	if (!gpiochip->irq_need_valid_mask)
>  		return 0;
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
