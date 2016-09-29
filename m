From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: pinctrl documentation not matching code
Date: Thu, 29 Sep 2016 13:33:39 +0100
Message-ID: <1475152419.4359.73.camel@rf-debian.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:33128 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754196AbcI2Mdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Sep 2016 08:33:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org

Hi,

The pinctrl documented behaviour is different from actual code in at
least two areas:

1) pinctrl-bindings.txt doc says that when selecting mux function
_either_ "pins" _or_ "groups" property must be given:

> pin multiplexing nodes:
> 
> function		- the mux function to select
> groups			- the list of groups to select with this function
> 			  (either this or "pins" must be specified)
> pins			- the list of pins to select with this function (either
> 			  this or "groups" must be specified)

and gives an example of "function" + "pins":

> state_2_node_a {
> 	function = "i2c0";
> 	pins = "mfio29", "mfio30";
> };

But this is not what the code does. The code in pinconf_generic_dt_subnode_to_map()
calls pinctrl_utils_add_map_mux() if a function is specified, which always sets the
map type as PIN_MAP_TYPE_CONFIGS_GROUP even if the string came from a "pins" property.
This means the example above from the bindings documentation will not work because it
will attempt to map to groups called "mfio29" and "mfio30".
Is the code wrong or the documentation wrong?

2) The bindings documentation explicitly says that a pinctrl driver can be a client of
itself:

> 
> Note that pin controllers themselves may also be client devices of themselves.
> For example, a pin controller may set up its own "active" state when the
> driver loads. This would allow representing a board's static pin configuration
> in a single place, rather than splitting it across multiple client device

However, although parts of the code seem to intend to support this (as a "hog")
it is prevented by the devicetree.c code. If a pinctrl attempts to be its own client
- that is, the client dev is the same as the pinctrl dev - the code in
dt_to_map_one_config() will return -ENODEV and the pinctrl_get() will fail with that
error:

> 		/* Do not defer probing of hogs (circular loop) */
> 		if (np_pctldev == p->dev->of_node) {
> 			of_node_put(np_pctldev);
> 			return -ENODEV;
> 		}

Again, which is wrong? The documentation or the code?


