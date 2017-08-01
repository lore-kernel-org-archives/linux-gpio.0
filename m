From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: xgene-sb: select IRQ_DOMAIN_HIERARCHY
Date: Tue, 1 Aug 2017 10:06:55 +0200
Message-ID: <CACRpkdbRzS+uu8Jqjn_WmqYXs4ECoCJKp5Z7FGmv0o9tSr57yQ@mail.gmail.com>
References: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com> <1499814710-16686-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:37748 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751746AbdHAIG4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 04:06:56 -0400
Received: by mail-it0-f52.google.com with SMTP id v127so4211911itd.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 01:06:56 -0700 (PDT)
In-Reply-To: <1499814710-16686-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 12, 2017 at 1:11 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This driver calls irq_domain_hierarchy() and irq_chip_*_parent().
> They are available only when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied for GPIO fixes on top of 1/2.

Thanks for the thorough fix, very impressed with this good
work.

Yours,
Linus Walleij
