From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinmux: 1 pin is not allowed to be configured for both
 GPIO and peripheral funtion
Date: Mon, 9 Mar 2015 16:46:41 +0100
Message-ID: <CACRpkdaLSZiqoQZrAkji_MsFCnr7hv7HwBe2_oFk+EPGeYMXww@mail.gmail.com>
References: <1424936504-32662-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33613 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754100AbbCIPql (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 11:46:41 -0400
Received: by oifz81 with SMTP id z81so30039857oif.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 08:46:41 -0700 (PDT)
In-Reply-To: <1424936504-32662-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Thu, Feb 26, 2015 at 8:41 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
>
> The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
> for both GPIO and peripheral function. So, check both gpio_owner and
> mux_owner before approving the pin request.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

So since there are pin controllers that can do this even though your
pin controller can't, you cannot forbit it for everyone like this.

We have discussed adding a field to struct pinctrl_desc,
bool strict, that would make the core disallow GPIOs and
functions to be used on a pin at the same time.

So if this behaviour is desired for a certain pin controller then
implement it like so: add bool strict to the struct pinctrl_desc,
and only do the above strict check for pin controllers that set
it, and set it for your pin controller.

Yours,
Linus Walleij
