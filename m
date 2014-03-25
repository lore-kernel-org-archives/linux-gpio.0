From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: moxart: Actually set output state in moxart_gpio_direction_output()
Date: Tue, 25 Mar 2014 11:35:29 +0900
Message-ID: <CAAVeFuKgtne_dcy5Gpc3HTBUttpN6jqna1wEBwaNmjM+cJCoYA@mail.gmail.com>
References: <1395714491.5096.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:52315 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbaCYCfx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:35:53 -0400
Received: by mail-ve0-f182.google.com with SMTP id jw12so6830532veb.13
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 19:35:52 -0700 (PDT)
In-Reply-To: <1395714491.5096.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 25, 2014 at 11:28 AM, Axel Lin <axel.lin@ingics.com> wrote:
> moxart_gpio_direction_output() ignored the state passed into it. Fix it.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-moxart.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
> index 2af9900..4bd81f9 100644
> --- a/drivers/gpio/gpio-moxart.c
> +++ b/drivers/gpio/gpio-moxart.c
> @@ -33,6 +33,8 @@ struct moxart_gpio_chip {
>         void __iomem *base;
>  };
>
> +static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value);

Just reverse the order of your patches, and you don't have to make
this declaration at all.

It makes little sense to introduce a forward-declaration in a patch
and remove it in the very next.
