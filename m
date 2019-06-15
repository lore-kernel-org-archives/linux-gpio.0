From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH net-next v2 1/1] net: stmmac: use GPIO descriptors in stmmac_mdio_reset
Date: Sat, 15 Jun 2019 11:11:35 +0200
Message-ID: <CAFBinCAimhth8fDcBZ3vNdy_9dGmHZVAAK0=TUczWWC4Dsa-pA@mail.gmail.com>
References: <20190612193115.6751-1-martin.blumenstingl@googlemail.com>
 <20190612193115.6751-2-martin.blumenstingl@googlemail.com> <CACRpkdajXRXRFz=XpbEzwUb-crhBxNQ4f-m9rfdY6+HcG0+_gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdajXRXRFz=XpbEzwUb-crhBxNQ4f-m9rfdY6+HcG0+_gA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: netdev <netdev@vger.kernel.org>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Sat, Jun 15, 2019 at 11:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Martin!
>
> Thanks for fixing this up!
you're welcome
I think I finally understand why you want to switch everything over to
GPIO descriptors

> A hint for a follow-up:
>
> On Wed, Jun 12, 2019 at 9:31 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 4335bd771ce5..816edb545592 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -97,7 +97,7 @@ struct stmmac_mdio_bus_data {
> >         int *irqs;
> >         int probed_phy_irq;
> >  #ifdef CONFIG_OF
> > -       int reset_gpio, active_low;
> > +       int reset_gpio;
>
> Nothing in the kernel seems to be using this reset_gpio either.
>
> I think it can be deleted with associated code, any new users
> should use machine descriptors if they insist on board files.
good catch, thank you - I'll put that in my cleanup series that I want
to send anyways


Martin
