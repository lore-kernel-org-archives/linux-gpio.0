From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: nomadik: queue pinctrl_request_gpio()
Date: Sat, 17 Aug 2013 10:51:27 +0200
Message-ID: <CACRpkdYHjYkxRQ1aA--yWR+JXOJGh+=TU47xj2LpA6CCkiFy+Q@mail.gmail.com>
References: <1376697278-18839-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:51809 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752220Ab3HQIv2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Aug 2013 04:51:28 -0400
Received: by mail-ob0-f179.google.com with SMTP id fb19so2941244obc.38
        for <linux-gpio@vger.kernel.org>; Sat, 17 Aug 2013 01:51:28 -0700 (PDT)
In-Reply-To: <1376697278-18839-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

On Sat, Aug 17, 2013 at 1:54 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Instead of deferring if pinctrl_request_gpio() returns
> -EPROBE_DEFER, queue the GPIO number and request it later,
> when the pinctrl part of the driver probes.

After sleeping on it I realized this is a problem in the pinctrl core
and wrote another patch doing this for *all* pinctrl drivers, right
in the pinctrl core. Will send out separately.

Yours,
Linus Walleij
