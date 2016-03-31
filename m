From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/ls2080a: Add compatible "fsl,ls2080a-gpio" for
 ls2080a gpio nodes
Date: Thu, 31 Mar 2016 10:29:02 +0200
Message-ID: <CACRpkdbRwTdGNsoCgqZbgf7DVYbPJdSDey7ju6ogVtVJ+tDGoA@mail.gmail.com>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
	<1458726442-1851-4-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33646 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752942AbcCaI3C (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:29:02 -0400
Received: by mail-oi0-f52.google.com with SMTP id d205so50951144oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:29:02 -0700 (PDT)
In-Reply-To: <1458726442-1851-4-git-send-email-Gang.Liu@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@linaro.org>, Rob Herring <robh+dt@kernel.org>, scott.wood@nxp.com, leoyang.li@nxp.com, mingkai.hu@nxp.com

The subject of this patch should be:

ARM64: dts: ...

And it should be merged into the ARM SoC tree, not the GPIO tree.

On Wed, Mar 23, 2016 at 10:47 AM, Liu Gang <Gang.Liu@nxp.com> wrote:

> The compatible "fsl,qoriq-gpio" is used by gpio driver:
> drivers/gpio/gpio-mpc8xxx.c to implement general gpio
> functionalities.
>
> The chip-specific compatible "fsl,ls2080a-gpio" may be
> used to fix potential gpio IP block errata or other
> chip-specific gpio issues.
>
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>

Apart from that it looks good.

Yours,
Linus Walleij
