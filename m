From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: amlogic: gxbb: add spi nor pins
Date: Tue, 13 Sep 2016 13:36:50 +0200
Message-ID: <CACRpkdZDhhqHF+NwC4yGoX4iLmw0O+thOd3+Syd+H7vJRa2bVg@mail.gmail.com>
References: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com> <1473409738-27175-2-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34204 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbcIMLgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 07:36:52 -0400
Received: by mail-oi0-f52.google.com with SMTP id m11so376809138oif.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 04:36:52 -0700 (PDT)
In-Reply-To: <1473409738-27175-2-git-send-email-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 9, 2016 at 10:28 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add EE domains pins for the SPI flash controller
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

This patch does not apply on the latest pinctrl devel
branch:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Please rebase, include Kevin's ACK and resend.

Goes for all pinctrl portions of the patch series.

Yours,
Linus Walleij
