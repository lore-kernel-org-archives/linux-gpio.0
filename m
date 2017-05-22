From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/5] pinctrl: imx: add generic pin config core support
Date: Mon, 22 May 2017 11:04:45 +0200
Message-ID: <CACRpkdYuxP114FzSxdb0MwsJa-2YsT8hSmPZtybM-Y4v8vXBcw@mail.gmail.com>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com> <1495177545-23006-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:34948 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751824AbdEVJEq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 05:04:46 -0400
Received: by mail-it0-f51.google.com with SMTP id c15so148002646ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 02:04:46 -0700 (PDT)
In-Reply-To: <1495177545-23006-3-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, fugang.duan@nxp.com, Sascha Hauer <kernel@pengutronix.de>

On Fri, May 19, 2017 at 9:05 AM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> The design is based on the exist architecture that the core will
> provide a uniformed way to decode the generic pin config into platform
> config register raw data according to the imx_cfg_params_decode maps
> registered by platform.
>
> Two useful macros, IMX_CFG_PARAMS_DECODE and IMX_CFG_PARAMS_DECODE_INVERT,
> are created for platform to register decode map conveniently.
>
> In order to cope with some special case, a platform specific fixup()
> function is also available to use.
>
> Note that rather than fully utilizing the generic pinconf support
> provided by pinctrl core, IMX only adopts the device tree bindings
> of generic pinconf. The config used in .pin_config_get[set] are raw
> register data instead of generic one which makes us align the exist
> using. And that's also why we cannot set pinconf_ops.is_generic.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
