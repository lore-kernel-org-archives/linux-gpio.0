From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: [PATCH 1/2] gpio: max732x: Propagate wake-up setting to parent
 irq controller
Date: Mon, 4 May 2015 21:23:06 +0300
Message-ID: <CAJOTznUNrx7oytz+J7hkvBOARHEFK9etsK86uTWYxdm2p-sqtw@mail.gmail.com>
References: <1429637257-11055-1-git-send-email-semen.protsenko@globallogic.com>
	<CACRpkdYT6OMy1GSkoP3Tab3xcpC6qPFfX=aRVr4iUvBe5V6hjw@mail.gmail.com>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og126.obsmtp.com ([64.18.0.251]:38026 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751590AbbEDSXJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 14:23:09 -0400
Received: by lbbqq2 with SMTP id qq2so111037244lbb.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2015 11:23:06 -0700 (PDT)
In-Reply-To: <CACRpkdYT6OMy1GSkoP3Tab3xcpC6qPFfX=aRVr4iUvBe5V6hjw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 4:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Are these real, observed issues?

The issue was observed for PCF857x expander (not by me), and it's described in
this commit: b80eef95beb04760629822fa130aeed54cdfafca .

It seems to me that the issue is real. But we need some really particular
hardware configuration and particular use-case to reproduce it. As I understand
from commit message (for mentioned commit), this issue was catch on
system with "arch/arm/boot/dts/sh73a0-kzm9g-reference.dts" device tree file.
As you can see from that file, there is a keyboard ("gpio-keys") connected
to PCF8575 expander. In order to wake system up from keyboard event (key
pressed), parent interrupt controller ("interrupt-parent" field in "pcf8575"
node) should has the same wake-up settings as PCF8575 has.

So this issue may affect other expanders (like MAX732X) as well. I haven't
tested if it's true (only validated that everything works fine with this patch).
I'm now in the middle of building my own PCB with MAX7325 chip for testing
such things (since I was relocated from project where I had board with MAX732X).

> Patch applied, but it seems we need a general approach to
> cover a few GPIO drivers with this kind of thing.
>
> Is this how we should always do it?

I think so (well, at least it seems to be correct for GPIO expanders). But I'd
verify each particular driver to be completely sure that it's really needed and
it wouldn't create some new issues. MAX732X chip seems to be very similar to
PCF857X one, so in this particular case I'm sure that this patch is a good thing
to have.
