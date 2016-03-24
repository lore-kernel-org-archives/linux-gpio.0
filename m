From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v4] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 24 Mar 2016 18:01:50 +0000
Message-ID: <56F42B8E.2090404@collabora.co.uk>
References: <1453126477-23735-1-git-send-email-martyn.welch@collabora.co.uk>
 <20160131195405.GA2957@localhost> <56AF52E0.2080507@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36981 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865AbcCXSBy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2016 14:01:54 -0400
In-Reply-To: <56AF52E0.2080507@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org



On 01/02/16 12:43, Martyn Welch wrote:
> On 31/01/16 19:54, Johan Hovold wrote:
>> On Mon, Jan 18, 2016 at 02:14:37PM +0000, Martyn Welch wrote:

<snip>

>>> +
>>> +    /*  2 banks of GPIO - One for the pins taken from each serial
>>> port */
>>> +    if (port_priv->bInterfaceNumber == 0 && (buf[0] & 0xFF) != 0) {
>>
>> No need to AND a u8 with 0xff.
>>
>>> +        port_priv->gc.label = "cp210x_eci";
>>> +        port_priv->gc.ngpio = 2;
>>> +    } else if (port_priv->bInterfaceNumber == 1 &&
>>> +           (buf[1] & 0xFF) != 0) {
>>> +        port_priv->gc.label = "cp210x_sci";
>>> +        port_priv->gc.ngpio = 3;
>>> +    } else {
>>> +        result = 0;
>>> +        goto err;
>>> +    }
>>
>> So this is cp2105 specific. Also cp2102, cp2103 and cp2108 supports
>> gpios. You don't have to add support for all types at once, but at least
>> make sure whatever design decisions you make allows for easy extension
>> to these types.
>>
>
> The cp2105 is the only one of these devices that muxes GPIO with serial
> control signals. The cp2102, cp2103 and cp2108 provide both GPIO and
> serial control signals separately, so the logic to configure the GPIO
> for those devices will be much simpler. (Hence why I called this
> cp210x_shared_gpio_init, as I figured the best approach for supporting
> the other devices would be through a separate init routine).
>
>> What about the other configurations supported for these pins (e.g.
>> traffic indication, rs485, ...). Would you also end up with non-zero
>> values for those?
>>
>
> Will investigate.
>

Sorry for the long delay - I got diverted by other things.

I've now worked out how to both program a device for these alternate 
modes (it's not clear in the data sheet and the configuration GUI 
available for Linux at least doesn't seem to be able to configure 
devices into these modes) and worked out how to check which GPIO are 
being used by them.

The configuration allows one or both of the 2 ECI GPIO to be used and 
one or both of the first 2 SCI GPIO to be used. i.e. I could have:

ECI:
  - Both GPIO available.
  - GPIO 0 available.
  - GPIO 1 available.

SCI:
  - All 3 GPIO available.
  - GPIO 0 & 2 available.
  - GPIO 1 & 2 available.
  - GPIO 2 available.

Can anyone provide some advise on best to map this into the GPIO framework?

Martyn
