From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: Remove suffix from gpiochip label
Date: Thu, 31 Aug 2017 14:45:47 +0200
Message-ID: <CACRpkdZXvjOkafYLDyKMshcH36s38tQ0wMbdz1CKpb1OhKKxOQ@mail.gmail.com>
References: <1503564738-32392-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33777 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751227AbdHaMps (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 08:45:48 -0400
Received: by mail-oi0-f48.google.com with SMTP id r203so4525842oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 05:45:48 -0700 (PDT)
In-Reply-To: <1503564738-32392-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Aug 24, 2017 at 10:52 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:

> The OF node name already contains the gpio chip identifier, no need to
> append it when creating the label.
>
> The following debug message clearly shows the suffix is not required
> "pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0-0 with 6
> pins"
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Patch applied.

Yours,
Linus Walleij
