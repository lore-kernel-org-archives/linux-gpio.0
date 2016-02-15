From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: set pin function as input on export
Date: Mon, 15 Feb 2016 23:04:26 +0100
Message-ID: <CACRpkdbd4f3yj2MnR6PU5SuhV5Tj4HzWLc0UX8jQkcJp7MoTig@mail.gmail.com>
References: <1454942242-25690-1-git-send-email-krzysztof.adamski@tieto.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33008 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752833AbcBOWE1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 17:04:27 -0500
Received: by mail-ob0-f181.google.com with SMTP id jq7so46589797obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 14:04:27 -0800 (PST)
In-Reply-To: <1454942242-25690-1-git-send-email-krzysztof.adamski@tieto.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Adamski <krzysztof.adamski@tieto.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>, Jonas Gorski <jogo@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Mon, Feb 8, 2016 at 3:37 PM, Krzysztof Adamski
<krzysztof.adamski@tieto.com> wrote:

> Default function of a pin in sunxi SoCs is "disabled". By default gpios
> exported by sysfs are set as input and indeed, when reading "direction"
> file you will get "in". The "value" pin won't return proper value,
> though, confusing user of this interface.
>
> This patch sets direction of a GPIO as input when exporting it.
>
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@tieto.com>

As maxime says it's not a sunxi problem.

So maybe it is wrong to set pins to either input or output when
exporting them, I suspect they should be exported as is.

Also: the sysfs ABI is deprecated. I suggest you invest your time
in working on the new chardev ABI.

Yours,
Linus Walleij
