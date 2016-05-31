From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: fix initialization of imx_pinctrl_desc
Date: Tue, 31 May 2016 10:55:16 +0200
Message-ID: <CACRpkdb5zv_YwbZw_=bcss=ssuqDPcXc6gDa+U0TsaN-8gie-w@mail.gmail.com>
References: <1463563919-4144-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34041 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755946AbcEaIzR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 04:55:17 -0400
Received: by mail-oi0-f51.google.com with SMTP id e72so16453231oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 01:55:16 -0700 (PDT)
In-Reply-To: <1463563919-4144-1-git-send-email-van.freenix@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peng Fan <van.freenix@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Vladimir Zapolskiy <vz@mleia.com>

On Wed, May 18, 2016 at 11:31 AM, Peng Fan <van.freenix@gmail.com> wrote:

> To i.MX7D, there are two iomux controllers, iomuxc and iomuxc_lpsr.
> They should not share one pin controller descriptor, otherwise
> the value filled into imx_pinctrl_desc when probing the first
> iomux controller will be overridden when probing the second one.
>
> In this patch, discard the static allcoated imx_pinctrl_desc and
> switch to dynamically allcate pin controller descriptor for each
> iomux controller.
>
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Vladimir Zapolskiy <vz@mleia.com>

Looks reasonable to me so patch applied since noone is responding.

Yours,
Linus Walleij
