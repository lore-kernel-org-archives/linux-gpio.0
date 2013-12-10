From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v5 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Tue, 10 Dec 2013 12:05:02 +0900
Message-ID: <52A684DE.9060605@nvidia.com>
References: <1386600421-16463-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9105 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110Ab3LJDFH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 22:05:07 -0500
In-Reply-To: <1386600421-16463-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On 12/09/2013 11:46 PM, Andy Shevchenko wrote:
> Here is a fifth [1] version of the SFI GPIO helpers. This series contains SFI
> GPIO helpers along with the update of GPIO library to lookup for SFI resources.
>
> It has been tested on Medfield device on top of recent linux-gpio/for-next +
> Mika's ACPI gpio patches [2].
>
> Changes since v4:
>   - fix one compilation warning
>
> [1] https://lkml.org/lkml/2013/6/5/316
> [2] http://www.spinics.net/lists/linux-acpi/msg47572.html

I commented on the v1 of this series about a potential lookup issue - 
while I totally agree with the overall idea, I'd like to see this issue 
solved before I give my ack.


