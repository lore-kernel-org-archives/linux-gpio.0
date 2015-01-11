From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv5 2/2] gpio: sch: Add support for Intel Quark X1000 SoC
Date: Mon, 12 Jan 2015 00:57:42 +0100
Message-ID: <CACRpkdaWBuMkLkO_Mh5-a+hCSSnpYj1nW2EL8bFD1_jPF=gL6A@mail.gmail.com>
References: <1418031490-17716-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1418031490-17716-3-git-send-email-rebecca.swee.fun.chang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:44049 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751043AbbAKX5m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jan 2015 18:57:42 -0500
Received: by mail-ie0-f181.google.com with SMTP id rl12so22867763iec.12
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2015 15:57:42 -0800 (PST)
In-Reply-To: <1418031490-17716-3-git-send-email-rebecca.swee.fun.chang@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: Mika Westerberg <mika.westerberg@intel.com>, Alexandre Courbot <gnurou@gmail.com>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Turischev <denis.turischev@compulab.co.il>

On Mon, Dec 8, 2014 at 10:38 AM, Chang Rebecca Swee Fun
<rebecca.swee.fun.chang@intel.com> wrote:

> Intel Quark X1000 provides a total of 16 GPIOs. The GPIOs are split between
> the legacy I/O bridge and the GPIO controller.
>
> GPIO-SCH is the GPIO pins on legacy bridge for Intel Quark SoC.
> Intel Quark X1000 has 2 GPIOs powered by the core power well and 6 from
> the suspend power well.
>
> This piece of work is derived from Dan O'Donovan's initial work for Quark
> X1000 enabling.
>
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
