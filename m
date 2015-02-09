From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/3][v2] gpiolib: add gpiod_get_array and gpiod_put_array
 functions
Date: Mon, 9 Feb 2015 15:32:56 +0200
Message-ID: <20150209133256.GH1480@lahna.fi.intel.com>
References: <1485356.H0CQOKK5aG@pcimr>
 <CAAVeFu+Z+ExaCimgB-7gT0zZspNLmpKPC+C_+wzYTYb2UMBJUQ@mail.gmail.com>
 <20150209120926.GC1480@lahna.fi.intel.com>
 <13958989.5jUGxRK7u6@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:46911 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751128AbbBINdF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Feb 2015 08:33:05 -0500
Content-Disposition: inline
In-Reply-To: <13958989.5jUGxRK7u6@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Feb 09, 2015 at 02:20:52PM +0100, Rojhalat Ibrahim wrote:
> Obviously not. So instead of taking the number of elements in the package
> we could count the number of device references (ACPI_TYPE_LOCAL_REFERENCE)
> within the package. That should give us the number of GPIOs in the package,
> right?

Yes, something like that should work.
