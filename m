From: Markus Mayer <markus.mayer@linaro.org>
Subject: Re: [PATCH v2] gpio: bcm281xx: Fix return value of bcm_kona_gpio_get()
Date: Mon, 18 Nov 2013 15:56:11 -0800
Message-ID: <CAPdLdq=30GbOGV6MutFNzE8LQkeoSYpVqd=6t4XeQpU89SuwKg@mail.gmail.com>
References: <1383941945-27569-1-git-send-email-markus.mayer@linaro.org>
	<CACRpkdaY0pJiy29BeXK3rdEesopLPF6P3MpdKAXybEpWF6=Ewg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:39398 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606Ab3KRX4M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 18:56:12 -0500
Received: by mail-wg0-f49.google.com with SMTP id x13so6814663wgg.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 15:56:11 -0800 (PST)
In-Reply-To: <CACRpkdaY0pJiy29BeXK3rdEesopLPF6P3MpdKAXybEpWF6=Ewg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>

On 18 November 2013 01:55, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 8, 2013 at 9:19 PM, Markus Mayer <markus.mayer@linaro.org> wrote:
>
>> We need to return the corresponding bit for a particular GPIO. This bit
>> contains shift not mask.
>>
>> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
>> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
>> Reviewed-by: Matt Porter <matt.porter@linaro.org>
>
> OK...
>
>>         /* return the specified bit status */
>> -       return !!(val & bit);
>> +       return (val >> bit) & 1;
>
> What about doing it like this instead:
>
> return !!(val & BIT(bit));

I'll have to run that change through some tests to ensure everything
is working as intended.

Regards,
-Markus

-- 
Markus Mayer
Broadcom Landing Team
