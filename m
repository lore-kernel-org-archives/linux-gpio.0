From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Mon, 25 Mar 2019 10:36:26 +0100
Message-ID: <ca34b30a-c989-d6df-8d6a-93ea1746e920@metux.net>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com>
 <20190321092330.GK9224@smile.fi.intel.com>
 <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net>
 <20190322190610.GB9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322190610.GB9224@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, zhuchangchun <zhuchangchun@cvte.com>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, hendychu@aliyun.com
List-Id: linux-gpio@vger.kernel.org

On 22.03.19 20:06, Andy Shevchenko wrote:
> On Fri, Mar 22, 2019 at 07:32:28PM +0100, Enrico Weigelt, metux IT consult wrote:
>> On 21.03.19 10:23, Andy Shevchenko wrote:
>>
>>> ...and on top of that GPIO sysfs interface is deprecated.
>>
>> I don't like the idea of deprecating this. It might not be enough for
>> all usecases, but for a lot of usecases, it's a very easy and simple
>> interfaces.
> 
> So, you probably late for more than year. Linus W. and others discussed that
> a lot and the points of the choice are listed in documentation IIRC.

If "deprecated" means there just won't be any new features, but
everything remains as it is, I can live w/ that. But But having to
rewrite lots of applications in the field for the new interface would
be really bad.

Note that the dev interface is *much* more complex than the sysfs one.
For example, it needs ioctl()s, so this can't be done just w/ a few
lines of shellscript anymore. (which is very common in many embedded
devices)


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
