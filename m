From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: pinctrl-sx150x.c broken in 4.11
Date: Thu, 11 May 2017 19:57:49 +0300
Message-ID: <7f79af49-2aae-2bd2-4b85-e65220cb27e8@cogentembedded.com>
References: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
 <CACRpkdaVpOw+PbocW+wwy5kDp8Ud=Xow_+gnAhJ+eFWTLob7LQ@mail.gmail.com>
 <20170511151647.GT3489@atomide.com>
 <252b379a-d3fe-8020-5209-f1de43004b08@cogentembedded.com>
 <20170511163615.GU3489@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34166 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755509AbdEKQ5x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 12:57:53 -0400
Received: by mail-wm0-f52.google.com with SMTP id u65so4522438wmu.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 09:57:52 -0700 (PDT)
In-Reply-To: <20170511163615.GU3489@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

>>> Hmm maybe yeah. I don't quite follow the above the "pinctrl-0 property
>>> of sx150x device tree node, is misinterpreted as hog" part though.
>>
>> sx150x is i2c-gpio device.  It has 16 GPIO lines that are communicated
>> with via i2c bus, and an interrupt line.
>>
>> Interrupt line is typically connected to SoC's pin.
>> This pin has to be configured.
>> This is done by providing appropriate subnode in SoC's pinmux node, with
>> information with pin configuration, and pinctrl-0 property in sx150x's
>> node with phandle to that subnode:
>>
>> ...
>> &i2c0 {
>> 	sx1503@20 {
>> 		compatible = "semtech,sx1503q";
>> 		pinctrl-names = "default";
>> 		pinctrl-0 = <&pinctrl_sx1503_20>;
>> 		...
>> 	};
>> };
>> ...
>> &iomuxc {
>> 	pinctrl_sx1503_20: pinctrl-sx1503-20 {
>> 		fsl,pins = <
>> 			VF610_PAD_PTB1__GPIO_23         0x219d
>> 		>;
>> 	};
>> };
>>
>> This pin configuration is handled by driver core, i.e. before probe()
>> for sx150x is called, core applies pin configuration.
>>
>> However sx150x driver is currently implemented as a pinctrl driver.
>>
>> When it initializes, pinctrl searches for "hog", i.e. pin config that
>> should be applied at driver registration time.
>>
>> While doing so, core searches for any registered pinctrl_map for device
>> being register. Search loop is in create_pinctrl().
>>
>> In this case, this loop finds map that is defined above.
>>
>> This is *not* hog.  This is pin setting already applied in SoC's pinmux
>> controller for sx1503 device.
>>
>> However code in create_pinctrl() tries to apply it, and use sx1503's
>> methods to do so. Which is plain wrong and errors out.
> 
> Maybe create_pinctrl() could check if the pin controller device
> for a potential hog points to the device itself and bail out
> if that's not the case?

Well that's exactly what patch from my first mail in this thread does.
This indeed fixes my case, but I don't know if it is correct in generic
case.

Should I submit it? Do you ack?

Nikita
