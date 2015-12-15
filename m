From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 050/182] gpio: pch: use gpiochip data pointer
Date: Tue, 15 Dec 2015 14:02:32 +0100
Message-ID: <CACRpkdYoPOYTiryLxctJ8iZj2U01zCKV3PMAnLAN7NyJzXfaOw@mail.gmail.com>
References: <1449667188-32127-1-git-send-email-linus.walleij@linaro.org>
	<20151214130709.7d0e5e75@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36630 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932887AbbLONCd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 08:02:33 -0500
Received: by mail-oi0-f51.google.com with SMTP id n133so4171034oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 05:02:32 -0800 (PST)
In-Reply-To: <20151214130709.7d0e5e75@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Thierry Reding <treding@nvidia.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>

On Mon, Dec 14, 2015 at 1:07 PM, Jean Delvare <jdelvare@suse.de> wrote:

> Looks good, although I can't test it without patches 001 and 002, which
> were not sent to me and are only archived by the download-unfriendly
> gmane.

Oopsie. I should have mentioned: you can pull the entire branch from
here:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=set-get-data

Yours,
Linus Walleij
