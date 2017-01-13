From: Nishanth Menon <nm@ti.com>
Subject: Re: [bug report] pinctrl: Introduce TI IOdelay configuration driver
Date: Fri, 13 Jan 2017 14:44:20 -0600
Message-ID: <83f91b7e-078b-3e9d-e09e-d8480811e6c6@ti.com>
References: <20170112191425.GA15070@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:10921 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750805AbdAMUqE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2017 15:46:04 -0500
In-Reply-To: <20170112191425.GA15070@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, "tony@atomide.com" <tony@atomide.com>

On 01/12/2017 01:14 PM, Dan Carpenter wrote:
> Hello Nishanth Menon,
>
> The patch 003910ebc83b: "pinctrl: Introduce TI IOdelay configuration
> driver" from Jan 5, 2017, leads to the following static checker
> warning:
>
> 	drivers/pinctrl/ti/pinctrl-ti-iodelay.c:668 ti_iodelay_pin_dbg_show()
> 	warn: unsigned 'pin' is never less than zero.
>
> drivers/pinctrl/ti/pinctrl-ti-iodelay.c
>    653  static void ti_iodelay_pin_dbg_show(struct pinctrl_dev *pctldev,
>    654                                      struct seq_file *s,
>    655                                      unsigned int pin)
>                                             ^^^^^^^^^^^^^^^^
>    656  {
>    657          struct ti_iodelay_device *iod;
>    658          struct pinctrl_pin_desc *pd;
>    659          struct ti_iodelay_cfg *cfg;
>    660          const struct ti_iodelay_reg_data *r;
>    661          unsigned long offset;
>    662          u32 in, oen, out;
>    663
>    664          iod = pinctrl_dev_get_drvdata(pctldev);
>    665          r = iod->reg_data;
>    666
>    667          offset = ti_iodelay_pin_to_offset(iod, pin);
>                                                        ^^^
>    668          if (pin < 0) {
>                     ^^^^^^^
>    669                  dev_err(iod->dev, "invalid pin offset for pin%i\n", pin);
>    670
>    671                  return;
>    672          }
>
> It looks to me like probably this code coulde be safely deleted?

yeah it is valid to be removed - had missed your note. Colin also 
noticed and provided a patch 
https://patchwork.kernel.org/patch/9515653/ for the same.


-- 
Regards,
Nishanth Menon
