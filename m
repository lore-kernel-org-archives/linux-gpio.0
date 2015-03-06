From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: baytrail: Relax GPIO request rules
Date: Fri, 6 Mar 2015 12:20:19 +0100
Message-ID: <CACRpkdYiC6cgkQ3x4TrZiuisF+nKu-xtwXLnJfy8Ev-g-gaR_Q@mail.gmail.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
	<1424695993-43707-2-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:45818 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755362AbbCFLUU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 06:20:20 -0500
Received: by oifu20 with SMTP id u20so17040202oif.12
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 03:20:19 -0800 (PST)
In-Reply-To: <1424695993-43707-2-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 23, 2015 at 1:53 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Zotac ZBOX PI320, a Baytrail based mini-PC, has power button connected to a
> GPIO pin and it is exposed to the operating system as Windows 8 button
> array. This is implemented in Linux as a driver using gpio_keys.
>
> However, BIOS on this particula machine forgot to mux the pin to be a GPIO
> instead of native function, which results following message to be seen on
> the console:
>
>  byt_gpio INT33FC:02: pin 16 cannot be used as GPIO.
>
> This causes power button to not work as the driver was not able to request
> the GPIO it needs.
>
> So instead of completely preventing this we allow turning the pin as GPIO
> but issue warning that something might be wrong.
>
> Reported-by: Benjamin Adler <benadler@gmx.net>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
