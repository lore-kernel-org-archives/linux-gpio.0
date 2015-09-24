From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RESEND] gpio:Fix error checking in the function device_pca957x_init
Date: Thu, 24 Sep 2015 14:34:58 +0900
Message-ID: <CAAVeFuJbi_gpNeWSjcw0_RpLcSOZ50D55_7somkuB4HEeVCgNA@mail.gmail.com>
References: <1443062553-4903-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35668 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752511AbbIXFfS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 01:35:18 -0400
In-Reply-To: <1443062553-4903-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 24, 2015 at 11:42 AM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes error checking in the function device_pca957x_init
> to properly check and return error code values from the calls
> to the function pca953x_write_regs if they fail as to properly
> signal callers when a error occurs due a failure when writing
> registers for this gpio based device.

I gave a Reviewed-by to the previous iteration of this patch but you
have not included it in this one.

Besides I also asked you to add a space after "gpio:" in your subject
line, but you have ignored this as well.
