From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 19/23] gpio: sysfs: use per-gpio locking
Date: Tue, 12 May 2015 10:39:37 +0200
Message-ID: <CACRpkdb=-znbz3N3wkg8+3Tp_+MqC=JB9HWHos=-6eMXydguxA@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-20-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:32909 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932174AbbELIji (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:39:38 -0400
Received: by obblk2 with SMTP id lk2so193824obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:39:37 -0700 (PDT)
In-Reply-To: <1430752248-15401-20-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Add a per-gpio mutex to serialise attribute operations rather than use
> one global mutex for all gpios and chips.
>
> Having a single global lock for all gpios in a system adds unnecessary
> latency to the sysfs interface, and especially when having gpio
> controllers connected over slow buses.
>
> Now that the global gpio-sysfs interrupt table is gone and with per-gpio
> data in place, we can easily switch to using a more fine-grained locking
> scheme.
>
> Keep the global mutex to serialise the global (class) operations of gpio
> export and unexport and chip removal.
>
> Also document the locking assumptions made.
>
> Note that this is also needed to fix a race between gpiod_export and
> gpiod_unexport.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
