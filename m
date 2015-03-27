From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-tb10x: remove incorrect __exit markup
Date: Fri, 27 Mar 2015 11:24:45 +0100
Message-ID: <CACRpkda7J0USKq4NLQgJkyGXVttAHQyOvD2p2xsDT=v9fX+BvA@mail.gmail.com>
References: <20150309180409.GA24645@dtor-ws>
	<CACRpkdaUMDZYmK6t5S7LZcmZw6e-viTd0Z4d2UtXZCvEX9RSWQ@mail.gmail.com>
	<20150318165527.GB11485@dtor-ws>
	<CACRpkdZ_092Gd62ef1bvp=c5WX3LXTB6W5ZrA260V1Q4Hi3UGg@mail.gmail.com>
	<20150325171453.GA40952@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36764 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751902AbbC0KYp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 06:24:45 -0400
Received: by oicf142 with SMTP id f142so62995731oic.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 03:24:45 -0700 (PDT)
In-Reply-To: <20150325171453.GA40952@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, Mar 25, 2015 at 6:14 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Mar 25, 2015 at 04:32:13PM +0100, Linus Walleij wrote:

>> For a bool driver of this type (typically compiled in and probed
>> at boot) that makes most sense to me.
>
> Hmm, I do not think this is a good justification for disabling
> unbinding. However, as far as I can see, removing gpiochip will succeed
> even though there are users of gpios in the system and that might
> justify the change. But does this mean that we give up on making
> gpiochip clean up properly and we should schedule gpiochip_remove() and
> the rest of gpio cleanup infrastructure for removal and declare that
> gpio drivers can not ever be made modules?

No. Johan Hovold is looking into use cases for GPIO chips that come
and go, think GPIO on USB. These obviously need remove() semantics.

What I'm thinking is that the SoC-embedded GPIO controllers (I don't know
how many these are) should probably be bool in Kconfig and also
patched not to have remove() functions and drop the sysfs attribs
for unbinding.

But now I think I'll just apply the patch anyways because it sure does
not make a difference wrt to the bigger problem, so I'm just bitching
around about details and thinking aloud, sorry..

Yours,
Linus Walleij
