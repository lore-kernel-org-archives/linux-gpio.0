From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 03/23] gpio: sysfs: fix redundant lock-as-irq handling
Date: Tue, 12 May 2015 09:59:26 +0200
Message-ID: <CACRpkdaHrTU26z-zD8dyyiasCffQu6083ogZu+68EPpTXe5pCw@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-4-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34486 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932128AbbELH70 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:59:26 -0400
Received: by obfe9 with SMTP id e9so118582260obf.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:59:26 -0700 (PDT)
In-Reply-To: <1430752248-15401-4-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Drivers should call gpiochip_lock_as_irq (which prevents the pin
> direction from being changed) in their irq_request_resources callbacks
> but some drivers currently fail to do so.
>
> Instead a second, explicit and often redundant call to lock-as-irq is
> made by the sysfs-interface implementation after an irq has been
> requested.
>
> Move the explicit call before the irq-request to match the unlock done
> after the irq is later released. Note that this also fixes an irq leak,
> should the explicit call ever have failed.
>
> Also add a comment about removing the redundant call once the broken
> drivers have been fixed.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
