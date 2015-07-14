From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Tue, 14 Jul 2015 16:01:57 +0200
Message-ID: <CACRpkda-OSsFdGHN9de00TsQjgdzC1Eg=vHXpeSvqBKH64wPmg@mail.gmail.com>
References: <1434647449-5393-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34172 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110AbbGNOB5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 10:01:57 -0400
Received: by obre1 with SMTP id e1so6544801obr.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 07:01:57 -0700 (PDT)
In-Reply-To: <1434647449-5393-1-git-send-email-vitalya@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vitaly Andrianov <vitalya@ti.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Reece Pollack <x0183204@ti.com>

On Thu, Jun 18, 2015 at 7:10 PM, Vitaly Andrianov <vitalya@ti.com> wrote:

> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
> "binten" register (offset 8). Previous versions of GPIO only
> used bit 0, which enables GPIO 0-15 interrupts.
>
> Signed-off-by: Reece Pollack <x0183204@ti.com>
> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>

Sekhar/Kevin: OK with this? We don't have a maintainer
listed for davinci GPIO so I assume it's you guys...

Should this be tagged for stable?

Yours,
Linus Walleij
