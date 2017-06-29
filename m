From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset calculation
Date: Thu, 29 Jun 2017 23:13:33 +0200
Message-ID: <2754889.4x1EiTEaaZ@aspire.rjw.lan>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com> <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com> <20170629202857.359bec9d@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:56938 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751819AbdF2VVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jun 2017 17:21:02 -0400
In-Reply-To: <20170629202857.359bec9d@alans-desktop>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Linus Walleij <linus.walleij@linaro.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Graeme Gregory <graeme.gregory@linaro.org>

On Thursday, June 29, 2017 08:28:57 PM Alan Cox wrote:
> > So where can I get a handle on the people inside Intel who are obviously
> > using ACPI GPIO class for shoehorning what we in the linux kernel call
> > syscon or register bit misc access into the GPIO ACPI container just
> > because they feel it is convenient?
> 
> It's a Windowsism and since Windows is the primary OS shipped the vendors
> of client platforms do what is needed to make Windows work nicely.

Yes, we are pretty much on the receiving end here and unfortunately we need to
deal with stuff already manufactured and shipped.

Thanks,
Rafael

