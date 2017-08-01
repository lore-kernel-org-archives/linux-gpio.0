From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: replace __maybe_unused in gpiolib.h with static inline
Date: Tue, 1 Aug 2017 09:55:50 +0200
Message-ID: <CACRpkdasPw13=CFjiyKWX+P1VLUVRzwP3QsFFu9tFRgtefEqtA@mail.gmail.com>
References: <1499784103-1538-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35630 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751163AbdHAHzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 03:55:52 -0400
Received: by mail-it0-f42.google.com with SMTP id h199so3911520ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 00:55:52 -0700 (PDT)
In-Reply-To: <1499784103-1538-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 11, 2017 at 4:41 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> In header files, static inline is more commonly used.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Good point.
Patch applied.

Yours,
Linus Walleij
