From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: CP2105 GPIO Pins
Date: Thu, 14 Jan 2016 10:24:22 +0100
Message-ID: <CACRpkdZrADtOetNQ6j8GvHuAkdxYz-q-4JgBY6xDTWK=sK7KmA@mail.gmail.com>
References: <568F9A17.809@collabora.co.uk>
	<CACRpkda_qbxeeFW4XdoJqaN_-wyB2cgHcLjr8XUDtdZBv+MvRw@mail.gmail.com>
	<569676EF.9070604@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34140 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753206AbcANJYX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2016 04:24:23 -0500
Received: by mail-ob0-f179.google.com with SMTP id vt7so78268254obb.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2016 01:24:23 -0800 (PST)
In-Reply-To: <569676EF.9070604@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 13, 2016 at 5:10 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
> On 13/01/16 14:58, Linus Walleij wrote:
>>
>> (Adding Johan Hovold, serial-usb-maintainer)
>>
>> On Fri, Jan 8, 2016 at 12:14 PM, Martyn Welch
>> <martyn.welch@collabora.co.uk> wrote:
>>
>>> I'm working on adding support to the cp210x driver for the optional GPIO
>>> pins available on Silicon Labs CP2105 USB to serial bridge.
>>
>>
>> Do you have a data sheet?
>
> Yes.

So can you share it or is it online somewhere?

>> I don't get it? Do you mean that the two serial ports will be able on
>> some serial port pins and then *also* on these extra pins in this
>> case, or do you mean that this is the only way for the serial
>> lines to get out of the chip?
>
> You loose DTR, DSR, DCD and RI on each serial port when GPIO is enabled on
> that port. Two of these pins on one port and 3 on the other become GPIO.
> Both serial ports are still available, but only provide TX, RX, RTS and CTS
> (which is more than enough for a lot of uses).

OK modem signals go out the window and instead these pins
are used for GPIO, because noone is using modems any more.
Makes perfect sense.

>> In any case, multiplexing is really a task for the pin control
>> framework, if you desire to switch this muxing at runtime.
>
> You can't do it at runtime. The choice is programmed into a PROM, typically
> at manufacture time (OEM, not chip) and can't be reverted.

OK then you should just go with the manufacturing setup
and you probably do not need pin control at all.

>> OK how do you determine this then?
>
> There are some vendor specific USB calls that can be used to determine this.

OK fair enough.

>> Isn't it possible to read/query the PROM about the settings?

And I guess that is what it does.

Looking forward to the patch :)

Yours,
Linus Walleij
