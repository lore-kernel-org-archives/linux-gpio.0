From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 1/5] gpio: pca953x: code shrink
Date: Wed, 07 Sep 2016 08:09:33 -0700
Message-ID: <1473260973.29864.13.camel@perches.com>
References: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
         <1473259770-26224-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473259770-26224-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2016-09-07 at 16:49 +0200, Bartosz Golaszewski wrote:
> There are multiple places in the driver code where a
> switch (chip->chip_type) is used to determine the proper register
> offset.
> 
> Unduplicate the code by adding a simple structure holding the possible
> offsets that differ between the pca953x and pca957x chip families and
> use it to avoid the checks.
[]
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
[]
> @@ -94,6 +94,24 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
>  
>  #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
>  
> +struct pca953x_offset {
> > +	int direction;
> > +	int output;
> > +	int input;
> +};

The struct name seems suboptimal.
Maybe pca95xx_reg_io_config or some such.

> +static const struct pca953x_offset pca953x_offsets = {
> > +	.direction = PCA953X_DIRECTION,
> > +	.output = PCA953X_OUTPUT,
> > +	.input = PCA953X_INPUT,
> +};
> +
> +static const struct pca953x_offset pca957x_offsets = {
> > +	.direction = PCA957X_CFG,
> > +	.output = PCA957X_OUT,
> > +	.input = PCA957X_IN,
> +};

The more naming consistency for #defines would be nice too
at some point.

> 
