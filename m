From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v2] drivers/gpio/gpio-sch311x: check return value of gpiochip_remove()
Date: Sun, 06 Jul 2014 18:53:18 +0530
Message-ID: <53B94DC6.7070308@gmail.com>
References: <1404457379-4193-1-git-send-email-varkab@cdac.in> <CAAVeFuK8oQStjAozf_3e3YTWBx3JYzBxEvLUq6n6uke1qaxXvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:40209 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbaGFNXW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Jul 2014 09:23:22 -0400
In-Reply-To: <CAAVeFuK8oQStjAozf_3e3YTWBx3JYzBxEvLUq6n6uke1qaxXvg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Varka Bhadram <varkab@cdac.in>

Hi,

On Sunday 06 July 2014 02:52 PM, Alexandre Courbot wrote:
> On Fri, Jul 4, 2014 at 4:02 PM, Varka Bhadram <varkabhadram@gmail.com=
> wrote:
>> This patch eliminates the following warning
>>
>> drivers/gpio/gpio-sch311x.c: In function =E2=80=98sch311x_gpio_probe=
=E2=80=99:
>> drivers/gpio/gpio-sch311x.c:286:18: warning: ignoring return value o=
f =E2=80=98gpiochip_remove=E2=80=99, declared with attribute warn_unuse=
d_result
> gpiochip_remove() is to have its return value set to void in another
> patch, so I'm not sure we need this one in the meantime?

I also saw that patch from abdoulaye berthe<berthe.ab@gmail.com>  .

If that is accepted its good. If not this may require.

--=20
Regards,
Varka Bhadram

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
