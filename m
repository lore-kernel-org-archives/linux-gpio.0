From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: fix Ethernet (RMII) pin-mux setting
 for LD20
Date: Wed, 18 Jan 2017 13:26:44 +0100
Message-ID: <CACRpkdZXTmGmsGG7kiVuPRs4vRk_-8FbRHvZGjt1cnmYutFvDw@mail.gmail.com>
References: <1484650374-30989-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:34198 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753134AbdARM0q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 07:26:46 -0500
Received: by mail-qk0-f174.google.com with SMTP id a20so11313059qkc.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 04:26:45 -0800 (PST)
In-Reply-To: <1484650374-30989-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 17, 2017 at 11:52 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Fix the pin-mux values for the MDC, MDIO, MDIO_INTL, PHYRSTL pins.
>
> Fixes: 1e359ab1285e ("pinctrl: uniphier: add Ethernet pin-mux settings")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied for fixes.

Yours,
Linus Walleij
