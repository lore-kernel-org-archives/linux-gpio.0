From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: handle suspend to ram
Date: Fri, 7 Apr 2017 14:34:03 +0200
Message-ID: <CACRpkdZ=7e71XR++RWY8j5Lqb_UF6oMZzibCRo=76b8YPvcPiw@mail.gmail.com>
References: <20170406133623.19160-1-alexandre.belloni@free-electrons.com>
 <CACRpkdYFPhewV4NLNxxVkXCwuyoo3rgeLt0auErS47R=055FHQ@mail.gmail.com> <20170407104846.5ghrcqc2ws4dkqxt@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:33731 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754416AbdDGMeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 08:34:05 -0400
Received: by mail-io0-f177.google.com with SMTP id t68so14718231iof.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 05:34:05 -0700 (PDT)
In-Reply-To: <20170407104846.5ghrcqc2ws4dkqxt@piout.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 7, 2017 at 12:48 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 07/04/2017 at 12:16:22 +0200, Linus Walleij wrote:
>> On Thu, Apr 6, 2017 at 3:36 PM, Alexandre Belloni
>> <alexandre.belloni@free-electrons.com> wrote:
>>
>> > When suspending to RAM, the power to the core is cut and the register
>> > values are lost. Save and restore more registers than just IMR.
>> >
>> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>
>> Should this be tagged for stable?
>>
>
> No because that particular suspend to ram mode is not yet implemented
> upstream.
>
>> Waiting for input from the AT91 maintainers here.
>>
>
> Well, I've been an AT91 maintainer for 2 years now and I have done all
> the AT91 pull requests since 3.16. I hope this qualifies me here.

So much for trying to keep MAINTAINERS in my head :(

I wish there was gmail integration so I could annotate people
with roles...

Patch applied.

Yours,
Linus Walleij
