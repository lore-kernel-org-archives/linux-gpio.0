From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tb10x: Drop unneeded free_irq() call
Date: Tue, 2 Jun 2015 11:26:30 +0200
Message-ID: <CACRpkdYfAtWmH_VpWOTkOSpR6FkY4c70GTjp8vpwRXA=kFNoJw@mail.gmail.com>
References: <1432805170.22632.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34408 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585AbbFBJ0b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 05:26:31 -0400
Received: by oifu123 with SMTP id u123so121193396oif.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 02:26:30 -0700 (PDT)
In-Reply-To: <1432805170.22632.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, May 28, 2015 at 11:26 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Current code uses devm_request_irq() in .probe, so drop the unneeded
> free_irq() call in .remove.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Christians ACK.

Yours,
Linus Walleij
