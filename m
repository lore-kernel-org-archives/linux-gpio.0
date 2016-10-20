From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: oxnas: Add support for OX820
Date: Thu, 20 Oct 2016 15:22:27 +0200
Message-ID: <CACRpkdYqxz1UfTrh_7=JthBfpRaZPoqCNHcBV6rPa--6EuuWSQ@mail.gmail.com>
References: <20161004134148.23028-1-narmstrong@baylibre.com> <20161004134148.23028-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:34170 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934859AbcJTNW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2016 09:22:28 -0400
Received: by mail-qk0-f174.google.com with SMTP id f128so90067849qkb.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2016 06:22:27 -0700 (PDT)
In-Reply-To: <20161004134148.23028-3-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-oxnas@lists.tuxfamily.org

On Tue, Oct 4, 2016 at 3:41 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add support for the Oxford Semiconductor OX820 which is similar as OX810 but
> has 50 pins and two registers banks to setup alternate functions.
> Add specific pins, groups and functions structures.
> Add DT match data to select corresponding support.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.

Yours,
Linus Walleij
