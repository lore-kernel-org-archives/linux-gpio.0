From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/23] cris: do away with ARCH_REQUIRE_GPIOLIB
Date: Tue, 26 Apr 2016 14:04:54 +0200
Message-ID: <CACRpkdbkJ64fQadB-zyQMkNzgxMKhjguBc8cTYS-zt0NfiAsCw@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-8-git-send-email-linus.walleij@linaro.org>
	<20160421140541.GQ2555@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36266 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751953AbcDZMEz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 08:04:55 -0400
Received: by mail-oi0-f52.google.com with SMTP id x201so12147681oif.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 05:04:55 -0700 (PDT)
In-Reply-To: <20160421140541.GQ2555@axis.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, linux-cris-kernel <linux-cris-kernel@axis.com>

On Thu, Apr 21, 2016 at 4:05 PM, Jesper Nilsson <jesper.nilsson@axis.co=
m> wrote:
> On Wed, Apr 20, 2016 at 10:58:05AM +0200, Linus Walleij wrote:
>> Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
>> as this can now be selected directly.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: Mikael Starvik <starvik@axis.com>
>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

Patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
