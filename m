From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 12:54:35 +0100
Message-ID: <CACRpkdbs889ftyk9noLTDH4exegggfXs=E6iz5TjcdoG_jZy-Q@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
	<20160217205445.GA2394@deathstar>
	<CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
	<20160219094620.GA28750@deathstar>
	<CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
	<20160219102614.GA31335@deathstar>
	<CACRpkdYEpzPX+4fCwUixbvGnGgR4Vm2j8DGL7aqNGWKbFD+PWg@mail.gmail.com>
	<CACxGe6voZgYK6SV-NZpYTV93JA-E1LfEbNDbJXoNHRF7jhjpgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33243 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585AbcBSLyf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 06:54:35 -0500
Received: by mail-oi0-f50.google.com with SMTP id j125so10420770oih.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 03:54:35 -0800 (PST)
In-Reply-To: <CACxGe6voZgYK6SV-NZpYTV93JA-E1LfEbNDbJXoNHRF7jhjpgQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Feb 19, 2016 at 12:29 PM, Grant Likely <grant.likely@linaro.org> wrote:
> [Me]
>> Here I lean toward the IIO event interface, that if you want to
>> monitor a GPIO line you should ask for an event file
>> descriptor and select() it waiting for events in userspace,
>> i.e. every such request comes with obtaining a new fd
>> and watching it.
>
> That seems overly heavyweight. It would be reasonable to select on a
> single file descriptor, and then on read it will also return a bitmap
> of which pin(s) actually raised the event.

Makes sense. But since GPIO controllers can supply hundreds of
GPIO lines we would however have make sure that this bitmap is
dynamic in size, a u32 or u64 won't work. So we should just pass the
offset number back with each event.

Yours,
Linus Walleij
