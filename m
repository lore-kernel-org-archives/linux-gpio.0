From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Add initial driver data for Alphascale asm9260
Date: Fri, 6 Mar 2015 09:38:28 +0100
Message-ID: <CACRpkdbKLkMB6WP0zp2xN+gM4ytvs=3V5hh8uKt8e=YE4gAAqQ@mail.gmail.com>
References: <CACRpkdZMX=HSpusLtPREufJpXuHOwH2MCtHrViASDR7Vbu_eMw@mail.gmail.com>
	<1423740753-1221-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:41789 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932276AbbCFIi3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 03:38:29 -0500
Received: by obcva8 with SMTP id va8so8129680obc.8
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 00:38:28 -0800 (PST)
In-Reply-To: <1423740753-1221-1-git-send-email-linux@rempel-privat.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Oleksij,

Thanks for your patch.

On Thu, Feb 12, 2015 at 12:32 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:

Also send the patch to linux-kernel@vger.kernel.org as that is the
default pin control mailing list.

Split off Device Tree bindings in its own file and send that also to
devicetree@vger.kernel.org for review.

> This patch adds initial driver data for Alphascale asm9260 pinctrl support.
>
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>

A bit terse description, tell us a bit more about the system in the initial
commit, and what silicon it lives in etc.

> +The pinctrl driver enables Alphascale ASM9260 to configure the multi-purpose pins
> +(MPP) to a specific function.

MPP? That is a new name again for pin multiplexing, alternate function,
mission mode etc... apparently people have a problem with what to
call this.

(...)
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices, including the meaning of the
> +phrase "pin configuration node".

Nice. Good that you use generic bindings.

> +The following generic properties as defined in pinctrl-bindings.txt are valid
> +to specify in a pin configuration subnode:
> +pins                   - the list of pins that properties in the node
> +                         apply to (either this or "group" has to be
> +                         specified)

Should be "groups" not "group". Several groups can map to one
function.

> +function               - the mux function to select
> +bias-disable           - disable any pin bias
> +bias-pull-up           - pull up the pin. Supported only on GPIO0_* pins.
> +bias-pull-down         - pull down the pin. Supported on all pins except of GPIO0_*.

Nice, good details.

(...)
> +struct asm9260_function {
> +       const char              *name;
> +       const char              **groups;
> +       unsigned int            ngroups;
> +};

Yes, see one function, many groups.

The driver looks simple and nice.

Yours,
Linus Walleij
