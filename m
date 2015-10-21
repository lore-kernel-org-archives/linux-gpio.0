From: Doug Anderson <dianders@chromium.org>
Subject: Re: [REPOST PATCH v2] drivers/pinctrl: Add the concept of an "init" state
Date: Tue, 20 Oct 2015 21:17:55 -0700
Message-ID: <CAD=FV=WAexTOiuAV1Rs-eTVra657cGvc51xYcgEgqfKoRpJEnw@mail.gmail.com>
References: <1445393316-10079-1-git-send-email-dianders@chromium.org>
	<201510211015.LOfTtSa0%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201510211015.LOfTtSa0%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, Linus Walleij <linus.walleij@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Tue, Oct 20, 2015 at 7:46 PM, kbuild test robot <lkp@intel.com> wrote:
> Hi Doug,
>
> [auto build test ERROR on pinctrl/for-next -- if it's inappropriate base, please suggest rules for selecting the more suitable base]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/drivers-pinctrl-Add-the-concept-of-an-init-state/20151021-101131
> config: i386-randconfig-x004-10191220 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>    drivers/base/dd.c: In function 'really_probe':
>>> drivers/base/dd.c:325:2: error: implicit declaration of function 'pinctrl_init_done' [-Werror=implicit-function-declaration]
>      pinctrl_init_done(dev);
>      ^
>    cc1: some warnings being treated as errors
>
> vim +/pinctrl_init_done +325 drivers/base/dd.c
>
>    319          } else if (drv->probe) {
>    320                  ret = drv->probe(dev);
>    321                  if (ret)
>    322                          goto probe_failed;
>    323          }
>    324
>  > 325          pinctrl_init_done(dev);
>    326
>    327          if (dev->pm_domain && dev->pm_domain->sync)
>    328                  dev->pm_domain->sync(dev);

Yup, good catch Mr. Robot.  I think I've got it all fixed up in:
https://patchwork.kernel.org/patch/7454311/
