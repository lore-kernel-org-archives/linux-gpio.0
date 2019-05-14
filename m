From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date: Tue, 14 May 2019 09:37:58 +0800
Message-ID: <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
 <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Evan Green <evgreen@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 14, 2019 at 6:29 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Nicolas Boichat (2019-04-28 20:55:15)
> > During suspend/resume, mtk_eint_mask may be called while
> > wake_mask is active. For example, this happens if a wake-source
> > with an active interrupt handler wakes the system:
> > irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> > that it can be handled later on in the resume flow.
> >
> > However, this may happen before mtk_eint_do_resume is called:
> > in this case, wake_mask is loaded, and cur_mask is restored
> > from an older copy, re-enabling the interrupt, and causing
> > an interrupt storm (especially for level interrupts).
> >
> > Instead, we just record mask/unmask changes in cur_mask. This
> > also avoids the need to read the current mask in eint_do_suspend,
> > and we can remove mtk_eint_chip_read_mask function.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
> here. Isn't that what's happening? All non-wake irqs should be masked at
> the hardware level so they can't cause a wakeup during suspend and on
> resume they can be unmasked?

No, this is for an line that has both wake and interrupt enabled. To
reword the commit message above:
 1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
enabled at hardware level)
 2. System suspends, resumes due to that line (at this stage EINT_HW
== wake_mask)
 3. irq_pm_check_wakeup is called, and disables the interrupt =>
EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
 4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
it reenables EINT_EN[irq] = 1 => interrupt storm.

This patch fixes the issue in step 3. So that the interrupt can be
re-enabled properly later on, sometimes after mtk_eint_do_resume, when
the driver is ready to handle it.

Also, IRQCHIP_MASK_ON_SUSPEND does not handle lines that are enabled
as a wake source, but without interrupt enabled (e.g. cros_ec driver
does that), which we do want to support.

> > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> > index 737385e86beb807..7e526bcf5e0b55c 100644
> > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > @@ -113,6 +113,8 @@ static void mtk_eint_mask(struct irq_data *d)
> >         void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
> >                                                 eint->regs->mask_set);
> >
> > +       eint->cur_mask[d->hwirq >> 5] &= ~mask;
> > +
> >         writel(mask, reg);
> >  }
> >
> > @@ -123,6 +125,8 @@ static void mtk_eint_unmask(struct irq_data *d)
> >         void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
> >                                                 eint->regs->mask_clr);
> >
> > +       eint->cur_mask[d->hwirq >> 5] |= mask;
> > +
> >         writel(mask, reg);
> >
> >         if (eint->dual_edge[d->hwirq])
> > @@ -384,7 +375,6 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
> >
> >  int mtk_eint_do_suspend(struct mtk_eint *eint)
> >  {
> > -       mtk_eint_chip_read_mask(eint, eint->base, eint->cur_mask);
> >         mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
> >
>
>
> This alone looks like, write out the mask to only allow wake interrupts.

Yes, and enable wake interrupts that may not be in cur_mask.
