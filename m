From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: add ZTE ZX pinctrl driver support
Date: Thu, 29 Jun 2017 12:51:52 +0300
Message-ID: <20170629095152.ahkv55cjj26c3nmk@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:36175 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbdF2JwF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 05:52:05 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shawn.guo@linaro.org
Cc: linux-gpio@vger.kernel.org

Hello Shawn Guo,

The patch cbff0c4d27f4: "pinctrl: add ZTE ZX pinctrl driver support"
from Apr 24, 2017, leads to the following static checker warning:

	drivers/pinctrl/zte/pinctrl-zx.c:338 zx_pinctrl_build_state()
	warn: passing devm_ allocated variable to kfree. 'functions'

drivers/pinctrl/zte/pinctrl-zx.c
   293  
   294          /* Build function list from pin mux functions */
   295          functions = devm_kzalloc(&pdev->dev, info->npins * sizeof(*functions),
                ^^^^^^^^^^^^^^^^^^^^^^^^

   296                                   GFP_KERNEL);
   297          if (!functions)
   298                  return -ENOMEM;
   299  
   300          nfunctions = 0;
   301          for (i = 0; i < info->npins; i++) {
   302                  const struct pinctrl_pin_desc *pindesc = info->pins + i;
   303                  struct zx_pin_data *data = pindesc->drv_data;
   304                  struct zx_mux_desc *mux;
   305  
   306                  /* Reserved pins do not have a drv_data at all */
   307                  if (!data)
   308                          continue;
   309  
   310                  /* Loop over all muxes for the pin */
   311                  mux = data->muxes;
   312                  while (mux->name) {
   313                          struct function_desc *func = functions;
   314  
   315                          /* Search function list for given mux */
   316                          while (func->name) {
   317                                  if (strcmp(mux->name, func->name) == 0) {
   318                                          /* Function exists */
   319                                          func->num_group_names++;
   320                                          break;
   321                                  }
   322                                  func++;
   323                          }
   324  
   325                          if (!func->name) {
   326                                  /* New function */
   327                                  func->name = mux->name;
   328                                  func->num_group_names = 1;
   329                                  radix_tree_insert(&pctldev->pin_function_tree,
   330                                                    nfunctions++, func);
   331                          }
   332  
   333                          mux++;
   334                  }
   335          }
   336  
   337          pctldev->num_functions = nfunctions;
   338          functions = krealloc(functions, nfunctions * sizeof(*functions),
                                     ^^^^^^^^^
Not allowed.

   339                               GFP_KERNEL);
   340  
   341          /* Find pin groups for every single function */
   342          for (i = 0; i < info->npins; i++) {

regards,
dan carpenter
