From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/23] arc: select GPIOLIB directly
Date: Tue, 26 Apr 2016 14:09:14 +0200
Message-ID: <CACRpkdYABvUtAjjzokNStDEaN=vViF5X7b_bhGsmgNFb9K62gQ@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
	<5719B3A0.4060001@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35193 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750AbcDZMJP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 08:09:15 -0400
Received: by mail-ob0-f175.google.com with SMTP id n10so5022604obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 05:09:15 -0700 (PDT)
In-Reply-To: <5719B3A0.4060001@synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, linux-snps-arc@lists.infradead.org

On Fri, Apr 22, 2016 at 7:16 AM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On Wednesday 20 April 2016 02:28 PM, Linus Walleij wrote:
>> Instead of indirectly selecting GPIOLIB via the
>> ARCH_REQUIRE_GPIOLIB symbol, just select GPIOLIB.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: Vineet Gupta <vgupta@synopsys.com>
>> Cc: linux-snps-arc@lists.infradead.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Various arch maintainers:
>
> It would be nice to get the cover latter as well to get more context.=
 The whole
> series didn't seem to be CCed to lkml either.

Sorry for that.

> Anyhow I found some reference on
> linux-gpio patchworks and seems like a nice cleanup.
>
> So for arch/arc/*
>
> Acked-by: Vineet Gupta <vgupt@synopsys.com>

Thanks, patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
