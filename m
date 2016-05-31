From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/17] pinctrl: copy per-pin driver private data to struct pin_desc
Date: Tue, 31 May 2016 10:58:28 +0200
Message-ID: <CACRpkdZkz+nKVzboKc9YdhQe9Mmj7UCwdwdeRTfhsRePxN3pzw@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33591 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755920AbcEaI63 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 04:58:29 -0400
Received: by mail-oi0-f47.google.com with SMTP id k23so292896392oih.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 01:58:29 -0700 (PDT)
In-Reply-To: <1464681923-7469-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, struct pinctrl_pin_desc can have per-pin driver private
> data, but it is not copied to struct pin_desc.
>
> For a driver with sparse pin space, for-loop search like below would
> be necessary in order to get the driver-specific data for a desired
> pin number.
>
>   for (i = 0; i < pctldev->desc->npins; i++)
>           if (pin_number == pctldev->desc->pins[i].number)
>                   return pctldev->desc->pins[i].drv_data;
>
> This is not efficient for a driver with a large number of pins.
> So, copy the data to struct pin_desc when each pin is registered
> for the faster radix tree lookup.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> This is a re-sent of
> http://patchwork.ozlabs.org/patch/626015/
>
> I included it again in this series because it is a prerequisite
> of 9/17.  Otherwise, the kbuild test robot might start
> complaining about the build error.

OK already applied.

Yours,
Linus Walleij
