From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: fix meaningless drive control offsets
Date: Sat, 18 Jun 2016 10:03:37 +0200
Message-ID: <CACRpkdZ+iVxW25Vsp6F8gXsKJ7crdVwZKVHFrWAt2rZ3WR+tng@mail.gmail.com>
References: <1465978686-28578-1-git-send-email-yamada.masahiro@socionext.com> <1465978686-28578-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34438 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936AbcFRIDj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:03:39 -0400
Received: by mail-oi0-f46.google.com with SMTP id d132so147737610oig.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:03:38 -0700 (PDT)
In-Reply-To: <1465978686-28578-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 15, 2016 at 10:18 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> These are input-only pins.  They do not support drive controlling
> in the first place.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
