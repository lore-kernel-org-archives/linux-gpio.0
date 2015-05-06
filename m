From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinmux: allow exlusive pin allocation among GPIO and
 peripheral funtions via flag strict in struct pinctrl_desc
Date: Wed, 6 May 2015 14:42:58 +0200
Message-ID: <CACRpkdYbqFeSYXn9Kdt6AqhTbZP+jWaT8KGbt-TERSyzainaeg@mail.gmail.com>
References: <1428549187-9377-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33107 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750940AbbEFMm7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 08:42:59 -0400
Received: by obblk2 with SMTP id lk2so5809894obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2015 05:42:58 -0700 (PDT)
In-Reply-To: <1428549187-9377-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Thu, Apr 9, 2015 at 5:13 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
>
> The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
> for both GPIO and peripheral function. So, add flag strict in struct
> pinctrl_desc to check both gpio_owner and mux_owner before approving the
> pin request.
>
> v2-changes:
> - if strict flag is set, check gpio_owner and mux_onwer in if and else clause
>
> v3-changes:
> - add kerneldoc for this struct
> - augment Documentation/pinctrl.txt
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Patch applied and then I made some more patches on top to
move around and test it out, sorry for taking so long. (Merge
window chaos.)

Sending my additional patches soon!

Yours,
Linus Walleij
