From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [RFC] Question about freeing of resource in
 'atlas7_pinmux_probe()', in file 'drivers/pinctrl/sirf/pinctrl-atlas7.c'
Date: Mon, 19 Dec 2016 15:54:24 +0200
Message-ID: <7123e174-cc22-4a76-337c-661ee87994df@mentor.com>
References: <612eedc5-0f28-7a38-abad-4b9573208875@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:53281 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750933AbcLSNya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Dec 2016 08:54:30 -0500
In-Reply-To: <612eedc5-0f28-7a38-abad-4b9573208875@wanadoo.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linus.walleij@linaro.org, baohua@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On 12/19/2016 08:19 AM, Marion & Christophe JAILLET wrote:
> Hi,
> 
> while playing with coccinelle, a missing 'of_node_put()' triggered in 
> 'atlas7_pinmux_probe()', in file 'drivers/pinctrl/sirf/pinctrl-atlas7.c'.
> 
>      /* The sd3 and sd9 shared all pins, and the function select by
>       * SYS2PCI_SDIO9SEL register
>       */
>      sys2pci_np = of_find_node_by_name(NULL, "sys2pci");
>      if (!sys2pci_np)
>          return -EINVAL;
>      ret = of_address_to_resource(sys2pci_np, 0, &res);
>      if (ret) <-------------    missing of_node_put(sys2pci_np);
>          return ret;
>      pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
>      if (IS_ERR(pmx->sys2pci_base)) {
>          of_node_put(sys2pci_np); <-------------    added by commit 
> 151b8c5ba1eb
>          return -ENOMEM;
>      }
> 
> Looking at the history of this file, I found a recent commit that added 
> another missing of_node_put (see above).
> 
> 
> Adding missing 'of_node_put()' in error handling paths is fine, but in 
> this particular case, I was wondering if one was not also missing in the 
> normal path?

Right, in this particular case 'of_node_put()' should be both on error
and normal paths.

> 
> In such a case, I would revert 151b8c5ba1eb and propose something like:
>      /* The sd3 and sd9 shared all pins, and the function select by
>       * SYS2PCI_SDIO9SEL register
>       */
>      sys2pci_np = of_find_node_by_name(NULL, "sys2pci");
>      if (!sys2pci_np)
>          return -EINVAL;
>      ret = of_address_to_resource(sys2pci_np, 0, &res);
>      if (ret) {
>          of_node_put(sys2pci_np);
>          return ret;
>      }
>      of_node_put(sys2pci_np);

Functionally it looks good, I have two comments though.

1) you don't need to revert 151b8c5ba1eb, the commit is a proper fix
   per se but incomplete, please add your change on top of it,

2) minimizing the lines of code by removing duplicates is always good,
   so here a better and complete fix will be like the following one:

	sys2pci_np = of_find_node_by_name(NULL, "sys2pci");
	if (!sys2pci_np)
		return -EINVAL;

	ret = of_address_to_resource(sys2pci_np, 0, &res);
	of_node_put(sys2pci_np);
	if (ret)
		return ret;

	pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
	if (IS_ERR(pmx->sys2pci_base))
		return -ENOMEM;

> 
>      pmx->sys2pci_base = devm_ioremap_resource(&pdev->dev, &res);
>      if (IS_ERR(pmx->sys2pci_base))
>          return -ENOMEM;

--
With best wishes,
Vladimir
