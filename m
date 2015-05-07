From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/3] leds: leds-gpio: Add missing #include <linux/of.h>
Date: Thu, 07 May 2015 14:15:05 +0200
Message-ID: <554B5749.60801@samsung.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
 <1430986090-7243-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
In-reply-to: <1430986090-7243-3-git-send-email-geert@linux-m68k.org>
Sender: linux-leds-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 05/07/2015 10:08 AM, Geert Uytterhoeven wrote:
> drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=80=
=99:
> drivers/leds/leds-gpio.c:194: error: implicit declaration of function=
 =E2=80=98of_node=E2=80=99
> drivers/leds/leds-gpio.c:194: warning: assignment makes pointer from =
integer without a cast
> drivers/leds/leds-gpio.c:200: error: dereferencing pointer to incompl=
ete type
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   drivers/leds/leds-gpio.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 15eb3f86f670ffe4..89d981e8f8cacf55 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -16,6 +16,7 @@
>   #include <linux/kernel.h>
>   #include <linux/leds.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/property.h>
>   #include <linux/slab.h>
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

--=20
Best Regards,
Jacek Anaszewski
