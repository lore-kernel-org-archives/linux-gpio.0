From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 29/54] pinctrl: ssbi-gpio: Be sure to clamp return value
Date: Tue, 5 Jan 2016 10:22:00 +0100
Message-ID: <CACRpkdaCs2LVDtGnhor3BCFh+MBBkaWwS6pWLhpSgd7bxW_OWA@mail.gmail.com>
References: <1450794674-23958-1-git-send-email-linus.walleij@linaro.org>
	<20151228035949.GE16437@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36447 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452AbcAEJWC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 04:22:02 -0500
Received: by mail-ob0-f176.google.com with SMTP id ba1so269360852obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 01:22:02 -0800 (PST)
In-Reply-To: <20151228035949.GE16437@tuxbot>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Bj?rn Andersson <bjorn.andersson@sonymobile.com>

On Mon, Dec 28, 2015 at 4:59 AM, Bjorn Andersson <bjorn@kryo.se> wrote:
> On Tue 22 Dec 06:31 PST 2015, Linus Walleij wrote:
>
>> As we want gpio_chip .get() calls to be able to return negative
>> error codes and propagate to drivers, we need to go over all
>> drivers and make sure their return values are clamped to [0,1].
>> We do this by using the ret =3D !!(val) design pattern.
>>
>> Also, this code was double-inverting a bool. That makes no
>> sense whatsoever, so I removed the double-invert.
>>
>> Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

>> -                     ret =3D !!state;
>> +                     ret =3D state;
>>       }
>>
>> -     return ret;
>> +     return !!ret;
>
> But these you should keep as is; before your change ret is either
> negative errno or !!state, after your change errno is merged with the
> "high case".
>
> So either just drop this patch, or add the !! to the output_value and=
 my
> Reviewed-by if you want consistency.
>
> This is actually the code path that started the discussion :)

Grrr my bad, I will make a separate patch fixing up this as I
have already merged this and other stuff on top.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
