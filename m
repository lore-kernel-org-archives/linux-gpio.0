From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: fix nested irqs rescheduling
Date: Thu, 16 Jul 2015 14:40:58 +0200
Message-ID: <CACRpkdbYxL7rTGXfa7JvK7ux-Nj+0kafgtvSmKb1D7ak3d8A5w@mail.gmail.com>
References: <1436279689-23427-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34736 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755108AbbGPMk7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 08:40:59 -0400
Received: by oigd21 with SMTP id d21so6877951oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 05:40:58 -0700 (PDT)
In-Reply-To: <1436279689-23427-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, Christian Gmeiner <christian.gmeiner@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 7, 2015 at 4:34 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> pca953x interrupt controller functionality is implemented using
> nested threaded IRQs which require parent_irq to be configured
> properly otherwise below warning can be seen if IRQ core
> will try re-schedule nested IRQ:

Ah, there is the patch.

Sorry for the delay, patch applied for fixes.

Yours,
Linus Walleij
