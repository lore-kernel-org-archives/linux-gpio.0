From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Date: Thu, 25 Apr 2019 12:11:40 +0300
Message-ID: <20190425091140.GS2654@lahna.fi.intel.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190422044539.16085-1-kai.heng.feng@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, hotwater438@tutanota.com, hdegoede@redhat.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 22, 2019 at 12:45:39PM +0800, Kai-Heng Feng wrote:
> Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> added because clearing interrupt status bit is required to avoid
> unexpected behavior.
> 
> Turns out the unmask callback also needs the fix, which can solve weird
> IRQ triggering issues on I2C touchpad ELAN1200.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
