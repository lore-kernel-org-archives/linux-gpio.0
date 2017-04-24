From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] gpio: gpio-wcove: fix irq pending status bit width
Date: Mon, 24 Apr 2017 15:15:18 +0200
Message-ID: <CACRpkdYTjvKbz55jVXuEe6B=OE-dcirjv+TsVf5aKFv_S8u0Vg@mail.gmail.com>
References: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <197e6ca51bb83ae865022d7ffd085d06dfee7795.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35816 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934157AbdDXNPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 09:15:20 -0400
Received: by mail-io0-f179.google.com with SMTP id r16so185892696ioi.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 06:15:20 -0700 (PDT)
In-Reply-To: <197e6ca51bb83ae865022d7ffd085d06dfee7795.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sathyaosid@gmail.com, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Fri, Apr 14, 2017 at 7:29 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> Whiskey cove PMIC has three GPIO banks with total number of 13 GPIO
> pins. But when checking for the pending status, for_each_set_bit() uses
> bit width of 7 and hence it only checks the status for first 7 GPIO pins
> missing to check/clear the status of rest of the GPIO pins. This patch
> fixes this issue.
>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Looks reasonable so patch applied.

Just looping in Mika & Andy so they have an idea about what's going
on.

Yours,
Linus Walleij
