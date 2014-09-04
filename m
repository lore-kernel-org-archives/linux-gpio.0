From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: make driver mcp23s08 to support both device tree
 and platform data
Date: Thu, 4 Sep 2014 19:02:08 +0200
Message-ID: <CACRpkdbimj9gbpu1PV6Fh5TcvqJGprbBUs+WJMGJjxMMjq3+nA@mail.gmail.com>
References: <1409541592-27787-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:53453 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754714AbaIDRCI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Sep 2014 13:02:08 -0400
Received: by mail-ob0-f178.google.com with SMTP id uy5so7660877obc.9
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2014 10:02:08 -0700 (PDT)
In-Reply-To: <1409541592-27787-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Mon, Sep 1, 2014 at 5:19 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Device tree is not enabled in some archtecture where gpio driver mcp23s08
> is still required.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

OK this v2 version applied.

Yours,
Linus Walleij
