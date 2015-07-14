From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Documentation: gpio: consumer: describe the con_id parameter
Date: Tue, 14 Jul 2015 14:01:16 +0900
Message-ID: <CAAVeFuKJJ8DCar-+_J6yEM+bckP1NgwTEk_f_rzChxe11Uf7TA@mail.gmail.com>
References: <1436593562-5119-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36130 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751875AbbGNFBg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 01:01:36 -0400
Received: by obnw1 with SMTP id w1so17129663obn.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2015 22:01:35 -0700 (PDT)
In-Reply-To: <1436593562-5119-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jul 11, 2015 at 2:46 PM, Dirk Behme <dirk.behme@gmail.com> wrote:
> The con_id parameter has to match the GPIO description and is automatically
> extended by the GPIO suffix if not NULL. I had to look into the code to
> understand this and properly find the GPIO I've been looking for, so document
> this.

Good idea!

>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
>  Documentation/gpio/consumer.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 75542b9..d0d1e47 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -39,6 +39,18 @@ device that displays digits), an additional index argument can be specified:
>                                           const char *con_id, unsigned int idx,
>                                           enum gpiod_flags flags)
>
> +The con_id string parameter has to be either NULL or the prefix of the GPIO
> +suffixes ("gpios" or "gpio"):

It may be useful to explain that "gpios" and "gpio" are both looked up
by gpiod functions, otherwise the reader might wonder how to choose
one or the other.

> +
> +* If the GPIO description is just named with one of the GPIO suffixes
> +  ("gpios" or "gpio") use NULL.

add a comma here:

    ("gpios" or "gpio"), use NULL.

> +* If the GPIO description is prefixed with anything, e.g. "reset-gpios", use the
> +  prefix without the "-" as con_id parameter (in this example "reset").
> +
> +In case con_id is not NULL, the gpiod subsystem prefixes the GPIO suffix

s/gpiod/GPIO. gpiod is not a subsystem, just a set of functions.

Otherwise it looks good. Feel free to add my

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

to the next revision.
