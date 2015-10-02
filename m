From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] gpio: Fix error checking in the function device_pca957x_init
Date: Fri, 2 Oct 2015 04:04:34 -0700
Message-ID: <CACRpkdZ1CqKsQ=vAgRzWvkN8j-_9JPBSfXoyixfgB636OUx0JQ@mail.gmail.com>
References: <1443085767-5299-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34450 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbbJBLEf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 07:04:35 -0400
Received: by obbda8 with SMTP id da8so79261004obb.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 04:04:34 -0700 (PDT)
In-Reply-To: <1443085767-5299-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 24, 2015 at 2:09 AM, Nicholas Krause <xerofoify@gmail.com> wrote:

> This fixes error checking in the function device_pca957x_init
> to properly check and return error code values from the calls
> to the function pca953x_write_regs if they fail as to properly
> signal callers when a error occurs due a failure when writing
> registers for this gpio based device.
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Already merged.

Yours,
Linus Walleij
