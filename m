From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: meson-gxl: Fix inverted registers and add
 missing pins
Date: Wed, 15 Mar 2017 10:43:57 +0100
Message-ID: <CACRpkdZ+x6vZQKfCoKD3dn-XzAxBBwMy=HF1Zi7SqXFWv28rZA@mail.gmail.com>
References: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com> <1488893462-7016-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:37731 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751509AbdCOJn7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:43:59 -0400
Received: by mail-it0-f52.google.com with SMTP id g138so15758856itb.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:43:58 -0700 (PDT)
In-Reply-To: <1488893462-7016-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 7, 2017 at 2:31 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Fix some inverted bit numbers in some pinctrl groups and add missing pins
> and groups to be in pair with the GXBB pinctrl pins definition.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This does not apply on my fixes branch and possibly no other
v4.11-rc1-based branch. Can you please rebase it and resend?

I guess this also needs queueing for fixes?

Yours,
Linus Walleij
