From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "pinctrl: digicolor: add missing
 platform_set_drvdata() call"
Date: Thu, 23 Jun 2016 09:50:36 +0200
Message-ID: <CACRpkdZhan_u56CWOp0LPcSLxva0ejUK9mU0NB3nh1SAFyd_vg@mail.gmail.com>
References: <8ee4285e8b0e2602ac5cec9845a937895147c5cb.1466280066.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36351 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbcFWHui (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:50:38 -0400
Received: by mail-oi0-f44.google.com with SMTP id f189so58492730oig.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:50:38 -0700 (PDT)
In-Reply-To: <8ee4285e8b0e2602ac5cec9845a937895147c5cb.1466280066.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Sat, Jun 18, 2016 at 10:01 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> This reverts commit 8b2b3dcb343bf8cb62efc1bd6a9dbe850005e2ac.
>
> Commit 546c6d79301 (pinctrl: digicolor: make it explicitly non-modular) removed
> the platform_get_drvdata() call, so platform_set_drvdata() is no longer needed.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch/revert applied.

Yours,
Linus Walleij
