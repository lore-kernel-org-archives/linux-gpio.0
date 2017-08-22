From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/17] constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Tue, 22 Aug 2017 14:43:49 +0200
Message-ID: <CACRpkdZA_Nff+5Gk9wexoroX2=-tMzNJFVQbWmV8nhWooEwWbA@mail.gmail.com>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34618 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932652AbdHVMnu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 08:43:50 -0400
Received: by mail-oi0-f51.google.com with SMTP id j144so56282333oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2017 05:43:49 -0700 (PDT)
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-arm-kernel@axis.com, Bhumika Goyal <bhumirks@gmail.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Aug 10, 2017 at 12:06 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> These structures are only stored in fields of a pinctrl_desc
> structure that are const. Make the structures const as well.
>
> Done with the help of Coccinelle.

Thanks Julia, all patches applied with relevant ACKs collected.

Yours,
Linus Walleij
