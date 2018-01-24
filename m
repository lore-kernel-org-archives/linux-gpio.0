From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC PATCH v1] pinctrl: meson: meson8b: fix requesting GPIOs
 greater than GPIOZ_3
Date: Wed, 24 Jan 2018 15:52:56 +0100
Message-ID: <1516805576.2344.86.camel@baylibre.com>
References: <20180124002738.32338-1-martin.blumenstingl@googlemail.com>
         <1516782493.2344.48.camel@baylibre.com>
         <CAFBinCCBHcjMRJ5sd9qWnL3FDEcHxp96rahgcYmSS3q-af-9Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:37965 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933954AbeAXOxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jan 2018 09:53:00 -0500
Received: by mail-wr0-f170.google.com with SMTP id x1so4325187wrb.5
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2018 06:53:00 -0800 (PST)
In-Reply-To: <CAFBinCCBHcjMRJ5sd9qWnL3FDEcHxp96rahgcYmSS3q-af-9Pw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, carlo@caione.org, linus.walleij@linaro.org, linus.luessing@c0d3.blue

On Wed, 2018-01-24 at 11:10 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Wed, Jan 24, 2018 at 9:28 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Wed, 2018-01-24 at 01:27 +0100, Martin Blumenstingl wrote:
> > > Meson8b is a cost reduced variant of the Meson8 SoC. It's package size
> > > is smaller than Meson8.
> > > Unfortunately there are a few key differences which cannot be seen
> > > without close inspection of the code and the public S805 data-sheet:
> > > - the GPIOX bank is missing the GPIOX_12, GPIOX_13, GPIOX_14 and
> > >   GPIOX_15 GPIOs
> > > - the GPIOY bank is missing the GPIOY_2, GPIOY_4, GPIOY_5, GPIOY_15 and
> > >   GPIOY_16 GPIOs
> > > - the GPIODV bank is missing all GPIOs except GPIODV_9, GPIODV_24,
> > >   GPIODV_25, GPIODV_26, GPIODV_27, GPIODV_28 and GPIODV_29
> > > - the GPIOZ bank is missing completely
> > > - there is a new GPIO bank called "DIF"
> > > - (all other pads exist on both, Meson8 and Meson8b)
> > > 
> > > The pinctrl-meson driver internally uses struct meson_bank, which
> > > assumes that the GPIOs are continuous, without any holes in between.
> > > This also matches with how the registers work:
> > > - GPIOX_0 for example uses bit 0 for switching this pad between
> > >   input/output, configuring pull-up/down, etc.
> > > - GPIOX_16 uses bit 16 for switching this pad between input/output,
> > >   configuring pull-up/down/, etc
> > > GPIOX_16 uses bit 16 even though GPIOX12..15 don't exist. (This is
> > > probably the reason why Meson8b inherits the dt-bindings - with all GPIO
> > > IDs - from Meson8)
> > > This means that Meson8b only has 83 actual GPIO lines. Without any holes
> > > there would be 130 GPIO lines in total (120 are inherited from Meson8
> > > plus 10 new from the DIF bank).
> > > 
> > > The pinctrl framework handles holes in the pin list fine, which can be
> > > seen in debugfs:
> > > $ cat /sys/kernel/debug/pinctrl/c1109880.pinctrl/pins
> > > pin 9 (GPIOX_9)  c1109880.pinctrl
> > > pin 10 (GPIOX_10)  c1109880.pinctrl
> > > pin 11 (GPIOX_11)  c1109880.pinctrl
> > > pin 16 (GPIOX_16)  c1109880.pinctrl
> > > pin 17 (GPIOX_17)  c1109880.pinctrl
> > 
> > Hi Martin,
> > 
> > While working on this controller a few weeks ago, I have seen that our current
> > design does not tolerate having holes in the declared PINS. This is something
> > that predate the changes mentioned here.
> > 
> > I'm not a big fan of the this overrides_ngpio here, I'm sure it fixes your
> > problem but it seems a bit hacky, don't you think ?
> 
> this is the reason why I sent it as RFC - I'm open to better solutions!
> 
> > I would prefer either of these 2 approach:
> > 
> > * Update the binding and kill the necessary pins. We are still figuring out
> > those chips, which is why the bindings are marked as un-stable. If sharing the
> > binding with meson8 was a mistake, now is the time to fix it.
> 
> let's say we produce a header file which does not contain GPIOX_12:
> this would be nice since it gives compile errors if non-existent GPIOs
> are used (instead of failing only at run-time)
> 
> however, the problem is meson8b_cbus_banks (annotated here to make it
> easier to read):
> BANK("X", /* name */
>           GPIOX_0, GPIOX_21, /* first and last GPIO */
>           97, 118, /* first and last IRQ */
>           4,  0, /* pull-up/down enable register and bit offset */
>           4,  0, /* pull-up/down configuration register and bit offset */
>           0,  0, /* input/output direction register and bit offset */
>           1,  0, /* output value register and bit offset */
>           2,  0), /* input value register and bit offset */
> 
> let's say we want to configure GPIOX_0 as an input:
> - we need to find the "offset" of this pad within the bank -> 0
> - find the input/output direction register -> 0
> - find the bit in that register: bit 0 + pad offset 0 = 0
> - we clear bit 0 in register 0
> 
> with the current code configuring GPIOX_16 as input works like this:
> - we need to find the "offset" of this pad within the bank -> 16
> - find the input/output direction register -> 0
> - find the bit in that register: bit 0 + pad offset 16 = 16
> - we clear bit 16 in register 0

