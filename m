From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 6/9] pinctrl: Combine substrings for a message in pin_config_group_get()
Date: Wed, 3 May 2017 20:49:19 +0300
Message-ID: <CAHp75VcNh4fenYmrd+NevgQ=CFU35UP5Pvb0SBef-CacaCNFtw@mail.gmail.com>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <04433cd2-002c-6534-622e-49ecb2dcfdc8@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36043 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753255AbdECRtV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 May 2017 13:49:21 -0400
In-Reply-To: <04433cd2-002c-6534-622e-49ecb2dcfdc8@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 12:26 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 10:22:47 +0200
>
> The script "checkpatch.pl" pointed information out like the following.
>
> WARNING: quoted string split across lines
>
> Thus fix the affected source code place.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/pinctrl/pinconf.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> index f2168b6e3418..037ac3e47891 100644
> --- a/drivers/pinctrl/pinconf.c
> +++ b/drivers/pinctrl/pinconf.c
> @@ -87,9 +87,8 @@ int pin_config_group_get(const char *dev_name, const char *pin_group,
>         ops = pctldev->desc->confops;
>
>         if (!ops || !ops->pin_config_group_get) {
> -               dev_dbg(pctldev->dev, "cannot get configuration for pin "
> -                       "group, missing group config get function in "
> -                       "driver\n");
> +               dev_dbg(pctldev->dev,
> +                       "cannot get configuration for pin group, missing group config get function in driver\n");
>                 ret = -ENOTSUPP;
>                 goto unlock;
>         }
> --
> 2.12.2
>



-- 
With Best Regards,
Andy Shevchenko
