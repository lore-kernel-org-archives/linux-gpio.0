From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tc3589x: use BIT() macro
Date: Tue, 5 Apr 2016 16:59:50 +0200
Message-ID: <CACRpkdastLZTNUFYqu5BV3aVvpf=N05v+W-RDM4tZbPVJOcGdA@mail.gmail.com>
References: <1459861855-1975-1-git-send-email-linus.walleij@linaro.org>
	<20160405135233.GE391@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34172 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758326AbcDEO7v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 10:59:51 -0400
Received: by mail-ob0-f174.google.com with SMTP id bg3so11046982obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 07:59:51 -0700 (PDT)
In-Reply-To: <20160405135233.GE391@tuxbot>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Apr 5, 2016 at 3:52 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 05 Apr 06:10 PDT 2016, Linus Walleij wrote:

>> -     u8 data[] = {!!val << pos, 1 << pos};
>> +     u8 data[] = {!!val << pos, BIT(pos)};
>                         ^
>                         |
> The first part of this is also a bitmask, so even though this is
> slightly messier I think for consistency you should go with:
>
> u8 data[] = {val ? BIT(pos) : 0, BIT(pos)};
>
>>
>>       tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
>>  }
>
> The rest looks good,
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

OK thanks, edited like so and applied with your review tag.

Yours,
Linus Walleij
