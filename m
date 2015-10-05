From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Mon, 5 Oct 2015 10:54:52 +0200
Message-ID: <CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
	<20151004133742.GO4284@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35790 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751973AbbJEIyx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 04:54:53 -0400
Received: by obbzf10 with SMTP id zf10so123453074obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 01:54:53 -0700 (PDT)
In-Reply-To: <20151004133742.GO4284@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>

On Sun, Oct 4, 2015 at 3:37 PM, Johan Hovold <johan@kernel.org> wrote:

> This looks good (apart from the checkpatch warning for the warning
> message string).

Yeah the GPIO maintainer is liberal about that rule...

> You also need to revert ddd5404007b8 ("gpio-sysfs: Use gpio descriptor
> name instead of gpiochip names array") however as this is an ABI change.
> Otherwise pins with a name in DT will now be exported using the gpio name
> rather than number as they used to be. [ The current behaviour is
> maintained by exporting names from chip->names for hard coded names
> only. ]

I think it is ABI-correct: it uses desc->name if that is set, and
currently that is only set from chip->names[] so status quo.

Yours,
Linus Walleij
