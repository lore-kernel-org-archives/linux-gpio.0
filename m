From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: Prevent an integer overflow in the pca953x driver
Date: Sat, 23 May 2015 15:22:56 +0900
Message-ID: <CAAVeFuLP-R21skS9G+pyhh7sqgKMMz-89draed5uxpm+kf+TLA@mail.gmail.com>
References: <1432254912-17153-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:36003 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753249AbbEWGXR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 May 2015 02:23:17 -0400
Received: by igbpi8 with SMTP id pi8so5600323igb.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2015 23:23:16 -0700 (PDT)
In-Reply-To: <1432254912-17153-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>

On Fri, May 22, 2015 at 9:35 AM, Joshua Scott
<joshua.scott@alliedtelesis.co.nz> wrote:
> Interrupts were missed if an 8-bit integer overflow occurred. This was
> observed when bank0,pin7 and bank1,pin7 changed simultaniously.
>
> As the 8-bit totals were only checked against zero, replace them with
> booleans. Name the booleans so that their purpose is clear.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>

Looks good, I wonder why += was used instead of |= ? Or why a bool was
not used in the first place since per-pin information is never used
anyway.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
