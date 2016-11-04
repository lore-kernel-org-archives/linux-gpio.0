From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/14] pinctrl-sx150x: Rely on of_modalias_node for OF matching
Date: Fri, 4 Nov 2016 22:29:47 +0100
Message-ID: <CACRpkdZCzOZo2r0=N1_MZ5WV7os3qL3YNS-VUAru+=Ni2fOh3A@mail.gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
 <1478015868-10309-2-git-send-email-andrew.smirnov@gmail.com>
 <CACRpkdaNRSM0JR7FJOBOstjaZXbMAV+xzNyT=UevNzVVwOO30A@mail.gmail.com> <CAHQ1cqHvUEoriKu19G1Omjm=k8Enfi6ZxYAs2TcDqgHjHSmuyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f172.google.com ([209.85.216.172]:34215 "EHLO
        mail-qt0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753131AbcKDV3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2016 17:29:48 -0400
Received: by mail-qt0-f172.google.com with SMTP id n6so56452210qtd.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2016 14:29:48 -0700 (PDT)
In-Reply-To: <CAHQ1cqHvUEoriKu19G1Omjm=k8Enfi6ZxYAs2TcDqgHjHSmuyQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Fri, Nov 4, 2016 at 9:09 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Fri, Nov 4, 2016 at 5:28 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Nov 1, 2016 at 4:57 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>>
>>> None of the OF match table entries contain any compatiblity strings that
>>> could not be matched against using i2c_device_id table above and
>>> of_modalias_node. Besides that entries in OF match table do not cary
>>> proper device variant information which is need by the drive. Those two
>>> facts combined, IMHO, make a compelling case for removal of that code
>>> altogether.
>>>
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> (...)
>>> -static const struct of_device_id sx150x_of_match[] = {
>>> -       { .compatible = "semtech,sx1508q" },
>>> -       { .compatible = "semtech,sx1509q" },
>>> -       { .compatible = "semtech,sx1506q" },
>>> -       { .compatible = "semtech,sx1502q" },
>>> -       {},
>>> -};
>>
>> I'm a bit hesitant about this since we should ideally first match on the
>> compatible string for any device. We have tried to alleviate the situation
>> in I2C devices but it has been a bit so-so.
>>
>
> Ah, good to know. Let's do it that way then.
>
>> It would be best if we make a separate patch after this tjat adds it
>> back, set the variant data also in the .data of the match and
>> use of_device_get_match_data().
>
> Do you prefer it as a separate patch, or, instead, should I change
> this patch of the series to do what you describe? I'd be happy to do
> either and it seems like it would be a trivial change so it should
> invalidate any of the testing done by Neil.

Yeah it would ideally be a modification of this patch.

Whatever is easiest for you to do!

BTW this is a great patch set and I'm very grateful for yours+Neils
combines contributions on getting this driver into shape.

Yours,
Linus Walleij
