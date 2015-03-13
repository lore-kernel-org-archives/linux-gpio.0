From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: pinctrl: mediatek: emulate GPIO interrupt on both-edges
Date: Fri, 13 Mar 2015 11:38:24 +0300
Message-ID: <20150313083824.GA5750@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:49077 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247AbbCMIil (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2015 04:38:41 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: yingjoe.chen@mediatek.com
Cc: linux-gpio@vger.kernel.org

Hello Yingjoe Chen,

The patch c3a785c1b041: "pinctrl: mediatek: emulate GPIO interrupt on
both-edges" from Jan 27, 2015, leads to the following static checker
warning:

	drivers/pinctrl/mediatek/pinctrl-mtk-common.c:1252 mtk_pctrl_init()
	warn: passing devm_ allocated variable to kfree. 'pctl->eint_dual_edges'

drivers/pinctrl/mediatek/pinctrl-mtk-common.c
  1213  
  1214          pctl->eint_dual_edges = devm_kzalloc(&pdev->dev,
                                        ^^^^^^^^^^^^
  1215                          sizeof(int) * pctl->devdata->ap_num, GFP_KERNEL);
  1216          if (!pctl->eint_dual_edges) {
  1217                  ret = -ENOMEM;
  1218                  goto chip_error;
  1219          }
  1220  
  1221          irq = irq_of_parse_and_map(np, 0);
  1222          if (!irq) {
  1223                  dev_err(&pdev->dev, "couldn't parse and map irq\n");
  1224                  ret = -EINVAL;
  1225                  goto free_edges;
  1226          }
  1227  
  1228          pctl->domain = irq_domain_add_linear(np,
  1229                  pctl->devdata->ap_num, &irq_domain_simple_ops, NULL);
  1230          if (!pctl->domain) {
  1231                  dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
  1232                  ret = -ENOMEM;
  1233                  goto free_edges;
  1234          }
  1235  
  1236          mtk_eint_init(pctl);
  1237          for (i = 0; i < pctl->devdata->ap_num; i++) {
  1238                  int virq = irq_create_mapping(pctl->domain, i);
  1239  
  1240                  irq_set_chip_and_handler(virq, &mtk_pinctrl_irq_chip,
  1241                          handle_level_irq);
  1242                  irq_set_chip_data(virq, pctl);
  1243                  set_irq_flags(virq, IRQF_VALID);
  1244          };
  1245  
  1246          irq_set_chained_handler(irq, mtk_eint_irq_handler);
  1247          irq_set_handler_data(irq, pctl);
  1248          set_irq_flags(irq, IRQF_VALID);
  1249          return 0;
  1250  
  1251  free_edges:
  1252          kfree(pctl->eint_dual_edges);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This causes a double free.  You can just leave it out since devm_
pointers are freed automatically.

  1253  chip_error:
  1254          gpiochip_remove(pctl->chip);

regards,
dan carpenter
