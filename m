From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Merge A31s pinctrl driver with A31
Date: Mon, 6 Feb 2017 11:07:33 +0100
Message-ID: <CACRpkdZUOszrqbPq4Ak+pUeYQB2qBnSrE2qWMkoNzvw+E74maw@mail.gmail.com>
References: <20170201162547.24232-1-wens@csie.org> <20170202081332.okjxo4ogm2kp3abh@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:34596 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbdBFKHf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 05:07:35 -0500
Received: by mail-io0-f175.google.com with SMTP id l66so61938623ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 02:07:34 -0800 (PST)
In-Reply-To: <20170202081332.okjxo4ogm2kp3abh@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 2, 2017 at 9:13 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Thu, Feb 02, 2017 at 12:25:45AM +0800, Chen-Yu Tsai wrote:
>> Hi everyone,
>>
>> This series merges support for the A31s' pin controller into the A31
>> driver, using the new sunxi variants support code. The A31s is a trimmed
>> down version of the A31, with some hardware blocks removed, and some
>> pin functions or pins removed. Thus it is easy to support the A31s
>> using the A31 driver by marking the extra pins/functions as A31 only.
>>
>> Patch 1 does exactly this.
>>
>> Patch 2 removes the original A31s driver, which is now redundant.
>>
>> I opted not to rename sun6i-a31 to sun6i in various places.
>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Could you guys make a patch either adding these drivers as
commonly maintained by you two in MAINTAINERS?

It is commonly maintained right?

Or if you prefer, just list the pinctrl dir under the Allwinner
SoC support entry?

Yours,
Linus Walleij
