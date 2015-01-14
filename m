From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: dove: Constify struct regmap_config and of_device_id
Date: Wed, 14 Jan 2015 12:59:54 +0100
Message-ID: <CACRpkdbe_=M51nGSHxV9BFrxwx7j-V62NSpf2REuXAf1zLycFw@mail.gmail.com>
References: <1420448590-9503-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:54351 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505AbbANL7z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 06:59:55 -0500
Received: by mail-ig0-f171.google.com with SMTP id z20so22028010igj.4
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 03:59:54 -0800 (PST)
In-Reply-To: <1420448590-9503-1-git-send-email-k.kozlowski@samsung.com>
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
