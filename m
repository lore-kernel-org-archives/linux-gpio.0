From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: CP2105 GPIO Pins
Date: Thu, 14 Jan 2016 09:52:38 +0000
Message-ID: <56976FE6.1010209@collabora.co.uk>
References: <568F9A17.809@collabora.co.uk>	<CACRpkda_qbxeeFW4XdoJqaN_-wyB2cgHcLjr8XUDtdZBv+MvRw@mail.gmail.com>	<569676EF.9070604@collabora.co.uk> <CACRpkdZrADtOetNQ6j8GvHuAkdxYz-q-4JgBY6xDTWK=sK7KmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41715 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751948AbcANJwl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2016 04:52:41 -0500
In-Reply-To: <CACRpkdZrADtOetNQ6j8GvHuAkdxYz-q-4JgBY6xDTWK=sK7KmA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>



On 14/01/16 09:24, Linus Walleij wrote:
> On Wed, Jan 13, 2016 at 5:10 PM, Martyn Welch
> <martyn.welch@collabora.co.uk> wrote:
>> On 13/01/16 14:58, Linus Walleij wrote:
>>>
>>> (Adding Johan Hovold, serial-usb-maintainer)
>>>
>>> On Fri, Jan 8, 2016 at 12:14 PM, Martyn Welch
>>> <martyn.welch@collabora.co.uk> wrote:
>>>
>>>> I'm working on adding support to the cp210x driver for the optional GPIO
>>>> pins available on Silicon Labs CP2105 USB to serial bridge.
>>>
>>>
>>> Do you have a data sheet?
>>
>> Yes.
>
> So can you share it or is it online somewhere?
>

FWIW, It's online:

https://www.silabs.com/Support%20Documents/TechnicalDocs/CP2105.pdf

Unfortunately it isn't particularly informative when it comes to the 
gpio, though they do provide a driver (which uses custom ioctls in the 
serial device, ick) and a user space test application that gives a good 
idea of how to drive it (well, how to toggle all of the bits 
simultaneously anyway).

For the vendor specific stuff, they provide further code to enable the 
manufacturing programming which makes use of that. With a little bit of 
digging I was able to ascertain what codes were sent to retrieve the 
information I required and which bits of the returned value were 
important for my use case.

Martyn

>>> I don't get it? Do you mean that the two serial ports will be able on
>>> some serial port pins and then *also* on these extra pins in this
>>> case, or do you mean that this is the only way for the serial
>>> lines to get out of the chip?
>>
>> You loose DTR, DSR, DCD and RI on each serial port when GPIO is enabled on
>> that port. Two of these pins on one port and 3 on the other become GPIO.
>> Both serial ports are still available, but only provide TX, RX, RTS and CTS
>> (which is more than enough for a lot of uses).
>
> OK modem signals go out the window and instead these pins
> are used for GPIO, because noone is using modems any more.
> Makes perfect sense.
>
>>> In any case, multiplexing is really a task for the pin control
>>> framework, if you desire to switch this muxing at runtime.
>>
>> You can't do it at runtime. The choice is programmed into a PROM, typically
>> at manufacture time (OEM, not chip) and can't be reverted.
>
> OK then you should just go with the manufacturing setup
> and you probably do not need pin control at all.
>
>>> OK how do you determine this then?
>>
>> There are some vendor specific USB calls that can be used to determine this.
>
> OK fair enough.
>
>>> Isn't it possible to read/query the PROM about the settings?
>
> And I guess that is what it does.
>
> Looking forward to the patch :)
>
> Yours,
> Linus Walleij
>
