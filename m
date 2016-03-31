From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio/ls1021a: Add gpio support for ls1021a platform
Date: Thu, 31 Mar 2016 10:32:11 +0200
Message-ID: <CACRpkdZzgYMUkJHMzxZkTFRR44R+XRe77aMz89Hj=y-ZQ15qgg@mail.gmail.com>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
	<1458726442-1851-2-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33095 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752030AbcCaIcM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:32:12 -0400
Received: by mail-oi0-f45.google.com with SMTP id d205so51039236oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:32:12 -0700 (PDT)
In-Reply-To: <1458726442-1851-2-git-send-email-Gang.Liu@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@linaro.org>, Rob Herring <robh+dt@kernel.org>, scott.wood@nxp.com, leoyang.li@nxp.com, mingkai.hu@nxp.com

The subject of this patch should be:

ARM: dts: ...

And it should be merged through the ARM SoC tree.

On Wed, Mar 23, 2016 at 10:47 AM, Liu Gang <Gang.Liu@nxp.com> wrote:

> Add gpio nodes for ls1021a platform dts file. The gpio
> IP block of the ls1021a can be supported by the code
> drivers/gpio/gpio-mpc8xxx.c.
>
> The compatible "fsl,qoriq-gpio" is used by gpio driver:
> drivers/gpio/gpio-mpc8xxx.c to implement general gpio
> functionalities.
>
> The chip-specific compatible "fsl,ls1021a-gpio" may be
> used to fix potential gpio IP block errata or other
> chip-specific gpio issues.
>
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>

Apart from that it looks OK.

Yours,
Linus Walleij
