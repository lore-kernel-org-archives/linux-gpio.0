From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ret needs to be an int for -ve return value from regmap_update_bits
Date: Tue, 13 Sep 2016 10:44:13 +0200
Message-ID: <CACRpkdaRWSNghaSpjCHGdiGA9NP81y+8A4x447sJYVN_=59fzA@mail.gmail.com>
References: <20160911083625.7451-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:32938 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752456AbcIMIoO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 04:44:14 -0400
Received: by mail-oi0-f53.google.com with SMTP id y2so371651130oie.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 01:44:14 -0700 (PDT)
In-Reply-To: <20160911083625.7451-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Sep 11, 2016 at 10:36 AM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Macro regmap_update_bits can return a -ve on an error value so ret
> needs to be an integer rather than a bool type.
>
> Fixes warning found by static analysis with cppcheck:
> [drivers/pinctrl/aspeed/pinctrl-aspeed.c:192]: (warning) Comparison of
>   a boolean expression with an integer other than 0 or 1.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Dropping this but added your Reported-by to Arnds patch.

Yours,
Linus Walleij
