From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] pinctrl / gpio: Allow GPIO chips to use generic pinconfig
Date: Thu, 26 Jan 2017 15:25:05 +0100
Message-ID: <CACRpkdYWT1yq9XNNxjS3=i0eYS6+DKQQ_sC00duhZLT9fm4JXw@mail.gmail.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2017 at 1:34 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> This series makes it possible to configure pins from GPIO chip drivers by
> implementing a new callback .set_config(). This callback replaces the
> existing .set_single_ended() and .set_debounce() simply because adding new
> callbacks for each possible configuration type does not scale. So instead
> we re-use the existing generic pinconf types and the packed format.
>
> This is a follow up of discussion on:
>
>   https://patchwork.ozlabs.org/patch/713289/

As you already know I'm a big fan of the series.

I applied the two patches to an immutable branch in the pin control
tree and pulled it into both pin control and GPIO devel branches.

Thanks a lot for your efforts!!

Yours,
Linus Walleij
