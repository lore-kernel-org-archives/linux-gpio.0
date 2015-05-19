From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: lpc18xx: add the missing group function map
Date: Tue, 19 May 2015 11:07:43 +0200
Message-ID: <CACRpkdZZ8669umQ8juihZczVzw+w3_Y6PzyH3WqQNNZmjMOTUQ@mail.gmail.com>
References: <1431607558-26887-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34689 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751817AbbESJHo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2015 05:07:44 -0400
Received: by obfe9 with SMTP id e9so7255856obf.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2015 02:07:43 -0700 (PDT)
In-Reply-To: <1431607558-26887-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, May 14, 2015 at 2:45 PM, Joachim Eastwood <manabian@gmail.com> wrote:

> Add the required group function map and fill it at probe using
> the pin capabilities information already present in the driver.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
>
> Hi Linus,
>
> Seems like the implementation of the group function map was missing
> from the pinctrl driver. The lpc18xx_pmx_get_func_groups function
> was actually returning uninitlized pointers, but it seems like this,
> for some reason, "works" on my nommu platform(!). This is the reason
> why it took me a while to notice it.
>
> After this patch the pinmux-functions debugfs file starts to work and
> the displayed result looks correct. Small snippet below.
>
> Patch based on your pintrl devel branch.

That's normal development :)

Patch applied.

Yours,
Linus Walleij
