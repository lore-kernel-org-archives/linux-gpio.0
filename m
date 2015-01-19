From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][v2] gpio-generic: add bgpio_set_multiple functions
Date: Mon, 19 Jan 2015 11:09:28 +0100
Message-ID: <CACRpkdZYdv02rqZbXSD_3Ms1q8yFhxK4rSywwZVAfs9dK+XqzA@mail.gmail.com>
References: <3218650.3Kg56DKAcg@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:52557 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbbASKJ3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 05:09:29 -0500
Received: by mail-ie0-f177.google.com with SMTP id at20so5449049iec.8
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2015 02:09:28 -0800 (PST)
In-Reply-To: <3218650.3Kg56DKAcg@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Jan 14, 2015 at 3:46 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Add set_multiple functions to the generic driver for memory-mapped GPIO
> controllers to improve performance when setting multiple outputs
> simultaneously.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> v2: refactor to reduce duplicate code

This v2 looks so nice that I couldn't resist applying it.

Patch applied!

Yours,
Linus Walleij
