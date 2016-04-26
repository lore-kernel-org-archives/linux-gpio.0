From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/23] m68k: do away with ARCH_REQUIRE_GPIOLIB
Date: Tue, 26 Apr 2016 14:02:11 +0200
Message-ID: <CACRpkdZKrvUtcLWZ6v4oRbaVw5awQYqx_fHVYQ-BUhbxiK56_A@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-10-git-send-email-linus.walleij@linaro.org>
	<5718290D.7030705@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34695 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751760AbcDZMCM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 08:02:12 -0400
Received: by mail-oi0-f54.google.com with SMTP id k142so12132042oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 05:02:12 -0700 (PDT)
In-Reply-To: <5718290D.7030705@westnet.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>

On Thu, Apr 21, 2016 at 3:12 AM, Greg Ungerer
<gregungerer@westnet.com.au> wrote:
> On 20/04/16 18:58, Linus Walleij wrote:
>> Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
>> as this can now be selected directly.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: linux-m68k@lists.linux-m68k.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Since this affects ColdFire I am happy to give an ack:
>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Patch applied to the GPIO tree with your ACK. That
should be enough I think.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
