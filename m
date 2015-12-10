From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm: Default PINCTRL_BCM281XX to y for ARCH_BCM_MOBILE
Date: Thu, 10 Dec 2015 23:54:33 +0100
Message-ID: <CACRpkdasK1Xx4S_CD0ykwW=jpWgo64ANXecgbFzDNH5ewduCyA@mail.gmail.com>
References: <1449020490-27084-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36608 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730AbbLJWye (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 17:54:34 -0500
Received: by obcse5 with SMTP id se5so70747451obc.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 14:54:33 -0800 (PST)
In-Reply-To: <1449020490-27084-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Wed, Dec 2, 2015 at 2:41 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> This driver is mandatory for proper operation on the platforms covered
> by the ARCH_BCM_MOBILE Kconfig symbol, make sure we do that driver on
> for these platforms.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied with Ray's Review tag.

Yours,
Linus Walleij
