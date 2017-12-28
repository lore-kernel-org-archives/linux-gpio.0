From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Thu, 28 Dec 2017 17:18:30 +0200
Message-ID: <1514474310.7000.420.camel@linux.intel.com>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:60255 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753454AbdL1PVe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Dec 2017 10:21:34 -0500
In-Reply-To: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Fri, 2017-12-22 at 19:58 +0100, Maciej S. Szmigiero wrote:
> This commit adds GPIO driver for Winbond Super I/Os.

Linus, since you asked me to review this, I can conclude that it is a
bit far from readiness. Couple of more iterations needed.

Please, also answer to a comment in review in regard to gpio_valid_mask
use.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
