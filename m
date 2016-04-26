From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 20/23] nios2: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Tue, 26 Apr 2016 14:03:33 +0200
Message-ID: <CACRpkdY0NqMAO8Eg_dd1gzismBhdztBpvQ=HR1CD6AdLF5nqhQ@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-21-git-send-email-linus.walleij@linaro.org>
	<1461224811.3003.2.camel@ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34125 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794AbcDZMDe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 08:03:34 -0400
Received: by mail-ob0-f182.google.com with SMTP id bg3so5630346obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 05:03:34 -0700 (PDT)
In-Reply-To: <1461224811.3003.2.camel@ubuntu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ley Foon Tan <lftan@altera.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, nios2-dev@lists.rocketboards.org

On Thu, Apr 21, 2016 at 9:46 AM, Ley Foon Tan <lftan@altera.com> wrote:
> On Wed, 2016-04-20 at 10:58 +0200, Linus Walleij wrote:
>> This symbols is not needed to get access to selecting the
>> GPIOLIB anymore: any arch can select GPIOLIB.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: Ley Foon Tan <lftan@altera.com>
>> Cc: nios2-dev@lists.rocketboards.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Various arch maintainers:
>>
>> either ACK this and I will merge it into the GPIO tree for v4.7
>> anticipating no clashes, or you wait until I have the enabling patch
>> upstream (patch 1 in this series, removing deps on
>> ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
>> merge it to your arch trees yourselves for late v4.7
>> (post GPIO tree merge) or for v4.8.
>>
>> You can also ask me for an immutable branch if you prefer that, I
>> will put the enabling patch on a branch and the patch for your arch
>> on top and ask you to pull it.
>>
>> Select your option from the menu, silence probably means I will
>> merge it to the GPIO tree. Unless you are X86 or ARM in which case
>> I will be cautious.
>> ---
> Please merge this via GPIO tree. Thanks.
>
> Acked-by: Ley Foon Tan <lftan@altera.com>

Patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
