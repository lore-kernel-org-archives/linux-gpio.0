From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/2] pinctrl: meson: prepare for new SoC
Date: Wed, 11 Oct 2017 17:15:29 -0700
Message-ID: <7hshepfcgu.fsf@baylibre.com>
References: <20171011120230.30483-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:55174 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdJLAPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 20:15:42 -0400
Received: by mail-pf0-f170.google.com with SMTP id m28so2541797pfi.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 17:15:42 -0700 (PDT)
In-Reply-To: <20171011120230.30483-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Wed, 11 Oct 2017 14:02:28 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The goal of this patchset is to prepare meson pinctrl driver to
> add a new meson SoC support. This new SoC will share the same pinconf/gpio
> registers but the pinmux part will be slightly different.
>
> First patch allows to compile and ship only the necessary pinctrl drivers,
> depending on the architecture and configuration needs. This should save
> a bit of memory.
>
> Second patch provide a way to deal with a different pinmux scheme, while
> reusing most of the meson pinctrl driver.
>
> Linus, FYI, this series depends on the meson changes you have already
> merged in this cycle.
>
> Change since v1: [0]
> * Use of_device_get_match_data() in patch
> * Change pmx naming scheme for the SoC parts
>
> [0]: https://lkml.kernel.org/r/20171009101747.16940-1-jbrunet@baylibre.com
>
> Jerome Brunet (2):
>   pinctrl: meson: separate soc drivers
>   pinctrl: meson: rework pinmux ops

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
