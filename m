From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: uniphier: fix WARN_ON() of pingroups dump on LD11
Date: Tue, 20 Jun 2017 11:34:24 +0200
Message-ID: <CACRpkdaw0rydYJnLZWSRLMg=gCCH69ZFwizKHf=mzBv1q8fgJw@mail.gmail.com>
References: <1497415770-17741-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:34682 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbdFTJeZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 05:34:25 -0400
Received: by mail-it0-f51.google.com with SMTP id m47so16494360iti.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 02:34:25 -0700 (PDT)
In-Reply-To: <1497415770-17741-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 14, 2017 at 6:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The pingroups dump of debugfs hits WARN_ON() in pinctrl_groups_show().
> Filling non-existing ports with '-1' turned out a bad idea.
>
> Fixes: 70f2f9c4cf25 ("pinctrl: uniphier: add UniPhier PH1-LD11 pinctrl driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
