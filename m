From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: bcm281xx: Fix return value of bcm_kona_gpio_get()
Date: Tue, 19 Nov 2013 10:44:50 +0100
Message-ID: <CACRpkdaOpJcazQMqa6nosN1sC0hAMoavRtHemYsP547RpHo=uw@mail.gmail.com>
References: <1383941945-27569-1-git-send-email-markus.mayer@linaro.org>
	<CACRpkdaY0pJiy29BeXK3rdEesopLPF6P3MpdKAXybEpWF6=Ewg@mail.gmail.com>
	<CAPdLdq=30GbOGV6MutFNzE8LQkeoSYpVqd=6t4XeQpU89SuwKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:36335 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380Ab3KSJou (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:44:50 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp18so3627816obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 01:44:50 -0800 (PST)
In-Reply-To: <CAPdLdq=30GbOGV6MutFNzE8LQkeoSYpVqd=6t4XeQpU89SuwKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>

On Tue, Nov 19, 2013 at 12:56 AM, Markus Mayer <markus.mayer@linaro.org> wrote:
> On 18 November 2013 01:55, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Nov 8, 2013 at 9:19 PM, Markus Mayer <markus.mayer@linaro.org> wrote:
>>
>>> We need to return the corresponding bit for a particular GPIO. This bit
>>> contains shift not mask.
>>>
>>> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
>>> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
>>> Reviewed-by: Matt Porter <matt.porter@linaro.org>
>>
>> OK...
>>
>>>         /* return the specified bit status */
>>> -       return !!(val & bit);
>>> +       return (val >> bit) & 1;
>>
>> What about doing it like this instead:
>>
>> return !!(val & BIT(bit));
>
> I'll have to run that change through some tests to ensure everything
> is working as intended.

OK please do, because that style is used elsewhere in the driver
so I'd like to keep it consistent.

Yours,
Linus Walleij
