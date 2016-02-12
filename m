From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: Re: [PATCH RFT] gpio: ts4800: Fixup flags argument for bgpio_init
Date: Fri, 12 Feb 2016 09:42:22 -0500 (EST)
Message-ID: <1960742682.183296.1455288142200.JavaMail.zimbra@savoirfairelinux.com>
References: <1455250590.9777.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:59425 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750802AbcBLOmZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2016 09:42:25 -0500
In-Reply-To: <1455250590.9777.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hi Alex,


----- Original Message -----
> From: "Axel Lin" <axel.lin@ingics.com>
> To: "Linus Walleij" <linus.walleij@linaro.org>
> Cc: "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>, "Alexandre Courbot" <gnurou@gmail.com>,
> linux-gpio@vger.kernel.org
> Sent: Thursday, February 11, 2016 11:16:30 PM
> Subject: [PATCH RFT] gpio: ts4800: Fixup flags argument for bgpio_init

> BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER is 0.
> Fixup the trivial typo.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Julien,
> I don't have this h/w, can you review and test if this patch works.

No, this patch is not working. The big endian flags where a mistake.
Therefore I submitted a patch to remove them:
[PATCH v2] gpio: TS-4800: remove useless bgpio_init flags. 

There is no flag required at all for bgpio_init,
I ran my tests and it worked as expected.

Thank you for proposing a solution.



> Thanks,
> Axel
> 
> drivers/gpio/gpio-ts4800.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
> index c4908a4..c244c31 100644
> --- a/drivers/gpio/gpio-ts4800.c
> +++ b/drivers/gpio/gpio-ts4800.c
> @@ -49,7 +49,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
> 	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
> 			    base_addr + OUTPUT_REG_OFFSET, NULL,
> 			    base_addr + DIRECTION_REG_OFFSET, NULL,
> -			    BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
> +			    BGPIOF_BIG_ENDIAN | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
> 	if (retval) {
> 		dev_err(&pdev->dev, "bgpio_init failed\n");
> 		return retval;
> --
> 2.1.4
