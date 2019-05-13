From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date: Mon, 13 May 2019 15:29:53 -0700
Message-ID: <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429035515.73611-3-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org
List-Id: linux-gpio@vger.kernel.org

Quoting Nicolas Boichat (2019-04-28 20:55:15)
> During suspend/resume, mtk_eint_mask may be called while
> wake_mask is active. For example, this happens if a wake-source
> with an active interrupt handler wakes the system:
> irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> that it can be handled later on in the resume flow.
>=20
> However, this may happen before mtk_eint_do_resume is called:
> in this case, wake_mask is loaded, and cur_mask is restored
> from an older copy, re-enabling the interrupt, and causing
> an interrupt storm (especially for level interrupts).
>=20
> Instead, we just record mask/unmask changes in cur_mask. This
> also avoids the need to read the current mask in eint_do_suspend,
> and we can remove mtk_eint_chip_read_mask function.
>=20
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
here. Isn't that what's happening? All non-wake irqs should be masked at
the hardware level so they can't cause a wakeup during suspend and on
resume they can be unmasked?

> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediat=
ek/mtk-eint.c
> index 737385e86beb807..7e526bcf5e0b55c 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -113,6 +113,8 @@ static void mtk_eint_mask(struct irq_data *d)
>         void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
>                                                 eint->regs->mask_set);
> =20
> +       eint->cur_mask[d->hwirq >> 5] &=3D ~mask;
> +
>         writel(mask, reg);
>  }
> =20
> @@ -123,6 +125,8 @@ static void mtk_eint_unmask(struct irq_data *d)
>         void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
>                                                 eint->regs->mask_clr);
> =20
> +       eint->cur_mask[d->hwirq >> 5] |=3D mask;
> +
>         writel(mask, reg);
> =20
>         if (eint->dual_edge[d->hwirq])
> @@ -384,7 +375,6 @@ static void mtk_eint_irq_handler(struct irq_desc *des=
c)
> =20
>  int mtk_eint_do_suspend(struct mtk_eint *eint)
>  {
> -       mtk_eint_chip_read_mask(eint, eint->base, eint->cur_mask);
>         mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
> =20


This alone looks like, write out the mask to only allow wake interrupts.
