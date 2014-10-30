From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH] gpio/pinctrl: baytrail: move gpio driver from pinctrl
 to gpio directory
Date: Thu, 30 Oct 2014 16:26:54 +0100
Message-ID: <CACRpkdYzuc+EmgjGtXaFKWRgEu1-B9tEiBnH_wTaa7vw4qPr+A@mail.gmail.com>
References: <1413227857-555-1-git-send-email-david.a.cohen@linux.intel.com>
	<543CFC7F.2070607@linux.intel.com>
	<20141014174535.GA6516@psi-dev26.jf.intel.com>
	<20141015070812.GM2255@lahna.fi.intel.com>
	<20141015165542.GA4529@psi-dev26.jf.intel.com>
	<20141016080123.GW2255@lahna.fi.intel.com>
	<20141017015322.GB4513@psi-dev26.jf.intel.com>
	<CACRpkdafsd3VDiEKbdooXx+mdAtf-3B6QBOEGeHgyJf9GKHqhQ@mail.gmail.com>
	<20141028164259.GA16355@psi-dev26.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141028164259.GA16355@psi-dev26.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 28, 2014 at 5:42 PM, David Cohen
<david.a.cohen@linux.intel.com> wrote:
> On Tue, Oct 28, 2014 at 04:10:26PM +0100, Linus Walleij wrote:
>> On Fri, Oct 17, 2014 at 3:53 AM, David Cohen
>> <david.a.cohen@linux.intel.com> wrote:
>> > On Thu, Oct 16, 2014 at 11:01:23AM +0300, Mika Westerberg wrote:
>>
>> >> In an ideal world, yes. However, the reality has shown that BIOS/FW gets
>> >> these wrong and we need to work it around in the OS.
>> >
>> > But we never upstream these workarounds, right? :)
>>
>> Unless you discover it after it hits the market, right?
>
> This is quite unlikely to happen. A pin mux misconfigured would have
> quite bad side effects

This is not what typically happens. Mux is not the problem, the
problem is going to be pin config.

What happens is that someone designs a board with a pull-up
resistor mounted on it, and the device ships with the internal
on-soc software controlled pull-up enabled as well.

A few weeks later someone discovers that the device is
consuming too much power, and start hunting for power
regressions.

They realize that the on-soc pull up should not have been enabled
since the one in hardware (soldered on the board) is good enough,
and having them both active leads to leak current as the sum
resistance of two parallel pull-ups is Rtot = R1*R2/(R1+R2).

And they start putting in software quirks to turn off the internal
pull-up to meet power targets.

Yours,
Linus Walleij
