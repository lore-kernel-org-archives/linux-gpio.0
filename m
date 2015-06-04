From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] pinctrl: imx7d: Remove .owner field
Date: Thu, 4 Jun 2015 10:13:52 +0200
Message-ID: <CACRpkdYSB_-kvVa0U3HkB4wikqsoJkGAXptKrp-OKYUjTFRtzw@mail.gmail.com>
References: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36349 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147AbbFDINx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2015 04:13:53 -0400
Received: by obbqz1 with SMTP id qz1so8803992obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2015 01:13:53 -0700 (PDT)
In-Reply-To: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <fabio.estevam@freescale.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 1, 2015 at 2:53 PM, Fabio Estevam
<fabio.estevam@freescale.com> wrote:

> platform_driver does not need to set the owner field, as it will be
> populated by the driver core, so just remove it.
>
> The semantic patch that makes this change is available
> in scripts/coccinelle/api/platform_no_drv_owner.cocci.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

All seven patches squashed into one and applied.

Yours,
Linus Walleij
