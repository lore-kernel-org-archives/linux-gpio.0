From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: bcm281xx: Constify struct regmap_config
Date: Wed, 14 Jan 2015 13:00:53 +0100
Message-ID: <CACRpkdbLTT7Ut5Va3ktJkMmTxRJ1o7TQxK_YN=wk3BnP0vrdjw@mail.gmail.com>
References: <1420448590-9503-1-git-send-email-k.kozlowski@samsung.com>
	<1420448590-9503-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:52933 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbbANMAy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 07:00:54 -0500
Received: by mail-ie0-f177.google.com with SMTP id rd18so8273802iec.8
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 04:00:53 -0800 (PST)
In-Reply-To: <1420448590-9503-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 5, 2015 at 10:03 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:

> The regmap_config struct may be const because it is not modified by the
> driver and regmap_init() accepts pointer to const. Make also
> of_device_id array const.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Patch applied.

Yours,
Linus Walleij
