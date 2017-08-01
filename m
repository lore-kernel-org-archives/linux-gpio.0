From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] pinctrl: uniphier: add suspend / resume support
Date: Tue, 1 Aug 2017 10:16:45 +0200
Message-ID: <CACRpkdZnyT7Anf4+U79hbHRFEvsEJNh8yF+9pW=bq65BDibHMQ@mail.gmail.com>
References: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com> <1501482071-9819-6-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:37295 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751746AbdHAIQr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 04:16:47 -0400
Received: by mail-it0-f47.google.com with SMTP id v127so4324114itd.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 01:16:46 -0700 (PDT)
In-Reply-To: <1501482071-9819-6-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 31, 2017 at 8:21 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Save registers lost in the sleep when suspending, and restore them
> when resuming.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
