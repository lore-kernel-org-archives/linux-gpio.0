From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/9] pinctrl: sunxi: Rework the pin config building code
Date: Thu, 20 Oct 2016 14:47:56 +0200
Message-ID: <CACRpkdZwmD=Jfss2hgEDt3KvTwVvFXCd5VzRCnn9_pn8VUvxkQ@mail.gmail.com>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <709f95f6725453af12bc989ce9039df5aa252ea5.1476200742.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:33572 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933391AbcJTMr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2016 08:47:58 -0400
Received: by mail-qk0-f177.google.com with SMTP id n189so92122824qke.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2016 05:47:58 -0700 (PDT)
In-Reply-To: <709f95f6725453af12bc989ce9039df5aa252ea5.1476200742.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 11, 2016 at 5:45 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> In order to support more easily the generic pinctrl properties, rework the
> pinctrl maps configuration and split it into several sub-functions.
>
> One of the side-effects from that rework is that we only parse the pin
> configuration once, since it's going to be common to every pin, instead of
> having to parsing once for each pin.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
