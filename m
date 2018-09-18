From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cannonlake: Fix gpio base for GPP-E
Date: Tue, 18 Sep 2018 16:34:14 -0700
Message-ID: <CACRpkdZMFv6NLmLVOXTofx_SBtO0R4qvcSbHu6uZw+k_vmmSSQ@mail.gmail.com>
References: <20180915211518.8155-1-s@sd.ai>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180915211518.8155-1-s@sd.ai>
Sender: linux-kernel-owner@vger.kernel.org
To: s@sd.ai
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 15, 2018 at 2:16 PM Simon Detheridge <s@sd.ai> wrote:

> The gpio base for GPP-E was set incorrectly to 258 instead of 256,
> preventing the touchpad working on my Tong Fang GK5CN5Z laptop.
>
> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=200787
> Signed-off-by: Simon Detheridge <s@sd.ai>

Patch applied for fixes.

It seems I should tag it for stable too.

Yours,
Linus Walleij
