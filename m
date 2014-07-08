From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-vr41xx.c: Cleaning up values that are never used
Date: Tue, 8 Jul 2014 09:24:59 +0200
Message-ID: <CACRpkdYh_o11Dk98g9fL2dYXRwSQ1rvCAoht3P0OEQYSCQoa0g@mail.gmail.com>
References: <1403789909-11252-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:34154 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752260AbaGHHY7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 03:24:59 -0400
Received: by mail-oa0-f48.google.com with SMTP id g18so704142oah.21
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2014 00:24:59 -0700 (PDT)
In-Reply-To: <1403789909-11252-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 26, 2014 at 3:38 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:

> Remove variable that are never used
>
> This was found using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Hm that was easy enough to fix up properly by actually checking
the return value so I cooked another patch and put you as
Reported-by:, should be on the linux-gpio list.

Yours,
Linus Walleij
