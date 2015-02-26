From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/3] Add Fintek F71869 and F71869A gpio support
Date: Thu, 26 Feb 2015 18:36:19 +0900
Message-ID: <CAAVeFuLgnLquniryQYV3VJfyV5JMOQimhzLsJjV4DcWNhUaDoQ@mail.gmail.com>
References: <1422206179-11464-1-git-send-email-andreas@gazonk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:36318 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753369AbbBZJgj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Feb 2015 04:36:39 -0500
Received: by ierx19 with SMTP id x19so12490715ier.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2015 01:36:39 -0800 (PST)
In-Reply-To: <1422206179-11464-1-git-send-email-andreas@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Bofjall <andreas@gazonk.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 26, 2015 at 2:16 AM, Andreas Bofjall <andreas@gazonk.org> wrote:
> Hi,
>
> this series adds support for the gpio pins on the Fintek F71869 and F71869A
> SuperI/O chips to the gpio-f7188x driver. The chips are used on for example
> Jetway motherboards.
>
> The driver has been tested on two different boards: a JNF99-525 with F71869A,
> and by Les Schaffer on a Jetway NF96u-525 with F71869.

The series,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Apologies for taking so long to check it out!

>
> Andreas Bofjall (3):
>   gpio: f7188x: correct spelling of "Fintek"
>   gpio: f7188x: add GPIO support for F71869
>   gpio: f7188x: add GPIO support for F71869A
>
>  drivers/gpio/Kconfig       |  4 ++--
>  drivers/gpio/gpio-f7188x.c | 47 ++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 45 insertions(+), 6 deletions(-)
>
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
