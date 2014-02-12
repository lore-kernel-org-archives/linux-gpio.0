From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] gpio: ich: Add support for Intel Avoton
Date: Wed, 12 Feb 2014 16:18:23 +0100
Message-ID: <CACRpkdYBEC=C+KjZAn30wU92rRnVCFyO_5CYr_3=7GdAV2AE6w@mail.gmail.com>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
	<1391779267-27084-6-git-send-email-vdonnefort@lacie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:44202 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269AbaBLPSX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 10:18:23 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp18so10632265obc.36
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2014 07:18:23 -0800 (PST)
In-Reply-To: <1391779267-27084-6-git-send-email-vdonnefort@lacie.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On Fri, Feb 7, 2014 at 2:21 PM, Vincent Donnefort <vdonnefort@gmail.com> wrote:

> From: Vincent Donnefort <vdonnefort@gmail.com>
>
> This patch adds support for Atom C2000 series (Avoton and Rangeley). And has
> the following options:
>   - New addresses register.
>   - Caching output levels (see Intel external design spec, table 48-29)
>   - No hardware blink.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

I need patches 1+2 to be merged first for this to work (apart from
that it's OK).

Can you try to obtain ACKs from Lee or Sam on the MFD portions?

Yours,
Linus Walleij
