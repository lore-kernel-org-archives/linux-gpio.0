From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ftgpio010: Fix platform_get_irq's error checking
Date: Sat, 2 Dec 2017 16:30:08 +0100
Message-ID: <CACRpkdZCh-YrsEM+f2XbpYtPuTN_DtEFUFUb-DJjZ-0=EQ5FMA@mail.gmail.com>
References: <c6bf37f60d82aa3d425f66f08e10fedc51202b6f.1512051063.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c6bf37f60d82aa3d425f66f08e10fedc51202b6f.1512051063.git.arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Arvind,

thanks for the patch!

On Thu, Nov 30, 2017 at 3:12 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> The platform_get_irq() function returns negative if an error occurs.
> zero or positive number on success. platform_get_irq() error checking
> for zero is not correct.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
(...)
>         irq = platform_get_irq(pdev, 0);
> -       if (!irq)
> -               return -EINVAL;
> +       if (irq < 0)
> +               return irq;

This is wrong.
For an in-depth explanation why irq 0 in not valid, see:
https://lwn.net/Articles/470820/

It should be:

if (irq <= 0)
  return irq ? irq : -EINVAL;

Please update and resubmit. If you have more patches like this,
correct them too.

Yours,
Linus Walleij
