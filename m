From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date: Mon, 10 Jun 2019 15:25:53 -0700
Message-ID: <5cfed8f2.1c69fb81.1dcd3.27c1@mx.google.com>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org> <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com> <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com> <155786487644.14659.17142525593824613967@swboyd.mtv.corp.google.com> <CANMq1KCNzn-5sYJZGivUedsNaQfVW_MjgDZn27W6sz8Fk3beNA@mail.gmail.com> <CAE=gft6jxR9Lt7tLwm6VKy9_shMVW7wf3g6rBGEqtB7oNH0hUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft6jxR9Lt7tLwm6VKy9_shMVW7wf3g6rBGEqtB7oNH0hUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

Quoting Evan Green (2019-05-30 10:12:03)
> On Wed, May 15, 2019 at 1:05 AM Nicolas Boichat <drinkcat@chromium.org> w=
rote:
> >
> > On Wed, May 15, 2019 at 4:14 AM Stephen Boyd <swboyd@chromium.org> wrot=
e:
> >
> > > We could immediately unmask those lines in the hardware when the
> > > set_wake() callback is called. That way the genirq layer can use the
> > > driver to do what it wants with the hardware and the driver can make
> > > sure that set_wake() will always cause the wakeup interrupt to be
> > > delivered to genirq even when software has disabled it.
> > >
> > > But I think that there might be a problem with how genirq understands
> > > the masked state of a line when the wakeup implementation conflates
> > > masked state with wakeup armed state. Consider this call-flow:
> > >
> > >         irq masked in hardware, IRQD_IRQ_MASKED is set
> > >         enable_irq_wake()
> > >           unmask_irq in hardware
> > >         IRQD_WAKEUP_ARMED is set
> > >         <suspend and wakeup from irq>
> > >         handle_level_irq()
> > >           mask_ack_irq()
> > >             mask_irq()
> > >               if (irqd_irq_masked()) -> returns true and skips maskin=
g!
> > >             if (desc->irq_data.chip->irq_ack)
> > >               ...
> > >           irq_may_run()
> > >             irq_pm_check_wakeup()
> > >               irq_disable()
> > >                 mask_irq() -> does nothing again
> > >
> > > In the above flow, we never mask the irq because we thought it was
> > > already masked when it was disabled, but the irqchip implementation
> > > unmasked it to make wakeup work. Maybe we should always mask the irq =
if
> > > wakeup is armed and we're trying to call mask_irq()? Looks hacky.
> > >
> > > diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> > > index 51128bea3846..20257d528880 100644
> > > --- a/kernel/irq/chip.c
> > > +++ b/kernel/irq/chip.c
> > > @@ -411,7 +411,7 @@ static inline void mask_ack_irq(struct irq_desc *=
desc)
> > >
> > >  void mask_irq(struct irq_desc *desc)
> > >  {
> > > -       if (irqd_irq_masked(&desc->irq_data))
> > > +       if (!irqd_is_wakeup_armed(&desc->irq_data) && irqd_irq_masked=
(&desc->irq_data))
> > >                 return;
> > >
> > >         if (desc->irq_data.chip->irq_mask) {
> >
> > I'm... really not sure what's the best approach here. But basically,
> > yes, if we can find a way to properly handle wake and interrupt
> > behaviour for drivers with a single mask, that'd be good.
> > IRQCHIP_MASK_ON_SUSPEND only seems to be doing half of the work, since
> > it does not cover the disable+wake source case.
> >
> > Thanks,
>=20
> I finally got around to studying this patch. This series seems okay to
> me. The underlying problem is really that the hardware IRQ enabled
> state is out of sync with what Linux thinks. This happens during
> suspend because Linux thinks the irq is disabled, but due to the
> hardware constraints on this platform, the interrupt has to be enabled
> for it to be a wake source. So the mtk driver re-enables the
> interrupt, and then has to find a way to get back in sync with Linux's
> IRQ mask state.
>=20
> One possible approach is mentioned above by Stephen: stop calling
> disable_irq in the cros EC driver. Then both linux and mtk agree the
> interrupt is enabled at suspend time. I think this ran into other
> problems though, where the EC gets its interrupt but is unable to
> silence it because the underlying SPI bus is still suspended.

Does this happen? I thought the interrupt would only be delivered once
all drivers have resumed from the noirq resume phase. Maybe the SPI
controller needs to resume there instead of in the normal resume path
and then this isn't a problem.

>=20
> The other approach, taken here, is to mask the interrupt when it first
> comes in, getting Linux and mtk back in agreement that yes, the
> interrupt is masked. Outside of enlightening the generic IRQ core
> about these types of interrupts that need to get re-enabled to be wake
> sources, this seems like a reasonable approach.

I prefer we teach the genirq layer about these types of irqchips. That
way the solution is common and not a one-off fix for Mediatek chips. I'm
sure that this same problem will come up again for another SoC vendor
out there so having a chip flag that does the other half of
IRQCHIP_MASK_ON_SUSPEND would be appropriate.
