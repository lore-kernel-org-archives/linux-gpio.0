From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson: get rid of unneeded domain structures
Date: Mon, 15 Aug 2016 17:57:59 -0500
Message-ID: <m2a8gdabd4.fsf@baylibre.com>
References: <1471110078-5946-1-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:38543 "EHLO
	mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbcHOW6B (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2016 18:58:01 -0400
Received: by mail-it0-f44.google.com with SMTP id n128so19965586ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2016 15:58:01 -0700 (PDT)
In-Reply-To: <1471110078-5946-1-git-send-email-b.galvani@gmail.com> (Beniamino
	Galvani's message of "Sat, 13 Aug 2016 19:41:18 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

Beniamino Galvani <b.galvani@gmail.com> writes:

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

Looks good and boot tested on meson-gxbb-p200:

Acked-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
