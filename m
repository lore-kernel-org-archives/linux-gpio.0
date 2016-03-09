From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: rename CONFIG options and file names
Date: Wed, 9 Mar 2016 10:40:11 +0700
Message-ID: <CACRpkdY8TJztJmENd5PTrQkgzXRRppbmY9HALT=yKf_8Q45C_Q@mail.gmail.com>
References: <1456899280-8641-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36336 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbcCIDkM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 22:40:12 -0500
Received: by mail-oi0-f53.google.com with SMTP id r187so26346747oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 19:40:12 -0800 (PST)
In-Reply-To: <1456899280-8641-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Mar 2, 2016 at 1:14 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The current "CONFIG_PINCTRL_UNIPHIER_PH1_*" is too long.  It would
> not hurt to drop "PH1_" because "UNIPHIER_" already well specifies
> the SoC family.  Also, rename files for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
