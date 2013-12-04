From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 2/4] gpiolib: introduce chip_* to print with chip->label
 prefix
Date: Wed, 4 Dec 2013 15:21:05 +0900
Message-ID: <529EC9D1.1090606@nvidia.com>
References: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386097406-24585-3-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14099 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab3LDGVI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 01:21:08 -0500
In-Reply-To: <1386097406-24585-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 12/04/2013 04:03 AM, Andy Shevchenko wrote:
> In several places we are printing messages with prefix based on chip->label.
> Introduced macros help us to do this easier and in uniform way.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks, that's going to be useful indeed.
