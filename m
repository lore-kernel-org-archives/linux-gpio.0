From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Do not free unrequested interrupt
Date: Fri, 14 Nov 2014 11:07:57 +0100
Message-ID: <CACRpkdbUPZrw6_kya12xtxVXpqMm8q_nx-smuCgV1Sq45dbDrQ@mail.gmail.com>
References: <1415693323-19046-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:51978 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754814AbaKNKH6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Nov 2014 05:07:58 -0500
Received: by mail-ig0-f179.google.com with SMTP id r10so1227114igi.6
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2014 02:07:57 -0800 (PST)
In-Reply-To: <1415693323-19046-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 11, 2014 at 9:08 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> If devm_request_threaded_irq fails for some reason we call
> mcp23s08_irq_teardown afterwards.
> Do not free the unrequested interrupt in this case. free_irq can also be
> omitted for the error free case because we use devm_request_threaded_irq.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied.

We don't have a maintainer for this driver... I'd like someone to look into
converting it to use GPIOLIB_IRQCHIP.

Yours,
Linus Walleij
