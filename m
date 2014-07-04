From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: gpiolib: set gpiochip_remove retval to void
Date: Sat, 5 Jul 2014 00:55:58 +0200
Message-ID: <CACRpkdanHjyV_px8v-6VYhEk635N-vtakKrBu9cz_3TBKVV24w@mail.gmail.com>
References: <CAAVeFuLMLfa-1RhcdSrKDUz7=eLqZurBSFSsN7N0x-0S+_btJA@mail.gmail.com>
	<1401906155-10543-1-git-send-email-berthe.ab@gmail.com>
	<1401906155-10543-3-git-send-email-berthe.ab@gmail.com>
	<CAAVeFu+ZWy1He1CxTh+GmHtwow0P=vX_9u0P67-p_ntpqDQGtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:48441 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760224AbaGDWz7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jul 2014 18:55:59 -0400
Received: by mail-ob0-f171.google.com with SMTP id nu7so2338917obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2014 15:55:59 -0700 (PDT)
In-Reply-To: <CAAVeFu+ZWy1He1CxTh+GmHtwow0P=vX_9u0P67-p_ntpqDQGtg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: abdoulaye berthe <berthe.ab@gmail.com>, Michael Buesch <m@bues.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jun 8, 2014 at 2:12 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Thu, Jun 5, 2014 at 3:22 AM, abdoulaye berthe <berthe.ab@gmail.com> wrote:

>> This avoids handling gpiochip remove error in device
>> remove handler.
>>
(...)
>> Signed-off-by: abdoulaye berthe <berthe.ab@gmail.com>
>> -               list_del(&chip->list);
>> +               if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags))
>> +                       panic("gpio: removing gpiochip with gpios still requested\n");
>
> Really, really I don't think we should panic here.

Nope dev_crit() is the right thing, with a big fat warning message.

Yours,
Linus Walleij
