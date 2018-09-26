From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Wed, 26 Sep 2018 13:42:35 +0200
Message-ID: <CAMuHMdWu-GWBompRMwbweOw-N2AOUtpGdAnO8JGbRAvy=Q9j=g@mail.gmail.com>
References: <20180926091053.21255-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926091053.21255-1-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Phil,

On Wed, Sep 26, 2018 at 11:11 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> This implements the pinctrl driver for the RZ/N1 family of devices, including
> the R9A06G032 (RZ/N1D) device.
>
> This series was originally written by Michel Pollet whilst at Renesas, and I
> have taken over this work.
>
> Main changes:
> v5:
>  - Address Jacopo's further comments
>  - Address Geert's comments
>
> v4:
>  - Address Jacopo's comments
>  - Add alternative way to use the pinmux prop.
>  - Remove mention of gpios.
>  - Implement pin_config_group_get()
>  - Fix function to get pin configs, i.e. return -EINVAL when disabled.
>
> v3:
>  - Use standard DT props instead of proprietary ones.
>  - Replace virtual pins used for MDIO muxing with extra funcs.
>  - Use pinctrl_utils funcs to handle the maps.
>  - Remove the dbg functions to keep things simple.
>  - Change the way the functions are defined so it is easy to check
>    against the hardware numbering.
>
> v2:
>  - Change to generic rzn1 family driver, instead of device specific.
>  - Review comments fixed.
>  - Fix error handling during probe
>
> Phil Edworthy (3):
>   dt-bindings: pinctrl: renesas,rzn1-pinctrl: documentation
>   pinctrl: renesas: Renesas RZ/N1 pinctrl driver
>   ARM: dts: r9a06g032: Add pinctrl node

Thanks, will apply the first two patches to sh-pfc-for-v4.2.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
