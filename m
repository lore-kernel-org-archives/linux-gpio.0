From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: single: dra7: remove PCS_QUIRK_SHARED_IRQ
Date: Thu, 16 Jul 2015 14:36:12 +0200
Message-ID: <CACRpkdYZ7gABkmdJfS9S=hXnjYtP6-YOQmo7OsBWf+_hC03DdQ@mail.gmail.com>
References: <1436195510-23880-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34012 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753529AbbGPMgM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 08:36:12 -0400
Received: by obre1 with SMTP id e1so45913277obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 05:36:12 -0700 (PDT)
In-Reply-To: <1436195510-23880-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>

On Mon, Jul 6, 2015 at 5:11 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> On DRA7 there is one pinctrl domain (dra7_pmx_core) and
> PRCM wake-up IRQ is not shared, so remove quirk.
>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Fixes: 31320beaa3d3 ('pinctrl: single: Add DRA7 pinctrl compatibility')
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
