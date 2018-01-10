From: Stefan Agner <stefan@agner.ch>
Subject: Re: [pinctrl:devel 63/65]
 drivers/pinctrl/freescale/pinctrl-imx6ul.c:343:33: warning: passing argument 2
 of 'imx_pinctrl_probe' discards 'const' qualifier from pointer target type
Date: Wed, 10 Jan 2018 19:11:23 +0100
Message-ID: <59dc10a601670bf18fbcd4d39d685c81@agner.ch>
References: <201801100031.ehyAIs9l%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:44312 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751831AbeAJSLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jan 2018 13:11:44 -0500
In-Reply-To: <201801100031.ehyAIs9l%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bai Ping <ping.bai@nxp.com>, kbuild-all@01.org, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, kbuild test robot <fengguang.wu@intel.com>

Hi Linus,

On 2018-01-09 17:40, kbuild test robot wrote:
> tree:  
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> devel
> head:   a3a093ae02e2ae81499ad9e78516dccd72906c25
> commit: ba33f4f42e968854d8367fc4e55b07f835c55832 [63/65] pinctrl:
> imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL
> config: arm-multi_v7_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ba33f4f42e968854d8367fc4e55b07f835c55832
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/pinctrl/freescale/pinctrl-imx6ul.c: In function
> 'imx6ul_pinctrl_probe':
>>> drivers/pinctrl/freescale/pinctrl-imx6ul.c:343:33: warning: passing argument 2 of 'imx_pinctrl_probe' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      return imx_pinctrl_probe(pdev, pinctrl_info);
>                                     ^~~~~~~~~~~~


I think this happened because you only applied patch 5 of the imx
constify patchset, is that correct?

Let me know if you expect me to do something.

--
Stefan

>    In file included from drivers/pinctrl/freescale/pinctrl-imx6ul.c:19:0:
>    drivers/pinctrl/freescale/pinctrl-imx.h:119:5: note: expected
> 'struct imx_pinctrl_soc_info *' but argument is of type 'const struct
> imx_pinctrl_soc_info *'
>     int imx_pinctrl_probe(struct platform_device *pdev,
>         ^~~~~~~~~~~~~~~~~
> 
> vim +343 drivers/pinctrl/freescale/pinctrl-imx6ul.c
> 
>    334
>    335	static int imx6ul_pinctrl_probe(struct platform_device *pdev)
>    336	{
>    337		const struct imx_pinctrl_soc_info *pinctrl_info;
>    338
>    339		pinctrl_info = of_device_get_match_data(&pdev->dev);
>    340		if (!pinctrl_info)
>    341			return -ENODEV;
>    342
>  > 343		return imx_pinctrl_probe(pdev, pinctrl_info);
>    344	}
>    345
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
