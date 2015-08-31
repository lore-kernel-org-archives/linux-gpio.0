From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] Documentation: gpio: board: add flags parameter to
 gpiod_get*() functions
Date: Mon, 31 Aug 2015 14:24:48 +0900
Message-ID: <CAAVeFuKKDoL4Z+DdO4BRBOfgjLwncqXMg4Nm6eRcUAayaGiZvQ@mail.gmail.com>
References: <1437808318-4453-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35281 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbbHaFZI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2015 01:25:08 -0400
Received: by obcbp4 with SMTP id bp4so11983414obc.2
        for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2015 22:25:08 -0700 (PDT)
In-Reply-To: <1437808318-4453-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Sat, Jul 25, 2015 at 4:11 PM, Dirk Behme <dirk.behme@gmail.com> wrote:
> With commit 39b2bbe3d715 ("gpio: add flags argument to gpiod_get*()
> functions") the gpiod_get*() functions got a 'flags' parameter. Reflect
> this in the documentation, too.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
>  Documentation/gpio/board.txt | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
> index b80606d..7605773 100644
> --- a/Documentation/gpio/board.txt
> +++ b/Documentation/gpio/board.txt
> @@ -39,11 +39,11 @@ This property will make GPIOs 15, 16 and 17 available to the driver under the
>
>         struct gpio_desc *red, *green, *blue, *power;
>
> -       red = gpiod_get_index(dev, "led", 0);
> -       green = gpiod_get_index(dev, "led", 1);
> -       blue = gpiod_get_index(dev, "led", 2);
> +       red = gpiod_get_index(dev, "led", 0, GPIOD_OUT_HIGH);
> +       green = gpiod_get_index(dev, "led", 1, GPIOD_OUT_HIGH);
> +       blue = gpiod_get_index(dev, "led", 2, GPIOD_OUT_HIGH);
>
> -       power = gpiod_get(dev, "power");
> +       power = gpiod_get(dev, "power", GPIOD_OUT_HIGH);
>
>  The led GPIOs will be active-high, while the power GPIO will be active-low (i.e.
>  gpiod_is_active_low(power) will be true).
> @@ -142,12 +142,11 @@ The driver controlling "foo.0" will then be able to obtain its GPIOs as follows:
>
>         struct gpio_desc *red, *green, *blue, *power;
>
> -       red = gpiod_get_index(dev, "led", 0);
> -       green = gpiod_get_index(dev, "led", 1);
> -       blue = gpiod_get_index(dev, "led", 2);
> +       red = gpiod_get_index(dev, "led", 0, GPIOD_OUT_HIGH);
> +       green = gpiod_get_index(dev, "led", 1, GPIOD_OUT_HIGH);
> +       blue = gpiod_get_index(dev, "led", 2, GPIOD_OUT_HIGH);

You are right in that the documentation needs to be updated. But since
the new code sets an output value for the 3 leds GPIO, could you also
add a short note in this paragraph to mention the fact that it will
switch the LEDs on, similarly to the explanation for the "power" GPIO
below?

Oh, and apologies for taking so long to come back to this m(__)m
