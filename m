From: Markus Mayer <mmayer@broadcom.com>
Subject: Re: [PATCH] gpio: only enable kona driver on BCM_MOBILE or for compile
 testing
Date: Thu, 27 Feb 2014 14:11:20 -0800
Message-ID: <530FB808.5050802@broadcom.com>
References: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de> <CACRpkdZg5uoP5LurL5vOPCaKQu2B=neybuo=gwM_JT7UAhRkjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:15745 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752461AbaB0WLW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Feb 2014 17:11:22 -0500
In-Reply-To: <CACRpkdZg5uoP5LurL5vOPCaKQu2B=neybuo=gwM_JT7UAhRkjg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?ISO-8859-1?Q?Uwe_Kleine?= =?ISO-8859-1?Q?-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On 14-02-27 01:16 AM, Linus Walleij wrote:
> On Fri, Feb 21, 2014 at 2:42 PM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>
>> This change makes it easier to configure a kernel for a real machine=
 by
>> not showing the option to enable it at all if COMPILE_TEST is off.
>>
>> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>
> Markus: can you ACK this patch?

Acked-by: Markus Mayer <mmayer@broadcom.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
