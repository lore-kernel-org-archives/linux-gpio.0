From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] gpio: fix gpio_chip add and remove
Date: Wed, 14 Jan 2015 14:27:41 +0100
Message-ID: <CACRpkdZwbigvBE0X9zwAWaaPp4Nt2gHxY+7nrKX5KTOy7J97RA@mail.gmail.com>
References: <1421079149-2236-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:40862 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345AbbANN1m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 08:27:42 -0500
Received: by mail-ie0-f169.google.com with SMTP id y20so8712664ier.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 05:27:41 -0800 (PST)
In-Reply-To: <1421079149-2236-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 12, 2015 at 5:12 PM, Johan Hovold <johan@kernel.org> wrote:

> This series fix a few issues with gpiochip_add and gpiochip_remove.
>
> The gpio-chip removal paths have probably not been exercised much, and
> there are further issues here that I'm working on fixing in order better
> support hot-plugging of gpio chips. I believe these patches should go
> into 3.19 meanwhile.

GOOD STUFF!
All six applied for fixes.

Yours,
Linus Walleij
