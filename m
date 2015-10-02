From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: uniphier: fix input enable settings for PH1-sLD8
Date: Fri, 2 Oct 2015 02:53:42 -0700
Message-ID: <CACRpkdZdDtQzSQ9KvqAWA0a6sz13DBp0Nuk-ZfLtZi2hRuG29g@mail.gmail.com>
References: <1441964010-6885-1-git-send-email-yamada.masahiro@socionext.com>
	<1441964010-6885-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:32876 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbbJBJxn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 05:53:43 -0400
Received: by obbbh8 with SMTP id bh8so78090781obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 02:53:42 -0700 (PDT)
In-Reply-To: <1441964010-6885-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 11, 2015 at 2:33 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, input enable settings are missing from the PH1-sLD8
> pinctrl driver.  (All the entries in the pin table are set to
> UNIPHIER_PIN_IECTRL_NONE).
>
> Fill the table with correct values.
>
> Fixes: 95372f9dc892 ("pinctrl: UniPhier: add UniPhier PH1-sLD8 pinctrl driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied for fixes.

Yours,
Linus Walleij
