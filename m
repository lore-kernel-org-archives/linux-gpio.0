From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl-adi2: Use a signed return type for
 adi_gpio_irq_startup()
Date: Sat, 19 Dec 2015 23:12:13 +0300
Message-ID: <20151219201213.GP5284@mwanda>
References: <56758D34.2070806@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56758D34.2070806@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-gpio@vger.kernel.org

This introduces a compile warning.  These functions are supposed to
return 1 if there is an IRQ pending.  Change the -EINVAL to 0.

regards,
dan carpenter

