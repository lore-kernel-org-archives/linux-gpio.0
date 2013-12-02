From: Bruno Randolf <br1@einfach.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Mon, 02 Dec 2013 12:43:27 +0000
Message-ID: <529C806F.4000204@einfach.org>
References: <1385597895-26418-1-git-send-email-br1@einfach.org> <20131129185606.GK16823@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from postler.einfach.org ([91.250.116.113]:43170 "EHLO
	postler.einfach.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752494Ab3LBMnh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2013 07:43:37 -0500
In-Reply-To: <20131129185606.GK16823@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Simon and all!

Thanks for your feedback, but please keep in mind that I am not
working for any chip manufacturer or board vendor. I'm just a user who
wants to share his work, and I believe in 99% of the cases only one
single "super i/o" chip will be in a given system, and 99% of the
users will not use more than the first 8 GPIOs. However I'm going to
try to support all available GPIOs on this chip, but I have the
following problem:

The chip has the following GPIOs:

10-17			8 continous GPIOs, OK
21, 22, 27		20 and 23-26 not available
30-34, 36, 37		35 not available
40, 42, 44-47		41, 43 not available
GP50-57			8 continous GPIOs, OK
GP60-67			8 continous GPIOs, OK

The datasheet is available at:

http://www.smsc.com/Products/PC_System_and_I-O_Controllers/Embedded_I-O_Products/LPC-Based_Embedded_I-O/SCH3112_SCH3114_SCH3116

So I'd register 6 gpio_chip structures with a different base, but how
should I handle these "holes"? Via gpio_chip.request? Or return error
in direction_input and direction_output?

On 11/29/2013 06:56 PM, Simon Guinot wrote:
>> +static unsigned int sch311x_gpio_conf[] = { +	{ 0x23,		/* GP10
>> config register */
> ^ Does this even compile ?

Sorry, a mistake crept in.

>> +static inline void sch311x_sio_enter(int sio_config_port) +{
> 
> As a Super-I/O is a multifunction device, I think you should
> request the Super-I/O port here, using request_muxed_region() for
> example.
> 
> This is a collaborative way to prevent against concurrent
> accesses.

Ok, thanks for this info.

> It seems to me that all the sch311x_gpio_conf registers are
> contiguous, except for address 0x27. Then, maybe you can transform
> this loop into a single request_region() call ?

It's except 0x27, and then when I add more GPIO lines the registers
get even more non-contiguous... I could manually check which areas can
be combined, but I think it's not worth it...

>> +	sch311x_sio_enter(sio_config_port);
> 
> Don't you need to check the vendor ID here ?

How?

>> +	dev_id = reg == 0x7c ? 2 : reg == 0x7d ? 4 : 6;
> 
> Outch :)

Well, again, I have copied this part from watchdog/sch311x_wdt.c

>> + +	/* Select logical device A (runtime registers) */ +
>> sch311x_sio_outb(sio_config_port, 0x07, 0x0a);
> 
> How behaves the Super-I/O if an another driver selects a different 
> logical device later ? Is that OK ?

I'm not sure but I believe so because we just got the base address of
the logical device in the next lines.

>> + +	/* Check if Logical Device Register is currently active */ +
>> if ((sch311x_sio_inb(sio_config_port, 0x30) & 0x01) == 0) +
>> pr_info("Seems that LDN 0x0a is not active...\n");
> 
> Maybe you can enable it ?

Again, not sure, but I assume the BIOS should enable/disable logical
devices it based on what is connected and in use?

brin

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSnIBvAAoJEE06nu8QSdWB9kAIAIgf1Js2aLHYyaZ+R0LdvQjw
Jcjbi1Ci3Q5eO69xwkl18sxCdqK4xhQOEPzSWD/DLwu0+oHL+5kXpnnNLrPXKJ9y
F/MIrtEz0RUD5siWvq97VL1OmfIaHUdhh4rz1Of93HkDMIyOPlV0fDyGYypyCk/c
0N2CVdgvt+O7KwmR+/fAAuNoi6dWtdX1Ilh3gOiF2b87SSpBgZxB/2Hi9e7GRXUD
g2A1f7mhHbhecqvu1FAxt12xEVUa7Yq5Lzt84IlL722Hk2cYJI011WRaBbaLtN5R
kVDKnLTfvtL9B4tdiDbV7LTCJ38JZMk4tWl4xKzjRcQsgbBTjP0dTZcoZrwBarE=
=9KaL
-----END PGP SIGNATURE-----
