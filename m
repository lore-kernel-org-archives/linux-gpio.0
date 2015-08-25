From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx6ul: Remove .owner field
Date: Tue, 25 Aug 2015 16:29:32 +0200
Message-ID: <CACRpkdZ2UK8C5mshMHKNRLfVHJFx+oJmVsXWx42DPjEE7bg3yA@mail.gmail.com>
References: <1439497221-29913-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33996 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755745AbbHYO3d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2015 10:29:33 -0400
Received: by obbfr1 with SMTP id fr1so143097303obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2015 07:29:32 -0700 (PDT)
In-Reply-To: <1439497221-29913-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Thu, Aug 13, 2015 at 10:20 PM, Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> platform_driver does not need to set an owner as it will be
> populated by the driver core.
>
> The semantic patch that makes this change is available
> in scripts/coccinelle/api/platform_no_drv_owner.cocci.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Patch applied.

Yours,
Linus Walleij
