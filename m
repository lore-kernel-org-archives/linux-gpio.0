From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: normalize the return value for gpio_get
Date: Wed, 15 Jan 2014 08:57:54 +0100
Message-ID: <CACRpkda=4AhOWDYu7ENcovTo_+oSKKVU+eqkHD9W-3bDMv2MUQ@mail.gmail.com>
References: <1389333783-3372-1-git-send-email-zhangwm@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:58730 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625AbaAOH5z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2014 02:57:55 -0500
Received: by mail-ob0-f170.google.com with SMTP id uy5so788790obc.15
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2014 23:57:54 -0800 (PST)
In-Reply-To: <1389333783-3372-1-git-send-email-zhangwm@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Zhang <zhangwm@marvell.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 10, 2014 at 7:03 AM, Neil Zhang <zhangwm@marvell.com> wrote:

> It would be convenient to normalize the return value for gpio_get.
>
> I have checked mach-mmp / mach-pxa / plat-pxa / plat-orion / mach-orion5x.
> It's OK for all of them to change this function to return 0 and 1.
>
> Signed-off-by: Neil Zhang <zhangwm@marvell.com>

Bah I updated the commit message a bit ... you dropped the
gpio: pxa: etc from the previous patch, not good but don't worry
I fixed it up.

Yours,
Linus Walleij
