From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: fix non-exported functions
Date: Wed, 8 Jun 2016 14:10:36 +0200
Message-ID: <CACRpkdbrCOaz-JRmgq7E6DvF-amJkkVj22R2dyg+bubz=qshig@mail.gmail.com>
References: <1465319265-27630-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36649 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752272AbcFHMKh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 08:10:37 -0400
Received: by mail-oi0-f46.google.com with SMTP id p204so8912205oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 05:10:37 -0700 (PDT)
In-Reply-To: <1465319265-27630-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 7, 2016 at 7:07 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> The atmel_pctl_find_group_by_pin() and the atmel_pinctrl_remove()
> functions are not exported, so fix the warnings about these
> being exported without definitions by making them static.
>
> drivers/pinctrl/pinctrl-at91-pio4.c:424:20: warning: symbol 'atmel_pctl_find_group_by_pin' was not declared. Should it be static?
> drivers/pinctrl/pinctrl-at91-pio4.c:1077:5: warning: symbol 'atmel_pinctrl_remove' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Patch applied with Ludovic's ACK.

Yours,
Linus Walleij
