From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [RFC] Question about freeing of resource in 'atlas7_pinmux_probe()',
 in file 'drivers/pinctrl/sirf/pinctrl-atlas7.c'
Date: Mon, 19 Dec 2016 07:19:43 +0100
Message-ID: <612eedc5-0f28-7a38-abad-4b9573208875@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, baohua@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

while playing with coccinelle, a missing 'of_node_put()' triggered in 
'atlas7_pinmux_probe()', in file 'drivers/pinctrl/sirf/pinctrl-atlas7.c'.

     /* The sd3 and sd9 shared all pins, and the function select by
      * SYS2PCI_SDIO9SEL register
      */
     sys2pci_np = of_find_node_by_name(NULL, "sys2pci");
     if (!sys2pci_np)
         return -EINVAL;
     ret = of_address_to_resource(sys2pci_np, 0, &res);
     if (ret) <-------------    missing of_node_put(sys2pci_np);
         return ret;
     pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
     if (IS_ERR(pmx->sys2pci_base)) {
         of_node_put(sys2pci_np); <-------------    added by commit 
151b8c5ba1eb
         return -ENOMEM;
     }

Looking at the history of this file, I found a recent commit that added 
another missing of_node_put (see above).


Adding missing 'of_node_put()' in error handling paths is fine, but in 
this particular case, I was wondering if one was not also missing in the 
normal path?


In such a case, I would revert 151b8c5ba1eb and propose something like:
     /* The sd3 and sd9 shared all pins, and the function select by
      * SYS2PCI_SDIO9SEL register
      */
     sys2pci_np = of_find_node_by_name(NULL, "sys2pci");
     if (!sys2pci_np)
         return -EINVAL;
     ret = of_address_to_resource(sys2pci_np, 0, &res);
     if (ret) {
         of_node_put(sys2pci_np);
         return ret;
     }
     of_node_put(sys2pci_np);

     pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
     if (IS_ERR(pmx->sys2pci_base))
         return -ENOMEM;

Thanks for your comment,

best regards,

CJ
