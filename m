From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 09/10] arm: dts: add imx7d-sdb support
Date: Fri, 17 Apr 2015 20:20:24 -0300
Message-ID: <CAOMZO5B9Ckc_YQpn4wrLLbEU-jahuZ4POBw2jtWi7GayLKp=zw@mail.gmail.com>
References: <1429306135-24695-1-git-send-email-Frank.Li@freescale.com>
	<1429306135-24695-10-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33911 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751669AbbDQXU0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Apr 2015 19:20:26 -0400
Received: by laat2 with SMTP id t2so91096283laa.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2015 16:20:24 -0700 (PDT)
In-Reply-To: <1429306135-24695-10-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Frank Li <Frank.Li@freescale.com>
Cc: =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Apr 17, 2015 at 6:28 PM,  <Frank.Li@freescale.com> wrote:

> +               pinctrl_max17135: max17135grp-1 {
> +                       fsl,pins = <
> +                               MX7D_PAD_EPDC_PWR_STAT__GPIO2_IO31      0x80000000  /* pwrgood */
> +                               MX7D_PAD_I2C4_SCL__GPIO4_IO14           0x80000000  /* vcom_ctrl */
> +                               MX7D_PAD_EPDC_SDCE3__GPIO2_IO23         0x80000000  /* wakeup */
> +                               MX7D_PAD_EPDC_PWR_COM__GPIO2_IO30       0x80000000  /* v3p3 */
> +                               MX7D_PAD_EPDC_SDCE2__GPIO2_IO22         0x80000000  /* pwr int */

As I mentioned earlier, no 0x80000000 settings, please. Better use the
real values instead.
