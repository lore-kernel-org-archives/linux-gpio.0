From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] gpio: Drop owner assignment from i2c_driver
Date: Mon, 30 Nov 2015 09:31:27 +0100
Message-ID: <CACRpkdZkAgiyyyfhfO8PRyiZBx7jsEmgEHFjaqLf1nV1F0pcbw@mail.gmail.com>
References: <1447905431-30728-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35312 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753160AbbK3Ib2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 03:31:28 -0500
Received: by obbnk6 with SMTP id nk6so120993575obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 00:31:27 -0800 (PST)
In-Reply-To: <1447905431-30728-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Nov 19, 2015 at 4:57 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:

> i2c_driver does not need to set an owner because i2c_register_driver()
> will set it.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Patch applied.

Yours,
Linus Walleij
