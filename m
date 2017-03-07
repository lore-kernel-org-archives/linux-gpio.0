From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for
 managing groups
Date: Tue, 7 Mar 2017 18:26:12 +0100
Message-ID: <CAAMH-ysO7SWYJ3dWjQODXBDEvfnRf09mefWBeDgeWH=MPSd+Ww@mail.gmail.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com>
 <20170102182022.2047-2-gary.bisson@boundarydevices.com> <CAOMZO5BKdP+A1JdJxkRXPvZcGGsW2k65nsseDvmFguaM8i18xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38167 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754946AbdCGSeq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2017 13:34:46 -0500
Received: by mail-wm0-f52.google.com with SMTP id t189so12575769wmt.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2017 10:34:24 -0800 (PST)
In-Reply-To: <CAOMZO5BKdP+A1JdJxkRXPvZcGGsW2k65nsseDvmFguaM8i18xw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Fabio,

On Tue, Mar 7, 2017 at 6:19 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Gary,
>
> On Mon, Jan 2, 2017 at 4:20 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>> Now using group_desc structure instead of imx_pin_group.
>>
>> Also leveraging generic functions to retrieve groups count/name/pins.
>>
>> The imx_free_pingroups function can be removed since it is now handled by
>> the core driver during unregister.
>>
>> Finally the device tree parsing is moved after the pinctrl driver registration
>> since this latter initializes the radix trees.
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> This patch is in 4.11-rc1 now and it causes a regression on the hog group:
>
> [    0.061005] imx6q-pinctrl 20e0000.iomuxc: unable to find group for
> node hoggrp
>
> The hog pins can no longer be initialized.
>
> Could you take a look, please?

No it isn't because of the use of radix but instead of:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=950b0d91dc10

It has been discussed here:
https://lkml.org/lkml/2017/2/28/140

Tony offered a patch in that thread which works. Tony, have you
submitted it yet?

Regards,
Gary
