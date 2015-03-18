From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio / ACPI: Avoid unnecessary checks in __gpiod_get_index()
Date: Wed, 18 Mar 2015 02:33:31 +0100
Message-ID: <CACRpkdaZvdQSvD4a3xG_uLdZGG3ZPSh_70WEUe6ZA8RTPYVb6Q@mail.gmail.com>
References: <4032246.STUT1iRmIk@vostro.rjw.lan>
	<1829371.gDPkhnsp25@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36388 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932513AbbCRBdc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:33:32 -0400
Received: by oigv203 with SMTP id v203so24443021oig.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:33:31 -0700 (PDT)
In-Reply-To: <1829371.gDPkhnsp25@vostro.rjw.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Mar 10, 2015 at 11:08 PM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:

> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> If dev is NULL in __gpiod_get_index() and both ACPI and OF are
> enabled, it will be checked twice before the code decides to give
> up with DT/ACPI lookup, so avoid that.
>
> Also use the observation that ACPI_COMPANION() is much more efficient
> than ACPI_HANDLE(), because the latter uses the former and carries out
> a check and a pointer dereference on top of it, so replace the
> ACPI_HANDLE() check with an ACPI_COMPANION() one which does not
> require the additional IS_ENABLED(CONFIG_ACPI) check too.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Patch applied with review and ACK tags.

Yours,
Linus Walleij
