From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: imx: accept gpio request/free from pinctrl
Date: Mon, 12 Sep 2016 14:26:27 +0200
Message-ID: <CACRpkdZwi_7OZ1_Ng44O10GqmLG3xgp3REyZPhJBs9goMLVU3A@mail.gmail.com>
References: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com> <1473299296-22458-2-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:35263 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756103AbcILM02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:26:28 -0400
Received: by mail-it0-f43.google.com with SMTP id r192so6316995ita.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:26:28 -0700 (PDT)
In-Reply-To: <1473299296-22458-2-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Deepak Das <deepak_das@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Sep 8, 2016 at 3:48 AM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> While only Freescale Vybrid SoC has settings of GPIO capabilities done
> by iomux controller, it is only a matter of GPIO controller driver
> implementation for the rest of Freescale/NXP SoCs from iMX series.
>
> As a practical example on GPIO request a pad function should be
> switched to GPIO, but because this requires updates to all particular
> iMX pinctrl drivers, for simplicity at the moment add only a proper
> connection between shared pinctrl-imx and pinctrl/pinmux core, namely
> .gpio_request_enable/.gpio_disable_free/.gpio_set_direction callbacks
> should return success to a caller. This change allows to progress by
> adding request/free callbacks into gpio-mxc.c driver.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
> Changes from v1 to v2:
> * none

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
