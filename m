From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Thu, 17 Dec 2015 15:49:30 +0200
Message-ID: <5672BD6A.5020209@mentor.com>
References: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org> <CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:39151 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755448AbbLQNvD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 08:51:03 -0500
In-Reply-To: <CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 11.12.2015 23:47, Fabio Estevam wrote:
> Hi Linus,
> 
> On Fri, Dec 11, 2015 at 7:36 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> The bgpio_get_set() call should return a value clamped to [0,1],
>> the current code will return a negative value if reading
>> bit 31, which turns the value negative as this is a signed value
>> and thus gets interpreted as an error by the gpiolib core.
>> Found on the gpio-mxc but applies to any MMIO driver.
>>
>> Fixes: b19e7f51a55f "gpio: gpio-generic: add flag to read out output value from reg_set"
> 
> This commit appeared in 4.2, so it would be nice to add a stable tag:
> 
> Cc: <stable@vger.kernel.org> # 4.2+

As it was discussed yesterday in another thread, the specified commit is
correct, and v4.2 works good.

The problem is in commit e20538b82f1f ("gpio: Propagate errors from
chip->get()"), which is present in v4.3.

So, Fixes: tag should be removed or corrected IMHO.

--
With best wishes,
Vladimir
