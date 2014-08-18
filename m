From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Mon, 18 Aug 2014 09:28:04 -0700
Message-ID: <CAAVeFu+DnWGjsu0t+e5zEkNDG2O5dXs-BHX=BX4RgcpHvTg7=w@mail.gmail.com>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de> <1408355696-9998-2-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:56687 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906AbaHRQ2Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Aug 2014 12:28:25 -0400
Received: by mail-ig0-f172.google.com with SMTP id h15so8570628igd.17
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2014 09:28:24 -0700 (PDT)
In-Reply-To: <1408355696-9998-2-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 18, 2014 at 2:54 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> When looking up the IRQ the bank offset needs to be taken into account.
> Otherwise interrupts for banks other than bank 0 get incorrectly reported as
> interrupts for bank 0.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes since v1:
>         * Use lookup table instead of switch-case.
> ---
>  drivers/gpio/gpio-zynq.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Yep, you saved 16 lines compared to the first version of this patch. :)

I assume overflows over this array cannot happen (otherwise a quick
check against ARRAY_SIZE(zynq_gpio_bank_offset) would do the trick),
if so:

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index f440317..5db1af7 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -138,6 +138,13 @@ static inline void zynq_gpio_get_bank_pin(unsigned int pin_num,
>         }
>  }
>
> +static const unsigned int zynq_gpio_bank_offset[] = {
> +       ZYNQ_GPIO_BANK0_PIN_MIN,
> +       ZYNQ_GPIO_BANK1_PIN_MIN,
> +       ZYNQ_GPIO_BANK2_PIN_MIN,
> +       ZYNQ_GPIO_BANK3_PIN_MIN,
> +};
> +
>  /**
>   * zynq_gpio_get_value - Get the state of the specified pin of GPIO device
>   * @chip:      gpio_chip instance to be worked on
> @@ -461,6 +468,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
>                                       unsigned int bank_num,
>                                       unsigned long pending)
>  {
> +       unsigned int bank_offset = zynq_gpio_bank_offset[bank_num];
>         struct irq_domain *irqdomain = gpio->chip.irqdomain;
>         int offset;
>
> @@ -470,7 +478,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
>         for_each_set_bit(offset, &pending, 32) {
>                 unsigned int gpio_irq;
>
> -               gpio_irq = irq_find_mapping(irqdomain, offset);
> +               gpio_irq = irq_find_mapping(irqdomain, offset + bank_offset);
>                 generic_handle_irq(gpio_irq);
>         }
>  }
> --
> 1.8.0
>
