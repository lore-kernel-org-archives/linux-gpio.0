From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Mon, 1 Oct 2018 22:16:51 +0200
Message-ID: <CACRpkdbcBrjKar4CDg+yEVuCNE3RiGD61UkPasZ35SSmSNsUBA@mail.gmail.com>
References: <20180906122436.25610-1-linus.walleij@linaro.org> <afd78fe6a5e168cc9190afe3e27d12286e0dfafa.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <afd78fe6a5e168cc9190afe3e27d12286e0dfafa.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leonard.crestez@nxp.com, John Stultz <john.stultz@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Anson Huang <anson.huang@nxp.com>, ext Tony Lindgren <tony@atomide.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 1, 2018 at 8:53 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> This patch seems to break network booting on imx6sx-sdb in linux-next
> because the enet phy regulator is not on. Reverting the patch fixes
> boot.

Thanks for reporting.

John Stultz reported the same problem I'm trying to debug it.

> Here is the regulator definition:
>
> reg_enet_3v3: regulator-enet-3v3 {
>         compatible = "regulator-fixed";
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_enet_3v3>;
>         regulator-name = "enet_3v3";
>         regulator-min-microvolt = <3300000>;
>         regulator-max-microvolt = <3300000>;
>         gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> };

This is a bit odd actually, the GPIO_ACTIVE_LOW flag will
be ignored as you see:

> [    0.153171] reg_fixed_voltage_probe(179): regulator-enet-3v3 call gpiod_get_optional gflags=0x7 ena_gpio_invert
> [    0.153218] regulator-enet-3v3 GPIO handle specifies active low - ignored
> [    0.153233] of_gpio_flags_quirks(83): regulator-enet-3v3 set active low because !enable-active-high

Because regulators don't specify active high/low in the second
cell because of legacy bindings.

So this should not be in the device tree anyway, it should be
GPIO_ACTIVE_HIGH or just 0.

> That "gpio_value: 30 set 1" tracepoint is wrong, the line is set high.
>
> It seems that gpiod_set_value will check FLAG_ACTIVE_LOW and
> automatically invert
(...)
>so maybe ena_gpio_invert should not be used if a
> full gpiod is passed to regulator?
(...)
> -       cfg.ena_gpio_invert = !config->enable_high;

Indeed. I will look closer so it's the right fix and provide a patch.

> All these high/low inversions and flags are extremely confusing to me.

Yeah it's what I'm trying to get rid of with these patches,
this is just the first patch in a series that move inversion over
to the GPIO library.

Yours,
Linus Walleij
