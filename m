From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 01/14] pinctrl-sx150x: Rely on of_modalias_node for OF matching
Date: Fri, 4 Nov 2016 13:09:00 -0700
Message-ID: <CAHQ1cqHvUEoriKu19G1Omjm=k8Enfi6ZxYAs2TcDqgHjHSmuyQ@mail.gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
 <1478015868-10309-2-git-send-email-andrew.smirnov@gmail.com> <CACRpkdaNRSM0JR7FJOBOstjaZXbMAV+xzNyT=UevNzVVwOO30A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaNRSM0JR7FJOBOstjaZXbMAV+xzNyT=UevNzVVwOO30A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 4, 2016 at 5:28 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 1, 2016 at 4:57 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
>> None of the OF match table entries contain any compatiblity strings that
>> could not be matched against using i2c_device_id table above and
>> of_modalias_node. Besides that entries in OF match table do not cary
>> proper device variant information which is need by the drive. Those two
>> facts combined, IMHO, make a compelling case for removal of that code
>> altogether.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> (...)
>> -static const struct of_device_id sx150x_of_match[] = {
>> -       { .compatible = "semtech,sx1508q" },
>> -       { .compatible = "semtech,sx1509q" },
>> -       { .compatible = "semtech,sx1506q" },
>> -       { .compatible = "semtech,sx1502q" },
>> -       {},
>> -};
>
> I'm a bit hesitant about this since we should ideally first match on the
> compatible string for any device. We have tried to alleviate the situation
> in I2C devices but it has been a bit so-so.
>

Ah, good to know. Let's do it that way then.

> It would be best if we make a separate patch after this tjat adds it
> back, set the variant data also in the .data of the match and
> use of_device_get_match_data().

Do you prefer it as a separate patch, or, instead, should I change
this patch of the series to do what you describe? I'd be happy to do
either and it seems like it would be a trivial change so it should
invalidate any of the testing done by Neil.

Thanks,
Andrey
