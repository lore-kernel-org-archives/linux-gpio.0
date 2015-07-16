From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Fix warning when HW interrupts are
 rescheduled by the softirq tasklet
Date: Thu, 16 Jul 2015 14:39:28 +0200
Message-ID: <CACRpkdbK4tXMuwMsXqmp=2-EkPC=95cK=Q8SMzv6ms3XnEDEMg@mail.gmail.com>
References: <1410251533-4990-1-git-send-email-LW@KARO-electronics.de>
	<CACRpkdbTXtx+EU4Dw1fxeThRUG4s5XvcJnAJ9PJd8i4KKGC65A@mail.gmail.com>
	<5421670D.10200@ti.com>
	<CACRpkdYCsdMcJY7Y0gK4_zPxiWRFKkzi2TaZUi1Vn7Kp0Cbgzg@mail.gmail.com>
	<5422B8F0.9060803@ti.com>
	<CACRpkdYtjQC_hCiqSB7fidct6CjJ5kMbj0PegW3MEuouBajv+g@mail.gmail.com>
	<54244243.3090904@ti.com>
	<CACRpkdahDFpP_3eJuAweYua4Cp2iJAd1BDUQHJ90O_bU3cuheg@mail.gmail.com>
	<CAH9NwWefBmpMua3oxjDOmMuEjRkutFPdAfVGCm8FtwjQi4Rpgg@mail.gmail.com>
	<559BA33E.1030200@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33878 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752245AbbGPMj3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 08:39:29 -0400
Received: by obre1 with SMTP id e1so45963554obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 05:39:28 -0700 (PDT)
In-Reply-To: <559BA33E.1030200@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 7, 2015 at 12:00 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 07/07/2015 09:29 AM, Christian Gmeiner wrote:

>> Linus, what is the state of the your last thinking about this topic?
>
> Could you try if below change works for you, pls (not tested):
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d233eb3..ac29308 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -570,6 +570,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>                                 "could not connect irqchip to gpiochip\n");
>                         return ret;
>                 }
> +
> +               gpiochip_set_chained_irqchip(&chip->gpio_chip, &pca953x_irq_chip,
> +                                            client->irq, NULL);

Looks like it works, can you send a proper patch?

(Maybe there is one in my inbox, whatdoIknow...)

Yours,
Linus Walleij
