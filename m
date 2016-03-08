From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl-bcm2835: Fix cut-and-paste error in "pull" parsing
Date: Tue, 8 Mar 2016 15:18:26 +0700
Message-ID: <CACRpkdZT9BvDc3f4mf22jGb5PQOVVgBU+pSrzhxrqfbczHNG8Q@mail.gmail.com>
References: <1456795808-1449-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:32881 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753677AbcCHIS1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 03:18:27 -0500
Received: by mail-ob0-f177.google.com with SMTP id fz5so7374356obc.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 00:18:26 -0800 (PST)
In-Reply-To: <1456795808-1449-1-git-send-email-eric@anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Elwell <phil@raspberrypi.org>, stable <stable@vger.kernel.org>

On Tue, Mar 1, 2016 at 8:30 AM, Eric Anholt <eric@anholt.net> wrote:

> From: Phil Elwell <phil@raspberrypi.org>
>
> The DT bindings for pinctrl-bcm2835 allow both the function and pull
> to contain either one entry or one per pin. However, an error in the
> DT parsing can cause failures if the number of pulls differs from the
> number of functions.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Cc: stable@vger.kernel.org
> ---
>
> Yes, the s-o-b differs from the author of the commit, but this falls
> under part b) of the process.
>
> Phil, any chance you could start putting Signed-off-by lines on your
> kernel commits?

Patch applied with the extra SoB and Stephen's review tag.

Yours,
Linus Walleij
