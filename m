From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: use dev_err() to show message in pinmux_func_name_to_selector()
Date: Mon, 27 Jul 2015 14:45:11 +0200
Message-ID: <CACRpkdZ-eZgQ251rcgP0+yU+H8=wYaM1dY-sFU+eEVKRsRFyVg@mail.gmail.com>
References: <1437459927-5278-1-git-send-email-yamada.masahiro@socionext.com>
	<1437459927-5278-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36708 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344AbbG0MpL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:45:11 -0400
Received: by oibn4 with SMTP id n4so50350886oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:45:11 -0700 (PDT)
In-Reply-To: <1437459927-5278-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 21, 2015 at 8:25 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Use dev_err() rather than pr_err() to display the error message.
>
> pinctrl_dev_get_name(pctldev) is no longer necessary because
> dev_err() shows which device the message is related to.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
