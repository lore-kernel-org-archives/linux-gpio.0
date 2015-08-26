From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: vf610: handle level IRQ's properly
Date: Wed, 26 Aug 2015 14:47:37 +0200
Message-ID: <CACRpkdYqU_yvZE4WS2jBDOhemPy7dcHeOoj_dG61hCL8ugTMYg@mail.gmail.com>
References: <1440197802-29720-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34380 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134AbbHZMrh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 08:47:37 -0400
Received: by obbfr1 with SMTP id fr1so169687324obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 05:47:37 -0700 (PDT)
In-Reply-To: <1440197802-29720-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Aug 22, 2015 at 12:56 AM, Stefan Agner <stefan@agner.ch> wrote:

> The GPIO IRQ controller is able to generate level triggered
> interrupts, however, these were handled by handle_simple_irq so far
> which did not take care of IRQ masking. This lead to "nobody cared
> (try booting with the "irqpoll" option)" stack traces.
>
> Use the generic interrupt handlers depending on the IRQ type.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied.

Hm, this looks like a problem that could exist in a few more
GPIO drivers. Can you look around and see if there is something
immediately suspicious in drivers/gpio?

Yours,
Linus Walleij
