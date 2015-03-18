From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio / ACPI: Use local variable instead of ACPI_HANDLE()
Date: Wed, 18 Mar 2015 02:35:02 +0100
Message-ID: <CACRpkdayzqXorj8h5WzE0CtcNqaP_-b=DWvoOiwvev_OJpOLOQ@mail.gmail.com>
References: <4032246.STUT1iRmIk@vostro.rjw.lan>
	<15697166.UNaCUJRTg5@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35650 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932546AbbCRBfD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:35:03 -0400
Received: by oiag65 with SMTP id g65so24488128oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:35:02 -0700 (PDT)
In-Reply-To: <15697166.UNaCUJRTg5@vostro.rjw.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Mar 10, 2015 at 11:10 PM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:

> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> In acpi_gpiochip_request_interrupts() the handle local
> variable already contains the value that we want to pass
> to acpi_walk_resources(), so it is better to use that
> variable instead of evaluating ACPI_HANDLE() once more
> for the same device.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
