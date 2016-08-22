From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: get rid of unneeded domain structures
Date: Mon, 22 Aug 2016 11:23:07 +0200
Message-ID: <CACRpkdbnXjOBP7KtFa+0_u9fVrqNRtBvskOwPggGbA5yW7RgDg@mail.gmail.com>
References: <1471110078-5946-1-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33240 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752903AbcHVJXJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 05:23:09 -0400
Received: by mail-oi0-f54.google.com with SMTP id c15so142602123oig.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 02:23:08 -0700 (PDT)
In-Reply-To: <1471110078-5946-1-git-send-email-b.galvani@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Aug 13, 2016 at 7:41 PM, Beniamino Galvani <b.galvani@gmail.com> wrote:

> The driver originally supported more domains (register ranges) per
> pinctrl device, but since commit 9dab1868ec0d ("pinctrl: amlogic: Make
> driver independent from two-domain configuration") each device gets
> assigned a single domain and we instantiate multiple pinctrl devices
> in the DT.
>
> Therefore, now the 'meson_domain' and 'meson_domain_data' structures
> don't have any reason to exist and can be removed to make the model
> simpler to understand. This commit doesn't change behavior.
>
> Tested on a Odroid-C2.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>

Patch applied with Kevin's ACK/Test tags.

Yours,
Linus Walleij
