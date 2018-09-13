From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] gpiolib: Free the last requested descriptor
Date: Thu, 13 Sep 2018 16:11:59 +0200
Message-ID: <CAPybu_1e8qTGY2W5sXVMPU95dfSRqKUq8yQmSKCOrx5rZU13aA@mail.gmail.com>
References: <20180913133704.15739-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913133704.15739-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: timur@codeaurora.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Reported-by: Jan Lorenzen <jl@newtec.dk>
On Thu, Sep 13, 2018 at 3:37 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> The current code only frees N-1 gpios if an error occurs during
> gpiod_set_transitory, gpiod_direction_output or gpiod_direction_input.
> Leading to gpios that cannot be used by userspace nor other drivers.
>
> Cc: Timur Tabi <timur@codeaurora.org>
> Cc: stable@vger.kernel.org
> Fixes: ab3dbcf78f60f46d ("gpioib: do not free unrequested descriptors)
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e8f8a1999393..a57300c1d649 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -571,7 +571,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>                 if (ret)
>                         goto out_free_descs;
>                 lh->descs[i] = desc;
> -               count = i;
> +               count = i + 1;
>
>                 if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
>                         set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> --
> 2.18.0
>


-- 
Ricardo Ribalda
