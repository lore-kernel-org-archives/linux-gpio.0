From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl:Convert the composition of devm_request_mem_region
 and devm_ioremap to a single call
Date: Fri, 30 Oct 2015 20:53:58 +0100
Message-ID: <CACRpkdZFhseQDbXvJg1CP3+WRsw_dPivx0w8730-9FV3fwjUGQ@mail.gmail.com>
References: <1446191478-22714-1-git-send-email-sanjeev_sharma@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34386 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760204AbbJ3Tx7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 15:53:59 -0400
Received: by oies66 with SMTP id s66so65068995oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 12:53:58 -0700 (PDT)
In-Reply-To: <1446191478-22714-1-git-send-email-sanjeev_sharma@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sanjeev Sharma <sanjeev_sharma@mentor.com>, Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Please run posts like this by the maintainers. Tony Lindgren is one
user, Haojian is another.

Your top-poster,
Linus Walleij

On Fri, Oct 30, 2015 at 8:51 AM, Sanjeev Sharma
<sanjeev_sharma@mentor.com> wrote:
> Use devm_ioremap_resource() in order to make the code simpler,
> and remove redundant return value check of platform_get_resource()
> because this value is alreadytaken care by devm_ioremap_resource()
>
> Signed-off-by: Sanjeev Sharma <sanjeev_sharma@mentor.com>
> ---
>  drivers/pinctrl/pinctrl-single.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index ef04b96..905cc0a 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1865,24 +1865,9 @@ static int pcs_probe(struct platform_device *pdev)
>                                                   "pinctrl-single,bit-per-mux");
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(pcs->dev, "could not get resource\n");
> -               return -ENODEV;
> -       }
> -
> -       pcs->res = devm_request_mem_region(pcs->dev, res->start,
> -                       resource_size(res), DRIVER_NAME);
> -       if (!pcs->res) {
> -               dev_err(pcs->dev, "could not get mem_region\n");
> -               return -EBUSY;
> -       }
> -
> -       pcs->size = resource_size(pcs->res);
> -       pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
> -       if (!pcs->base) {
> -               dev_err(pcs->dev, "could not ioremap\n");
> -               return -ENODEV;
> -       }
> +       pcs->base = devm_ioremap_resource(pcs->dev, res);
> +       if (IS_ERR(pcs->base))
> +               return PTR_ERR(pcs->base);
>
>         INIT_RADIX_TREE(&pcs->pgtree, GFP_KERNEL);
>         INIT_RADIX_TREE(&pcs->ftree, GFP_KERNEL);
> --
> 1.7.11.7
>
