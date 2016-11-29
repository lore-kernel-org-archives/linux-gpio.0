From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3] RFC: pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
Date: Tue, 29 Nov 2016 20:20:56 +0100 (CET)
Message-ID: <882495650.143642.63209ba1-8fb4-4a13-9ee0-f746a192f4c7.open-xchange@email.1und1.de>
References: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdZ39UbUzKebVzRuAg8hxgLiGNzzUMebMVT+mcAOnHRW+w@mail.gmail.com>
 <2017856859.25225.e58aee3b-9fc2-4b39-a030-c2409c5b92fc.open-xchange@email.1und1.de>
 <87zikjz7cy.fsf@eliezer.anholt.net> <1480370884.1939.1.camel@crowfest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:56255 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755402AbcK2TVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2016 14:21:43 -0500
In-Reply-To: <1480370884.1939.1.camel@crowfest.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Zoran <mzoran@crowfest.net>
Cc: Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>

Hi Michael,

> Michael Zoran <mzoran@crowfest.net> hat am 28. November 2016 um 23:08
> geschrieben:
> 
> 
> On Mon, 2016-11-28 at 12:18 -0800, Eric Anholt wrote:
> > Stefan Wahren <stefan.wahren@i2se.com> writes:
> > 
> > > Hi Linus,
> > > 
> > > > Linus Walleij <linus.walleij@linaro.org> hat am 24. November 2016
> > > > um 16:16
> > > > geschrieben:
> > > > 
> > > > 
> > > > On Mon, Nov 14, 2016 at 6:52 PM, Linus Walleij <linus.walleij@lin
> > > > aro.org>
> > > > wrote:
> > > > 
> > > > > It should be possible to use the GPIOLIB_IRQCHIP helper
> > > > > library with the BCM2835 driver since it is a pretty straight
> > > > > forward cascaded irqchip.
> > > > > 
> > > > > The only difference from other drivers is that the BCM2835
> > > > > has several banks for a single gpiochip, and each bank has
> > > > > a separate IRQ line. Instead of creating one gpiochip per
> > > > > bank, a single gpiochip covers all banks GPIO lines. This
> > > > > makes it necessary to resolve the bank ID in the IRQ
> > > > > handler.
> > > > > 
> > > > > The GPIOLIB_IRQCHIP allows several IRQs to be cascaded off
> > > > > the same gpiochip by calling gpiochip_set_chained_irqchip()
> > > > > repeatedly, but we have been a bit short on examples
> > > > > for how this should be handled in practice, so this is intended
> > > > > as an example of how this can be achieved.
> > > > > 
> > > > > The old code did not model the chip as a chained interrupt
> > > > > handler, but this patch also rectifies that situation.
> > > > > 
> > > > > Cc: Stephen Warren <swarren@wwwdotorg.org>
> > > > > Cc: Stefan Wahren <stefan.wahren@i2se.com>
> > > > > Cc: Eric Anholt <eric@anholt.net>
> > > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > ---
> > > > > ChangeLog v2->v3:
> > > > > - Rebase on top of the two new patches from the vendor tree.
> > > > > ChangeLog v1->v2:
> > > > > - Forgot to convert the driver to chained IRQ handler. Now
> > > > > fixed.
> > > > > 
> > > > > Rpi folks: I have no clue if this works or not, but would be
> > > > > happy
> > > > > if you could test it to see if IRQs fire as expected and
> > > > > provide
> > > > > some feedback.
> > > > 
> > > > Any testers?
> > > > 
> > > > I'm getting tempted to just apply it to get test coverage, at the
> > > > cost of having to revert it if it just explodes...
> > > 
> > > i made a simple boot + reboot test on my RPI 1 Model B without any
> > > issues.
> > > Unfortunately i don't have any additional hardware with a GPIO
> > > interrupt.
> > > 
> > > In the case this is sufficient you can have my:
> > > 
> > > Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> > 
> > Given that this is mostly about changing how IRQs are handled, it
> > would
> > be really nice to actually test that.  I've forwarded the patch on to
> > Phil in the hopes he can test it.  Alternatively, we could make HDMI
> > use
> > the GPIO line as an interrupt and turn off HPD polling and see if
> > that
> > works before and after.
> > 
> 
> 
> I might be able to help.  Over the years I've built little breakout
> boards of a USB PIC32 from Microchip that has a GPIO header just like
> the RPI.  I can hook up a test on a breadboard that connects the PIC32
> to both the USB port and the GPIO header of a RPI 2 or RPI 3.  That way
> I can do some loopback tests.
> 
> The only thing is I no nothing about the GPIO API of Linux, so it would
> take some learning on my part.
> 
> It would possibly take me a few days or to the end of the week to test
> everything well, since like I said I would need to setup a test and
> write some test code. 
> 
> I can't help if you need to get this in sooner, such as for 4.10.
> 

it's too late for 4.10. So there's no need to hurry.

Thanks
Stefan
