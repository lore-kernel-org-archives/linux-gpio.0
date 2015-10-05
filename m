From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ath79: Convert to the state container design pattern
Date: Mon, 5 Oct 2015 09:41:14 +0200
Message-ID: <CACRpkdbyWyvLQyv8abZju4zA62JP2ARgXcsrXhX5gdWBRS+L2w@mail.gmail.com>
References: <1441100282-13584-1-git-send-email-albeu@free.fr>
	<CACRpkdbX+cMmS-j85zqhPSa8XRQHtus6HXqZrLo9b++KAHDc5g@mail.gmail.com>
	<20151002085254.6a929c58@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:35956 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbJEHlP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 03:41:15 -0400
Received: by obcgx8 with SMTP id gx8so122177057obc.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 00:41:14 -0700 (PDT)
In-Reply-To: <20151002085254.6a929c58@tock>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Oct 2, 2015 at 8:52 AM, Alban <albeu@free.fr> wrote:

>> Would you consider sending a patch adding yourself as maintainer
>> for this file in MAINTAINERS?
>
> Yes, I'll send that soon.

Thanks!

> However while looking at adding IRQ support I stumbled upon the bgpio
> API from the generic gpio driver. I think it might make more sense
> to simply move to this API instead of doing the above cleanup. I'll
> send a patch for this in the next days.

Yeah maybe that is better. For IRQ support please use GPIOLIB_IRQCHIP
if you can. I think I saw that OpenWRT has implemented IRQ support for
ath79 with some outoftree patch right?

Yours,
Linus Walleij
