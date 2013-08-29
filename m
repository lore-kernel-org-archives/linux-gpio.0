From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: (gpio-pca953x) move header to linux/platform_data/
Date: Thu, 29 Aug 2013 20:46:04 +0200
Message-ID: <CACRpkdaK4XBPejAC6EezhTi_CkWZpj4A9+FzAhzSDib9dhJJNw@mail.gmail.com>
References: <ADE657CA350FB648AAC2C43247A983F0021DAC7DA184@AUSP01VMBX24.collaborationhost.net>
	<1859873512.636800.1377798778897.JavaMail.root@mail>
	<20130829180040.GI18542@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:39034 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755515Ab3H2SqE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 14:46:04 -0400
Received: by mail-oa0-f48.google.com with SMTP id o17so1101822oag.7
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2013 11:46:04 -0700 (PDT)
In-Reply-To: <20130829180040.GI18542@quad.lixom.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "arm@kernel.org" <arm@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel@savoirfairelinux.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, H Hartley Sweeten <hartleys@visionengravers.com>

On Thu, Aug 29, 2013 at 8:00 PM, Olof Johansson <olof@lixom.net> wrote:
> On Thu, Aug 29, 2013 at 01:52:58PM -0400, Vivien Didelot wrote:
>> As this patch mainly touches arch/arm/*, Olof/Kevin, would you mind
>> applying it?
>>
>> The first message in thread is here: https://lkml.org/lkml/2013/7/31/552
>> Here are the previous ACKs:
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
>
> Looks like i2c or gpio maintainers should be taking it, but since Linus acked
> it instead of applied it, I guess we can take it. :)
>
> I'll apply it to next/cleanup for 3.12 if you resend me the patch with the
> acks. Thanks!

Thanks a lot Olof, I worried about all the hunks hitting the arch/arm/*
hierarchy, and not much is happening in drivers/gpio this cycle
so think it is better off in ARM SoC.

Yours,
Linus Walleij
