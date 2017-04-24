From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/2] gpio: gpio-wcove: fix irq pending status bit
 width
Date: Mon, 24 Apr 2017 17:27:21 +0300
Message-ID: <1493044041.24567.166.camel@linux.intel.com>
References: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
         <197e6ca51bb83ae865022d7ffd085d06dfee7795.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
         <CACRpkdYTjvKbz55jVXuEe6B=OE-dcirjv+TsVf5aKFv_S8u0Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:51404 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1428132AbdDXO1f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Apr 2017 10:27:35 -0400
In-Reply-To: <CACRpkdYTjvKbz55jVXuEe6B=OE-dcirjv+TsVf5aKFv_S8u0Vg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sathyaosid@gmail.com, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, 2017-04-24 at 15:15 +0200, Linus Walleij wrote:
> On Fri, Apr 14, 2017 at 7:29 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> 
> > From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.i
> > ntel.com>
> > 
> > Whiskey cove PMIC has three GPIO banks with total number of 13 GPIO
> > pins. But when checking for the pending status, for_each_set_bit()
> > uses
> > bit width of 7 and hence it only checks the status for first 7 GPIO
> > pins
> > missing to check/clear the status of rest of the GPIO pins. This
> > patch
> > fixes this issue.
> > 
> > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswam
> > y@linux.intel.com>
> 
> Looks reasonable so patch applied.
> 
> Just looping in Mika & Andy so they have an idea about what's going
> on.

This is fine by me, thanks!


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
