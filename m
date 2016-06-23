From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: of: optimize "gpios" property parsing of of_parse_own_gpio()
Date: Thu, 23 Jun 2016 09:23:34 +0200
Message-ID: <CACRpkdaTHshatsK5FRLwihGSz1gOCdYV2B+k2i-6rRS416SEfw@mail.gmail.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com> <1465898827-2229-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33822 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367AbcFWHXg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:23:36 -0400
Received: by mail-oi0-f50.google.com with SMTP id s66so57696087oif.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:23:35 -0700 (PDT)
In-Reply-To: <1465898827-2229-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 14, 2016 at 12:07 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Call of_property_read_u32_array() only once rather than iterating
> of_property_read_u32_index().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks patch applied!

In this case I think the code is so old that the read_u32_array() function
didn't exist when it was written.

Yours,
Linus Walleij
