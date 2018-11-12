From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: drop broken to_gpio_irq_chip() helper
Date: Mon, 12 Nov 2018 16:48:51 +0100
Message-ID: <CAMpxmJVzbQ850uMkwG+e5Gg_GgfLS_wxXOoY+xEXfjqfFyt75A@mail.gmail.com>
References: <20181112141028.10213-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112141028.10213-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, treding@nvidia.com, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

pon., 12 lis 2018 o 15:11 Johan Hovold <johan@kernel.org> napisa=C5=82(a):
>
> Drop the broken to_gpio_irq_chip() container_of() helper, which would
> break the build for anyone who tries to use it.
>

Which is the usual problem with APIs nobody uses...

> Specifically, struct gpio_irq_chip only holds a pointer to a struct
> irq_chip so using container_of() on an irq-chip pointer makes no sense.
>
> Fixes: da80ff81a8f5 ("gpio: Move irqchip into struct gpio_irq_chip")
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  include/linux/gpio/driver.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 2db62b550b95..21bff1f14fde 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -166,11 +166,6 @@ struct gpio_irq_chip {
>          */
>         void            (*irq_disable)(struct irq_data *data);
>  };
> -
> -static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *ch=
ip)
> -{
> -       return container_of(chip, struct gpio_irq_chip, chip);
> -}
>  #endif
>
>  /**
> --
> 2.19.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
