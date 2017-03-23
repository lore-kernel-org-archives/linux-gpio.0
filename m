From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: make drivers non-modular
Date: Thu, 23 Mar 2017 10:00:12 +0100
Message-ID: <CACRpkdZAnNNFrrJxQe+HApsEkRid5G2Mr9eSuexgypiUrHMUtw@mail.gmail.com>
References: <1489599495-14004-1-git-send-email-yamada.masahiro@socionext.com> <1489599495-14004-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:38119 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754517AbdCWJAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:00:30 -0400
Received: by mail-it0-f47.google.com with SMTP id y18so36635820itc.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:00:13 -0700 (PDT)
In-Reply-To: <1489599495-14004-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 15, 2017 at 6:38 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> At first these drivers were written as tristate, but the module
> usecases are actually not tested.  Make all of them boolean.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
