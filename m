From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: add __rcu annotations to fix sparse warnings
Date: Mon, 7 Aug 2017 15:15:38 +0200
Message-ID: <CACRpkda-z45g77Qv9dqoaEvUF6zhSWYf-3LSW0zN0kUP8jxz6A@mail.gmail.com>
References: <1501822325-25512-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:35786 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751493AbdHGNPj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 09:15:39 -0400
Received: by mail-it0-f48.google.com with SMTP id 76so3296653ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 06:15:39 -0700 (PDT)
In-Reply-To: <1501822325-25512-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 4, 2017 at 6:52 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Sparse reports "warning: incorrect type in assignment (different
> address spaces)".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
