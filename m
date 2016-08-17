From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: Fix OF build problem on UM
Date: Wed, 17 Aug 2016 11:03:02 +0200
Message-ID: <CAMuHMdU3j6_sye_WqKgcReD+Nym-2=ymEh98D50nD2jEifOXRQ@mail.gmail.com>
References: <1471334801-2814-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1471334801-2814-1-git-send-email-linus.walleij@linaro.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 16, 2016 at 10:06 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> The UserMode (UM) Linux build was failing in gpiolib-of as it requires
> ioremap()/iounmap() to exist, which is absent from UM. The non-existence
> of IO memory is negatively defined as CONFIG_NO_IOMEM so put a reverse
> dependency on !NO_IOMEM for OF_GPIO to fix the build.
>
> Cc: stable@vger.kernel.org
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 98dd47a30fc7..a6026f2fe7f5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -50,6 +50,7 @@ config GPIO_DEVRES
>  config OF_GPIO
>         def_bool y
>         depends on OF
> +       depends on !NO_IOMEM

depends on HAS_IOMEM?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
