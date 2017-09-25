From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 1/3] irqdomain: export of_phandle_args_to_fwspec
Date: Mon, 25 Sep 2017 12:11:58 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709251211050.15252@nanos>
References: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com> <1505292990-22957-2-git-send-email-yamada.masahiro@socionext.com> <CACRpkdb_4xMvN=5TH=UNiHhKC7X-C4g+t2JoiR992Y12Q-818w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:44517 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933052AbdIYKMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2017 06:12:13 -0400
In-Reply-To: <CACRpkdb_4xMvN=5TH=UNiHhKC7X-C4g+t2JoiR992Y12Q-818w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Marc Zyngier <marc.zyngier@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 21 Sep 2017, Linus Walleij wrote:

> On Wed, Sep 13, 2017 at 10:56 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> 
> > This helper will be useful for irqchip drivers that need to convert
> > DT binding into IRQ fwspec.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> I'm waiting for the irqchip maintainers to have a look at this.
> 
> I can carry it in the GPIO tree, but Thomas often prefers to handle
> me an immutable git branch for infrastructure.

I don't think we have colliding stuff coming up, so please carry it in your
tree with Acked-by-me.

Thanks,

	tglx
