From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: controlling pinctrl GPIOs from userspace on x86
Date: Wed, 25 Jan 2017 11:25:22 +0200
Message-ID: <20170125092522.GN17297@lahna.fi.intel.com>
References: <9201895.LkQO1ovFfJ@rdx.n.i2n>
 <CACRpkdaNBiyEqRYgoD-k+TEC90_fq-LAnfH3uJ6Ar8OqjWooZg@mail.gmail.com>
 <4151584.CJCGa0bWPQ@rdx.n.i2n>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12656 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751381AbdAYJZy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 04:25:54 -0500
Content-Disposition: inline
In-Reply-To: <4151584.CJCGa0bWPQ@rdx.n.i2n>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gerd v. Egidy" <lists@egidy.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 25, 2017 at 12:25:20AM +0100, Gerd v. Egidy wrote:
> Hi Linus,
> 
> thank you for answering after such a long time.
> 
> > - What kernel version are you running?
> 
> I tried it with a 4.8.12 which was reasonably current when I tried it in 
> december.
> 
> > - Have you tried compiling tools/gpio/* and running "lsgpio"?
> 
> nope.
> 
> > That said, GPIO can use pin control as a back-end and pin control
> > drivers are often "dual devices" registering both pin control and GPIO.
> 
> The pinctrl-sunrisepoint driver does not seem to be such a dual device.

It does actually.

> What other ways instead of a dual device driver are there to expose pin 
> control pins through the GPIO subsystem?
> 
> Is there some kind of translation driver which takes a pinctrl pin with some 
> extra information (like push-pull vs. open drain etc.) and creates a user 
> accessible entry in the gpio subsystem from it?
> 
> If not, wouldn't it make sense to have such a thing?

So you can use the older sysfs ABI also to access the pin:

# grep SATAXPCIE_1 /sys/kernel/debug/pinctrl/INT344B\:00/pins                 
pin 97 (SATAXPCIE_1) mode 1 0x44000700 0x00000019

# cat /sys/kernel/debug/pinctrl/INT344B\:00/gpio-ranges 
GPIO ranges handled:
0: INT344B:00 GPIOS [360 - 511] PINS [0 - 151]

# echo $((360+97)) > /sys/class/gpio/export 
[   86.778304] sunrisepoint-pinctrl INT344B:00: request pin 97 (SATAXPCIE_1) for INT344B:00:457

This will change the pin SATAXPCIE_1 to a GPIO and makes it accessible
from userspace via /sys/class/gpio/gpio457/*.

Note you should really know what you are doing if you are going to
toggle random GPIOS.
