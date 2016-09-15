From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH v2 2/4] pinctrl: amlogic: gxbb: add nand pins
Date: Thu, 15 Sep 2016 14:15:23 +0200
Message-ID: <CACRpkda5PZ9UJ8oKVp7rJ3+G1+pt1a_HuGEpfL4zar=zps52MQ@mail.gmail.com>
References: <1473779542-2635-1-git-send-email-jbrunet@baylibre.com> <1473779542-2635-2-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35739 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933595AbcIOMPY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 08:15:24 -0400
Received: by mail-oi0-f52.google.com with SMTP id w11so65907393oia.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 05:15:24 -0700 (PDT)
In-Reply-To: <1473779542-2635-2-git-send-email-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 13, 2016 at 5:12 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add EE domains pins for the NAND flash controller.
> Even tough we have no driver for the NAND flash controller yet, we need
> to have these pins in pinctrl as the actual pin are shared with the spifc
> controller. The bootloader on the S905-P200 setup pinmux for the NAND
> controller so we need the kernel to properly deactivate this if necessary.
>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
