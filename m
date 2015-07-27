From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sunxi: Add custom irq_domain_ops
Date: Mon, 27 Jul 2015 14:57:01 +0200
Message-ID: <CACRpkda+pUGw=dDA4quMgFW7YJGCKF0ApqXi8Y7ZoYxPQWSZCQ@mail.gmail.com>
References: <1438000918-9026-1-git-send-email-maxime.ripard@free-electrons.com>
	<1438000918-9026-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34437 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753221AbbG0M5C (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:57:02 -0400
Received: by obre1 with SMTP id e1so58636095obr.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:57:01 -0700 (PDT)
In-Reply-To: <1438000918-9026-2-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jul 27, 2015 at 2:41 PM, Maxime Ripard
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
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Patch applied.

Yours,
Linus Walleij
