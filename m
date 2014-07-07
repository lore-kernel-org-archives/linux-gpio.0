From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-pxa: gpio0 and gpio1 support on dt
Date: Mon, 7 Jul 2014 12:55:19 +0200
Message-ID: <CACRpkdYX-k3bwcCNibxX7wrrZDo6eJ8GrU+yv79tJvz4hWRPOA@mail.gmail.com>
References: <1401995603-25997-1-git-send-email-andrew.ruder@elecsyscorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:56565 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbaGGKzU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jul 2014 06:55:20 -0400
Received: by mail-ob0-f170.google.com with SMTP id uz6so4454916obc.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2014 03:55:20 -0700 (PDT)
In-Reply-To: <1401995603-25997-1-git-send-email-andrew.ruder@elecsyscorp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Jun 5, 2014 at 9:13 PM, Andrew Ruder
<andrew.ruder@elecsyscorp.com> wrote:

> pxa_gpio_probe() has some issues supporting the gpio0 and gpio1
> interrupts under device-tree - it never actually sets up the chain
> handler to get interrupts on edge detect for GPIO0 and GPIO1.
>
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Patch applied with Haojian's ACK.

Yours,
Linus Walleij
