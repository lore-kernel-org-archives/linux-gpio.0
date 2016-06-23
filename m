From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] gpio: of: factor out common code to a new helper function
Date: Thu, 23 Jun 2016 09:42:21 +0200
Message-ID: <CACRpkdZUtVTGULf-g8meEmryTLz6=VZzQhJcYAYJQTnkDNa9Zw@mail.gmail.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com> <1465898827-2229-6-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34879 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023AbcFWHmW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:42:22 -0400
Received: by mail-oi0-f53.google.com with SMTP id r2so58278328oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:42:22 -0700 (PDT)
In-Reply-To: <1465898827-2229-6-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 14, 2016 at 12:07 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The conversion from a DT spec to struct gpio_desc is common between
> of_get_named_gpiod_flags() and of_parse_own_gpio().  Factor out the
> common code to a new helper, of_xlate_and_get_gpiod_flags().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
