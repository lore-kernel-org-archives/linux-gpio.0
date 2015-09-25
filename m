From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio:Fix error checking in the function device_pca957x_init
Date: Fri, 25 Sep 2015 09:54:21 -0700
Message-ID: <CACRpkdZghuarCU83uW6FPkjKFTh2+8HWO1xxbnRQd9h5+_Hmrg@mail.gmail.com>
References: <1440625939-18667-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34601 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234AbbIYQyV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 12:54:21 -0400
Received: by oiev17 with SMTP id v17so61294698oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 09:54:21 -0700 (PDT)
In-Reply-To: <1440625939-18667-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 26, 2015 at 2:52 PM, Nicholas Krause <xerofoify@gmail.com> wrote:

> This fixes error checking in the function device_pca957x_init
> to properly check and return error code values from the calls
> to the function pca953x_write_regs if they fail as to properly
> signal callers when a error occurs due a failure when writing
> registers for this gpio based device.
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>

Patch applied with Alexandre's review tag.

Yours,
Linus Walleij
