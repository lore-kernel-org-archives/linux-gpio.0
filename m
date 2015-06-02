From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix confusing debug message in pinctrl_register_map()
Date: Tue, 2 Jun 2015 13:33:01 +0200
Message-ID: <CACRpkdYFRxizbJmJhzx7sa11EEdXu5s5myz+2amgPC-JQC6Kgg@mail.gmail.com>
References: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36047 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754206AbbFBLdC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 07:33:02 -0400
Received: by oihb142 with SMTP id b142so122979758oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 04:33:01 -0700 (PDT)
In-Reply-To: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 28, 2015 at 2:52 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> There are two types for pinctrl maps: pinmux and pinconfig
> This debug message shows the number of maps of both types.
> The string "pinmux map" is not precise.  Let's say "pinctrl map"
> instead.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied, also changed %d->%u as suggested by Joe.

Yours,
Linus Walleij
