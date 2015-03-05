From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/4] gpiolib: define gpio suffixes globally
Date: Thu, 5 Mar 2015 09:47:52 +0100
Message-ID: <CACRpkdbi832P1inRWPeQ4BF-LxDWse9NytEn_c4ub4C=Hf7AXA@mail.gmail.com>
References: <6473685.Mym42fyUcn@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35763 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754699AbbCEIrx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2015 03:47:53 -0500
Received: by oifz81 with SMTP id z81so10504117oif.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2015 00:47:52 -0800 (PST)
In-Reply-To: <6473685.Mym42fyUcn@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Feb 9, 2015 at 6:07 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Avoid multiple identical definitions of the gpio suffix strings by putting
> them into a global constant array.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> v3: add this change as a separate patch

Patch applied, now I'm not even a month behind on my mail, yay.

Yours,
Linus Walleij
