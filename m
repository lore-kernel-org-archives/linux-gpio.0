From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xlp: Add GPIO driver support for Broadcom Vulcan ARM64
Date: Tue, 22 Mar 2016 15:06:50 +0100
Message-ID: <CACRpkdbXrUD0BfyYMceCS=EqoHztjPMChrwHTXWMySo_kD=qdw@mail.gmail.com>
References: <1458652125-4527-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35242 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991AbcCVOGx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 10:06:53 -0400
Received: by mail-oi0-f49.google.com with SMTP id w20so120631485oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 07:06:53 -0700 (PDT)
In-Reply-To: <1458652125-4527-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 22, 2016 at 2:08 PM,  <kamlakant.patel@broadcom.com> wrote:

> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> - Add GPIO support for Broadcom Vulcan ARM64.
> - Add depends on ARCH_VULCAN to Kconfig to enable gpio controller
>   driver for Broadcom Vulcan ARM64 SoCs.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
(...)
> +       {
> +               .compatible = "brcm,vulcan-gpio",
> +               .data       = (void *)GPIO_VARIANT_VULCAN,
> +       },

Please patch:
Documentation/devicetree/bindings/gpio/gpio-xlp.txt

TO contain the new compatible.

It's fine with me to do in the same patch.

No other problems with this, just fix that and I will apply it.

Yours,
Linus Walleij
