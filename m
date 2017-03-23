From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: uniphier: remove obsoleted compatibles
Date: Thu, 23 Mar 2017 09:59:05 +0100
Message-ID: <CACRpkdZQjhggmQvdT+u6x=7x5-31ZOMs8=qt0qUVS4GE+Dw9WQ@mail.gmail.com>
References: <1489599495-14004-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37628 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751984AbdCWJGI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:06:08 -0400
Received: by mail-it0-f48.google.com with SMTP id 190so36583642itm.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:06:00 -0700 (PDT)
In-Reply-To: <1489599495-14004-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 15, 2017 at 6:38 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Since commit 3e030b0b4e46 ("pinctrl: uniphier: allow to have pinctrl
> node under syscon node"), this driver has kept compatibility for the
> old DT files.  Several releases have passed since then, so remove
> the obsoleted compatibles and clean up the code.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
