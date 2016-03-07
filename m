From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: core: create nolock version of pinctrl_find_gpio_range_from_pin
Date: Mon, 7 Mar 2016 10:41:54 +0700
Message-ID: <CACRpkdaOV01tq2AOf=Sdf_4__pjPdya=YQOPcFWNJw8VKXSY9A@mail.gmail.com>
References: <1456436679-22077-1-git-send-email-manabian@gmail.com>
	<1456436679-22077-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:33295 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbcCGDly (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 22:41:54 -0500
Received: by mail-ob0-f179.google.com with SMTP id fz5so95328005obc.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 19:41:54 -0800 (PST)
In-Reply-To: <1456436679-22077-2-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 4:44 AM, Joachim Eastwood <manabian@gmail.com> wrote:

> pinctrl_find_gpio_range_from_pin takes the pctldev->mutex but so
> does pinconf_pins_show and this will cause a deadlock if
> pinctrl_find_gpio_range_from_pin is used in .pin_config_get
> callback.
>
> Create a nolock version of pinctrl_find_gpio_range_from_pin to
> allow pin to gpio lookup to be used from pinconf_pins_show.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>

Excellent, patch applied.

Yours,
Linus Walleij
