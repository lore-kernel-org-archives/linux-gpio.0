From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCHv4 3/3] gpio: sch: Enable IRQ support for Quark X1000
Date: Thu, 27 Nov 2014 12:53:31 +0200
Message-ID: <CAHp75Vfx=MXU_AV3MZS18xJicWUT8tpiZL+OsSDjLyiQVueOBA@mail.gmail.com>
References: <1416977280-27319-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1416977280-27319-4-git-send-email-rebecca.swee.fun.chang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:44750 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753357AbaK0Kxc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Nov 2014 05:53:32 -0500
In-Reply-To: <1416977280-27319-4-git-send-email-rebecca.swee.fun.chang@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@intel.com>, Denis Turischev <denis.turischev@compulab.co.il>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Nov 26, 2014 at 6:48 AM, Chang Rebecca Swee Fun
<rebecca.swee.fun.chang@intel.com> wrote:
> ntel Quark X1000 GPIO controller supports interrupt handling for
> both core power well and resume power well. This patch is to enable
> the IRQ support and provide IRQ handling for Intel Quark X1000
> GPIO-SCH device driver.
>
> This piece of work is derived from Dan O'Donovan's initial work for
> Quark X1000 enabling.

Minor comments.

[]

>  static int sch_gpio_probe(struct platform_device *pdev)
>  {
>         struct sch_gpio *sch;
>         struct resource *res;
> +       int err;
>
>         sch =3D devm_kzalloc(&pdev->dev, sizeof(*sch), GFP_KERNEL);
>         if (!sch)
> @@ -167,6 +333,15 @@ static int sch_gpio_probe(struct platform_device=
 *pdev)
>                                  pdev->name))
>                 return -EBUSY;
>
> +       sch->irq =3D platform_get_irq(pdev, 0);
> +       if (sch->irq >=3D 0) {
> +               sch->irq_support =3D true;

Do we need irq_support at all? Can we substitute it by sch->irq >=3D 0 =
or =E2=80=A6 < 0?

> +       } else {
> +               dev_warn(&pdev->dev,
> +                        "failed to obtain irq number for device\n");
> +               sch->irq_support =3D false;
> +       }
> +
>         spin_lock_init(&sch->lock);
>         sch->iobase =3D res->start;
>         sch->chip =3D sch_gpio_chip;
> @@ -215,15 +390,57 @@ static int sch_gpio_probe(struct platform_devic=
e *pdev)
>                 return -ENODEV;
>         }
>
> +       gpiochip_add(&sch->chip);
> +
> +       if (sch->irq_support) {
> +               sch->irq_base =3D irq_alloc_descs(-1, 0, sch->chip.ng=
pio,
> +                                               NUMA_NO_NODE);
> +               if (sch->irq_base < 0) {
> +                       dev_err(&pdev->dev,
> +                               "failed to allocate GPIO IRQ descs\n"=
);
> +                       goto err_sch_intr_chip;
> +               }
> +
> +               /* disable interrupts */
> +               sch_gpio_irq_disable_all(sch, sch->chip.ngpio);
> +
> +               err =3D request_irq(sch->irq, sch_gpio_irq_handler, I=
RQF_SHARED,
> +                                 KBUILD_MODNAME, sch);
> +               if (err) {
> +                       dev_err(&pdev->dev,
> +                               "%s failed to request IRQ\n", __func_=
_);
> +                       goto err_sch_request_irq;
> +               }
> +
> +               sch_gpio_irqs_init(sch, sch->chip.ngpio);
> +       }
> +
>         platform_set_drvdata(pdev, sch);
>
> -       return gpiochip_add(&sch->chip);
> +       return 0;
> +
> +err_sch_request_irq:
> +       irq_free_descs(sch->irq_base, sch->chip.ngpio);
> +
> +err_sch_intr_chip:
> +       gpiochip_remove(&sch->chip);
> +
> +       return err;
>  }
>
>  static int sch_gpio_remove(struct platform_device *pdev)
>  {
>         struct sch_gpio *sch =3D platform_get_drvdata(pdev);
>
> +       if (sch->irq_support) {
> +               sch_gpio_irqs_deinit(sch, sch->chip.ngpio);
> +
> +               if (sch->irq >=3D 0)

Is it possible to have irq_support =3D true and sch->irq < 0?

> +                       free_irq(sch->irq, sch);
> +
> +               irq_free_descs(sch->irq_base, sch->chip.ngpio);
> +       }
> +
>         gpiochip_remove(&sch->chip);
>         return 0;
>  }

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
