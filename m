From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register
 offset calculation
Date: Thu, 29 Jun 2017 20:28:57 +0100
Message-ID: <20170629202857.359bec9d@alans-desktop>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
        <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.llwyncelyn.cymru ([82.70.14.225]:60706 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751988AbdF2T3P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jun 2017 15:29:15 -0400
In-Reply-To: <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Graeme Gregory <graeme.gregory@linaro.org>

> So where can I get a handle on the people inside Intel who are obviously
> using ACPI GPIO class for shoehorning what we in the linux kernel call
> syscon or register bit misc access into the GPIO ACPI container just
> because they feel it is convenient?

It's a Windowsism and since Windows is the primary OS shipped the vendors
of client platforms do what is needed to make Windows work nicely.

> They need to invent a NEW ACPI four-character thing and call that
> "misc register bit" (_MRB?) or whatever and have it bind to syscon.
> This is not working.

Short of Microsoft adopting such a standard I don't think it would make
any difference (beyond making life worse because you'd have a new _MRB
that wasn't used by Windows so nobody ever tested).

> It feels like I am starting to maintain Intel's swiss army knife for misc
> register manipulation, and that should not be done by "virtual GPIO"
> because just look at it:

It's an ACPIism not an Intelism. I expect it's there on other vendors
devices and the same things will pop up as Windows/ARM platforms with
ACPI appear.

> General-purpose input/output - yeah that sounds like something
> going in/out of the system right?

It's become an ACPI interface for controlling all sorts of system state
in a way that works nicely in Windows. Rightly or wrongly that's the
situation and we are still the tail not the dog.

Alan
