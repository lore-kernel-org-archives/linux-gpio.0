From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Mon, 31 Oct 2016 10:17:44 +0000
Message-ID: <20161031101744.GA11986@hermes.home>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
 <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48977 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752340AbcJaKRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2016 06:17:51 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Tue, Oct 25, 2016 at 11:34:40AM +0200, Linus Walleij wrote:
> Good work on this patch, nice that it got merged.
> 
> I was just thinking that as an add-on, you may want to name
> the gpio lines so they have meaningful names in userspace
> when you use this with the chardev (I have reasons to believe
> these GPIOs will be used from userspace, tell me if that
> is wrong).
> 

Yeah, they are.

> We currently support naming lines for devicetree and
> ACPI (in -next).
> 

I'm not sure this would be a good fit for the current use case I've been
working on, as I understand there might be an arbitary number of devices
plugged in. The same chip may also get used in more than one way (in the
current use case, the Vendor/Product IDs actually get get to determine the
use case.

Originally I did name the GPIO as either SCI or ECI, in the case of the
CP2105, being able to distinguish between the two banks can be helpful
during debug (but isn't essential and didn't actually seem to help when
trying to programatically parse though the available banks of GPIO in user
space to find the ones that were interesting). However this doesn't
translate so well to the other chips in the CP210x family as the GPIO is
implemented differently for the majority of those (they don't mux pins from
the serial ports).

I have seen such chips actually used inside of units, so being able to name
the GPIO would be quite useful there, though that naming would need to only
be applied to specific devices and not to other devices plugged in
externally.

Martyn

