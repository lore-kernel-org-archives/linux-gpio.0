From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1 linux-next] gpio: use container_of to resolve
 cs5535_gpio_chip from gpio_chip
Date: Tue, 23 Sep 2014 17:13:59 +0200
Message-ID: <CACRpkdbZHLqfVZabm47tg9LDC7VS3XfB8zqs+d=0HroH-syMgQ@mail.gmail.com>
References: <1410703015-24127-1-git-send-email-fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:64964 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752593AbaIWPOA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 11:14:00 -0400
Received: by mail-ig0-f181.google.com with SMTP id h18so4742653igc.8
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 08:13:59 -0700 (PDT)
In-Reply-To: <1410703015-24127-1-git-send-email-fabf@skynet.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabian Frederick <fabf@skynet.be>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Sep 14, 2014 at 3:56 PM, Fabian Frederick <fabf@skynet.be> wrote:

> Use container_of instead of casting first structure member.
>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
> Compiled but untested.

Patch applied.
The existing code is unintelligible, so thanks a lot.

Yours,
Linus Walleij
