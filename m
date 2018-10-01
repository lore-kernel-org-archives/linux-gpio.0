From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Mon, 1 Oct 2018 22:48:54 +0200
Message-ID: <CACRpkdZ2XQKmzeu8KK-dCses21EBLbxtK+MvzJ42gHMhKc71kw@mail.gmail.com>
References: <20180906122436.25610-1-linus.walleij@linaro.org>
 <afd78fe6a5e168cc9190afe3e27d12286e0dfafa.camel@nxp.com> <CACRpkdbcBrjKar4CDg+yEVuCNE3RiGD61UkPasZ35SSmSNsUBA@mail.gmail.com>
 <CAOMZO5BhjDk4u4Y4H7swKK0faWaZWL7sFHZC7=G8Em0-jusUHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BhjDk4u4Y4H7swKK0faWaZWL7sFHZC7=G8Em0-jusUHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: leonard.crestez@nxp.com, John Stultz <john.stultz@linaro.org>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Anson Huang <anson.huang@nxp.com>, ext Tony Lindgren <tony@atomide.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 1, 2018 at 10:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> On Mon, Oct 1, 2018 at 5:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > reg_enet_3v3: regulator-enet-3v3 {
> > >         compatible = "regulator-fixed";
> > >         pinctrl-names = "default";
> > >         pinctrl-0 = <&pinctrl_enet_3v3>;
> > >         regulator-name = "enet_3v3";
> > >         regulator-min-microvolt = <3300000>;
> > >         regulator-max-microvolt = <3300000>;
> > >         gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> > > };
> >
> > This is a bit odd actually, the GPIO_ACTIVE_LOW flag will
> > be ignored as you see:
>
> Yes, the flag will be ignored by the regulator driver, but the dts
> description is correct: it is an active low GPIO that turns on the
> reg_enet_3v3 regulator.
>
> The 'enable-active-high' flag needs to be passed to indicate an active
> high polarity.

Yes.

> > > [    0.153171] reg_fixed_voltage_probe(179): regulator-enet-3v3 call gpiod_get_optional gflags=0x7 ena_gpio_invert
> > > [    0.153218] regulator-enet-3v3 GPIO handle specifies active low - ignored
> > > [    0.153233] of_gpio_flags_quirks(83): regulator-enet-3v3 set active low because !enable-active-high
> >
> > Because regulators don't specify active high/low in the second
> > cell because of legacy bindings.
> >
> > So this should not be in the device tree anyway, it should be
> > GPIO_ACTIVE_HIGH or just 0.
>
> Then it would provide a wrong description that does not describe the reality.

OK my bad, by all means keep it. :)

The warning message does not say the description is wrong, just that it will
be ignored, and it is there for the users to be aware of that setting
GPIO_ACTIVE_LOW will have no semantic effect.

We introduced it because we were worried that if we don't print that,
users will tend to think that their GPIO_ACTIVE_LOW flags are
respected, so it was the best we could think of.

The real problem, of course, is that the bindings are ambiguous with
the elder binding taking precedence. Sorry about that, we were young
and didn't know how to do it the right way. Lesson learnt.

Yours,
Linus Walleij
