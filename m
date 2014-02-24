From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: davinci: Use signed type for 'irq' variable
Date: Mon, 24 Feb 2014 14:51:14 +0100
Message-ID: <CACRpkdbzX6XiccQh0SpY42qyPwegQKTvnSrjOdbdOZTzdKi+3Q@mail.gmail.com>
References: <1392469925-16737-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:39663 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752565AbaBXNvP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 08:51:15 -0500
Received: by mail-ob0-f180.google.com with SMTP id vb8so6700682obc.25
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 05:51:15 -0800 (PST)
In-Reply-To: <1392469925-16737-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Feb 15, 2014 at 2:12 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Variable 'irq' is declared as unsigned and then used to store
> negative return values from irq_alloc_descs() such as -EINVAL.
> This patch fix this by declaring the variable as a signed.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Patch applied.

Yours,
Linus Walleij
