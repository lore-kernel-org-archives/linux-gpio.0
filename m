From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: core: Warn about NULL gpio_chip in pinctrl_ready_for_gpio_range()
Date: Tue, 8 Sep 2015 16:11:42 +0200
Message-ID: <CACRpkdbQBt_p74ke3TV94gZ5wa=87th+f5jOLNSZFFhFbn3NEw@mail.gmail.com>
References: <1441301670-6498-1-git-send-email-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33763 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755038AbbIHOLn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 10:11:43 -0400
Received: by oixx17 with SMTP id x17so59416292oix.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 07:11:42 -0700 (PDT)
In-Reply-To: <1441301670-6498-1-git-send-email-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Sep 3, 2015 at 7:34 PM, Tony Lindgren <tony@atomide.com> wrote:

> If the gpio driver is confused about the numbers for gpio-ranges,
> pinctrl_ready_for_gpio_range() may get called with invalid GPIO
> causing a NULL pointer exception. Let's instead provide a warning
> that allows fixing the problem and return with error.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied for fixes.

Yours,
Linus Walleij
