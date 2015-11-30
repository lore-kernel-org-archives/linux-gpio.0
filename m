From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 104-idio-16: Disable IRQ on device probe
Date: Mon, 30 Nov 2015 14:42:29 +0100
Message-ID: <CACRpkdaXhsrRnZvgavS-hf7TgrGVsz43HwCPLR-2S=YtiGOZ5g@mail.gmail.com>
References: <20151122163855.GA18100@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33486 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753881AbbK3Nma (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 08:42:30 -0500
Received: by obbww6 with SMTP id ww6so126819446obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 05:42:29 -0800 (PST)
In-Reply-To: <20151122163855.GA18100@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Nov 22, 2015 at 5:38 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> IRQ should be disabled on device probe so that the device IRQ is in a
> known starting state. If IRQ is not disabled, interrupts may be reported
> as handled by the IRQ handler, despite no irq_unmask calls made by the
> user.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
