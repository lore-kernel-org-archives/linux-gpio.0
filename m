From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix filtering out unwanted events
Date: Thu, 29 Jun 2017 15:16:19 +0200
Message-ID: <CACRpkdZd=rGQy8kGEjS8pEAJ+xYpBn=JmGXDpSf3qF_P2aa6TA@mail.gmail.com>
References: <1498218316-27860-1-git-send-email-brgl@bgdev.pl>
 <1498218316-27860-2-git-send-email-brgl@bgdev.pl> <CACRpkda0WViPpULRAZCcBzCfCuum0GHkyWnWonS8A+LZvP+xXQ@mail.gmail.com>
 <CAMRc=MdYomHx1UKM4PrTAdkkz1KG3ifx=CmF6S+Nq4L3NRNoAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:36377 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752684AbdF2NQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 09:16:21 -0400
Received: by mail-io0-f171.google.com with SMTP id z62so6646272ioi.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 06:16:21 -0700 (PDT)
In-Reply-To: <CAMRc=MdYomHx1UKM4PrTAdkkz1KG3ifx=CmF6S+Nq4L3NRNoAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 29, 2017 at 1:03 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2017-06-29 11:33 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Fri, Jun 23, 2017 at 1:45 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>>> GPIOEVENT_REQUEST_BOTH_EDGES is not a single flag, but a binary OR of
>>> GPIOEVENT_REQUEST_RISING_EDGE and GPIOEVENT_REQUEST_FALLING_EDGE.
>>>
>>> The expression 'le->eflags & GPIOEVENT_REQUEST_BOTH_EDGES' we'll get
>>> evaluated to true even if only one event type was requested.
>>>
>>> Fix it by checking both RISING & FALLING flags explicitly.
>>>
>>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>>
>> Patch applied for fixes.
>>
>> Yours,
>> Linus Walleij
>
> Thanks. I think this should also go to linux-stable (e.g. 4.9 LTS is
> affected). Will you forward it or should I do it myself?

I have added the stable tag so it should JustWork(TM).

Yours,
Linus Walleij
