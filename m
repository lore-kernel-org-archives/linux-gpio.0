From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 12/18] dt-bindings: Add PLX Technology OXNAS pinctrl
 and gpio bindings
Date: Thu, 31 Mar 2016 10:55:39 +0200
Message-ID: <CACRpkdYvWKMFkng_rA364dDrM3-GoXrBnaEfT+mWR61ySMpPQw@mail.gmail.com>
References: <1458838215-23314-1-git-send-email-narmstrong@baylibre.com>
	<1458838215-23314-13-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35724 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455AbcCaIzl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:55:41 -0400
Received: by mail-oi0-f43.google.com with SMTP id p188so18949580oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:55:40 -0700 (PDT)
In-Reply-To: <1458838215-23314-13-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Mar 24, 2016 at 5:50 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add pinctrl and gpio DT bindings for PLX Technology OXNAS SoC Family.
> This version supports the ARM926EJ-S based OX810SE SoC with 34 IO pins.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
(...)
> + - plxtech,gpio-bank: Specifies which bank a controller owns.

Rob commented on this too.

Other drivers just use "gpio-bank" for this, so use that.

I should add it to the generic bindings document.

Yours,
Linus Walleij
