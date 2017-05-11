From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl-sx150x.c broken in 4.11
Date: Thu, 11 May 2017 09:23:45 +0200
Message-ID: <CACRpkdaVpOw+PbocW+wwy5kDp8Ud=Xow_+gnAhJ+eFWTLob7LQ@mail.gmail.com>
References: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33902 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753303AbdEKHXr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 03:23:47 -0400
Received: by mail-io0-f172.google.com with SMTP id k91so16066107ioi.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 00:23:47 -0700 (PDT)
In-Reply-To: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, ext Tony Lindgren <tony@atomide.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On Wed, May 10, 2017 at 9:32 PM, Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:

> Looks like recent pinctrl changes - possibly commit 99e4f67508e1
> ("pinctrl: core: Use delayed work for hogs") - breaks pinctrl-sx150x
> driver in all setups where it has any pinctrl settings in device tree.
>
> AFAIU, pinctrl-sx150x is not a real pinctrl/pinmux driver,

It's as real as it gets.

> but it uses
> pinctrl subsystem to provide control over GPIO lines it provides.  But
> for user, it is just a i2c-gpio device that is enabled via device tree,
> and, like other devices, can have pinctrl-0 that points to "real" pinmux
> configuration for involved hardware lines (i.e. line used for interrupt).
>
> Problem is that when pinctrl-sx150x driver registers itself via
> pinctrl_register(), pinctrl map that corresponds to pinctrl-0 property
> of sx150x device tree node, is misinterpreted as hog.  Corresponding
> call chain is
>
>   pinctrl_enable() ->
>     pinctrl_claim_hogs() ->
>       create_pinctrl()
>
> at this point, registered pinctrl maps are scanned and matched by device
> name only, without checking map's control device. Then map is passed to
> add_setting() with pctldev set to sx150x which does not provide
> pinmux_ops, which errors out:
>
> sx150x-pinctrl 10-0020: does not support mux function
> sx150x-pinctrl 10-0020: could not map pin config for "VF610_PAD_PTB1"
> sx150x-pinctrl 10-0020: error claiming hogs: -22
> sx150x-pinctrl 10-0020: could not claim hogs: -22
> sx150x-pinctrl 10-0020: Failed to register pinctrl device
> sx150x-pinctrl: probe of 10-0020 failed with error -22
>
> Before commit 99e4f67508e1 ("pinctrl: core: Use delayed work for hogs")
> problem was hidden by not passing pinctrl device to add_setting(), but
> instead getting that from map.
>
> What is proper fix for this?

I bet Tony has the answer to this.

I think something similar to:
commit 6118714275f0a313ecc296a87ed1af32d9691bed
"pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()"
is needed?

Maybe we need to go over everything in drivers/pinctrl and check that
we don't have more of these broken hogs.

Yours,
Linus Walleij
