From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: Drop pinctrl_unregister for devm_
 registered device
Date: Thu, 4 Aug 2016 10:10:23 +0200
Message-ID: <CACRpkdZutfsuRn9_QfsF6dzMWNyQp-Enic7MiibxkzV-dS24Vg@mail.gmail.com>
References: <1469544718-32001-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34612 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932346AbcHDIKY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2016 04:10:24 -0400
Received: by mail-oi0-f51.google.com with SMTP id k131so5532182oib.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2016 01:10:24 -0700 (PDT)
In-Reply-To: <1469544718-32001-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>

On Tue, Jul 26, 2016 at 4:51 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> It's not necessary to unregister pin controller device registered
> with devm_pinctrl_register() and using pinctrl_unregister() leads
> to a double free.
>
> This is detected by Coccinelle semantic patch.
>
> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>

Patch applied for fixes with Dmitry's and Kevin's tags.

Yours,
Linus Walleij
