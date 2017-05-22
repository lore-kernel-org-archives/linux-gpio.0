From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: when claiming hog, skip maps not served by same device
Date: Mon, 22 May 2017 17:07:11 +0200
Message-ID: <CACRpkdZx4TgqtZujSsr-J171J90ot9kznrUAheNaU=wkTQAjPQ@mail.gmail.com>
References: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:33533 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933734AbdEVPHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 11:07:12 -0400
Received: by mail-io0-f175.google.com with SMTP id p24so83157817ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 08:07:12 -0700 (PDT)
In-Reply-To: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Tony Lindgren <tony@atomide.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>

On Thu, May 11, 2017 at 10:02 PM, Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:

> When pinctrl device registers, it automatically claims hogs, that is,
> maps that pinctrl device serves for itself.
>
> It is possible that in addition to SoC's pinctrl device, other pinctrl
> devices get registered. E.g. some gpio expander devies are registered
> as pinctrl devices. For such devices, pinctrl maps could be defined
> that set up SoC's pins (e.g. interrupt pin for gpio expander). Such
> a map will have target device set to gpio expander.
>
> Here is device tree snippet that causes this scenario:
>
> &i2c0 {
>         sx1503@20 {
>                 compatible = "semtech,sx1503q";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&pinctrl_sx1503_20>;
>                 ...
>         };
> };
> ...
> &iomuxc {
>         pinctrl_sx1503_20: pinctrl-sx1503-20 {
>                 fsl,pins = <
>                         VF610_PAD_PTB1__GPIO_23         0x219d
>                 >;
>         };
> };
>
> Such a map will have target device set to gpio expander. However is not
> a hog, it is a regular map that is claimed by core before gpio expander
> device is probed.
>
> Thus when looking for hogs, it is not enough to check that map's target
> device is set to pinctrl device being registered. Need also check that
> map's control device is also set to the same.
>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Oh that looks logically correct, good find.

I guess I tested multiple pin control devices on a system but
not with also using hogs on them...

Patch applied with Tony's ACK.

Yours,
Linus Walleij
