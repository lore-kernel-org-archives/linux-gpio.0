From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Mon, 6 Feb 2017 19:15:24 +0100
Message-ID: <83c749f8-4eee-96e7-9c91-8a350d2a7498@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <2041391.79UjQ7DgUt@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42518 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751946AbdBFSP3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 13:15:29 -0500
In-Reply-To: <2041391.79UjQ7DgUt@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linus.walleij@linaro.org, Tony Lindgren <tony@atomide.com>
Cc: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Laurent,

On 01/02/2017 16:21, Laurent Pinchart wrote:
> Hi Jacopo,
>
[snip]
>
>> +}
>> +
>> +/**
>> + * rz_dt_node_to_map() - Parse device tree nodes and collect pins, groups
>> and
>> + *			 functions
>
> I don't think we have groups and functions, do we ?
>

Sort of.. The hardware does not have that, but we create them from pin 
configuration sub-nodes, as the pinmux core API is sort of 
group/function centric (see the pinmux_ops.set_mux function prototype)

[snip]

> +	mutex_lock(&rz_pinctrl->mutex);

This seems weird. The pinctrl generic functions indeed state that the 
caller
must take care of locking, but there doesn't seem to be any lock protecting
races between .dt_node_to_map() calling the generic functions below, and 
the
generic .get_group_*() handlers.

> +	ret = pinctrl_generic_add_group(pctldev, grpname, grpins, npins,
NULL);
> +	if (ret) {
> +		mutex_unlock(&rz_pinctrl->mutex);
> +		goto free_map;
> +	}
> +
> +	ret = pinmux_generic_add_function(pctldev, grpname, fngrps,
> +					  1, mux_modes);
> +	if (ret) {
> +		mutex_unlock(&rz_pinctrl->mutex);
> +		goto free_map;
> +	}
> +	mutex_unlock(&rz_pinctrl->mutex);

radix trees are RCU protected structures, so no locking should be 
required when accessing them from different places, so I guess lock here 
is just to protect the num_groups and num_functions variables in core 
pin controller driver...

[snip]

>> +/**
>> + * rz_dt_free_map()
>> + */
>> +static void rz_dt_free_map(struct pinctrl_dev *pctldev,
>> +			   struct pinctrl_map *map, unsigned int num_maps)
>> +{
>> +	struct rz_pinctrl_dev *rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
>> +
>> +	devm_kfree(rz_pinctrl->dev, map);
>
> Shouldn't you also free the other allocated pieces of memory (fngrps,
> mux_modes and grpins) ?
>

That's an interesting one. If I have to free all data associated with 
that map (and I assume so) I shall be able to retrieve groups and 
functions that map represents and delete them and

Currently there is no generic pinctrl and pinmux function to retrieve a 
group or function by name, but only by their id (selector).
It would take 10minutes to add them, but I wonder if that's desirable or 
there are other ways to do so I haven't found out yet.

Linus, Tony and gpio people: do you have opinions on this? I can add 
those functions to core/pinmux in my next patch series if I get your ack 
here.

Thanks
    j

