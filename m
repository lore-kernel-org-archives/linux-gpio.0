From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: uniphier: prohibit drive control for pin
 61-66 of PH1-LD11
Date: Sat, 18 Jun 2016 10:02:38 +0200
Message-ID: <CACRpkdYjGXN1753bbHx-sQfekzUQWg+QSORTMNg4yrSyjFfnqA@mail.gmail.com>
References: <1465978686-28578-1-git-send-email-yamada.masahiro@socionext.com> <1465978686-28578-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35588 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864AbcFRICn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:02:43 -0400
Received: by mail-oi0-f53.google.com with SMTP id v7so36787423oig.2
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:02:43 -0700 (PDT)
In-Reply-To: <1465978686-28578-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 15, 2016 at 10:18 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> According to the hardware document, setting the drive control is
> prohibited for these pins (N-channel Open Drain pins).  Set their
> drive control attribute to "fixed".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
