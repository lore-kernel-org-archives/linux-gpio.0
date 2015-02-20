From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: return NULL from gpiod_get_optional when GPIOLIB is disabled
Date: Fri, 20 Feb 2015 13:59:43 +0900
Message-ID: <CAAVeFu+Ys44Y0mcBYqoUEVST+TZuGXKUX5qQe9z9sDZCXdOZfQ@mail.gmail.com>
References: <20150220003035.GA22334@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150220003035.GA22334@dtor-glaptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 20, 2015 at 9:30 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> Given the intent behind gpiod_get_optional() and friends it does not make
> sense to return -ENOSYS when GPIOLIB is disabled: the driver is expected to
> work just fine without gpio so let's behave as if gpio was not found.
> Otherwise we have to special-case -ENOSYS in drivers.

Interestingly Uwe sent a RFC for this one week ago:

http://patchwork.ozlabs.org/patch/439135/

Maybe credit him with a Suggested-by.?

I should have commented at that time, but let's do it now: I agree
with the idea, but this leaves the door open to confusing situations
in case gpiolib was unintentionally disabled. Could you also add a
note in the documentation of this function to explain this behavior,
to spare a few headaches to users of this function?

>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  include/linux/gpio/consumer.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index fd85cb1..f68244f 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -132,14 +132,14 @@ static inline struct gpio_desc *__must_check
>  __gpiod_get_optional(struct device *dev, const char *con_id,
>                      enum gpiod_flags flags)
>  {
> -       return ERR_PTR(-ENOSYS);
> +       return NULL;
>  }
>
>  static inline struct gpio_desc *__must_check
>  __gpiod_get_index_optional(struct device *dev, const char *con_id,
>                            unsigned int index, enum gpiod_flags flags)
>  {
> -       return ERR_PTR(-ENOSYS);
> +       return NULL;
>  }
>
>  static inline void gpiod_put(struct gpio_desc *desc)
> @@ -171,14 +171,14 @@ static inline struct gpio_desc *__must_check
>  __devm_gpiod_get_optional(struct device *dev, const char *con_id,
>                           enum gpiod_flags flags)
>  {
> -       return ERR_PTR(-ENOSYS);
> +       return NULL;
>  }
>
>  static inline struct gpio_desc *__must_check
>  __devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
>                                 unsigned int index, enum gpiod_flags flags)
>  {
> -       return ERR_PTR(-ENOSYS);
> +       return NULL;
>  }
>
>  static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
> --
> 2.2.0.rc0.207.ga3a616c
>
>
> --
> Dmitry
