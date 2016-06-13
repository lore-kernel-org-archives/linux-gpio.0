From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nomadik: fix warnings from unexported functions
Date: Mon, 13 Jun 2016 08:50:45 +0200
Message-ID: <CACRpkdavZ9hhrXKAd71_xt7bU6cPyHRynzJeWf+v+p3DMYhnNA@mail.gmail.com>
References: <1465402062-26122-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35564 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161007AbcFMGur (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 02:50:47 -0400
Received: by mail-oi0-f46.google.com with SMTP id w5so115132457oib.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2016 23:50:47 -0700 (PDT)
In-Reply-To: <1465402062-26122-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Alessandro Rubini <rubini@unipv.it>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jun 8, 2016 at 6:07 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> There are five functions in the driver that are defined but
> only used locally. Since these are not used in the current
> kernel, delete them to avoid the following warnings:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1036:6: warning: symbol 'nmk_gpio_clocks_enable' was not declared. Should it be static?
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1050:6: warning: symbol 'nmk_gpio_clocks_disable' was not declared. Should it be static?
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1073:6: warning: symbol 'nmk_gpio_wakeups_suspend' was not declared. Should it be static?
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1094:6: warning: symbol 'nmk_gpio_wakeups_resume' was not declared. Should it be static?
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1120:6: warning: symbol 'nmk_gpio_read_pull' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
