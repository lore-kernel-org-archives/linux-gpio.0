From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: dwapb: a bug fix a few cleanups, v2
Date: Tue, 25 Mar 2014 22:26:52 +0100
Message-ID: <5331F49C.8080106@gmail.com>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de> <CACRpkdbFj+Msq5HjcV8N5A6TN9sic1+Y2v9aWAMa2g+0zO=D1Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:36042 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512AbaCYV06 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 17:26:58 -0400
In-Reply-To: <CACRpkdbFj+Msq5HjcV8N5A6TN9sic1+Y2v9aWAMa2g+0zO=D1Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jamie Iles <jamie@jamieiles.com>
Cc: Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, Alan Tull <delicious.quinoa@gmail.com>

On 03/25/2014 09:45 PM, Linus Walleij wrote:
> On Sat, Mar 22, 2014 at 5:16 PM, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> 
>> Since Alan said that he had drop two patches from earlier series to make
>> it work I decided to spent some extra time to check if this is really the
>> case.
>> I dropped "gpio: dwapb: do not create the irq mapping upfront." until the
>> discussion there is over.
>>
>> This series has been tested back ported and tested on a v3.13 kernel with
>> the dummy test [0] here. It was tested on the Arrow board and the dev kit. I
>> tested edge and level interrupts. On the Arrow board releasing the button
>> causes a lot of interrupts so I assume debouncing is no working well
>> there. On the dev kit I see only one interrupt. If I realse it really
>> slowly, then the extra interrupts are visible there as well but way less.
>>
>> [0] http://breakpoint.cc/gpio-dwapb-test.c
> 
> Okay so can we have Jamie and Sebastian H. have a look at this
> series?

Linus,

I'd love to test it and have a closer look, but we are way behind on
gpio and especially gpio irqs on mach-berlin.

I will look at the patches, but I guess if it doesn't break socfpga
or any other user of it, it is fine.

Sebastian

