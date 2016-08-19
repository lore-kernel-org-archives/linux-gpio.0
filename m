From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: Fix OF build problem on UM
Date: Fri, 19 Aug 2016 11:16:47 +0200
Message-ID: <CAMuHMdWiu9pucXTzzQSY-FjVojaV3W2BF-m7BVcQXWhT8zrAdQ@mail.gmail.com>
References: <1471334801-2814-1-git-send-email-linus.walleij@linaro.org>
 <CAMuHMdU3j6_sye_WqKgcReD+Nym-2=ymEh98D50nD2jEifOXRQ@mail.gmail.com> <CACRpkdY+8beEcyvx1TYZr_=Q9zdvj8PoWX4qL+UoiEGS1ppBpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34440 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750879AbcHSJQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2016 05:16:49 -0400
In-Reply-To: <CACRpkdY+8beEcyvx1TYZr_=Q9zdvj8PoWX4qL+UoiEGS1ppBpA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, stable <stable@vger.kernel.org>

On Fri, Aug 19, 2016 at 10:53 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Aug 17, 2016 at 11:03 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Aug 16, 2016 at 10:06 AM, Linus Walleij
>> <linus.walleij@linaro.org> wrote:
>>> The UserMode (UM) Linux build was failing in gpiolib-of as it requires
>>> ioremap()/iounmap() to exist, which is absent from UM. The non-existence
>>> of IO memory is negatively defined as CONFIG_NO_IOMEM so put a reverse
>>> dependency on !NO_IOMEM for OF_GPIO to fix the build.
>>>
>>> Cc: stable@vger.kernel.org
>>> Reported-by: kbuild test robot <fengguang.wu@intel.com>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>> ---
>>>  drivers/gpio/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index 98dd47a30fc7..a6026f2fe7f5 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -50,6 +50,7 @@ config GPIO_DEVRES
>>>  config OF_GPIO
>>>         def_bool y
>>>         depends on OF
>>> +       depends on !NO_IOMEM
>>
>> depends on HAS_IOMEM?
>
> Apparently not, and that is the scary thing.
>
> HAS_IOMEM depends on !NO_IOMEM indeed but
> it also selects GENERIC_IO, and AFAICT there are
> some configs out there in the intersection between,
> that have IOMEM but are not using GENERIC_IO,
> tell me if I'm wrong :/

lib/Kconfig:

    config HAS_IOMEM
            bool
            depends on !NO_IOMEM
            select GENERIC_IO
            default y

Hence if NO_IOMEM is not set, HAS_IOMEM and GENERIC_IO are always set.

UML selects GENERIC_IO, but not HAS_IOMEM (it sets NO_IOMEM).

Perhaps you're confusing GENERIC_IO with GENERIC_IOMAP?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
