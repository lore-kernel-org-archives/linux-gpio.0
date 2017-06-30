From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: make structures rza1_gpiochip_template and
 rza1_pinmux_ops static
Date: Fri, 30 Jun 2017 15:49:05 +0200
Message-ID: <CACRpkdaw3APxQhNw9zmc5-41s6jxSS34f7BZ-PncNpmW0=-_8Q@mail.gmail.com>
References: <20170630102653.9546-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37829 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751563AbdF3NtH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2017 09:49:07 -0400
Received: by mail-it0-f51.google.com with SMTP id m84so24764223ita.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2017 06:49:07 -0700 (PDT)
In-Reply-To: <20170630102653.9546-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 12:26 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> structures rza1_gpiochip_template and rza1_pinmux_ops do not need to be
> in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'rza1_gpiochip_template' was not declared. Should it be static?
> symbol 'rza1_pinmux_ops' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
