From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib-acpi: Duplicate con_id string when adding it
 to the crs lookup list
Date: Sat, 30 Apr 2016 13:51:37 +0200
Message-ID: <CACRpkdaaRA1ubPfr9NrQajMJRMmXo7jpeFL2umEgx2pTHGXsAA@mail.gmail.com>
References: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
	<1461589279-8911-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35886 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751691AbcD3Lvh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Apr 2016 07:51:37 -0400
Received: by mail-ob0-f182.google.com with SMTP id j9so68182325obd.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 Apr 2016 04:51:37 -0700 (PDT)
In-Reply-To: <1461589279-8911-1-git-send-email-ville.syrjala@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, stable <stable@vger.kernel.org>

On Mon, Apr 25, 2016 at 3:01 PM,  <ville.syrjala@linux.intel.com> wrote=
:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Calling gpiod_get() from a module and then unloading the module leads=
 to an
> oops due to acpi_can_fallback_to_crs() storing the pointer to the pas=
sed
> 'con_id' string onto acpi_crs_lookup_list. The next guy to come along=
 will then
> try to access the string but the memory may now be gone with the modu=
le.
> Make a copy of the passed string instead, and store the copy on the l=
ist.

Patch applied with the ACKs and queued for fixes.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
