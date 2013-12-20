From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Tracing events with GPIOs
Date: Fri, 20 Dec 2013 16:33:41 +0900
Message-ID: <CAAVeFuJ=s8e8g5LG2CVAkS3guj-HRUYrwKxywFxq36sNpAjQGQ@mail.gmail.com>
References: <1387239745-2890-1-git-send-email-jjhiblot@traphandler.com>
 <CAAVeFuKAGfnnsbtBg=zfmciyMdZHgrX_EpecqPjG=oO6rZdWag@mail.gmail.com> <CACh+v5MUsYW-=qaVubzt8CWRGxibKDB3PjMZ6AaeDYgeTNzONA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACh+v5MUsYW-=qaVubzt8CWRGxibKDB3PjMZ6AaeDYgeTNzONA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2013 at 8:38 PM, Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> 2013/12/19 Alexandre Courbot <gnurou@gmail.com>:
>> The problems I can see so far:
>>
>> - Using gpiod, GPIOs are not specified as integers, but are typically
>> mapped to a given (device, function) pair (device can be NULL) using
>> device tree/platform data/ACPI and obtained by the corresponding
>> device driver through gpiod_get(). You would need to find a different
>> way to specify GPIOs, maybe using the gpio_chip's label and the GPIO
>> hardware number.
>>
>> - Even if you do so, there is currently no way to arbitrarily obtain a
>> GPIO that has not been explicitly mapped to a (device, function), and
>> IIUC you need to specify the tracing GPIO freely from user-space. This
>> hints that we will need to add a function that is sensibly the same as
>> gpio_request_one() to the gpiod API, but I wonder if that does not
>> defeats the purpose somehow.
>
> This is something I was wondering about for another reason. In many
> cases the GPIOs that are physically available for probing will be
> limited to the GPIOs already assigned a function (backlight control
> for example), others are usually not routed except in eval boards or
> early prototypes. And consequently those GPIOs will be requested by a
> driver long before a probe is set.
> It would be nice not to have to remove the driver to be able to use
> this GPIO  as a probe. Maybe a gpiod_steal() interface and a flag
> indicating that the GPIO can be safely stolen?

Mmm an explicit way to hijack a GPIO does not sound very safe. Do you
have concrete cases where you need to do so? I guess most boards you
may want to use this patch with would have at least some spare GPIOs
with pins somewhere on the board for this kind of purpose.
