From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nomadik: hide unused functions
Date: Thu, 28 Jan 2016 11:36:31 +0100
Message-ID: <CACRpkdYHpeb18SfUU=d_jXtLPFpUe2AkW5JJzMK5giFBw1aKAA@mail.gmail.com>
References: <1453737557-1960171-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35889 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964802AbcA1Kgb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 05:36:31 -0500
Received: by mail-ob0-f173.google.com with SMTP id ba1so31962744obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 02:36:31 -0800 (PST)
In-Reply-To: <1453737557-1960171-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 25, 2016 at 4:59 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The nomadik pinctrl driver has two functions that are only used
> for debugfs output and are otherwise unused:
>
> drivers/pinctrl/nomadik/pinctrl-abx500.c:194:12: error: 'abx500_get_pull_updown' defined but not used
> drivers/pinctrl/nomadik/pinctrl-abx500.c:471:12: error: 'abx500_get_mode' defined but not used
>
> This makes the function definitions conditional to avoid the
> harmless warnings.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied for fixes.

Yours,
Linus Walleij
