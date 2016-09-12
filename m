From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: mxc: shift gpio_mxc_init() to
 subsys_initcall level
Date: Mon, 12 Sep 2016 14:28:27 +0200
Message-ID: <CACRpkdbNs-Niq_ErSYh4thMTA-EijDn33fFugGFMSRBDQ7uFBA@mail.gmail.com>
References: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com> <1473299296-22458-3-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:36613 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756756AbcILM22 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:28:28 -0400
Received: by mail-it0-f47.google.com with SMTP id o3so7425224ita.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:28:28 -0700 (PDT)
In-Reply-To: <1473299296-22458-3-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Deepak Das <deepak_das@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Sep 8, 2016 at 3:48 AM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> In general situation on-SoC GPIO controller drivers should be probed
> after pinctrl/pinmux controller driver, because on-SoC GPIOs utilize a
> pin/pad as a resource provided and controlled by pinctrl subsystem.
>
> This is stated in multiple places, e.g. from drivers/Makefile:
>
>   GPIO must come after pinctrl as gpios may need to mux pins etc
>
> Looking at Freescale iMX SoC series specifics, imx*_pinctrl_init()
> functions are called at arch_initcall and postcore_initcall init
> levels, so the change of initcall level for gpio-mxc driver from
> postcore_initcall to subsys_initcall level is sufficient. Also note
> that the most of GPIO controller drivers settled at subsys_initcall
> level.
>
> If pinctrl subsystem manages pads with GPIO functions, the change is
> needed to avoid unwanted driver probe deferrals during kernel boot.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
> Changes from v1 to v2:
> * replaced by a change with better commit description and which
>   moves gpio_mxc_init() call to subsys_initcall() instead of
>   apparently too late device_initcall(), this mitigates Shawn's
>   expressed concern about the change.

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
