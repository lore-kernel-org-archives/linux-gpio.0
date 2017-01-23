From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] pinctrl: sunxi: Don't enforce bias disable (for now)
Date: Mon, 23 Jan 2017 17:59:23 +0800
Message-ID: <CAGb2v66h8M+PwfO8kKL6AF5O5hW7FE77mGXNvt-5UH=CPWaAMQ@mail.gmail.com>
References: <20170123082130.15558-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:36930 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdAWJ7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2017 04:59:48 -0500
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com [209.85.214.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: b93043)
        by smtp.csie.ntu.edu.tw (Postfix) with ESMTPSA id BE226202E7
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2017 17:59:45 +0800 (CST)
Received: by mail-it0-f45.google.com with SMTP id c7so59473862itd.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2017 01:59:45 -0800 (PST)
In-Reply-To: <20170123082130.15558-1-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Priit Laes <plaes@plaes.org>

On Mon, Jan 23, 2017 at 4:21 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Commit 07fe64ba213f ("pinctrl: sunxi: Handle bias disable") actually
> enforced enforced the disabling of the pull up/down resistors instead of
> ignoring it like it was done before.
>
> This was part of a wider rework to switch to the generic pinconf bindings,
> and was meant to be merged together with DT patches that were switching to
> it, and removing what was considered default values by both the binding and
> the boards. This included no bias on a pin.
>
> However, those DT patches were delayed to 4.11, which would be fine only
> for a significant number boards having the bias setup wrong, which in turns
> break the MMC on those boards (and possibly other devices too).
>
> In order to avoid conflicts as much as possible, bring back the old
> behaviour for 4.10, and we'll revert that commit once all the DT bits will
> have landed.
>
> Tested-by: Priit Laes <plaes@plaes.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
> Hi Linus,
>
> This is intended as a fix for 4.10.
>
> Thanks!
> Maxime
>
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0eb51e33cb1b..207a8de4e1ed 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -564,8 +564,7 @@ static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
>                         val = arg / 10 - 1;
>                         break;
>                 case PIN_CONFIG_BIAS_DISABLE:
> -                       val = 0;
> -                       break;
> +                       continue;
>                 case PIN_CONFIG_BIAS_PULL_UP:
>                         if (arg == 0)
>                                 return -EINVAL;
> --
> 2.11.0
>
