From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH] pinctrl: pistachio: Use common error handling code in pistachio_gpio_register()
Date: Tue, 31 Oct 2017 09:13:42 -0700
Message-ID: <CAL1qeaEQV+Cz6Y5XUg-kAZUhANHGsSoAWT_oGgM4Y_PieZOXdA@mail.gmail.com>
References: <0b8eced6-c4d9-6b0b-ac23-de764622e91c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <0b8eced6-c4d9-6b0b-ac23-de764622e91c@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Damien Horsley <Damien.Horsley@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: linux-gpio@vger.kernel.org

Markus,

On Mon, Oct 30, 2017 at 10:51 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 30 Oct 2017 18:40:10 +0100
>
> Adjust jump targets so that a bit of exception handling can be better
> reused at the end of this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Andrew Bresticker <abrestic@chromium.org>

> ---
>  drivers/pinctrl/pinctrl-pistachio.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
> index 55375b1b3cc8..b314eb61bf35 100644
> --- a/drivers/pinctrl/pinctrl-pistachio.c
> +++ b/drivers/pinctrl/pinctrl-pistachio.c
> @@ -1362,21 +1362,21 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>                 if (!child) {
>                         dev_err(pctl->dev, "No node for bank %u\n", i);
>                         ret = -ENODEV;
> -                       goto err;
> +                       goto remove_chips;
>                 }
>
>                 if (!of_find_property(child, "gpio-controller", NULL)) {
>                         dev_err(pctl->dev,
>                                 "No gpio-controller property for bank %u\n", i);
>                         ret = -ENODEV;
> -                       goto err;
> +                       goto remove_chips;
>                 }
>
>                 irq = irq_of_parse_and_map(child, 0);
>                 if (irq < 0) {
>                         dev_err(pctl->dev, "No IRQ for bank %u: %d\n", i, irq);
>                         ret = irq;
> -                       goto err;
> +                       goto remove_chips;
>                 }
>
>                 bank = &pctl->gpio_banks[i];
> @@ -1389,7 +1389,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>                 if (ret < 0) {
>                         dev_err(pctl->dev, "Failed to add GPIO chip %u: %d\n",
>                                 i, ret);
> -                       goto err;
> +                       goto remove_chips;
>                 }
>
>                 ret = gpiochip_irqchip_add(&bank->gpio_chip, &bank->irq_chip,
> @@ -1397,8 +1397,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>                 if (ret < 0) {
>                         dev_err(pctl->dev, "Failed to add IRQ chip %u: %d\n",
>                                 i, ret);
> -                       gpiochip_remove(&bank->gpio_chip);
> -                       goto err;
> +                       goto remove_chip;
>                 }
>                 gpiochip_set_chained_irqchip(&bank->gpio_chip, &bank->irq_chip,
>                                              irq, pistachio_gpio_irq_handler);
> @@ -1409,13 +1408,15 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>                 if (ret < 0) {
>                         dev_err(pctl->dev, "Failed to add GPIO range %u: %d\n",
>                                 i, ret);
> -                       gpiochip_remove(&bank->gpio_chip);
> -                       goto err;
> +                       goto remove_chip;
>                 }
>         }
>
>         return 0;
> -err:
> +
> +remove_chip:
> +       gpiochip_remove(&bank->gpio_chip);
> +remove_chips:
>         for (; i > 0; i--) {
>                 bank = &pctl->gpio_banks[i - 1];
>                 gpiochip_remove(&bank->gpio_chip);
> --
> 2.14.3
>
