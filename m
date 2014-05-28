From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: pcf857x: Add IRQF_SHARED when request irq
Date: Wed, 28 May 2014 09:21:28 +0200
Message-ID: <CACRpkdaDTeBhCaxeO0F8EMH7H5dZy1-mdiwgfVB-vXUU_Df=hA@mail.gmail.com>
References: <1400824647-2525-1-git-send-email-george.cherian@ti.com>
	<1400824647-2525-2-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:62382 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155AbaE1HV3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 May 2014 03:21:29 -0400
Received: by mail-oa0-f53.google.com with SMTP id m1so10484257oag.26
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2014 00:21:28 -0700 (PDT)
In-Reply-To: <1400824647-2525-2-git-send-email-george.cherian@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: George Cherian <george.cherian@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Fri, May 23, 2014 at 7:57 AM, George Cherian <george.cherian@ti.com> wrote:

> It's quite possible that multiple pcf857x can be hooked up
> to the same interrupt line with the processor. So add IRQF_SHARED
> in request irq..
>
> Signed-off-by: George Cherian <george.cherian@ti.com>

Patch applied.

Yours,
Linus Walleij
