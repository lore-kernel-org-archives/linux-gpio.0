From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Question about gpio sysfs interface
Date: Mon, 7 Apr 2014 16:58:22 +0900
Message-ID: <CAAVeFuKyixV8CPp3i+ftuqgtF-sWc5TVRy1gRg6Xg+pQBsF6-w@mail.gmail.com>
References: <1420047.Pa7NFNg2Xt@kerker>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:47177 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaDGH6n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 03:58:43 -0400
Received: by mail-ie0-f175.google.com with SMTP id to1so5642989ieb.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2014 00:58:42 -0700 (PDT)
In-Reply-To: <1420047.Pa7NFNg2Xt@kerker>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Heimpold <mhei@heimpold.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Apr 7, 2014 at 3:56 AM, Michael Heimpold <mhei@heimpold.de> wrote:
> Hi,
>
> I have a question regarding user-space gpio support with sysfs.
>
> Documentation/gpio/sysfs.txt states
>> GPIO signals have paths like /sys/class/gpio/gpio42/ (for GPIO #42)
>> and have the following read/write attributes:
>>
>>    /sys/class/gpio/gpioN/
>>
>>       "direction" ... reads as either "in" or "out". This value may
>>               normally be written. ...
>>
>>               Note that this attribute *will not exist* if the kernel
>>               doesn't support changing the direction of a GPIO, or
>>               it was exported by kernel code that didn't explicitly
>>               allow userspace to reconfigure this GPIO's direction.
>
> Imagine for example a generic user-space tool which enumerates
> all available GPIOs to the user and sorts by input and output GPIOs.
> How would such a tool classify an exported GPIO when kernel
> doesn't export the 'direction' file via sysfs? Or in other words: how
> can userspace detect the state (in vs. out) of a GPIO when 'direction'
> is not exported?

Wouldn't the "value" field be read-only for a "in" GPIO and read-write
for an "out" one?

Other than that, I also don't see any drawback to having "direction"
always exported and made read-only if direction cannot be changed.

Alex.
