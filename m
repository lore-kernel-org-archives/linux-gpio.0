From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Fri, 22 Mar 2019 19:32:28 +0100
Message-ID: <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com>
 <20190321092330.GK9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321092330.GK9224@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: zhuchangchun <zhuchangchun@cvte.com>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, hendychu@aliyun.com
List-Id: linux-gpio@vger.kernel.org

On 21.03.19 10:23, Andy Shevchenko wrote:

> ...and on top of that GPIO sysfs interface is deprecated.

I don't like the idea of deprecating this. It might not be enough for
all usecases, but for a lot of usecases, it's a very easy and simple
interfaces.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
