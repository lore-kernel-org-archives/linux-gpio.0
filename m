From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: Introduce TI IOdelay configuration driver
Date: Thu, 12 Jan 2017 22:14:25 +0300
Message-ID: <20170112191425.GA15070@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:44055 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdALTOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 14:14:55 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: nm@ti.com
Cc: linux-gpio@vger.kernel.org

Hello Nishanth Menon,

The patch 003910ebc83b: "pinctrl: Introduce TI IOdelay configuration
driver" from Jan 5, 2017, leads to the following static checker
warning:

	drivers/pinctrl/ti/pinctrl-ti-iodelay.c:668 ti_iodelay_pin_dbg_show()
	warn: unsigned 'pin' is never less than zero.

drivers/pinctrl/ti/pinctrl-ti-iodelay.c
   653  static void ti_iodelay_pin_dbg_show(struct pinctrl_dev *pctldev,
   654                                      struct seq_file *s,
   655                                      unsigned int pin)
                                            ^^^^^^^^^^^^^^^^
   656  {
   657          struct ti_iodelay_device *iod;
   658          struct pinctrl_pin_desc *pd;
   659          struct ti_iodelay_cfg *cfg;
   660          const struct ti_iodelay_reg_data *r;
   661          unsigned long offset;
   662          u32 in, oen, out;
   663  
   664          iod = pinctrl_dev_get_drvdata(pctldev);
   665          r = iod->reg_data;
   666  
   667          offset = ti_iodelay_pin_to_offset(iod, pin);
                                                       ^^^
   668          if (pin < 0) {
                    ^^^^^^^
   669                  dev_err(iod->dev, "invalid pin offset for pin%i\n", pin);
   670  
   671                  return;
   672          }

It looks to me like probably this code coulde be safely deleted?

   673  
   674          pd = &iod->pa[pin];

regards,
dan carpenter
