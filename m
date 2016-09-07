From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 5/5] gpio: pca953x: refactor pca953x_read_regs()
Date: Wed, 07 Sep 2016 14:35:57 +0300
Message-ID: <1473248157.11323.39.camel@linux.intel.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
         <1473240297-19881-6-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44962 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933961AbcIGLgB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 07:36:01 -0400
In-Reply-To: <1473240297-19881-6-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 11:24 +0200, Bartosz Golaszewski wrote:
> Avoid the unnecessary if-else in pca953x_read_regs() by spltting the
> routine into smaller, specialized functions and calling the right one
> via a function pointer held in struct pca953x.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 55 ++++++++++++++++++++++++++++++++--
> -----------
>  1 file changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 00bb2ea..e417c42 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -134,6 +134,7 @@ struct pca953x_chip {
>  	const struct pca953x_offset *offset;
>  
>  	int (*write_regs)(struct pca953x_chip *, int, u8 *);
> +	int (*read_regs)(struct pca953x_chip *, int, u8 *);
>  };
>  
>  static int pca953x_read_single(struct pca953x_chip *chip, int reg,
> u32 *val,
> @@ -219,24 +220,41 @@ static int pca953x_write_regs(struct
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
>  
> -		ret = i2c_smbus_read_i2c_block_data(chip->client,
> -					(reg << bank_shift) |
> REG_ADDR_AI,
> -					NBANK(chip), val);
> -	} else {
> -		ret = i2c_smbus_read_word_data(chip->client, reg <<
> 1);
> -		val[0] = (u16)ret & 0xFF;
> -		val[1] = (u16)ret >> 8;
> -	}
> +	return ret;
> +}
> +
> +static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg,
> u8 *val)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_word_data(chip->client, reg << 1);
> +	val[0] = (u16)ret & 0xFF;
> +	val[1] = (u16)ret >> 8;
> +
> +	return ret;
> +}
> +
> +static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg,
> u8 *val)
> +{
> +	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +
> +	return i2c_smbus_read_i2c_block_data(chip->client,
> +					     (reg << bank_shift) |
> REG_ADDR_AI,
> +					     NBANK(chip), val);
> +}
> +
> +static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8
> *val)
> +{
> +	int ret;
> +
> +	ret = chip->read_regs(chip, reg, val);
>  	if (ret < 0) {
>  		dev_err(&chip->client->dev, "failed reading
> register\n");
>  		return ret;
> @@ -766,10 +784,15 @@ static int pca953x_probe(struct i2c_client
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
> +		chip->read_regs = pca953x_read_regs_24;
> +	} else {
> +		chip->read_regs = pca953x_read_regs_16;
> +	}

For sake of consolidation stuff can we move write_regs_16 variants here?
It might require to refactor patch 3 as well


>  
>  	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
>  		ret = device_pca953x_init(chip, invert);

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
