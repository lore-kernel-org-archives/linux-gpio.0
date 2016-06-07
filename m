From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v10 0/2] gpio: add DT support for memory-mapped GPIOs
Date: Tue, 7 Jun 2016 12:49:13 +0900
Message-ID: <CAAVeFuLWQbGZQFjnMSEXOrx-SUaVPFNFuLdkdvcvEKaqMt7O7g@mail.gmail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com> <CACRpkdZybWKbZVaQ9hcEfb2oghMwZEq-J48hk19fb_RgtOSgKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34044 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbcFGDte (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2016 23:49:34 -0400
In-Reply-To: <CACRpkdZybWKbZVaQ9hcEfb2oghMwZEq-J48hk19fb_RgtOSgKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>

On Tue, May 24, 2016 at 7:43 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, May 13, 2016 at 11:07 PM, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
>
>> v9 -> v10:
>>         - split "gpio: mmio: add DT support for memory-mapped GPIOs"
>>           into two parts.
>>                 - PATCH 1/2 adds the DT infrastructure
>>                 - PATCH 2/2 adds the "wd,mbl-gpio" driver binding and
>>                   property parser.
>>         - removed "move clps711x, moxart, ts4800 and gpio-ge into gpio-mmio"
>
> This minimal patch set looks good to me, Alexandre is this OK with you?

Sorry! This look good to me, yes.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
