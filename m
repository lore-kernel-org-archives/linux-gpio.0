From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Fri, 7 Mar 2014 11:46:13 +0800
Message-ID: <CACRpkda+r2ptR06LrAPX0dZFOou6pce88kXdSFXad55Vx=vDYg@mail.gmail.com>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
	<20140225190923.fdd969463717061aea582551@mail.ru>
	<CACRpkdbc5SZYC-1eC=er+HmBxp6a77Nwzr46Vv7BFk882TRLDg@mail.gmail.com>
	<1394002983.39681225@f309.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:46299 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751573AbaCGDqN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 22:46:13 -0500
Received: by mail-ob0-f172.google.com with SMTP id wm4so3554503obc.17
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2014 19:46:13 -0800 (PST)
In-Reply-To: <1394002983.39681225@f309.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Mar 5, 2014 at 3:03 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> I think that Olof meant to completely remove the concept of "syscon" from the
> DT description.
> This can be done by changing the compatibility string with "cirrus,clps711x-mctrl-gpio"
> for my case and hide "syscon" in the internal structure of the driver to use the
> syscon_regmap_lookup_by_compatible() function.
> If so, then I'll make the next version.

OK sounds like a plan.

Yours,
Linus Walleij
