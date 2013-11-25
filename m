From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: add missing declarations
Date: Mon, 25 Nov 2013 18:07:10 +0900
Message-ID: <CAAVeFu+wFAqroiyzwRQLkRAmhVQV-efOYA51DTHUwMMA1nTYxA@mail.gmail.com>
References: <1385186069-28986-1-git-send-email-acourbot@nvidia.com> <20131125085831.GO2281@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131125085831.GO2281@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 25, 2013 at 5:58 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Sat, Nov 23, 2013 at 02:54:29PM +0900, Alexandre Courbot wrote:
>> Add missing declarations and include files to avoid warnings during
>> compilation of include/gpio/driver.h.
>
> It would be good to have those warnings included in the changelog as well.

As in, copy-pasting the compiler's output? Isn't the change explicit enough?
