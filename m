From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: fix gpio leak in gpiochip_add error path
Date: Tue, 12 May 2015 16:00:41 +0900
Message-ID: <CAAVeFuLQWOihkOjb_DVCjgiEtGfkC56DQpw8wy0HYYH9ZT4Mmg@mail.gmail.com>
References: <1430753005-19691-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:33177 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752418AbbELHBC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:01:02 -0400
In-Reply-To: <1430753005-19691-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, May 5, 2015 at 12:23 AM, Johan Hovold <johan@kernel.org> wrote:
> Make sure to free any hogged gpios on errors in gpiochip_add.
>
> Also move all forward declarations to the top of the file.
>
> Fixes: f625d4601759 ("gpio: add GPIO hogging mechanism")
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
