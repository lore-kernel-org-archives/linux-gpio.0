From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH -next] pinctrl: artpec6: Make two functions static
Date: Tue, 9 Apr 2019 08:56:21 +0200
Message-ID: <20190409065621.2yfx5nqzpuxyj46p@axis.com>
References: <20190321150909.3576-1-yuehaibing@huawei.com>
 <20190408180110.GA15199@archlinux-ryzen>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408180110.GA15199@archlinux-ryzen>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Yue Haibing <yuehaibing@huawei.com>, jespern@axis.com, larper@axis.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@axis.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 08, 2019 at 11:01:10AM -0700, Nathan Chancellor wrote:
> On Thu, Mar 21, 2019 at 11:09:09PM +0800, Yue Haibing wrote:
> > From: YueHaibing <yuehaibing@huawei.com>
> > -void artpec6_pmx_disable(struct pinctrl_dev *pctldev, unsigned int function,
> > -			 unsigned int group)
> > +static void artpec6_pmx_disable(struct pinctrl_dev *pctldev,
> > +				unsigned int function,
> > +				unsigned int group)
> 
> On arm32 allyesconfig:
> 
> drivers/pinctrl/pinctrl-artpec6.c:706:13: error: unused function
> 'artpec6_pmx_disable' [-Werror,-Wunused-function]
> 
> This is the second time you've introduced an unused function warning by
> making a function static[1], could you please be a little more vigilant
> in your clean ups in the future?
> 
> [1]: https://lore.kernel.org/lkml/20190327050126.12064-1-natechancellor@gmail.com/
> 
> Linus/Jesper/Lars, should this function just be deleted? I'd be happy to
> send a patch doing so if that's the right course of action.

Yes, that function is unused and can be dropped.

> Thanks,
> Nathan

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
