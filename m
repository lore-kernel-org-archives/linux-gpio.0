From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: create an API to detect open drain/source on lines
Date: Thu, 18 Feb 2016 21:47:07 +0100
Message-ID: <CACRpkdYmhRrfMgdoxh7oV1p4swaRRZ+sGPM_AU6+KD_JL8R6NA@mail.gmail.com>
References: <1455633979-30970-1-git-send-email-linus.walleij@linaro.org>
	<20160217002124.GA31158@vian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36384 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947555AbcBRUrI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 15:47:08 -0500
Received: by mail-ob0-f176.google.com with SMTP id gc3so84935091obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 12:47:08 -0800 (PST)
In-Reply-To: <20160217002124.GA31158@vian>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Feb 17, 2016 at 1:21 AM, Nicolas Saenz Julienne
<nicolassaenzj@gmail.com> wrote:
> On Tue, Feb 16, 2016 at 03:46:19PM +0100, Linus Walleij wrote:
>> My left hand merges code to privatize the descriptor handling
>> while my right hand merges drivers that poke around and
>> disrespect with the same gpiolib internals.
>>
>> So let's expose the proper APIs for drivers to ask the gpiolib
>> core if a line is marked as open drain or open source and
>> get some order around things so this driver compiles again.
>
> Thanks, looks way better now, I'd suggest to remove the "gpiolib.h"
> include since it's not needed anymore. I can do it's on a separate patch
> on top of this one if you prefer :)

I don't understand this comment? That is our internal library header
so that different files in gpiolib can share functions.

>
> Acked-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

Thanks!

Yours,
Linus Walleij
