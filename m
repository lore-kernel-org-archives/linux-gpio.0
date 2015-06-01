From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: use "const struct ..." rather than "struct ... const"
Date: Mon, 1 Jun 2015 15:48:33 +0200
Message-ID: <CACRpkdZmC+uGQd3ux+ZzNXkMHdCdnmVhRYr0x4nQXOdF=OCj8g@mail.gmail.com>
References: <1432275950-15374-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34462 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbbFANse (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 09:48:34 -0400
Received: by oifu123 with SMTP id u123so101595344oif.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 06:48:33 -0700 (PDT)
In-Reply-To: <1432275950-15374-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 22, 2015 at 8:25 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Only this member, pins, is defined as "struct ... const *", but the
> others in this struct, pinlops, pmxops, confops, etc. are defined as
> "const struct ... *".
>
> Swap the "struct pinctrl_pin_desc" and "const" for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
