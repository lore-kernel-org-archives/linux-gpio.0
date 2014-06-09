From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] USB: ftdi_sio: add GPIO support
Date: Mon, 09 Jun 2014 22:36:47 +0400
Message-ID: <5395FEBF.3040608@cogentembedded.com>
References: <1402320115-13171-1-git-send-email-x-linux@infra-silbe.de> <20140609152313.45f353d6@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140609152313.45f353d6@alan.etchedpixels.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Sascha Silbe <x-linux@infra-silbe.de>
Cc: Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello.

On 06/09/2014 06:23 PM, One Thousand Gnomes wrote:

>>   #include <linux/kernel.h>
>>   #include <linux/errno.h>
>> +#ifdef CONFIG_GPIOLIB
>> +#include <linux/gpio.h>
>> +#endif

> Please create a new struct, a new file and put all the GPIO stuff in
> there rather than #if bombing the driver.

> You can then declare blank methods for the gpio stuff if GPIO is not
> compiled in - ie in the headers

> #ifdef CONFIG_GPIOLIB
> extern int ftdi_gpio_open(struct ftdi_private *priv);
> etc...
> #else
> extern inline  int ftdi_gpio_open(struct ftdi_private *priv) { return 0 };

    I guess you meant *static* instead of *extern* here?

> #endif

WBR, Sergei
