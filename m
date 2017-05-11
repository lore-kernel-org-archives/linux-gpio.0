From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: pinctrl-sx150x.c broken in 4.11
Date: Thu, 11 May 2017 22:11:05 +0300
Message-ID: <8e203964-064c-260d-71eb-b430df365a08@cogentembedded.com>
References: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
 <CACRpkdaVpOw+PbocW+wwy5kDp8Ud=Xow_+gnAhJ+eFWTLob7LQ@mail.gmail.com>
 <20170511151647.GT3489@atomide.com>
 <252b379a-d3fe-8020-5209-f1de43004b08@cogentembedded.com>
 <20170511163615.GU3489@atomide.com>
 <7f79af49-2aae-2bd2-4b85-e65220cb27e8@cogentembedded.com>
 <20170511175106.GV3489@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35754 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932811AbdEKTLJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 15:11:09 -0400
Received: by mail-wm0-f54.google.com with SMTP id b84so52500812wmh.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 12:11:08 -0700 (PDT)
In-Reply-To: <20170511175106.GV3489@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

>>> Maybe create_pinctrl() could check if the pin controller device
>>> for a potential hog points to the device itself and bail out
>>> if that's not the case?
>>
>> Well that's exactly what patch from my first mail in this thread does.
>> This indeed fixes my case, but I don't know if it is correct in generic
>> case.
> 
> OK, yeah I just looked it up as I was not in cc.
> 
>> Should I submit it? Do you ack?
> 
> Yeah please submit a proper patch. I assume you already checked
> that this change only affects the pinctrl hogs only, not regular
> device pins? I'd assume so as it's in create_pinctrl()..

Regular device pins go via pinctrl_get() which calls create_pinctrl()
with second argument set to NULL.
