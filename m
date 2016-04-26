From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/23] avr32: do away with ARCH_REQUIRE_GPIOLIB
Date: Tue, 26 Apr 2016 13:38:03 +0200
Message-ID: <CACRpkdYv+nt_-onhFqFPxgX1MYkGNO0ZUp1PEUN4hdfYJF=hiA@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-6-git-send-email-linus.walleij@linaro.org>
	<20160420090931.GA21027@samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35856 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752553AbcDZLiF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 07:38:05 -0400
Received: by mail-ob0-f177.google.com with SMTP id j9so5323602obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 04:38:04 -0700 (PDT)
In-Reply-To: <20160420090931.GA21027@samfundet.no>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, Haavard Skinnemoen <hskinnemoen@gmail.com>

On Wed, Apr 20, 2016 at 11:09 AM, Hans-Christian Noren Egtvedt
<egtvedt@samfundet.no> wrote:
> Around Wed 20 Apr 2016 10:58:03 +0200 or thereabout, Linus Walleij wr=
ote:
>> Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
>> as this can now be selected directly.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
>> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

Applied to the GPIO tree for v4.7 with your ACK, thanks!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
