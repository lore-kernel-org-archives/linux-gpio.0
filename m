From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 2/2] ARM64: dts: amlogic: meson-gxl: add the missing PWM pins
Date: Thu, 23 Mar 2017 12:09:53 -0700
Message-ID: <m21stnn726.fsf@baylibre.com>
References: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
        <20170318122736.11592-1-martin.blumenstingl@googlemail.com>
        <20170318122736.11592-3-martin.blumenstingl@googlemail.com>
        <CACRpkdZSJc8a5jqK0gAuRgogQfiLsSXocR4RKsogqnWgNnVsjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:35066 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751235AbdCWTJ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 15:09:56 -0400
Received: by mail-pg0-f47.google.com with SMTP id t143so62534434pgb.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 12:09:56 -0700 (PDT)
In-Reply-To: <CACRpkdZSJc8a5jqK0gAuRgogQfiLsSXocR4RKsogqnWgNnVsjQ@mail.gmail.com>
        (Linus Walleij's message of "Thu, 23 Mar 2017 09:47:23 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Carlo Caione <carlo@caione.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sat, Mar 18, 2017 at 1:27 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
>> This adds the new DT nodes for the missing PWM pins in the EE and AO
>> domain.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Pls take this through ARM SoC.

Applied to amlogic v4.12/dt64 branch, to be sent via arm-soc.

Thanks,

Kevin
