From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] pinctrl: meson: separate soc drivers
Date: Mon, 16 Oct 2017 14:00:33 +0200
Message-ID: <CACRpkdavA_yLJb81K+-q0Bpd5Lt4DqiZyBaDX5xAbEyW-8ROWg@mail.gmail.com>
References: <20171012124026.2111-1-jbrunet@baylibre.com> <20171012124026.2111-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:47127 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752226AbdJPMAe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 08:00:34 -0400
Received: by mail-io0-f170.google.com with SMTP id h70so15790415ioi.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 05:00:34 -0700 (PDT)
In-Reply-To: <20171012124026.2111-2-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 12, 2017 at 2:40 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> When meson pinctrl is enabled, all meson platforms pinctrl drivers are
> built in the kernel, with a significant amount of data.
>
> This leads to situation where pinctrl drivers targeting an architecture
> are also compiled and shipped on another one (ex: meson8 - ARM - compiled
> and shipped on ARM64 builds). This is a waste of memory we can easily
> avoid.
>
> This change makes 4 pinctrl drivers (1 per SoC) out the original single
> driver, allowing to compile and ship only the ones required.
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
