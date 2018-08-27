From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2 v2] gpio: ftgpio: Support optional silicon clock
Date: Mon, 27 Aug 2018 23:52:06 +0200
Message-ID: <20180827215206.GS27483@lunn.ch>
References: <20180827201540.15957-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180827201540.15957-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, Jonas Jensen <jonas.jensen@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 27, 2018 at 10:15:40PM +0200, Linus Walleij wrote:
> The GPIO silicon is clocked with a PCLK (peripheral clock)
> on all systems, however not all platforms model it and include
> it in e.g. the device tree, so add clock handling but make it
> optional so we bail out safely if it is e.g. always on.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Bail out properly for -EPROBE_DEFER from the clock.
> ---
>  drivers/gpio/gpio-ftgpio010.c | 41 +++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
> index 868bf8501560..f548bc92e1d1 100644
> --- a/drivers/gpio/gpio-ftgpio010.c
> +++ b/drivers/gpio/gpio-ftgpio010.c
> @@ -15,6 +15,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  
>  /* GPIO registers definition */
>  #define GPIO_DATA_OUT		0x00
> @@ -40,11 +41,14 @@
>   * struct ftgpio_gpio - Gemini GPIO state container
>   * @dev: containing device for this instance
>   * @gc: gpiochip for this instance
> + * @base: remapped I/O-memory base
> + * @clk: silicon clock
>   */
>  struct ftgpio_gpio {
>  	struct device *dev;
>  	struct gpio_chip gc;
>  	void __iomem *base;
> +	struct clk *clk;
>  };
>  
>  static void ftgpio_gpio_ack_irq(struct irq_data *d)
> @@ -180,6 +184,19 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
>  	if (irq <= 0)
>  		return irq ? irq : -EINVAL;
>  
> +	g->clk = devm_clk_get(dev, NULL);
> +	if (!IS_ERR(g->clk)) {
> +		ret = clk_prepare_enable(g->clk);
> +		if (ret)
> +			return ret;
> +	} else if (PTR_ERR(g->clk) == -EPROBE_DEFER) {
> +		/*
> +		 * Percolate deferrals, for anything else,
> +		 * just live without the clocking.
> +		 */
> +		return PTR_ERR(g->clk);

Hi Linus

This is O.K. But you could also do

               	} else {
	       		g->clk = NULL;
 		}

And then:

> +dis_clk:
> +	if (!IS_ERR(g->clk))
> +		clk_disable_unprepare(g->clk);

you don't need the test, the clk API is happy with a NULL pointer, and
does a NOP.

But you can keep it as is.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
