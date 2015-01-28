From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: board.txt: Fix the gpio name example
Date: Wed, 28 Jan 2015 15:16:39 +0900
Message-ID: <CAAVeFuLpm5WZOF_hvZORTK1TVZVhubfj_A3sqdR7YijpqF9png@mail.gmail.com>
References: <1422318639-20995-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:52556 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754837AbbA1GRA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jan 2015 01:17:00 -0500
Received: by mail-ie0-f173.google.com with SMTP id tr6so19854209ieb.4
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2015 22:16:59 -0800 (PST)
In-Reply-To: <1422318639-20995-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Tue, Jan 27, 2015 at 9:30 AM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> As explained in this file:
>
> "GPIOs mappings are defined in the consumer device's node, in a property named
> <function>-gpios"
>
> So fix the example to match the convention.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
