From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for
 managing groups
Date: Tue, 7 Mar 2017 14:19:52 -0300
Message-ID: <CAOMZO5BKdP+A1JdJxkRXPvZcGGsW2k65nsseDvmFguaM8i18xw@mail.gmail.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com> <20170102182022.2047-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35953 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754513AbdCGRWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2017 12:22:12 -0500
In-Reply-To: <20170102182022.2047-2-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Gary,

On Mon, Jan 2, 2017 at 4:20 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Now using group_desc structure instead of imx_pin_group.
>
> Also leveraging generic functions to retrieve groups count/name/pins.
>
> The imx_free_pingroups function can be removed since it is now handled by
> the core driver during unregister.
>
> Finally the device tree parsing is moved after the pinctrl driver registration
> since this latter initializes the radix trees.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

This patch is in 4.11-rc1 now and it causes a regression on the hog group:

[    0.061005] imx6q-pinctrl 20e0000.iomuxc: unable to find group for
node hoggrp

The hog pins can no longer be initialized.

Could you take a look, please?
