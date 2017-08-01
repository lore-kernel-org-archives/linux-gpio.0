From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] [BUGFIX] gpio: reject invalid gpio before getting gpio_desc
Date: Tue, 1 Aug 2017 10:09:09 +0200
Message-ID: <CACRpkdaOHQ+3mEPOOtztb5LN0pmvnJE5oWd524MgiaYkASYJ_w@mail.gmail.com>
References: <150146625669.11567.9576692487524672090.stgit@devbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:37324 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751102AbdHAIJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 04:09:11 -0400
Received: by mail-it0-f53.google.com with SMTP id v127so4238392itd.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 01:09:11 -0700 (PDT)
In-Reply-To: <150146625669.11567.9576692487524672090.stgit@devbox>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>

On Mon, Jul 31, 2017 at 3:57 AM, Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Check user-given gpio number and reject it before
> calling gpio_to_desc() because gpio_to_desc() is
> for kernel driver and it expects given gpio number
> is valid (means 0 to 511).
> If given number is invalid, gpio_to_desc() calls
> WARN() and dump registers and stack for debug.
> This means user can easily kick WARN() just by
> writing invalid gpio number (e.g. 512) to
> /sys/class/gpio/export.
>
> Fixes: 0e9a5edf5d01 ("gpio: fix deferred probe detection for legacy API")
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> ---
>   Changes in v2:
>    - Add gpio_to_valid_desc() according to Andy's comment (Thanks!).
>    - Fix patch description.

I hate the old sysfs ABI sigh. Thanks for fixing it anyways!

Should this be tagged for stable?

Waiting for Andy's review before applying.

Yours,
Linus Walleij
