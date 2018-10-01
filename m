From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Mon, 1 Oct 2018 17:37:02 -0300
Message-ID: <CAOMZO5BhjDk4u4Y4H7swKK0faWaZWL7sFHZC7=G8Em0-jusUHA@mail.gmail.com>
References: <20180906122436.25610-1-linus.walleij@linaro.org>
 <afd78fe6a5e168cc9190afe3e27d12286e0dfafa.camel@nxp.com> <CACRpkdbcBrjKar4CDg+yEVuCNE3RiGD61UkPasZ35SSmSNsUBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbcBrjKar4CDg+yEVuCNE3RiGD61UkPasZ35SSmSNsUBA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, John Stultz <john.stultz@linaro.org>, Mark Brown <broonie@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fugang Duan <fugang.duan@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Yongcai Huang <anson.huang@nxp.com>, Tony Lindgren <tony@atomide.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, jmkrzyszt@gmail.com
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Oct 1, 2018 at 5:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > reg_enet_3v3: regulator-enet-3v3 {
> >         compatible = "regulator-fixed";
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&pinctrl_enet_3v3>;
> >         regulator-name = "enet_3v3";
> >         regulator-min-microvolt = <3300000>;
> >         regulator-max-microvolt = <3300000>;
> >         gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> > };
>
> This is a bit odd actually, the GPIO_ACTIVE_LOW flag will
> be ignored as you see:

Yes, the flag will be ignored by the regulator driver, but the dts
description is correct: it is an active low GPIO that turns on the
reg_enet_3v3 regulator.

The 'enable-active-high' flag needs to be passed to indicate an active
high polarity.

> > [    0.153171] reg_fixed_voltage_probe(179): regulator-enet-3v3 call gpiod_get_optional gflags=0x7 ena_gpio_invert
> > [    0.153218] regulator-enet-3v3 GPIO handle specifies active low - ignored
> > [    0.153233] of_gpio_flags_quirks(83): regulator-enet-3v3 set active low because !enable-active-high
>
> Because regulators don't specify active high/low in the second
> cell because of legacy bindings.
>
> So this should not be in the device tree anyway, it should be
> GPIO_ACTIVE_HIGH or just 0.

Then it would provide a wrong description that does not describe the reality.
