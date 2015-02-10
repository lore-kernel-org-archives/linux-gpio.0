From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 1/4] gpiolib: define gpio suffixes globally
Date: Tue, 10 Feb 2015 15:18:38 +0900
Message-ID: <CAAVeFuJkXz_szEUz7XBasZJx3R-Vf1rYVji0H6mrn_uKwg-wbA@mail.gmail.com>
References: <6473685.Mym42fyUcn@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:45790 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbBJGS7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 01:18:59 -0500
Received: by iecat20 with SMTP id at20so13951961iec.12
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2015 22:18:58 -0800 (PST)
In-Reply-To: <6473685.Mym42fyUcn@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Feb 10, 2015 at 2:07 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Avoid multiple identical definitions of the gpio suffix strings by putting
> them into a global constant array.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
