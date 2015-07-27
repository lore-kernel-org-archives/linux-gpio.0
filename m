From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: sunxi: Add custom irq_domain_ops
Date: Mon, 27 Jul 2015 14:04:38 +0200
Message-ID: <CACRpkdagO0DhB_1KLcKDPJ9RoKx=aiUMLMX59bZOXkA4PcN8cg@mail.gmail.com>
References: <1437396074-15791-1-git-send-email-maxime.ripard@free-electrons.com>
	<1437396074-15791-4-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36729 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059AbbG0MEj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:04:39 -0400
Received: by oibn4 with SMTP id n4so49824192oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:04:39 -0700 (PDT)
In-Reply-To: <1437396074-15791-4-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jul 20, 2015 at 2:41 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The current interrupt parsing code was working by accident, because the
> default was actually parsing the first node of interrupts.
>
> While that was mostly working (and the flags were actually ignored), this
> binding has never been documented, and doesn't work with SoCs that have
> multiple interrupt banks anyway.
>
> Add a proper interrupt xlate function, that uses the same description than
> the GPIOs (<bank> <pin> <flags>), that will make things less confusing.
>
> The EINT number will still be used as the hwirq number, but won't be
> exposed through the DT.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

This patch does not apply to the pinctrl devel branch.

Does it need to be rebased or do I need to merge in fixes?

Holding patch 3/4 and 4/4 until this is resolved.

Yours,
Linus Walleij
