From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: remove unneeded initializer in gpiochip_add_to_list()
Date: Mon, 27 Jul 2015 14:40:59 +0200
Message-ID: <CACRpkdbkX=eR8r15ty=+Cqi5cWi5HFyciK5sSg0epAtt780JkQ@mail.gmail.com>
References: <1437457540-1778-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35847 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752294AbbG0Mk7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:40:59 -0400
Received: by obnw1 with SMTP id w1so58023473obn.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:40:59 -0700 (PDT)
In-Reply-To: <1437457540-1778-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 21, 2015 at 7:45 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This variable is used as an iterator and initialized in the
> list_for_each() loop.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Alex' review tag.

Yours,
Linus Walleij
