From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: refactor gpiochip_find() slightly
Date: Fri, 19 Aug 2016 10:56:09 +0200
Message-ID: <CACRpkdasM0U2sS_AeZmjJg70ZTJ_=X6sygnRVD6NPVfyMr4=3g@mail.gmail.com>
References: <1470932518-8748-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35472 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752431AbcHSI4f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2016 04:56:35 -0400
Received: by mail-oi0-f54.google.com with SMTP id 4so55461342oih.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2016 01:56:10 -0700 (PDT)
In-Reply-To: <1470932518-8748-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Aug 11, 2016 at 6:21 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The if...else... block after the loop can be dropped with
> a slight refactoring.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
