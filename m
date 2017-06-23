From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] SoCFPGA update for v4.13
Date: Fri, 23 Jun 2017 14:38:16 +0200
Message-ID: <CAK8P3a2DFrabNdJu3d1V5F_uWRz0C+sPgqm9mnA_Wpzy6FYNDQ@mail.gmail.com>
References: <1498059352-9483-1-git-send-email-dinguyen@kernel.org>
 <1498059352-9483-2-git-send-email-dinguyen@kernel.org> <CAK8P3a1vZVQ5MZDU+qp62LCLnF8z-9LFH=c7XYj=ZnPUzVMjOA@mail.gmail.com>
 <CACRpkdbCrKo7Uvhdyx+4_hMQrPCYaMMijHpYzEY+2MePjpr73g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:34432 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbdFWMiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 08:38:17 -0400
Received: by mail-ot0-f196.google.com with SMTP id p48so4727296otc.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2017 05:38:17 -0700 (PDT)
In-Reply-To: <CACRpkdbCrKo7Uvhdyx+4_hMQrPCYaMMijHpYzEY+2MePjpr73g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Jun 23, 2017 at 2:28 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jun 23, 2017 at 2:03 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Jun 21, 2017 at 5:35 PM, Dinh Nguyen <dinguyen@kernel.org> wrote:
>>> Hi Arnd, Kevin, and Olof:
>>>
>>> Please pull in this SoCFPGA Kconfig update for v4.13.
>>
>> I'd like to defer this one until I hear back from the GPIO maintainers:
>>
>> With this patch, CONFIG_ARCH_NR_GPIO increases from 1024 to 2048
>> in the ARM defconfig build. Is this ok in terms of runtime overhead?
>
> There is no problem with runtime overhead, only with footprint.
>
> The array of sizeof(gpio_desc) increases to double.
>
> struct looks like so:
>
> struct gpio_desc {
>         struct gpio_device      *gdev;
>         unsigned long           flags;
>         const char              *label;
>         const char              *name;
> };
>
> Looks like 4x32 bits in most cases, so this means a 4*4*1024 =
> 16 KiB footprint increase.

Ok.

> We have had to allocate this statically because so many playforms still
> use the legacy GPIO API.
>
>> If not, are there any alternatives?
>
> Not really, if they have this many GPIOs.

Right. I pulled the branch into next/soc now, thanks for the quick reply!

> Helping out ridding the kernel of users of the old GPIO global
> numberspace ABI is appreciated though.

I guess there is no easy way to figure out which drivers are needed on
socfpga and do those first, right?

        Arnd
