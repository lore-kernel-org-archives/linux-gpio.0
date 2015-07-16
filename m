From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Thu, 16 Jul 2015 10:17:00 +0200
Message-ID: <CACRpkdatFhHezJ9csU6WrOq88ekf+zNY_5xcLRi3KNZF_w+N+w@mail.gmail.com>
References: <1435545357-4494-1-git-send-email-jun.nie@linaro.org>
	<1435545357-4494-2-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34678 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753693AbbGPIRA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 04:17:00 -0400
Received: by obre1 with SMTP id e1so42549921obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 01:17:00 -0700 (PDT)
In-Reply-To: <1435545357-4494-2-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawn.guo@linaro.org>, wan.zhijun@zte.com.cn, Jason Liu <jason.liu@linaro.org>

On Mon, Jun 29, 2015 at 4:35 AM, Jun Nie <jun.nie@linaro.org> wrote:

> Add ZTE zx296702 GPIO controller support
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Patch applied with Shawn's ACK.

Kudos for using GPIOLIB_IRQCHIP, well done.

> +       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
> +               chip->uses_pinctrl = true;

I see this follows the PL061 pattern, maybe we should start doing this
in the gpiolib core.

Yours,
Linus Walleij
