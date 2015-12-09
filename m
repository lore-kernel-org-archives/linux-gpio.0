From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [RESEND RFC PATCH 0/2] Expose the PIO_ISR register on SAMA5D3
Date: Wed, 09 Dec 2015 09:56:19 +0100
Message-ID: <5667ECB3.1010107@lysator.liu.se>
References: <1449544808-3163-1-git-send-email-peda@lysator.liu.se> <20151209080155.GB7411@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.lysator.liu.se ([130.236.254.3]:48666 "EHLO
	mail.lysator.liu.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296AbbLII42 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 03:56:28 -0500
In-Reply-To: <20151209080155.GB7411@odux.rfo.atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter Rosin <peda@axentia.se>

Hi!

On 2015-12-09 09:01, Ludovic Desroches wrote:
> Hi Peter,
> 
> On Tue, Dec 08, 2015 at 04:20:06AM +0100, Peter Rosin wrote:
>> From: Peter Rosin <peda@axentia.se>
>>
>> Hi!
>>
>> I have a signal connected to a gpio pin which is the output of
>> a comparator. By changing the level of one of the inputs to the
>> comparator, I can detect the envelope of the other input to
>> the comparator by using a series of measurements much in the
>> same maner a manual ADC works, but watching for changes on the
>> comparator over a period of time instead of only the immediate
>> output.
>>
>> Now, the input signal to the comparator might have a high frequency,
>> which will cause the output from the comparator (and thus the GPIO
>> input) to change rapidly.
>>
>> A common(?) idiom for this is to use the interrupt status register
>> to catch the glitches, but then not have any interrupt tied to
>> the pin as that could possibly generate pointless bursts of
>> (expensive) interrupts.
>>
> 
> Well I don't know if this use case as already been considered. I
> understand you don't want to be overwhelmed by interrupts but why not
> using the interrupt to start polling the PDSR (Pin Data Status
> Register)?

That scheme will not work for me. There might be only one short
glitch, and there might be a flood. I need to catch both. What could
be made to work is some kind of one-off interrupt thingy. I.e. an
interrupt that disabled itself when hit (if that is possibly without
lockup?). That could be a small generic driver not specific to gpio,
I suppose, but where should such a beast live and what user space
interface should it have?

And while that is generic and will probably work in more cases, it
seems complicated and quite a bit of a detour compared to simply
reading the same info from a register.

Are there really noone else using ISR type registers like this with
Linux? In my mind that was pretty standard practice...

> I am really not comfortable about exposing the ISR since there is a
> clean on read. You have taken precautions by checking the IMR before but
> if there is a single driver using a gpio as an irq, you will never get
> the ISR.

Yes, I'm aware of the limitation, but in my case that's not a problem,
obviously. I have no (other) interrupt sources on the gpios covered by
the ISR register in question.

I take it that your major concern is the non-generality, i.e. that it
is not possible to safely get at the ISR when there are interrupts
enabled, and not the complication/overhead of the new lock?

Cheers,
Peter
