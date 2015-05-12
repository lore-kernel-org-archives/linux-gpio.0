From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: lpc18xx: create pin cap lookup helper
Date: Tue, 12 May 2015 13:18:11 +0200
Message-ID: <CACRpkdY-_+Y3UqoSM7BHTukbwtRfi9w5Sf00NQsRQuPxXgr_gg@mail.gmail.com>
References: <1430932281-3432-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33350 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932296AbbELLSL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 07:18:11 -0400
Received: by oica37 with SMTP id a37so2935512oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 04:18:11 -0700 (PDT)
In-Reply-To: <1430932281-3432-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, May 6, 2015 at 7:11 PM, Joachim Eastwood <manabian@gmail.com> wrote:

> Both pconf_get_pin and pconf_set_pin needs to lookup pin cap based
> on the pin number. Create a common helper function that both
> functions can use that also handles the case where no pin number is
> found in the pins array.
>
> This also fixes a small bug in pconf_get_pin where pconf_get_i2c0
> would use the pins array index rather than the pin number.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
> Hi Linus,
>
> Patch is based on your linux-pinctrl devel branch.
> Since it's a new driver feel free to squash it with the initial commit.

Patch applied, removed the other hackish check.

Yours,
Linus Walleij
