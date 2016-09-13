From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: mediatek: constify gpio_chip structures
Date: Tue, 13 Sep 2016 10:40:04 +0200
Message-ID: <CACRpkdZD2QD50B785M5a8LpoaJuwBjmn-yo0tmwJaMVj2Et39A@mail.gmail.com>
References: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr> <1473596082-32690-4-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36379 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755922AbcIMIkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 04:40:05 -0400
Received: by mail-oi0-f41.google.com with SMTP id q188so255443479oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 01:40:05 -0700 (PDT)
In-Reply-To: <1473596082-32690-4-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Sep 11, 2016 at 2:14 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> These structures are only used to copy into other structures, so declare
> them as const.
(...)
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.

Yours,
Linus Walleij
