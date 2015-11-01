From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Sun, 1 Nov 2015 10:37:28 +0100
Message-ID: <CACRpkdaO7XT+V4bbKE9Vzx+B4rLHXC+YhoX_UdxKSvypQUJZ0A@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<20151024184253.GC22220@pengutronix.de>
	<CACRpkdYiQ=eQpUNspRH27x=9soExn-Mx5Rhc7USqAk7g5DNG_A@mail.gmail.com>
	<3839397.mYWtgokiUO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34413 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752314AbbKAJh3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Nov 2015 04:37:29 -0500
Received: by obbza9 with SMTP id za9so74328185obb.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2015 01:37:28 -0800 (PST)
In-Reply-To: <3839397.mYWtgokiUO@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Oct 30, 2015 at 11:54 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> For character devices, udev has a complex set of (user-overridable) rules
> to derive one or more stable name(s) from the sysfs attributes.

OK I'll go read these I think.

Doesn't help much with Busybox' mdev though, which I recently discussed
with Greg and turns out to need a rewrite :/

Yours,
Linus Walleij
