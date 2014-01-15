From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: fix bug when get gpio value
Date: Wed, 15 Jan 2014 08:48:47 +0100
Message-ID: <CACRpkdY=1xT6QNCO_N2SJoGX5HMqNKqvwtiH0QEPNK42reSbAw@mail.gmail.com>
References: <1389259557-1731-1-git-send-email-zhangwm@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:36123 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbaAOHst (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2014 02:48:49 -0500
Received: by mail-oa0-f44.google.com with SMTP id g12so815316oah.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2014 23:48:48 -0800 (PST)
In-Reply-To: <1389259557-1731-1-git-send-email-zhangwm@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Zhang <zhangwm@marvell.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.or>

On Thu, Jan 9, 2014 at 10:25 AM, Neil Zhang <zhangwm@marvell.com> wrote:

> gpio_get_value should return 0 or 1.
>
> I have checked mach-mmp / mach-pxa / plat-pxa / plat-orion / mach-orion5x.
> It's OK for all of them to change this function to return 0 and 1.
>
> Signed-off-by: Neil Zhang <zhangwm@marvell.com>

Patch applied.

Yours,
Linus Walleij
