From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib: tighten up ACPI legacy gpio lookups
Date: Fri, 6 Nov 2015 10:31:42 +0200
Message-ID: <20151106083142.GV1509@lahna.fi.intel.com>
References: <20151105193838.GA33410@dtor-ws>
 <20151106080814.GS1509@lahna.fi.intel.com>
 <CAKdAkRSwLBtqUqEj+6gY5vDz5_UJQs=ruUnFfxQQyhDZgxQjyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:65179 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1032918AbbKFIbr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 6 Nov 2015 03:31:47 -0500
Content-Disposition: inline
In-Reply-To: <CAKdAkRSwLBtqUqEj+6gY5vDz5_UJQs=ruUnFfxQQyhDZgxQjyg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Fri, Nov 06, 2015 at 12:25:34AM -0800, Dmitry Torokhov wrote:
> I wonder if I should move acpi_can_fallback_to_crs() into
> gpiolib-acpi.c and provide a stub for it...

That works too :-)
