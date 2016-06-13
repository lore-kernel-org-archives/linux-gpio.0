From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 104-idi-48: Fix missing spin_lock_init for ack_lock
Date: Mon, 13 Jun 2016 14:48:52 +0200
Message-ID: <CACRpkdZHYSD+1-N-1jdWzs_XnfSXwuH0qpjuypWUYXL1EcB+OQ@mail.gmail.com>
References: <1465796933.11725.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35410 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422747AbcFMMsx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:48:53 -0400
Received: by mail-oi0-f42.google.com with SMTP id w5so126320911oib.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 05:48:53 -0700 (PDT)
In-Reply-To: <1465796933.11725.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 13, 2016 at 7:48 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Fixes: 9ae482104cb9 ("gpio: 104-idi-48: Clear pending interrupt once in IRQ handler")
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for fixes with William's ACK.

Yours,
Linus Walleij
