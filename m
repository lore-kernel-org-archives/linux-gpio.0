From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/8] gpio/mpc8xxx: Use of_mm_gpiochip_remove
Date: Tue, 20 Jan 2015 11:17:51 +0100
Message-ID: <CACRpkdZ+FYQveP-ervZ5NWv0NYeYmsTwpB0jXYyUFNK4TotNSQ@mail.gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
	<1421581173-28416-9-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:39178 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752450AbbATKRw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jan 2015 05:17:52 -0500
Received: by mail-ig0-f171.google.com with SMTP id h15so8428543igd.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2015 02:17:51 -0800 (PST)
In-Reply-To: <1421581173-28416-9-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>

On Sun, Jan 18, 2015 at 12:39 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Since d621e8bae5ac9c67 (Create of_mm_gpiochip_remove), there is a
> counterpart for of_mm_gpiochip_add.
>
> This patch implements the remove function of the driver making use of
> it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Waiting for a v2 addressing the issues pointed out by Peter on this
patch.

Yours,
Linus Walleij
