From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: Eliminates redundant checking.
Date: Sat, 5 Jul 2014 01:14:45 +0200
Message-ID: <CACRpkdbU6Quk-M_oK-VNu7u+uHLhRTPH6TxzCYLZHCkUGmUQMA@mail.gmail.com>
References: <20140606033755.GA13605@deathray>
	<1402425994-2983-1-git-send-email-mwelling@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:42132 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753012AbaGDXOp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jul 2014 19:14:45 -0400
Received: by mail-ob0-f173.google.com with SMTP id va2so2331000obc.4
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2014 16:14:45 -0700 (PDT)
In-Reply-To: <1402425994-2983-1-git-send-email-mwelling@ieee.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, peter@korsgaard.com, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Stickel <ms@mycable.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 10, 2014 at 8:46 PM, Michael Welling <mwelling@ieee.org> wrote:

> Unnecessary checking was added during the merge of the gpio branch.
> This patch removes the extra unnecessary checking.
>
> Signed-off-by: Michael Welling <mwelling@ieee.org>

Applied for fixes. Sorry for the mess.

Yours,
Linus Walleij
