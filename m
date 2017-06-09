From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: fix missing first irq for edgeboth irq type
Date: Fri, 9 Jun 2017 11:26:19 +0200
Message-ID: <CACRpkdbnXOab-wn3z9BQrs7RVrqag8wtdwsmUvekYLY29rxdVw@mail.gmail.com>
References: <20170601232715.2788-1-xgchenshy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38454 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbdFIJ0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 05:26:21 -0400
Received: by mail-it0-f52.google.com with SMTP id r63so29660991itc.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 02:26:21 -0700 (PDT)
In-Reply-To: <20170601232715.2788-1-xgchenshy@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: xgchenshy@gmail.com, Jisheng Zhang <jszhang@marvell.com>, Hoan Tran <hotran@apm.com>, Jiang Qiu <qiujiang@huawei.com>, Jamie Iles <jamie@jamieiles.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Adding driver authors to the To: Line and top posting to get some
review.

Yours,
Linus Walleij


On Fri, Jun 2, 2017 at 1:27 AM,  <xgchenshy@gmail.com> wrote:
> From: Xiaoguang Chen <xgchenshy@gmail.com>
>
> dwapb_irq_set_type overwrites polarity register value for
> IRQ_TYPE_EDGE_BOTH case. If the polarity of one gpio is 0
> by default, then it will set falling edge irq trigger.
> and the gpio may requires rising edge irq for the first time,
> and it will be missed.
>
> Do not overwrite polarity register for IRQ_TYPE_EDGE_BOTH case
> can solve this issue.
>
> Signed-off-by: Xiaoguang Chen <xgchenshy@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index f051c45..80913e4 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -288,7 +288,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32=
 type)
>         irq_setup_alt_chip(d, type);
>
>         dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
> -       dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
> +       if =EF=BC=88type !=3D IRQ_TYPE_EDGE_BOTH=EF=BC=89
> +               dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
>         spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
> --
> 2.8.4 (Apple Git-73)
>
