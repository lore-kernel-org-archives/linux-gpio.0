From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 6/6] gpiolib: Add gpio name information to /sys/kernel/debug/gpio
Date: Mon, 17 Aug 2015 16:29:18 +0900
Message-ID: <CAAVeFuKSQP2DYWdhYy-k+cr9F0jc46Q-xuoWXSTguQYaf3SY+w@mail.gmail.com>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
 <1438680203-13432-7-git-send-email-mpa@pengutronix.de> <CACRpkdajd5B6qUa6mi_0m53eMtLenoAWUCnmq-mOC+EhXfzpTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:33656 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751331AbbHQH3i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 03:29:38 -0400
Received: by obbhe7 with SMTP id he7so105435558obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2015 00:29:38 -0700 (PDT)
In-Reply-To: <CACRpkdajd5B6qUa6mi_0m53eMtLenoAWUCnmq-mOC+EhXfzpTA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Mon, Aug 10, 2015 at 7:02 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
>
>> Add some information about gpio names to the debugfs gpio file. name and
>> label of a GPIO are then displayed next to each other. This way it is
>> easy to see what the real name of GPIO is and what the driver requested
>> it for.
>>
>> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>
> This patch looks correct in the context.

Looks correct indeed, but on a related note one might question the
need to have both a "name" and a "label" for a GPIO?
