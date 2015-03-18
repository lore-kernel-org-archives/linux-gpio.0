From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: Remove emev2 platform_device_id entry
Date: Wed, 18 Mar 2015 02:17:35 +0100
Message-ID: <CACRpkdYQu_kwc_t46X_gHp+aHbpwbc5dgqgvG=FCo4tZW1CqZQ@mail.gmail.com>
References: <1425986080-26648-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:32903 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753016AbbCRBRf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:17:35 -0400
Received: by obcxo2 with SMTP id xo2so21360813obc.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:17:35 -0700 (PDT)
In-Reply-To: <1425986080-26648-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Tue, Mar 10, 2015 at 12:14 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The emev2 platform is now DT-only, the driver doesn't need to match
> platform devices by name anymore. Remove the corresponding
> platform_device_id entry.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The emev2 platform never had pinctrl support for non-DT.

Patch applied with Laurent's ACK.

Yours,
Linus Walleij
