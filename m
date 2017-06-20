From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ingenic: checking for NULL instead of IS_ERR()
Date: Tue, 20 Jun 2017 11:36:40 +0200
Message-ID: <CACRpkdZ6qczpU+ovDdmUyURMasQgdvNUypWoFLBWk7B2b2v4+Q@mail.gmail.com>
References: <20170614091209.GC29394@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:38152 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751641AbdFTJgm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 05:36:42 -0400
Received: by mail-it0-f54.google.com with SMTP id b205so10658818itg.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 02:36:42 -0700 (PDT)
In-Reply-To: <20170614091209.GC29394@elgon.mountain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Cercueil <paul@crapouillou.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 11:12 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> devm_pinctrl_register() returns error pointers, it doesn't return NULL.
>
> Fixes: b5c23aa46537 ("pinctrl: add a pinctrl driver for the Ingenic jz47xx SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
