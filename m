From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: bcm-kona: Implement get_direction callback
Date: Mon, 27 Apr 2015 15:30:52 +0200
Message-ID: <CACRpkdYhCyoBPSudP9C5jx-sLbTSvpKLPjeu07GicUgPLWOk3w@mail.gmail.com>
References: <1428911760.25188.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36156 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932653AbbD0Nax (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 09:30:53 -0400
Received: by obbeb7 with SMTP id eb7so82919427obb.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2015 06:30:53 -0700 (PDT)
In-Reply-To: <1428911760.25188.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Apr 13, 2015 at 9:56 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Implement gpio_chip's get_direction() callback, that lets other drivers get
> particular GPIOs direction using gpiod_get_direction().
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> v2: Make bcm_kona_gpio_get_dir explicitly return GPIOF_DIR_IN or GPIOF_DIR_OUT.

Patch applied with Ray's review tag.

Yours,
Linus Walleij
