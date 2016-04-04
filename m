From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 2/2] gpiolib: Defer gpio device setup until after gpiolib
 initialization
Date: Tue, 5 Apr 2016 09:50:17 +1000
Message-ID: <5702FDB9.9010806@westnet.com.au>
References: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
 <1459437090-10029-2-git-send-email-linux@roeck-us.net>
 <56FDC0D7.5040101@westnet.com.au> <20160401005301.GA17066@roeck-us.net>
 <56FDCFDF.2090107@westnet.com.au>
 <CACRpkdacra5WnWtH7qyuxix3fGBoa+6WZJCU5vusQoAaJGZrfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdacra5WnWtH7qyuxix3fGBoa+6WZJCU5vusQoAaJGZrfw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 01/04/16 18:16, Linus Walleij wrote:
> On Fri, Apr 1, 2016 at 3:33 AM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
>> On 01/04/16 10:53, Guenter Roeck wrote:
>
>>> Probably coldfire ?
>>>
>>> arch/m68k/coldfire/gpio.c:
>>
>> Yes, that is the one.
>>
>>> static struct bus_type mcfgpio_subsys = {
>>>          .name           = "gpio",
>>>        .dev_name       = "gpio",
>>> };
>>>
>>> No idea what to do about that. Can that bus be renamed ?
>>
>> Yeah, it could. But is it even necessary at all now?
>>
>> I am thinking I could remove the subsys_system_register(&mcfgpio_subsys, NULL)
>> call from that coldfire/gpio.c. Doing that certainly cleans up the
>> boot. There was nothing much under the old coldfire /sys/gpio other than
>> the standard devices/drivers/etc. And the new gpio api ofcourse has all
>> that as well.
>
> Please kill it if you can. Or are there userspaces for
> coldfire that use this? In that case we need some compatibility
> shim for them.

I don't see any reason we can't just kill it.
It never had any real links to anything under it, only
the usual set of bus sysfs nodes. So the new "/sys/bus/gpio"
has all that and more. So no need for a shim.


> I'm trying to pull all needed functionality into the proper gpiolib
> so we can get some order around the place...

Yep :-)
I'll prepare a patch to remove the coldfire gpio sys bus device.
It is pretty simple in this case.

Regards
Greg
