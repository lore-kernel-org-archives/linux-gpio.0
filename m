From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dln2: fix build breakage
Date: Wed, 13 May 2015 10:02:52 +0200
Message-ID: <CACRpkdaO9wUV302gvn+2derna0YMDamHKbDO4VbH2n6eE=KMwA@mail.gmail.com>
References: <1431436825-31612-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35842 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbbEMICw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 04:02:52 -0400
Received: by oift201 with SMTP id t201so25179342oif.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2015 01:02:52 -0700 (PDT)
In-Reply-To: <1431436825-31612-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, kbuild test robot <fengguang.wu@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 12, 2015 at 3:20 PM, Johan Hovold <johan@kernel.org> wrote:

> The dln2 driver was initialising a gpiolib private field, which is now
> gone.
>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
