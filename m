From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm: add OF dependencies
Date: Fri, 22 Jul 2016 16:44:05 +0200
Message-ID: <CACRpkdZFqZ-BiWye1J3DJcY-TSMS+EJZbEEHyGTxJm8+Ed1JHA@mail.gmail.com>
References: <20160715203012.1715182-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36370 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751580AbcGVOoG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 10:44:06 -0400
Received: by mail-oi0-f44.google.com with SMTP id w18so165625418oiw.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 07:44:06 -0700 (PDT)
In-Reply-To: <20160715203012.1715182-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ray Jui <rjui@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 15, 2016 at 10:29 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Building without CONFIG_OF gives us these warnings for the broadcom
> pinctrl drivers:
>
> drivers/pinctrl/bcm/pinctrl-nsp-mux.c:356:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
> drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
>
> The function is only available when CONFIG_OF is set, so we should add
> a Kconfig dependency for both drivers.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for Broadcom NSP SoC")

Patch applied.

Yours,
Linus Walleij
