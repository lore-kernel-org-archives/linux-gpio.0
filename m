From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 1/3] pinctrl: sx150x: use correct registers for reg_sense
 (sx1502 and sx1508)
Date: Fri, 2 Dec 2016 09:56:21 +0100
Message-ID: <032a7c70-38b1-c147-4f13-ddb71971ae80@axentia.se>
References: <1480020320-28354-1-git-send-email-peda@axentia.se>
 <1480020320-28354-2-git-send-email-peda@axentia.se>
 <CACRpkdb2pJTfL+bmGT9OW84kJaJFF5F=qdHz9vKgG4Y4Mq2KUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0108.outbound.protection.outlook.com ([104.47.2.108]:50489
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757445AbcLBKbQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Dec 2016 05:31:16 -0500
In-Reply-To: <CACRpkdb2pJTfL+bmGT9OW84kJaJFF5F=qdHz9vKgG4Y4Mq2KUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 2016-11-25 14:40, Linus Walleij wrote:
> On Thu, Nov 24, 2016 at 9:45 PM, Peter Rosin <peda@axentia.se> wrote:
> 
>> All other registers on these chips are 8-bit, but reg_sense is 16-bits
>> and therefore needs to be moved down one notch.
>> This was apparently overlooked in the conversion to regmap, which only
>> updated the register locations for the 16-bit chips.
>>
>> Fixes: 6489677f86c3 ("pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API")
>> Signed-off-by: Peter Rosin <peda@axentia.se>
> 
> Patch applied.

Hi!

I'm just dubble-checking that the intention is to get this patch all
the way upstream in time for v4.10-rc1? Because right now there is a
regression regarding irq handling on sx1502/sx1508 in linux-next.

I see the patch in your devel branch, but it's not yet in the for-next
branch, which happened pretty quickly for my other pair of patches for
the sx150x driver. So, I worry that there might have been some for-next
deadline?

No rush, it's only been a week, I'm just asking...

Cheers,
Peter

