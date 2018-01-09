From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove redundant mux_setting clear in pinmux_disable_setting()
Date: Tue, 9 Jan 2018 14:49:08 +0100
Message-ID: <CACRpkdaCoWz+5=b5t5Aa3npPfMrHsW=c8v6G9vuZ_rXop1ePOA@mail.gmail.com>
References: <1515149546-31282-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:44095 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751131AbeAINtJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jan 2018 08:49:09 -0500
Received: by mail-it0-f43.google.com with SMTP id b5so11668788itc.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jan 2018 05:49:09 -0800 (PST)
In-Reply-To: <1515149546-31282-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 5, 2018 at 11:52 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> desc->mux_setting is set to NULL in pin_free() called just below.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Excellent work, as always.

Yours,
Linus Walleij
