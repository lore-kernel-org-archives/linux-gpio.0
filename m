From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 1/2] gpio: brcmstb: Handle return value of devm_kasprintf
Date: Wed, 20 Sep 2017 20:24:52 -0700
Message-ID: <CADtm3G6ngRfbzhOkpyfKnvSSN4F+P3vgLJ-Pfo2zLKdaHDOCBQ@mail.gmail.com>
References: <1505891589-6632-1-git-send-email-arvind.yadav.cs@gmail.com> <1505891589-6632-2-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35236 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751283AbdIUDZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2017 23:25:24 -0400
In-Reply-To: <1505891589-6632-2-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 20, 2017 at 12:13 AM, Arvind Yadav
<arvind.yadav.cs@gmail.com> wrote:
> devm_kasprintf() can fail here and we must check its return value.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index dd0308c..1227d6e 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -485,6 +485,9 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>                 gc->of_node = np;
>                 gc->owner = THIS_MODULE;
>                 gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> +               if (!gc->label)
> +                       goto fail;

Please also set err to -ENOMEM.

> +
>                 gc->base = gpio_base;
>                 gc->of_gpio_n_cells = 2;
>                 gc->of_xlate = brcmstb_gpio_of_xlate;
> --
> 1.9.1
>

Thanks,
Gregory
