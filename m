From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: max732x: Propagate wake-up setting to parent
 irq controller
Date: Tue, 12 May 2015 09:34:28 +0200
Message-ID: <CACRpkdax+v48AJhoA4xJpO66ADUxOBOFLvmxKWJxLZBdN2iBgA@mail.gmail.com>
References: <1429637257-11055-1-git-send-email-semen.protsenko@globallogic.com>
	<CACRpkdYT6OMy1GSkoP3Tab3xcpC6qPFfX=aRVr4iUvBe5V6hjw@mail.gmail.com>
	<CAJOTznUNrx7oytz+J7hkvBOARHEFK9etsK86uTWYxdm2p-sqtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36646 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbbELHe3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:34:29 -0400
Received: by obbkp3 with SMTP id kp3so118092178obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:34:29 -0700 (PDT)
In-Reply-To: <CAJOTznUNrx7oytz+J7hkvBOARHEFK9etsK86uTWYxdm2p-sqtw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sam Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 8:23 PM, Sam Protsenko
<semen.protsenko@globallogic.com> wrote:
> On Mon, May 4, 2015 at 4:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> Patch applied, but it seems we need a general approach to
>> cover a few GPIO drivers with this kind of thing.
>>
>> Is this how we should always do it?
>
> I think so (well, at least it seems to be correct for GPIO expanders). But I'd
> verify each particular driver to be completely sure that it's really needed and
> it wouldn't create some new issues. MAX732X chip seems to be very similar to
> PCF857X one, so in this particular case I'm sure that this patch is a good thing
> to have.

OK yeah, maybe we could provide a list of "usual suspects", what do you
say about "my" expanders:

drivers/gpio/gpio-stmpe.c
drivers/gpio/gpio-tc3589x.c

I can surely patch and test these.

Yours,
Linus Walleij
