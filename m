From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: u300: make u300_pmx_registers static
Date: Mon, 13 Jun 2016 09:28:16 +0200
Message-ID: <CACRpkdbO3KdgGrrdRckmY1NfGzDeiPB4TzZAiaZE2zzeKBScXw@mail.gmail.com>
References: <1465469700-9026-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33504 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965004AbcFMH2S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 03:28:18 -0400
Received: by mail-oi0-f51.google.com with SMTP id u201so68311211oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 00:28:17 -0700 (PDT)
In-Reply-To: <1465469700-9026-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jun 9, 2016 at 12:55 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> The array u300_pmx_registers is not declared or used outside
> of the driver, so make it static to avoid the following warning:
>
> drivers/pinctrl/pinctrl-u300.c:673:11: warning: symbol 'u300_pmx_registers' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Patch applied.

Yours,
Linus Walleij
