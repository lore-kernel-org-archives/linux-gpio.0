From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix a WARN_ON that can never trigger
Date: Tue, 31 Jan 2017 15:44:43 +0100
Message-ID: <CACRpkdY+ng2YvWpd_WxDVtKcN6H3nU8BZ0isUeCvhfKw+mjKpw@mail.gmail.com>
References: <20170127115642.19174-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:34666 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750802AbdAaOo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 09:44:58 -0500
Received: by mail-io0-f173.google.com with SMTP id l66so133032502ioi.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 06:44:44 -0800 (PST)
In-Reply-To: <20170127115642.19174-1-christophe.jaillet@wanadoo.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 27, 2017 at 12:56 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> "if (!x) WARN_ON(x)" can never trigger.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Good catch.

Patch applied.

Yours,
Linus Walleij
