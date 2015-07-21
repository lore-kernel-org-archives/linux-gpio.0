From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] Documentation: gpio: consumer: describe the con_id parameter
Date: Tue, 21 Jul 2015 14:12:51 +0900
Message-ID: <CAAVeFuJZgiKu+8=Nugmsq9f70CLju2d=SJX6vHi8ismSHFh-Ag@mail.gmail.com>
References: <1437200647-5138-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35813 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbbGUFNN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 01:13:13 -0400
Received: by lblf12 with SMTP id f12so108056223lbl.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2015 22:13:11 -0700 (PDT)
In-Reply-To: <1437200647-5138-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Sat, Jul 18, 2015 at 3:24 PM, Dirk Behme <dirk.behme@gmail.com> wrote:
> The con_id parameter has to match the GPIO description and is automatically
> extended by the GPIO suffix if not NULL. I had to look into the code to
> understand this and properly find the GPIO I've been looking for, so document
> this.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes in v2: Incorporate the review comments from Alexandre.
>
>  Documentation/gpio/consumer.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 75542b9..5f7437b 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -39,6 +39,19 @@ device that displays digits), an additional index argument can be specified:
>                                           const char *con_id, unsigned int idx,
>                                           enum gpiod_flags flags)
>
> +The con_id string parameter has to be either NULL or the prefix of the GPIO
> +suffixes ("gpios" or "gpio", automatically looked up by the gpiod functions
> +internally):
> +
> +* If the GPIO description is just named with one of the GPIO suffixes
> +  ("gpios" or "gpio"), use NULL.
> +* If the GPIO description is prefixed with anything, e.g. "reset-gpios", use the
> +  prefix without the "-" as con_id parameter (in this example "reset").
> +
> +In case con_id is not NULL, the GPIO subsystem prefixes the GPIO suffix
> +("gpios" or "gpio") with the string passed in con_id to get the resulting string
> +(snprintf(... "%s-%s", con_id, gpio_suffixes[]).

Ah, there is still an issue with this description. It is correct as
far as GPIOs are assigned by the device tree ; but it turns out that
we have two other ways of assigning GPIOs: ACPI and platform data.
Have a look at the board.txt file which describes how this works. And
actually, instead of repeating the same stuff in consumer.txt, maybe
we can just redirect the reader to the other file?
