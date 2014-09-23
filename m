From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: imx: detect uninitialized pins
Date: Tue, 23 Sep 2014 11:46:20 +0200
Message-ID: <CACRpkdbzvyN0ecP2JA6LhYkPYhe_vJTrLvx4WOW73SRyoMLPEg@mail.gmail.com>
References: <cover.1410020458.git.stefan@agner.ch>
	<6d676a88eb82a47f8fa9e16abbc768e3e9ac236a.1410020458.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:52524 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753133AbaIWJqV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 05:46:21 -0400
Received: by mail-ie0-f182.google.com with SMTP id tp5so3732480ieb.41
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 02:46:20 -0700 (PDT)
In-Reply-To: <6d676a88eb82a47f8fa9e16abbc768e3e9ac236a.1410020458.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Sep 6, 2014 at 6:25 PM, Stefan Agner <stefan@agner.ch> wrote:

> The pinctrl driver initialized the register offsets for the pins
> with 0. On Vybrid an offset of 0 is a valid offset for the pinctrl
> mux register. So far, this was solved using the ZERO_OFFSET_VALID
> flag which allowed offsets of 0. However, this does not allow to
> verify whether a pins struct imx_pmx_func was initialized or not.
>
> Use signed offset values for register offsets and initialize those
> with -1 in order to detect uninitialized offset values reliable.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied.

Yours,
Linus Walleij
