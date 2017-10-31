From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/4] gpiolib: add bitmask for valid GPIO lines
Date: Tue, 31 Oct 2017 21:05:57 +0200
Message-ID: <1509476757.10233.143.camel@linux.intel.com>
References: <1509396602-1936-1-git-send-email-timur@codeaurora.org>
         <1509396602-1936-3-git-send-email-timur@codeaurora.org>
         <1509441149.10233.80.camel@linux.intel.com>
         <02208047-38c8-f97b-5c53-6cced7bdecc6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <02208047-38c8-f97b-5c53-6cced7bdecc6@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2017-10-31 at 13:54 -0500, Timur Tabi wrote:
> On 10/31/2017 04:12 AM, Andy Shevchenko wrote:
> > Instead of mangling this function wouldn't be better to introduce a
> > separate one for line and perhaps a third one which calls them both?
> 
> The diff is convoluted, but the end result is clean:

> Is this acceptable?

I also put in the comment the following:

--- 8< --- 8< --- 8< ---

...for my opinion it will drastically increase readability and reduce
diff as well (better for review).

--- 8< --- 8< --- 8< ---

The decision is up to Linus. I simple shared my opinion.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
