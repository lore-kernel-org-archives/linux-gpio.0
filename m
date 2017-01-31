From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Tue, 31 Jan 2017 10:00:49 +0100
Message-ID: <fd107367-caf5-0817-6a02-352f5af0dbb8@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB11651AE84528322CB29B33FF8A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60731 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbdAaJBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 04:01:05 -0500
In-Reply-To: <SG2PR06MB11651AE84528322CB29B33FF8A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Chris,

On 30/01/2017 20:19, Chris Brandt wrote:
> Hi Jacopo,
>
> On Wednesday, January 25, 2017, Jacopo Mondi wrote:
>> +
>> +	return 0;
>> +
>> +free_map:
>> +	devm_kfree(rz_pinctrl->dev, *map);
>> +free_fngrps:
>> +	devm_kfree(rz_pinctrl->dev, fngrps);
>> +free_pins:
>> +	devm_kfree(rz_pinctrl->dev, mux_modes);
>> +	devm_kfree(rz_pinctrl->dev, grpins);
>> +	return ret;
>> +}
>
> Since one of the benefits of using devm_kzalloc is that if
> the probe fails and returns an error, all the memory associated with
> that device will automatically get freed, you 'might' not
> need this code to free memory.
>
> I say might because I'm not sure if returning an error here will
> kill the driver or not. But, might be interesting to look into.
>

No, returning an error here would not kill the driver BUT if 
dt_node_to_map fails, dt_free_map is called immediately later [1]

So here we maybe should not use device managed memory as it does not 
bring anything, do not free *map as it is freed later in dt_free_map, 
but release fngrps mux_modes and grpins, as we lose reference to them 
outside the scope of this function.

Do you agree?

>

>> +#define RZ_PIN_NAME(bank, pin)						\
>> +	PIN_##bank##_##pin
>> +
>> +#define RZ_PIN_DESC(b, p)						\
>> +	{ .number = RZ_PIN_NAME(b, p),					\
>> +	  .name = __stringify(RZ_PIN_NAME(b, p)),			\
>
> The hardware manual uses the names "P1_0" for ports, so it might
> be better to match that format for consistency.
>
>

Noted

Thanks
    j


[1] http://lxr.free-electrons.com/source/drivers/pinctrl/devicetree.c#L236


