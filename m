From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: pca953x: Add NXP PCA9698
Date: Thu, 13 Feb 2014 14:01:28 +0100
Message-ID: <CACRpkdaC5YZ6uZdYdMY2dyYfU=CEF3m=_XsgxmHwOJqpyZW0HQ@mail.gmail.com>
References: <1523732022.119053.1391812099611.JavaMail.zimbra@xes-inc.com>
	<1709957220.119585.1391812563657.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:41471 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752760AbaBMNB2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2014 08:01:28 -0500
Received: by mail-ob0-f175.google.com with SMTP id wn1so12021272obc.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2014 05:01:28 -0800 (PST)
In-Reply-To: <1709957220.119585.1391812563657.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Sierra <asierra@xes-inc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Balaji Venkatachalam <balaji.v@thotakaa.com>

On Fri, Feb 7, 2014 at 11:36 PM, Aaron Sierra <asierra@xes-inc.com> wrote:

> Add the NXP PCA9698 40-bit GPIO expander to the supported list.
> Note: This only enables GPIO functionality.
>
> Tested-by: Bob Schmitz <bschmitz@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Patch applied with Graeme's ACK.

> @@ -812,6 +813,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
>         { .compatible = "nxp,pca9557", },
>         { .compatible = "nxp,pca9574", },
>         { .compatible = "nxp,pca9575", },
> +       { .compatible = "nxp,pca9698", },

Hm noone has written any devicetree binding doc for the pca
GPIO block, feel free to do that in a separate patch when you
have time or get bored...

Yours,
Linus Walleij
