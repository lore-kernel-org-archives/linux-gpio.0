From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson: fix gpio request disabling other modes
Date: Tue, 06 Dec 2016 16:47:41 -0800
Message-ID: <m2bmwoftua.fsf@baylibre.com>
References: <20161206140817.11708-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:35953 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbcLGArn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2016 19:47:43 -0500
Received: by mail-pf0-f173.google.com with SMTP id 189so73347021pfz.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2016 16:47:43 -0800 (PST)
In-Reply-To: <20161206140817.11708-1-narmstrong@baylibre.com> (Neil
        Armstrong's message of "Tue, 6 Dec 2016 15:08:16 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linus.walleij@linaro.org, carlo@caione.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>

Neil Armstrong <narmstrong@baylibre.com> writes:

> The pinctrl_gpio_request is called with the "full" gpio number, already
> containing the base, then meson_pmx_request_gpio is then called with the
> final pin number.
> Remove the base addition when calling meson_pmx_disable_other_groups.
>
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> CC: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
