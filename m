From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: use gpiolib API to mark a GPIO used
 as an IRQ
Date: Mon, 28 Jul 2014 12:11:28 +0200
Message-ID: <CACRpkdZHLgi1D-+pQmhS60tjrgEu82AnYH23UhSuHcCnFKKUsw@mail.gmail.com>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
	<1405358677-23657-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:44005 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095AbaG1KL3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jul 2014 06:11:29 -0400
Received: by mail-oi0-f43.google.com with SMTP id u20so5833271oif.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2014 03:11:29 -0700 (PDT)
In-Reply-To: <1405358677-23657-2-git-send-email-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Mon, Jul 14, 2014 at 7:24 PM, Chen-Yu Tsai <wens@csie.org> wrote:

> When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
> the gpiolib so we can keep track of the usage centrally.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
