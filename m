From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/15] ARM: sa1100: don't preallocate IRQ space for locomo
Date: Fri, 31 Oct 2014 08:50:47 +0100
Message-ID: <CACRpkdZnAtXtdtKbuqj8a_6a=2jS_Jf6yrq=iz-GJV+4RifRhw@mail.gmail.com>
References: <1414454528-24240-1-git-send-email-dbaryshkov@gmail.com>
	<1414454528-24240-10-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:48920 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756506AbaJaHus (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Oct 2014 03:50:48 -0400
Received: by mail-ig0-f175.google.com with SMTP id h3so488378igd.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2014 00:50:47 -0700 (PDT)
In-Reply-To: <1414454528-24240-10-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Andrea Adami <andrea.adami@gmail.com>, Russell King <linux@arm.linux.org.uk>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Alexandre Courbot <gnurou@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Jingoo

On Tue, Oct 28, 2014 at 1:02 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:

> As new locomo driver properly supports SPARSE_IRQ, stop playing with
> NR_IRQS on sa1100 (locomo was the last chip requiring NR_IRQ tricks).
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

That's right! By moving to irqdomain things get even better :)

Yours,
Linus Walleij
