From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] gpio: Allow PC/104 devices on X86_64
Date: Sat, 4 Jun 2016 07:12:21 -0400
Message-ID: <20160604111204.GA19180@sophia>
References: <cover.1464029828.git.vilhelm.gray@gmail.com>
 <d7320150373a0a04ba44b12c5c56d92370853316.1464029828.git.vilhelm.gray@gmail.com>
 <20160603205703.GC11253@amd>
 <20160603211244.GA6831@sophia>
 <20160604071408.GA22045@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160604071408.GA22045@amd>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jun 04, 2016 at 09:14:08AM +0200, Pavel Machek wrote:
>On Fri 2016-06-03 17:12:44, William Breathitt Gray wrote:
>> On Fri, Jun 03, 2016 at 10:57:03PM +0200, Pavel Machek wrote:
>> >Should we do "depends on PC104" here, because that is what it really
>> >means, and have PC104 enabled when ISA_BUS_API is enabled or something
>> >like that?
>> 
>> Since the functionality remains the same, I'm a bit indifferent to that
>> change; as long as the driver builds for systems in which it's intended
>> to be used, I'm satisfied.
>> 
>> Differentiating between PC/104 and ISA may be a pointless endeavor
>> though since both buses appear the same to software. But if it is better
>> to differentiate between devices as such, then I see little harm in
>> adding a PC104 Kconfig option which follows the ISA_BUS_API Kconfig
>> option.
>
>Well, they are same to the software, but not at the hardware. If I
>have a development board that has PC104 (but not isa), I'd like to see
>prompts for PC104 extensions, not for isa. If PC105 comes out, still
>ISA compatible, I will want to see prompts for PC104 boards or PC105
>boards, but not neccessarily both...

I think I see the merit of a prompt for PC104 devices. I've encountered
a use case recently which I'm curious about in this scenario. Given the
compatibility with ISA, manufacturers may occasionally develop variants
of existing ISA devices by duplicating the firmware on a PC/104 form
factor.

I'm working on an IIO DAC driver for the Measurement Computing CIO-DAC
family (CIO-DAC08, CIO-DAC16, and PC104-DAC06); while not a GPIO driver,
I believe it can serve as a decent example. Interestingly, while the
CIO-DAC08 and CIO-DAC16 are true ISA devices, the PC104-DAC06 is a
PC/104 variant compatible with the others in the family. The IIO DAC
driver works just as well with the PC104-DAC06, as it does with the true
ISA devices in the family.

What would the Kconfig depends line look in this scenario? I imagine
simply "depends on PC104" would be inappropriate since there are a
number of true ISA devices supported by the driver, but "depends on
ISA_BUS_API || PC104" seems somewhat redundant when the PC104 Kconfig
option implies ISA_BUS_API. This situation isn't that much of an issue
overall, but I anticipate encountering it occassionally as I develop
future PC/104 drivers.

William Breathitt Gray
