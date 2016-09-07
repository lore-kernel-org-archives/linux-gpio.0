From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 5/5] gpio: pca953x: coding style fixes
Date: Wed, 07 Sep 2016 18:17:37 +0300
Message-ID: <1473261457.11323.88.camel@linux.intel.com>
References: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
         <1473259770-26224-6-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:7955 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932898AbcIGPRp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 11:17:45 -0400
In-Reply-To: <1473259770-26224-6-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 16:49 +0200, Bartosz Golaszewski wrote:
> pca953x_gpio_set_multiple() has some coding style issues that make it
> harder to read. Tweak the code a bit.
> 

Usually give one day for reviewers to have a chance to follow your
changes.

And one comment below.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b08ed52..079c311 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -360,25 +360,27 @@ exit:
>  }
>  
>  static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
> -		unsigned long *mask, unsigned long *bits)
> +				      unsigned long *mask, unsigned
> long *bits)
>  {
>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
> +	unsigned int bankmask, bankval;
> +	int bank_shift, bank, ret;
>  	u8 reg_val[MAX_BANK];
> -	int ret;
> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> -	int bank;

I meant to keep int ret apart.

struct pca953x_chip *chip = gpiochip_get_data(gc);
unsigned int bank_mask, bank_val, bank_shift, bank;
u8 reg_val[MAX_BANK];
int ret;

And perhaps _ in the names of bank* to be consistent.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
