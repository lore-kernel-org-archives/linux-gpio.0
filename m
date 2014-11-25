From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpio: remove const modifier from gpiod_get_direction()
Date: Tue, 25 Nov 2014 17:09:03 +0900
Message-ID: <5474391F.6030908@nvidia.com>
References: <1416900045-2304-1-git-send-email-acourbot@nvidia.com> <20141125080122.GY4431@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5019 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304AbaKYIJd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Nov 2014 03:09:33 -0500
In-Reply-To: <20141125080122.GY4431@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com

On 11/25/2014 05:01 PM, Uwe Kleine-K=F6nig wrote:
> Hello Alexandre,
>
> just some minor nitpicking on the commit log:
>
> On Tue, Nov 25, 2014 at 04:20:45PM +0900, Alexandre Courbot wrote:
>> Although gpiod_get_direction() can be considered side-effect free fo=
r
>> consumers, its internals involve setting or clearing bits in the
>> affected GPIO descriptor, for which we need to force-cast the const
>> descriptor parameter. This could lead to incorrect behavior is the
> s/ is/ if/, and I think s/parameter/variable to non-const/
>
>> compiler decide to optimize here, so remove this const parameter. Th=
e
> s/decide/decides/; s/parameter/attribute/
>
>> intent is to make gpiod_get_direction() private anyway, so it does n=
ot
>> really matter.
>>
>> Reported-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks ; I should have proof-read myself...

Sending a v2 with a fixed log and your Ack so Linus can just pick the=20
patch as-is.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
