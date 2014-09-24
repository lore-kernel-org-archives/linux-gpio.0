From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: Fix ngpio in gpio-xilinx driver
Date: Wed, 24 Sep 2014 13:38:04 +0200
Message-ID: <CACRpkdYW17RtVEfGia8Lp2RE3WB1_TPone5ZHbY86WQ2RLezYg@mail.gmail.com>
References: <1411031032-20649-1-git-send-email-gvormayr@gmail.com>
	<1411513125-20712-1-git-send-email-gvormayr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:50200 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974AbaIXLiG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 07:38:06 -0400
Received: by mail-ie0-f177.google.com with SMTP id x19so10872207ier.8
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 04:38:04 -0700 (PDT)
In-Reply-To: <1411513125-20712-1-git-send-email-gvormayr@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gernot Vormayr <gvormayr@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 24, 2014 at 12:58 AM, Gernot Vormayr <gvormayr@gmail.com> wrote:

> If one adds gpio-controller; to the chip in the devicetree, then
> initialization fails with 'gpiochip_find_base: cannot find free range',
> because ngpio is 0. This patch fixes the bug.
>
> This version includes the suggestions from Linus Walleij.
>
> Tested on ml507 board.
>
> Signed-off-by: Gernot Vormayr <gvormayr@gmail.com>

Patch applied.

Yours,
Linus Walleij
