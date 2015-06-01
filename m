From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove useless const qualifier
Date: Mon, 1 Jun 2015 15:47:43 +0200
Message-ID: <CACRpkdbYJ9hvk+ZX8qePxRfk8BqgcVC2mYHee9G_nYAGqLVv6A@mail.gmail.com>
References: <1432275577-13016-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35392 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbbFANro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 09:47:44 -0400
Received: by obcnx10 with SMTP id nx10so98108840obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 06:47:43 -0700 (PDT)
In-Reply-To: <1432275577-13016-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 22, 2015 at 8:19 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This "const" claims the get_function_groups callback never
> changes the given num_groups pointer.  It is always true
> in C language, so not worth mentioning.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