If offset calculation is really the problem, nothing is stopping you from the
splitting BANK in two. With your example of GPIOX_12...15 missing: 

BANK("X1", /* name */
           GPIOX_0, GPIOX_11, /* first and last GPIO */
           97, 108, /* first and last IRQ */
           4,  0, /* pull-up/down enable register and bit offset */
           4,  0, /* pull-up/down configuration register and bit offset */
           0,  0, /* input/output direction register and bit offset */
           1,  0, /* output value register and bit offset */
           2,  0), /* input value register and bit offset */

BANK("X2", /* name */
           GPIOX_16, GPIOX_21, /* first and last GPIO */
           113, 118, /* first and last IRQ */
           X,  Y, /* pull-up/down enable register and bit offset */
           X,  Y, /* pull-up/down configuration register and bit offset */
           Z,  XX, /* input/output direction register and bit offset */
           FOO,  0, /* output value register and bit offset */
           BAR,  0), /* input value register and bit offset */

> 
> let's assume that we removed GPIOX_12...15 from Meson8b
> GPIOX_16 could now have the same value that was assigned to GPIOX_12
> before (= 12)
> but how do we now know the offset of GPIOX_16?
> if we don't consider it in the calculation above we would end up
> writing to bit 12 (instead of bit 16).
> 
> we could still cleanup the header file but leave the IDs of the
> existing GPIOs untouched (so GPIOX_16 would still be 16).

I don't really get the point of doing so, especially is this patch is still
needed in the end.

> however, that means that this patch is still needed because our last
> ID would be DIF_4_N (= value 129) again (so with holes our total count
> is still 130).
> with that we wouldn't even break the DT ABI

While I prefer changing the bindings over the 'over_ngpio' tweak, it is not my
favorite solution.

> 
> > * If meson8b is indeed a cost reduction, it is likely to be same the approach as
> > s905x vs s905d: The D version is the same SoC with less ball pad but, as far as
> > we know, the logic is still there on the silicium (same die), it is just not
> > routed to the outside world. Both version share the same pinctrl driver (gxl).
> > The pad not routed to the outside world can just be considered "internal pads"
> 
> there are a few differences between Meson8 and Meson8b, see also [0]:
> - Meson8 (and Meson8m2) CPU cores: 4x Cortex-A9
> - Meson8b CPU cores: 4x Cortex-A5
> - Meson8 (and Meson8m2) GPU: Mali-450MP8
> - Meson8b GPU: Mali-450MP4
> - Meson8 (and Meson8m2) package size: 19mm x 19 mm, LFBGA
> - Meson8b package size: 12mm x 12 mm, LFBGA
> 
> the pinctrl register layout seems to be *mostly* compatible between
> Meson8 and Meson8b.
> unfortunately it's not entirely compatible, here is one example:
> - Meson8: GROUP(uart_tx_b1, 6, 23),
> - Meson8b: GROUP(uart_tx_b1, 6, 19),
> - Meson8: GROUP(eth_mdc, 6, 5),
> - Meson8b: GROUP(eth_mdc, 6, 9),
> 
> > Long story short, if meson8 and meson8b share the same bindings, maybe they
> > should also share the driver. If they can't share the driver because they are
> > definitely incompatible, maybe they should not share the same bindings
> 
> based on what I have seen so far I believe that they should not share
> the same bindings

It looks to me to be same gpio/pinconf IP with a few pads not exposed to the
outside world, so I think they could share the bindings, and apparently fair
part of the driver data.

Apparently amlogic tweaked a bit the pinmux. With the current architecture of
our pinctrl driver, it should be fairly easy to register 2  drivers sharing
everything but the GROUP table (and maybe the FUNCS if necessary)

If possible, I would be more in favor of this last solution, as we could kill
one the pinctrl-meson8.c file, which are mostly a copy/paste of one another.
While fixing you issue, we would end up with less code to maintain and save a
bit of memory.

Do you see any other big issue with this approach ?

