From: Tal Shorer <tal.shorer@gmail.com>
Subject: Re: [PATCH v2 2/2] tracing: gpio: add Kconfig option for
 enabling/disabling trace events
Date: Sat, 18 Jul 2015 13:12:53 +0300
Message-ID: <CAFDyS3Nuq8FPx4z5GW1Ht+NBGd+8O9rjPZ+DaMU1XU1QYgA=2g@mail.gmail.com>
References: <20150713143459.09582cb9@gandalf.local.home>
	<1437068376-24617-1-git-send-email-tal.shorer@gmail.com>
	<1437068376-24617-3-git-send-email-tal.shorer@gmail.com>
	<20150717143606.200d97d7@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:37875 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414AbbGRKMy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jul 2015 06:12:54 -0400
In-Reply-To: <20150717143606.200d97d7@gandalf.local.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mingo@redhat.com, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On second thought, I wonder if the config option shouldn't be in
kernel/trace/Kconfig
Imagine there's an option for every subsystem. Disabling all of them
but the one you actually care about is going to be a mess if they're
scattered all over the place.
Your thoughts?

On Fri, Jul 17, 2015 at 9:36 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 16 Jul 2015 20:39:36 +0300
> Tal Shorer <tal.shorer@gmail.com> wrote:
>
>> Add a new options to gpio Kconfig, CONFIG_GPIO_TRACING, that is used
>> for enabling/disabling compilation of gpio function trace events.
>>
>
> If I can get acks from the gpio maintainers, I can take this in my
> tree, as it depends on code that modifies the core tracing facility.
>
> -- Steve
>
>> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
>> ---
>>  drivers/gpio/Kconfig        | 7 +++++++
>>  include/trace/events/gpio.h | 4 ++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index c1e2ca3..2829e8e 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -88,6 +88,13 @@ config GPIO_SYSFS
>>  config GPIO_GENERIC
>>       tristate
>>
>> +config GPIO_TRACING
>> +     bool "gpio tracing"
>> +     depends on TRACING
>> +     help
>> +       Enable tracing for gpio subsystem
>> +
>> +
>>  # put drivers in the right section, in alphabetical order
>>
>>  config GPIO_DA9052
>> diff --git a/include/trace/events/gpio.h b/include/trace/events/gpio.h
>> index 927a8ad..09af636 100644
>> --- a/include/trace/events/gpio.h
>> +++ b/include/trace/events/gpio.h
>> @@ -1,6 +1,10 @@
>>  #undef TRACE_SYSTEM
>>  #define TRACE_SYSTEM gpio
>>
>> +#ifndef CONFIG_GPIO_TRACING
>> +#define NOTRACE
>> +#endif
>> +
>>  #if !defined(_TRACE_GPIO_H) || defined(TRACE_HEADER_MULTI_READ)
>>  #define _TRACE_GPIO_H
>>
>
