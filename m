From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mb86s7x: Allow compile test build
Date: Thu, 25 Feb 2016 16:00:45 +0100
Message-ID: <CACRpkdYA06RgRRG5NGzyoqOo=vi7BBm1CxeJxLHWo4qAmZZcjQ@mail.gmail.com>
References: <1456378890.27479.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33873 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759993AbcBYPAq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 10:00:46 -0500
Received: by mail-ob0-f182.google.com with SMTP id ts10so50769697obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 07:00:46 -0800 (PST)
In-Reply-To: <1456378890.27479.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 25, 2016 at 6:41 AM, Axel Lin <axel.lin@ingics.com> wrote:

> There is no build dependency for this driver, so enable COMPILE_TEST to get
> better build coverage.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
