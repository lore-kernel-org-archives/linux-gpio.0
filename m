From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/4] gpio: Assign gpio_irq_chip::parents to non-stack pointer
Date: Mon, 08 Oct 2018 23:01:15 -0700
Message-ID: <153906487527.119890.6761556114422000083@swboyd.mtv.corp.google.com>
References: <20181008163216.97436-2-swboyd@chromium.org>
 <201810091251.jzXVZxHH%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201810091251.jzXVZxHH%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Evan Green <evgreen@chromium.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Quoting kbuild test robot (2018-10-08 21:56:25)
> Hi Stephen,
> =

> I love your patch! Perhaps something to improve:
[...]
>    net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx=
_stats.packets' not described in 'sta_info'
>    net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx=
_stats.bytes' not described in 'sta_info'
>    net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx=
_stats.last_rate' not described in 'sta_info'
>    net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx=
_stats.msdu' not described in 'sta_info'
>    include/linux/dma-buf.h:304: warning: Function parameter or member 'cb=
_excl.cb' not described in 'dma_buf'
>    include/linux/dma-buf.h:304: warning: Function parameter or member 'cb=
_excl.poll' not described in 'dma_buf'
>    include/linux/dma-buf.h:304: warning: Function parameter or member 'cb=
_excl.active' not described in 'dma_buf'
>    include/linux/dma-buf.h:304: warning: Function parameter or member 'cb=
_shared.cb' not described in 'dma_buf'
>    include/linux/dma-buf.h:304: warning: Function parameter or member 'cb=
_shared.poll' not described in 'dma_buf'
>    include/linux/dma-buf.h:304: warning: Function parameter or member 'cb=
_shared.active' not described in 'dma_buf'
>    include/linux/dma-fence-array.h:54: warning: Function parameter or mem=
ber 'work' not described in 'dma_fence_array'
>    include/linux/gpio/driver.h:105: warning: Incorrect use of kernel-doc =
format: Documentation Makefile include scripts source private: For use by g=
piochip_set_cascaded_irqchip()
> >> include/linux/gpio/driver.h:167: warning: Function parameter or member=
 'parent_irq' not described in 'gpio_irq_chip'

Ok! That was a little rough to pick out. Is there any way to mark
something as private with inline kernel doc?
