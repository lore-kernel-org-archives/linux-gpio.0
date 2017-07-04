From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpiolib: skip unwanted events, don't convert them to
 opposite edge
Date: Tue, 4 Jul 2017 16:27:08 +0200
Message-ID: <CAMRc=MccOquh9ovQTLB-F2GiQND3EQXmcKDEqh26o+RY470UZw@mail.gmail.com>
References: <1499073123-13393-1-git-send-email-brgl@bgdev.pl> <CAHp75Vddwkxgj6uLc9GSqqAF0PQCzX9a2QyyBhE7GviVBJH8jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:36828 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752135AbdGDO1J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2017 10:27:09 -0400
Received: by mail-qk0-f175.google.com with SMTP id p21so169712211qke.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jul 2017 07:27:09 -0700 (PDT)
In-Reply-To: <CAHp75Vddwkxgj6uLc9GSqqAF0PQCzX9a2QyyBhE7GviVBJH8jQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-07-03 13:07 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Mon, Jul 3, 2017 at 12:12 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> The previous fix for filtering out of unwatched events was not entirely
>> correct. Instead of skipping the events we don't want, they are now
>> interpreted as events with opposing edge.
>>
>> In order to fix it: always read the GPIO line value on interrupt and
>> only emit the event if it corresponds with the event type we requested.
>
>>         struct lineevent_state *le = p;
>>         struct gpioevent_data ge;
>> -       int ret;
>> +       int ret, level;
>
> I prefer
> int level;
> int ret;
>
> Though it's matter of taste (I don't remember which one Linus' preferable).
>
> --
> With Best Regards,
> Andy Shevchenko

Hard to tell, the file uses both styles.

Thanks,
Bartosz
