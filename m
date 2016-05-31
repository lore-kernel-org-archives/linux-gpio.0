From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 15/17] pinctrl: uniphier: allow to have pinctrl node under
 syscon node
Date: Tue, 31 May 2016 12:55:24 +0200
Message-ID: <CACRpkdZ3tLp3LeR6Q1YvgvKN8B0NuRzfcg_K+smo3_-TGCvr8Q@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-16-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36178 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418AbcEaKzZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 06:55:25 -0400
Received: by mail-oi0-f53.google.com with SMTP id j1so295034194oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 03:55:25 -0700 (PDT)
In-Reply-To: <1464681923-7469-16-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, the UniPhier pinctrl driver itself is a syscon, but it
> turned out much more reasonable to make it a child node of a syscon
> because our syscon node consists of a bunch of system configuration
> registers, not only pinctrl, but also phy, and misc registers.
> It is difficult to split the node.
>
> To allow to migrate to the new DT structure, this commit adds new
> compatible strings to not disturb the existing DT.  After a while,
> the old binding will be removed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied, I guess if there is too much fuzz about the DT
bindings getting incompatible I would have to revert it.

Yours,
Linus Walleij
