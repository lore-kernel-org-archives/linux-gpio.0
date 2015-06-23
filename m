From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio/xilinx: Use correct address when setting initial values.
Date: Tue, 23 Jun 2015 23:11:52 +0900
Message-ID: <CAAVeFu+HR2sV2XgR0QWWP3rediE4V7J9wrT+qXhcu_++Tb_qEw@mail.gmail.com>
References: <1435065280.13545.6.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35036 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933809AbbFWOMN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2015 10:12:13 -0400
In-Reply-To: <1435065280.13545.6.camel@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Rapha=C3=ABl_Teysseyre?= <rteysseyre@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jun 23, 2015 at 10:14 PM, Rapha=C3=ABl Teysseyre
<rteysseyre@gmail.com> wrote:
> From 670209328307a198b80723a917957269a815fc32 Mon Sep 17 00:00:00 200=
1
> From: =3D?UTF-8?q?Rapha=3DC3=3DABl=3D20Teysseyre?=3D <rteysseyre@gmai=
l.com>
> Date: Tue, 23 Jun 2015 14:49:31 +0200
> Subject: [PATCH] gpio/xilinx: Use correct address when setting initia=
l values.
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit

Mmm this looks like you copy/pasted the output of git format-patch
into your email client. Use git send-email instead, or avoid the mail
headers if you wish to use another client.

>
> Signed-off-by: Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>

A commit message beyond the subject would be appreciated. What did you
fix exactly? What was incorrect?

> ---
>  drivers/gpio/gpio-xilinx.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 61243d1..e544b7a 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -220,9 +220,9 @@ static void xgpio_save_regs(struct of_mm_gpio_chi=
p *mm_gc)
>         if (!chip->gpio_width[1])
>                 return;
>
> -       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_TRI_OF=
=46SET,
> +       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNE=
L_OFFSET,
>                        chip->gpio_state[1]);
> -       xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_TRI_OFF=
SET,
> +       xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL=
_OFFSET,
>                        chip->gpio_dir[1]);
>  }
>
> --
> 1.7.1
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
