From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: lantiq: remove bogus of_gpio_chip_add
Date: Wed, 14 Jan 2015 14:18:06 +0100
Message-ID: <CACRpkdb7=t5YXNTPv3xGUerKe62-dG+UJD9a7+Mz1aW5v_vMTA@mail.gmail.com>
References: <1421079651-2650-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:61273 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752018AbbANNSG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 08:18:06 -0500
Received: by mail-ie0-f174.google.com with SMTP id at20so8642070iec.5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 05:18:06 -0800 (PST)
In-Reply-To: <1421079651-2650-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 12, 2015 at 5:20 PM, Johan Hovold <johan@kernel.org> wrote:

> Remove bogus call to of_gpiochip_add (and of_gpio_chip remove in error
> path) which is also called when adding the gpio chip.
>
> This prevents adding the same pinctrl range twice.
>
> Fixes: 3f8c50c9b110 ("OF: pinctrl: MIPS: lantiq: implement lantiq/xway
> pinctrl support")
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Very weird. Patch applied.

Yours,
Linus Walleij
