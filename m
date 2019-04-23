From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Date: Tue, 23 Apr 2019 12:08:16 +0300
Message-ID: <20190423090816.GN2654@lahna.fi.intel.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
 <Ld5HCy5--3-1@tutanota.com>
 <EA207DE8-E89A-427B-B910-A36170A76031@canonical.com>
 <Ld8QGex--3-1@tutanota.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Ld8QGex--3-1@tutanota.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hotwater438@tutanota.com
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Hdegoede <hdegoede@redhat.com>, Linux Gpio <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 23, 2019 at 11:00:48AM +0200, hotwater438@tutanota.com wrote:
>    Hi.
> 
>    Honestly, I can't find any information about my acpi suspend type.
>    There are no options in my BIOS to change it, and I can't determine
>    which exactly I have. But I suppose I have a S3 because I have suspend
>    issue.
> 
>    Can I somehow determine it in Linux? I did a research but found nothing
>    on the internet.

You can read the default mode from /sys/power/mem_sleep. "s2idle" means,
well suspend-to-idle and "deep" means S3.
