From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] gpiolib: fix freeing of descriptors on error
Date: Thu, 13 Sep 2018 21:56:08 +0200
Message-ID: <CAPybu_1WO8jcJbKJfiyCcfTahtxqSvdvyhyYaZsog05ab+OXWw@mail.gmail.com>
References: <20180913163541.7364-1-jim@jtan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913163541.7364-1-jim@jtan.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Paris <jim@jtan.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jim

I have sent an identical patch 3 hours before you [1] ;)
Seems that we are working on the same stuff.

Cheers

[1] https://www.spinics.net/lists/linux-gpio/msg32541.html

On Thu, Sep 13, 2018 at 6:42 PM Jim Paris <jim@jtan.com> wrote:
>
> When the main loop in linehandle_create() encounters an error, it
> fails to free one of the previously-requested GPIO descriptors.
> This renders the unfreed GPIO unusable until reboot, and leaves
> its label pointing to free'd kernel memory.
>
> Cc: stable@vger.kernel.org
> Fixes: ab3dbcf78f60 ("gpioib: do not free unrequested descriptors")
> Signed-off-by: Jim Paris <jim@jtan.com>
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
