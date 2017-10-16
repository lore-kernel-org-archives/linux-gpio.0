From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] pinctrl: meson: rework pinmux ops
Date: Mon, 16 Oct 2017 14:01:50 +0200
Message-ID: <CACRpkdbM94-ovZWN3quuXBrmPxB+O1C=dxAqPCspf-Bragg7Qw@mail.gmail.com>
References: <20171012124026.2111-1-jbrunet@baylibre.com> <20171012124026.2111-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:52476 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752193AbdJPMBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 08:01:51 -0400
Received: by mail-it0-f54.google.com with SMTP id j140so843015itj.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 05:01:51 -0700 (PDT)
In-Reply-To: <20171012124026.2111-3-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 12, 2017 at 2:40 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This change prepare the introduction of new meson SoC. This new SoC will
> share the same gpio/pinconf registers but the pinmux part will be
> different. While the format of the data associated with each pinmux group
> will change, the way to handle pinmuxing will be similar.
>
> To deal with this new situation, the meson_pmx_struture is kept but the
> data associated to it is now generic. This allows to reuse the basic
> functions which would otherwise be copy/pasted in each pinmux driver
> (such as getting the name a count of groups and functions) Only the
> functions actually using this specific data is taken out of the common
> code and is handling the SoC pinmuxing
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
