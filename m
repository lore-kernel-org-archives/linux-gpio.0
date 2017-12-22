From: Andrew Cooks <andrew.cooks@opengear.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Fri, 22 Dec 2017 11:05:58 +1000
Message-ID: <5dacc682-bc50-b6d1-5a38-e9d571b351c0@opengear.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
 <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
 <CAOdcoTnpiWkPu4_eOJ6bzUE58PqRHw-y5yHY2T8M3Ymp_2v0MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-dm3nam03on0044.outbound.protection.outlook.com ([104.47.41.44]:42048
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752385AbdLVBG2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 20:06:28 -0500
In-Reply-To: <CAOdcoTnpiWkPu4_eOJ6bzUE58PqRHw-y5yHY2T8M3Ymp_2v0MQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tobias Diedrich <tobiasdiedrich@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, Timur Tabi <timur@codeaurora.org>

Hi Tobias

On 21/12/17 23:06, Tobias Diedrich wrote:

> 
>     > Another driver (gpio-sb8xx) was submitted for upstream inclusion, but was
>     > knocked back with the suggestion that pinctrl is the way forward[3].
> 
>     Hm I cannot follow link [3] right now. And I don't remember the submission :(
>     It doesn't seem to be in my mail archives either.
> 
> 
> FWIW I wrote the gpio-sb8xx driver mostly to allow toggling the (board-specific) APU1 leds and didn't have time to rewrite it for the pinctrl api (also it was more of a "would be neat to have", so I didn't push it much).
> It would actually be neat to have ACPI support for arbitrary leds in some better way (toggling the pinctrl bits could easily be implemented in ACPI if there was some method called to enabled/disable the led).> 
> The coreboot bits were submitted:
> https://github.com/coreboot/coreboot/blob/master/src/mainboard/pcengines/apu1/acpi/leds.asl
> https://github.com/coreboot/coreboot/blob/master/src/mainboard/pcengines/apu1/acpi/gpio.asl
> The latter is specifically asking for "gpio-sb8xx" (or compatible) (this is essentially an ACPI-provided devicetree snippet).

Our ACPI LED support is on a I2C GPIO expander, but looks similar. I'll submit that to coreboot after the holidays. We use the SoC gpios for buttons and other peripherals.

a.
