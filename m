From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: of: Add support for multiple GPIOs in a single
 GPIO hog
Date: Thu, 22 Dec 2016 14:36:10 -0600
Message-ID: <20161222203610.dhmpg5oegthgpabu@rob-hp-laptop>
References: <1482171694-18237-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34034 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752585AbcLVUgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Dec 2016 15:36:13 -0500
Content-Disposition: inline
In-Reply-To: <1482171694-18237-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org

On Mon, Dec 19, 2016 at 07:21:34PM +0100, Geert Uytterhoeven wrote:
> When listing multiple GPIOs in the "gpios" property of a GPIO hog, only
> the first GPIO is affected.  The user is left clueless about the
> disfunctioning of the other GPIOs specified.
> 
> Fix this by adding and documenting support for specifying multiple
> GPIOs in a single GPIO hog.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt |  8 +++----
>  drivers/gpio/gpiolib-of.c                       | 31 ++++++++++++++++---------
>  2 files changed, 24 insertions(+), 15 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
