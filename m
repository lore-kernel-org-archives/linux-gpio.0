From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH gpio v1 2/2] gpio: ks8695: fix 'else should follow close
 brace '}''
Date: Mon, 22 Sep 2014 18:48:03 +0900
Message-ID: <CAAVeFu+NVmV+MqPXBUD3+3Zio44AZF5-YPV_p4KRzOHLrRFB2Q@mail.gmail.com>
References: <1411226071-11625-1-git-send-email-varkab@cdac.in> <1411226071-11625-2-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:59645 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753673AbaIVJsZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Sep 2014 05:48:25 -0400
Received: by mail-ig0-f169.google.com with SMTP id l13so3796899iga.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2014 02:48:24 -0700 (PDT)
In-Reply-To: <1411226071-11625-2-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Varka Bhadram <varkab@cdac.in>

On Sun, Sep 21, 2014 at 12:14 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> ---
>  drivers/gpio/gpio-ks8695.c |    9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
> index ba2d2f1..10c7377 100644
> --- a/drivers/gpio/gpio-ks8695.c
> +++ b/drivers/gpio/gpio-ks8695.c
> @@ -276,17 +276,14 @@ static int ks8695_gpio_show(struct seq_file *s, void *unused)
>                                 case IOPC_TM_EDGE:
>                                         seq_printf(s, "(Edges)");       break;
>                                 }
> -                       }
> -                       else
> +                       } else
>                                 seq_printf(s, "GPIO\t");

According to the kernel code formatting guidelines, this should actually be

        } else {
                seq_printf(s, "GPIO\t");
        }
