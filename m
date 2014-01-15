From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: davinci: signedness bug in davinci_gpio_irq_setup()
Date: Wed, 15 Jan 2014 08:21:19 +0100
Message-ID: <CACRpkdbSKE=d=_oxk+Nh8g3hAjr++ukvrh4nVujupqHk_xH-uw@mail.gmail.com>
References: <20140109052803.GA1265@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20140109052803.GA1265@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@linaro.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 9, 2014 at 6:28 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "irq" needs to be signed for the error handling to work.
>
> Fixes: 6075a8b2b6c3 ('gpio: davinci: don't create irq_domain in case of unbanked irqs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 7629b4f12b7f..b0e98d379217 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -423,7 +423,7 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
>
>  static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  {
> -       unsigned        gpio, irq, bank;
> +       unsigned        gpio, bank;
>         struct clk      *clk;
>         u32             binten = 0;
>         unsigned        ngpio, bank_irq;
> @@ -433,6 +433,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>         struct davinci_gpio_platform_data *pdata = dev->platform_data;
>         struct davinci_gpio_regs __iomem *g;
>         struct irq_domain       *irq_domain = NULL;
> +       int             irq;
>
>         ngpio = pdata->ngpio;
>         res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);

Acked-by: Linus Walleij <linus.walleij@linaro.org>

This merge window the DaVinci GPIO changes are queued by the DaVinci
maintainers (this patch does not even apply to my tree) so DaVinci guys:
please pick up this patch.

Yours,
Linus Walleij
