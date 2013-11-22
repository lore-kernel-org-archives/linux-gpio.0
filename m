From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 0/9] ARM: sa1100: Rework IRQ handling
Date: Fri, 22 Nov 2013 21:33:32 +0400
Message-ID: <528F956C.5040107@gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com> <CACRpkdZU3_EqhBjV68+okJwh7QONuxWVjKkrUO4PkwJhKrP+mQ@mail.gmail.com> <528B811A.1030501@gmail.com> <CACRpkdbgn22xDX4nJZSDSE9-h+u1j5DQt=8arO7oS-UCBdBMUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:58594 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753339Ab3KVRdj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2013 12:33:39 -0500
Received: by mail-wg0-f53.google.com with SMTP id b13so1468565wgh.20
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2013 09:33:38 -0800 (PST)
In-Reply-To: <CACRpkdbgn22xDX4nJZSDSE9-h+u1j5DQt=8arO7oS-UCBdBMUQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Dmitry Artamonow <mad_soft@inbox.ru>

On 11/20/2013 12:24 AM, Linus Walleij wrote:
> On Tue, Nov 19, 2013 at 4:17 PM, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> On 11/19/2013 05:00 PM, Linus Walleij wrote:
>
>>> And that happens before the GPIO driver gets registered -> crash.
>>
>> That is not the issue. The real issue is h3xxx using those gpio's without
>> previously calling gpio_request.
>
> Really? But that wasn't done before this patch either.
>
> It is basically OK to use the gpio_* functions before or
> without requesting the GPIOs, it won't look nice but it
> works.
>
>> Unfortunately sa1100 driver doesn't have a
>> good place to request gpios. When faced this problem during locomo
>> refactoring, I ended up with the following piece of code:
> (...)
>> Russell, Linus, what do you think about the previous solution?
>
> That looks OK but is that really the problem?

I have reworked h3xxx GPIO handling to (hopefully) not to cause the 
problem. I have sent the patches yesterday.

Linus, Could you please check if both series work (and make sense to you)?

-- 
With best wishes
Dmitry
