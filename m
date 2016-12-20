From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4 1/5] pinctrl: aspeed: dt: Fix compatibles for the
 System Control Unit
Date: Tue, 20 Dec 2016 18:26:22 +1030
Message-ID: <CACPK8Xd2VtZVPE0S5M1+ubvhNMvPe8dZKYU_GeyL=aShM0CaOg@mail.gmail.com>
References: <20161220073551.28522-1-andrew@aj.id.au> <20161220073551.28522-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:36092 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754822AbcLTH4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2016 02:56:44 -0500
In-Reply-To: <20161220073551.28522-2-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 20, 2016 at 6:05 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Reference the SoC-specific compatible string in the examples as
> required.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>


> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
