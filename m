From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v6 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Thu, 12 Dec 2013 10:53:58 +0900
Message-ID: <52A91736.5010505@nvidia.com>
References: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10320 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130Ab3LLByC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 20:54:02 -0500
In-Reply-To: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On 12/10/2013 10:21 PM, Andy Shevchenko wrote:
> Here is a sixth [1] version of the SFI GPIO helpers. This series contains SFI
> GPIO helpers along with the update of GPIO library to lookup for SFI resources.
>
> It has been tested on Medfield device on top of recent linux-next-20131210 +
> Mika's ACPI gpio patches [2].
>
> Changes since v6:
>   - remove FSF address
>   - require dev to be NULL when looking up for GPIO line

Since my concerns about lookup by non-platform code have been lifted:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
