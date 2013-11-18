From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Mon, 18 Nov 2013 11:05:53 +0100
Message-ID: <CACRpkdZhYcx5hH8HvZR9=Ym_NJeGX-OO2hxRuAJ1smJJZOPb5w@mail.gmail.com>
References: <874n7i4a7x.fsf@gmail.com>
	<52834327.9060308@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:39877 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157Ab3KRKFy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:05:54 -0500
Received: by mail-oa0-f51.google.com with SMTP id i7so1646126oag.24
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:05:53 -0800 (PST)
In-Reply-To: <52834327.9060308@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: Ben Gamari <bgamari.foss@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Nov 13, 2013 at 10:15 AM, Ji=C5=99=C3=AD Prchal <jiri.prchal@ak=
signal.cz> wrote:

[Regarding https://github.com/beagleboard/meta-beagleboard/blob/master/=
common-bsp/recipes-kernel/linux/linux-mainline-3.8/not-capebus/0182-gpi=
o-Introduce-GPIO-OF-helper.patch]

> Hi Ben,
> probably it's what I' trying to do.
> Why it is not in master tree?

They have not sent this upstream to the GPIO maintainer (me) and
discussed with the rest of the world (like you) if we should use this
approach...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
