From: Li Yang <leoli@freescale.com>
Subject: Re: [PATCH] gpio/ls2080a: Add compatible "fsl,ls2080a-gpio" for
 ls2080a gpio nodes
Date: Thu, 31 Mar 2016 14:40:31 -0500
Message-ID: <CADRPPNTSA888Vc6E3Sg__6b7dG3Eq26=4vf0OojpjdzfrSWA2w@mail.gmail.com>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
	<1458726442-1851-4-git-send-email-Gang.Liu@nxp.com>
	<CACRpkdbRwTdGNsoCgqZbgf7DVYbPJdSDey7ju6ogVtVJ+tDGoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33150 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756334AbcCaTkd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 15:40:33 -0400
Received: by mail-wm0-f68.google.com with SMTP id i204so24738952wmd.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 12:40:32 -0700 (PDT)
In-Reply-To: <CACRpkdbRwTdGNsoCgqZbgf7DVYbPJdSDey7ju6ogVtVJ+tDGoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liu Gang <Gang.Liu@nxp.com>, Kevin Hilman <khilman@linaro.org>, Li Yang <leoyang.li@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, mingkai.hu@nxp.com, scott.wood@nxp.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Mar 31, 2016 at 3:29 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The subject of this patch should be:
>
> ARM64: dts: ...
>
> And it should be merged into the ARM SoC tree, not the GPIO tree.

Thanks for the comment.  I will help to fix the title issues for the
dts patches and push for acceptance in arm-soc tree.

Regards,
Leo
