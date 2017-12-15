From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: fix "gpio-line-names" property retrieval
Date: Fri, 15 Dec 2017 20:39:54 +0200
Message-ID: <20171215183954.GJ22431@lahna.fi.intel.com>
References: <20171215140233.804E768968@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:55761 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755530AbdLOSoU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Dec 2017 13:44:20 -0500
Content-Disposition: inline
In-Reply-To: <20171215140233.804E768968@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org

On Fri, Dec 15, 2017 at 03:02:33PM +0100, Christophe Leroy wrote:
> Following commit 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names()
> to use device property accessors"), "gpio-line-names" DT property is
> not retrieved anymore when chip->parent is not set by the driver.
> This is due to OF based property reads having been replaced by device
> based property reads.
> 
> This patch fixes that by making use of
> fwnode_property_read_string_array() instead of
> device_property_read_string_array() and handing over either
> of_fwnode_handle(chip->of_node) or dev_fwnode(chip->parent)
> to that function.
> 
> Fixes: 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names() to use device property accessors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
