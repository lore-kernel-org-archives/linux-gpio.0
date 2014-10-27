From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: amd8111: unmap ioport on failure case
Date: Mon, 27 Oct 2014 16:27:27 +0100
Message-ID: <CACRpkdZjqLUMVGZzqkK+E+0BBquu8fw-=6FivFzmO8cUnZe5dw@mail.gmail.com>
References: <1412157780-32219-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:48621 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbaJ0P12 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Oct 2014 11:27:28 -0400
Received: by mail-ig0-f171.google.com with SMTP id l13so6512954iga.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 08:27:27 -0700 (PDT)
In-Reply-To: <1412157780-32219-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 1, 2014 at 12:03 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:

> This change unmaps ioport when gpiochip_add fails
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>

Patch applied. Sorry for disproportionate delays...

Yours,
Linus Walleij
