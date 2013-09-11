From: Daniel Santos <danielfsantos@att.net>
Subject: Re: "Virtual" Interrupts -- Need help please
Date: Wed, 11 Sep 2013 12:59:28 -0500
Message-ID: <5230AF80.8020100@att.net>
References: <522BC27A.5080303@att.net> <20130909110640.GV29403@sirena.org.uk> <522E39B5.4090906@att.net> <20130910180143.GA29403@sirena.org.uk>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm2-vm5.access.bullet.mail.bf1.yahoo.com ([216.109.114.92]:35914
	"EHLO nm2-vm5.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754606Ab3IKR7H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 11 Sep 2013 13:59:07 -0400
In-Reply-To: <20130910180143.GA29403@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On 09/10/2013 01:01 PM, Mark Brown wrote:
> On Mon, Sep 09, 2013 at 04:12:21PM -0500, Daniel Santos wrote:
>> One of my original requirements for this driver is that it is
>> reusable for different devices that use the MCP2210, not just my own
>> hardware.  There are a number of ways to accomplish this, but I'm
>> still new to Linux device drivers, so I don't know how an "abstract
>> driver" would work other than just making it a library that doesn't
>> register its self as a driver.  The theory is that you should be
>> able to specify your own USB vid/pid and have your driver probe on
>> that, then feed the generic MCP2210 driver/library your board wiring
>> information and any parameters your other drivers need (spi or
>> gpio-driven peripherals on the board) and let the MCP2210
>> driver/library do potentially everything else for you, unless your
>> device has some needs that aren't covered.
> OK, this is a lot like the plugin modules that are fairly common in
> embedded reference designs.  I do have some ideas for how to put an
> indirection layer in front of them but I'm not sure they're that
> exciting - I expect what you end up doing will be having tables of child
> device configurations registered based on the vendor ID, the vendor ID
> support in the USB subsystem will let you provide either an index into
> an array or just a pointer to the data for the specific board.

Hmm, I guess I was thinking about this in the other direction: A generic 
mcp2210 and then the new guy's writes a driver for his specific hardware 
with it's own vid/pid and he loads up mcp2210 and sends it config, but 
doesn't change mcp2210.  Honestly, I forget some of the dynamics of 
working with the kernel that differ from other projects -- anything can 
be modified at a later date to accommodate new hardware.  Just adding a 
new vid/pid entry with config would be much easier and lightweight.

>> Another requirement is for my specific device to vary its hardware
>> somewhat, but (possibly) use the same vid/pid for these.  Maybe this
>> is some cardinal sin and a unique pid and model number for each
>> variant is called for (like I said, I'm still new to this stuff).
>> None the less, I've dealt with these two problems by creating an
>> encoding scheme (which I've dubbed "Creek", since I figured I was up
>> one if it didn't work) that compresses the data so that it will fit
>> easily in the 256 bytes of user-EEPROM on the chip.
> That doesn't seem so bad, you can just have the decode of the main
> VID/PID kick off the decode of the EEPROM contents.

Currently, I'm using magic.  I read the first 4 bytes of the user-EEPROM 
and if it's 0xc01df00d then I presume that it will feed me configuration 
data in the Creek format, after re-heating of course.  I left myself a 4 
bit format version field as well.

>> At the time I wrote this, I knew very little about the device tree
>> and nothing about this Open Firmware format, so now I want to make
>> sure I'm not re-inventing some wheel or circumventing a standard
>> unnecessarily.  Then, as I was working on figuring out how to
>> propagate IRQs, I noticed that the irq_domain_add_linear() accepted
>> a pointer to struct device_node and didn't not accept NULL. This
>> made me think that I was missing something.
> Device tree is more applicable on a system level, it's not something
> it's sensible to mandate for a USB device.  The struct device is as much
> for in kernel usage as anything else, there are helpers to make DT
> transparent but it all works perfectly fine on systems that don't even
> have DT support built in.

Ahh, well that's fun.  I want to learn about it none the less because 
the hardware that we'll interact with from usb to spi/gpio/i2s/smbus, 
etc. will typically be devices who's drivers are platform drivers.  
Thus, I would suspect that at least some of these drivers expect to be 
fed something DT or OF related?  One of my motivations here is to 
leverage existing drivers for such devices, although I'm having to write 
fresh ones for all of the chips I'm using in my real-world, actual 
money-producing project. :)

>> So in summary, I need to make sure that what I'm doing 1.) makes
>> sense, 2.) adheres to standards (unless the standard fails to
>> fulfill the real-world requirements) and 3.) doesn't unnecessarily
>> introduce a new way to do something that's already done better
>> elsewhere.
> It doesn't seem unreasonable to me, though it'd be good to review the
> specifics of course.

Wonderful!  It is certainly a relief and I very much appreciate your 
time and feedback! When I get things a little more stable and finish 
putting in the IRQ code, I would be very happy to get your help in 
reviewing it. :)
