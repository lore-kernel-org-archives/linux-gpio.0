From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: Bug fix of SPI device tree registration.
Date: Thu, 24 Apr 2014 15:04:04 +0200
Message-ID: <CACRpkdYOFZxLGHQu6qE8CWLXipkj-XEaRVCKZbi+v+tOJtV4jA@mail.gmail.com>
References: <1397696424-3394-1-git-send-email-mwelling@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:47091 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751631AbaDXNEE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Apr 2014 09:04:04 -0400
Received: by mail-oa0-f50.google.com with SMTP id i11so2556223oag.23
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2014 06:04:04 -0700 (PDT)
In-Reply-To: <1397696424-3394-1-git-send-email-mwelling@ieee.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Apr 17, 2014 at 3:00 AM, Michael Welling <mwelling@ieee.org> wrote:

> The chips variable needs to be incremented for each chip that is found in the
> spi_present_mask when register via device tree. Without this and the checking
> a negative index is passed to the data->chip array in a subsequent loop.
>
> Signed-off-by: Michael Welling <mwelling@ieee.org>

Patch applied for fixes and also tagged for stable.

Yours,
Linus Walleij
