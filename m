From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/5] gpio: pca953x: refactor pca953x_read_regs()
Date: Wed, 07 Sep 2016 16:56:31 +0300
Message-ID: <1473256591.11323.71.camel@linux.intel.com>
References: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
         <1473255472-16090-4-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:49935 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752767AbcIGN4f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 09:56:35 -0400
In-Reply-To: <1473255472-16090-4-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 15:37 +0200, Bartosz Golaszewski wrote:
> Avoid the unnecessary if-else in pca953x_read_regs() by spltting the
> routine into smaller, specialized functions and calling the right one
> via a function pointer held in struct pca953x.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 56 +++++++++++++++++++++++++++++++-----
> ---------
>  1 file changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b3020ee..018bd18 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -135,6 +135,7 @@ struct pca953x_chip {
>  	const struct pca953x_offset *offset;
>  
>  	int (*write_regs)(struct pca953x_chip *, int, u8 *);
> +	int (*read_regs)(struct pca953x_chip *, int, u8 *);
>  };
>  
>  static int pca953x_read_single(struct pca953x_chip *chip, int reg,
> u32 *val,
> @@ -220,24 +221,41 @@ static int pca953x_write_regs(struct
> pca953x_chip *chip, int reg, u8 *val)
>  	return 0;
>  }
>  
> -static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8
> *val)
> +static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8
> *val)
>  {
>  	int ret;
>  
> -	if (chip->gpio_chip.ngpio <= 8) {
> -		ret = i2c_smbus_read_byte_data(chip->client, reg);
> -		*val = ret;
> -	} else if (chip->gpio_chip.ngpio >= 24) {
> -		int bank_shift = fls((chip->gpio_chip.ngpio - 1) /
> BANK_SZ);
> +	ret = i2c_smbus_read_byte_data(chip->client, reg);
> +	*val = ret;

It's probably of out scope of this series, but looks like

if (ret < 0)
 return ret;

*val = ret;
return 0 (?);

> @@ -762,14 +780,18 @@ static int pca953x_probe(struct i2c_client
> *client,
>  	 */
>  	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
>  
> -	if (chip->gpio_chip.ngpio <= 8)
> +	if (chip->gpio_chip.ngpio <= 8) {
>  		chip->write_regs = pca953x_write_regs_8;
> -	else if (chip->gpio_chip.ngpio >= 24)
> +		chip->read_regs = pca953x_read_regs_8;
> +	} else if (chip->gpio_chip.ngpio >= 24) {
>  		chip->write_regs = pca953x_write_regs_24;
> -	else
> +		chip->read_regs = pca953x_read_regs_24;
> +	} else {
>  		chip->write_regs = chip->chip_type == PCA953X_TYPE ?
>  					pca953x_write_regs_16 :
>  					pca957x_write_regs_16;
> +		chip->read_regs = pca953x_read_regs_16;
> +	}

Would you move {} to the previous patch?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
