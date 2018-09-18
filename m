From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Tue, 18 Sep 2018 15:40:10 -0700
Message-ID: <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com> <20180914070839.4667-2-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180914070839.4667-2-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Timur Tabi <timur@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 14, 2018 at 12:08 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Current code assumes that the direction is input if direction_input
> function is set.
> This might not be the case on GPIOs with programmable direction.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a57300c1d649..af853749e0bb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1352,7 +1352,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>                  * it does, and in case chip->get_direction is not set, we may
>                  * expose the wrong direction in sysfs.
>                  */
> -               desc->flags = !chip->direction_input ? (1 << FLAG_IS_OUT) : 0;
> +               if (chip->get_direction)
> +                       desc->flags = !chip->get_direction(chip, i) ?
> +                                       (1 << FLAG_IS_OUT) : 0;
> +               else
> +                       desc->flags = !chip->direction_input ?
> +                                       (1 << FLAG_IS_OUT) : 0;

We used to do this.

But it breaks Qualcomm hardware.

commit 1ca2a92b2a99323f666f1b669b7484df4bda05e4
Author: Timur Tabi <timur@codeaurora.org>
Date:   Wed Dec 20 13:10:31 2017 -0600

    Revert "gpio: set up initial state from .get_direction()"

    This reverts commit 72d3200061776264941be1b5a9bb8e926b3b30a5.

    We cannot blindly query the direction of all GPIOs when the pins are
    first registered.  The get_direction callback normally triggers a
    read/write to hardware, but we shouldn't be touching the hardware for
    an individual GPIO until after it's been properly claimed.

    Signed-off-by: Timur Tabi <timur@codeaurora.org>
    Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
