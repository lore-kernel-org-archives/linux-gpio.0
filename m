From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 0/6] mcp23s08 pinconf support
Date: Thu, 11 May 2017 15:38:58 +0200
Message-ID: <CACRpkdYo3M2_f-36KiYcRCJEwDXj6Mqpf=qpovmK=rhgVzbp0w@mail.gmail.com>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
 <CACRpkdZVQJ+KvoKVzfMjGeaPMJ4MT+uf3HSr5JixBx5MgJ8xeQ@mail.gmail.com> <20170428084344.exegdfcfblbx3k5w@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38067 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755481AbdEKNjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 09:39:00 -0400
Received: by mail-it0-f52.google.com with SMTP id e65so19775614ita.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 06:39:00 -0700 (PDT)
In-Reply-To: <20170428084344.exegdfcfblbx3k5w@earth>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 28, 2017 at 10:43 AM, Sebastian Reichel
<sebastian.reichel@collabora.co.uk> wrote:
> On Fri, Apr 28, 2017 at 10:22:24AM +0200, Linus Walleij wrote:
>> On Thu, Apr 27, 2017 at 4:19 PM, Sebastian Reichel
>> <sebastian.reichel@collabora.co.uk> wrote:
>>
>> > Back in January I sent patches adding pinconf support
>> > for configuring mcp23s08's pull-ups. Apart from my
>> > custom Raspberry Pi setup the pull-up support is also
>> > needed by Toby Churchill SL50.
>> >
>> > Changes since PATCHv1:
>> >  * Add patch moving mcp23s08 from gpio/ to pinctrl/
>> >  * Add patches updating config references in arch/
>> >  * Add patch removing pdata support for pullup config
>>
>> I like this and I would like to queue it early in the v4.13
>> development cycle.
>
> Thanks.

I wanna queue this.

Can you resend this patch set based on Torvald's HEAD or v4.12-rc1
when that is out after the weekend and:

- Request explicit ACKs from blackfin and ARM maintainers.
  (The ARM people are at arm@kernel.org)

- Include the regmap conversion in the last two patches you
  sent.

Yours,
Linus Walleij
