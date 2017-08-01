From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: uniphier: omit redundant input enable bit information
Date: Tue, 1 Aug 2017 10:15:42 +0200
Message-ID: <CACRpkdYpLYcKCbvpMQ34iLsdjroGKy=UvFqG3nqQk5VyA8CB0A@mail.gmail.com>
References: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com> <1501482071-9819-5-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:36270 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751368AbdHAIPo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 04:15:44 -0400
Received: by mail-it0-f48.google.com with SMTP id 77so4109312itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 01:15:44 -0700 (PDT)
In-Reply-To: <1501482071-9819-5-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 31, 2017 at 8:21 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> For LD11/20 SoCs (capable of per-pin input enable), the iectrl bit
> number matches its pin number.  So, this is redundant information.
> Instead, we just need a flag to know if the iectrl gating exists or not.
>
> With this refactoring, 5 bits in pin data will be saved.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
