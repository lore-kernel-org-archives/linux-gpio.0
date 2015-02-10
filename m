From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 3/4] gpiolib: add devm_gpiod_get_array and
 devm_gpiod_put_array functions
Date: Tue, 10 Feb 2015 15:20:38 +0900
Message-ID: <CAAVeFu+6y7K7zWrTO3BvwpPFFJ6AsJuSEMrCiAkWkXfSbnYK7Q@mail.gmail.com>
References: <9128234.l5v0vy9XLV@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:37947 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808AbbBJGU7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 01:20:59 -0500
Received: by iecrd18 with SMTP id rd18so10343807iec.5
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2015 22:20:59 -0800 (PST)
In-Reply-To: <9128234.l5v0vy9XLV@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Feb 10, 2015 at 2:07 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Add device managed variants of gpiod_get_array() / gpiod_put_array()
> functions for conveniently obtaining and disposing of an entire array
> of GPIOs with one function call.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
