From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: 74xx: fix a possible NULL dereference
Date: Mon, 9 Nov 2015 09:21:23 +0900
Message-ID: <CAAVeFuJK9iLOtgdja3RxXzuosQYBGxQKYA+oQ4f2buQh8G-Kbw@mail.gmail.com>
References: <1446738939-22320-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:35340 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417AbbKIAVn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2015 19:21:43 -0500
In-Reply-To: <1446738939-22320-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Nov 6, 2015 at 12:55 AM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 132:
> priv->flags = (uintptr_t) of_id->data;
>
> Reported-by: coverity (CID 1324141)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/gpio/gpio-74xx-mmio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index 6ed7c0f..4a7be0f 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -120,6 +120,9 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
>         void __iomem *dat;
>         int err;
>
> +       if (!of_id)
> +               return -ENODEV;
> +

Nit: in that case, could you also move the assignment of of_id to its
own line right above these added lines? It would keep things in the
same place and the current layout does not even save any space since
the declaration of of_id currently takes two lines because the
assignment makes it longer than 80 chars...

With this,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
