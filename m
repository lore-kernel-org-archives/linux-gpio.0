From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: [PATCH 1/2] gpio: max732x: Propagate wake-up setting to parent
 irq controller
Date: Wed, 13 May 2015 15:23:01 +0300
Message-ID: <CAJOTznUyyj4VqP6m5iXa8y=z9jahKc_R0s=ommvQjTQpmprjRw@mail.gmail.com>
References: <1429637257-11055-1-git-send-email-semen.protsenko@globallogic.com>
	<CACRpkdYT6OMy1GSkoP3Tab3xcpC6qPFfX=aRVr4iUvBe5V6hjw@mail.gmail.com>
	<CAJOTznUNrx7oytz+J7hkvBOARHEFK9etsK86uTWYxdm2p-sqtw@mail.gmail.com>
	<CACRpkdax+v48AJhoA4xJpO66ADUxOBOFLvmxKWJxLZBdN2iBgA@mail.gmail.com>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:35600 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754440AbbEMMXD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 08:23:03 -0400
Received: by labbd9 with SMTP id bd9so27954370lab.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2015 05:23:01 -0700 (PDT)
In-Reply-To: <CACRpkdax+v48AJhoA4xJpO66ADUxOBOFLvmxKWJxLZBdN2iBgA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 12, 2015 at 10:34 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> OK yeah, maybe we could provide a list of "usual suspects", what do you
> say about "my" expanders:
>
> drivers/gpio/gpio-stmpe.c
> drivers/gpio/gpio-tc3589x.c
>
> I can surely patch and test these.

This issue seems to be pretty common for all GPIO chips that have IRQ chip
capability. So your expanders should be patched too. But still, the best course
here is to actually reproduce the issue first, and only then proceed to
patching. So if you have boards with those expanders -- it should be easy to
come up with some use-case that reproduces the issue mentioned in the original
commit.