> 
> > > 
> > > GPIOs which don't exist cannot be requested either ("base" of the GPIO
> > > controller is 382):
> > > $ echo 394 > /sys/class/gpio/export
> > > meson8b-pinctrl c1109880.pinctrl: pin 12 is not registered so it cannot be requested
> > > meson8b-pinctrl c1109880.pinctrl: pin-12 (cbus-banks:394) status -22
> > > 
> > > Unfortunately GPIOs greater GPIOZ_3 (whose ID is 83 - as a reminder:
> > > this is exactly the number of actual GPIO lines on Meson8b) cannot be
> > > requested. Using CARD_6 (ID 100, "base of the GPIO controller is 382) as
> > > an example:
> > > $ echo 482 > /sys/class/gpio/export
> > > export_store: invalid GPIO 482
> > > 
> > > The problem here is that struct gpio_chip's "ngpio" is set to 83. Thus
> > > requesting a GPIO higher than 83 fails. Commit 984cffdeaeb7ea ("pinctrl:
> > > Fix gpio/pin mapping for Meson8b") fixed this problem a while ago, by
> > > setting "ngpio" to 130. Unfortunately this broke again while cleaning up
> > > the pinctrl-meson driver in commit db80f0e158e621 ("pinctrl: meson: get
> > > rid of unneeded domain structures"), which started using
> > > ARRAY_SIZE(meson8b_cbus_pins) - which evaluates to 83 - as "ngpio".
> > > 
> > > This is now fixed by introducing a new "override_ngpio" field in struct
> > > meson_pinctrl_data. This value is passed to struct gpio_chip's "ngpio"
> > > when set - if override_ngpio is <= 0 then num_pins is used (which works
> > > for all other Meson SoCs, except Meson8b).
> > > The definitions in "include/dt-bindings/gpio/meson8b-gpio.h" were not
> > > changed. Cleaning up these definitions would allow us to get rid of the
> > > GPIOZ definitions (which are inherited from Meson8). However, we still
> > > need to handle GPIO banks with holes (such as GPIOX), so this include is
> > > not touched for now (touching it could also break the device-tree ABI).
> > > 
> > > Meson8b's AO GPIO controller is not affected by this issue since it does
> > > not have any holes in it - only the CBUS GPIO controller is affected.
> > > 
> > > This was initially seen by Linus Lüssing who was preparing SD card
> > > support on Odroid-C1 which uses CARD_6 as "card detect" GPIO.
> > > 
> > > Fixes: db80f0e158e621 ("pinctrl: meson: get rid of unneeded domain structures")
> > > Reported-by: Linus Lüssing <linus.luessing@c0d3.blue>
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > >  drivers/pinctrl/meson/pinctrl-meson.c   |  7 ++++++-
> > >  drivers/pinctrl/meson/pinctrl-meson.h   |  1 +
> > >  drivers/pinctrl/meson/pinctrl-meson8b.c | 14 ++++++++++++++
> > >  3 files changed, 21 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> > > index 29a458da78db..1befe67fd187 100644
> > > --- a/drivers/pinctrl/meson/pinctrl-meson.c
> > > +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> > > @@ -413,7 +413,12 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
> > >       pc->chip.get = meson_gpio_get;
> > >       pc->chip.set = meson_gpio_set;
> > >       pc->chip.base = -1;
> > > -     pc->chip.ngpio = pc->data->num_pins;
> > > +
> > > +     if (pc->data->override_ngpio > 0)
> > > +             pc->chip.ngpio = pc->data->override_ngpio;
> > > +     else
> > > +             pc->chip.ngpio = pc->data->num_pins;
> > > +
> > >       pc->chip.can_sleep = false;
> > >       pc->chip.of_node = pc->of_node;
> > >       pc->chip.of_gpio_n_cells = 2;
> > > diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> > > index 183b6e471635..afd7efaad9bb 100644
> > > --- a/drivers/pinctrl/meson/pinctrl-meson.h
> > > +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> > > @@ -108,6 +108,7 @@ struct meson_pinctrl_data {
> > >       struct meson_bank *banks;
> > >       unsigned int num_banks;
> > >       const struct pinmux_ops *pmx_ops;
> > > +     unsigned int override_ngpio;
> > >  };
> > > 
> > >  struct meson_pinctrl {
> > > diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
> > > index 5bd808dc81e1..05bb4c3143d9 100644
> > > --- a/drivers/pinctrl/meson/pinctrl-meson8b.c
> > > +++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
> > > @@ -916,6 +916,20 @@ static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
> > >       .num_funcs      = ARRAY_SIZE(meson8b_cbus_functions),
> > >       .num_banks      = ARRAY_SIZE(meson8b_cbus_banks),
> > >       .pmx_ops        = &meson8_pmx_ops,
> > > +     /*
> > > +      * there are holes in the meson8b_cbus_pins mapping because we are
> > > +      * mapping the GPIO identifiers to register bits. on Meson8b some bits
> > > +      * (and thus the corresponding pads) are not used on the SoC
> > > +      * (presumably because they were skipped because Meson8b is a cost
> > > +      * reduced variant of Meson8 and it didn't make sense to create a whole
> > > +      * new register layout for this variant).
> > > +      * this informs the GPIO framework know about the number of GPIOs we
> > > +      * have, including the pins which are not available on Meson8b (= the
> > > +      * holes). The pinctrl/GPIO framework knows the holes because it checks
> > > +      * all pinctrl_pin_desc in meson8b_cbus_pins and reports an error as
> > > +      * soon as a GPIO is requested which is not part of meson8b_cbus_pins.
> > > +      */
> > > +     .override_ngpio = 130,
> > >  };
> > > 
> > >  static struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
> 
> [0] https://www.cnx-software.com/2014/04/25/amlogic-stb-socs-comparison-aml8726-mx-s802-s805-and-s812/

