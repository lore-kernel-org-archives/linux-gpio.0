From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Mon, 22 Jun 2015 22:11:35 +0200
Message-ID: <11dedbc454ab78f5e03497e2c5d8f5b3@agner.ch>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
 <20150622172610.GK483@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:33900 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607AbbFVUOD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2015 16:14:03 -0400
In-Reply-To: <20150622172610.GK483@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, hachti@hachti.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <jhovold@gmail.com>

On 2015-06-22 19:26, Johan Hovold wrote:
> On Sun, Jun 21, 2015 at 12:12:55AM +0200, Stefan Agner wrote:
<snip>
>> Bit Bang mode, the pins need to be reprogrammed to I/O mode first
>> (EEPROM). All three modes are supported from userspace by libftdi afaik.
> 
> Is there a way to retrieve the settings from eeprom and only register
> the gpio chip based on the configuration?
> 

Afaik, there is. Not sure if that is somewhat standardized between the
different controllers, will have a look at it. 

>> In my use case I would like to use the additional GPIOs to control an
>> embedded board (power off/reset etc.) and use the serial communication
>> alongside. Using libftdi to use the CBUS Bit Bang mode is cumbersome,
>> since libftdi requires to detach the kernel driver to get access to the
>> device. The user needs then to reconnect the serial terminal every time
>> a GPIO has been used. Hence, if any of these modes, I see most value in
>> supporting the CBUS mode through the kernel's gpiolib API. However,
>> since some functions are shared (e.g. set_bitmode to enable the
>> different bit modes), this patchset is does some ground work for the
>> other modes too, in case anybody wants to do further work on them.
> 
> I agree, the usb-serial driver should only provide access to the four
> cbus pins if available (and use gpiolib).
> 
>> This patchset currently supports FT232R type of devices and has been
>> tested using a FT232RL device. I think the FT232H (and probably later)
>> types of devices should work too (at least the Table 3.5 in the FT232H
>> data sheet mentions the ACBUS Signal Option "I/O mode"). However, I
>> don't have such a device to test at my disposal.
>>
>> On the implementation side, I created a distinct GPIO driver in
>> drivers/gpio and create that platform device directly from within the
>> ftdi_sio driver. I understand that the mfd subsystem would be the way to
>> go, however it seems to me quite a big change... At least all USB device
>> IDs would need to be moved to the mfd core device since the mfd device
>> would be registered as a USB driver. I guess the ftdi_sio driver would
>> become a platform device and still live under drivers/usb/serial/...?
>>
>> I just saw that recent discussion by Grant and Linus did not approve
>> this approach...?
> 
> Using the platform bus -- directly as you do or via MFD -- allows for
> some (arguably contrived) abstraction but I think we should avoid it
> nonetheless. USB (serial) does not use it as you already noted, and
> there's not much to gain from creating a single-cell-mfd child device to
> the USB interface.
> 
> Instead, hang the gpio chip directly off the usb interface (not the
> port), add a new config option, and keep the gpio implementation under
> drivers/usb/serial (possibly in its own file ftdi_sio-gpio.c).

Agreed sounds like a good plan. Will try this approach in v2.

Except I don't think hanging it directly to the USB interface is the
right thing to do.

Looking at the block diagram of FT232R or FT232H, the CBUS pins seem to
be part of the UART/FIFO controller. And I think the dual UART FT2232D
actually supports controlling the CBUS pins of the two UART controllers
individually, at least the block diagram thereof suggests so.


> Note that your current implementation fails to remove the gpio chip on
> device disconnect, leaks resources in error paths, and lacks locking for
> the gpio state.

Oh true. I was aware that it is somewhat rough, should probably have
sent the patch as RFC...

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
