Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB483F23CF;
	Tue, 14 Jul 2026 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013962; cv=none; b=hI9QkEGin8vvWhyoSM0NCeCYiCce6qL52A7qm2YS7IzwQt9yg581PuirnmIsQFoOZND0HV5Pxgu9JCvoF8VOLuEwmFq51kwoQe/OullwXsOeXmesH78v4i+22fVD7a5NFYs7V3MyBFmj3CBiLSphO4Lyu2GBKvCF513Las/Veb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013962; c=relaxed/simple;
	bh=mvdef3HhUbjshgP3VH0HTN0FXnTzDuMFLFmU12GGNZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8b2/l8WHVGWPJblKgbshi5oAoxdKnH89TPgleLrIHpgK4recQLmeOG81I9HUXhu/5nvDmsow5xmvjtAVnAfuaukhA94iS9cTsfFIiGQsvW7nwmfU2ioXzdwdnnoLcZYktdqIiauLAGsHdhX56/zydbBxor8zzioOQqt1sxZA5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290551F000E9;
	Tue, 14 Jul 2026 07:25:56 +0000 (UTC)
Message-ID: <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
Date: Tue, 14 Jul 2026 10:25:52 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 wsa+renesas <wsa+renesas@sang-engineering.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
 <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev>
 <TY3PR01MB1134672AC39737CA91F8FDBA886FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134672AC39737CA91F8FDBA886FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/13/26 18:15, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea<claudiu.beznea@tuxon.dev>
>> Sent: 13 July 2026 15:57
>> Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power
>> source
>>
>>
>>
>> On 7/13/26 16:56, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea<claudiu.beznea@tuxon.dev>
>>>> Sent: 13 July 2026 14:19
>>>> Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S
>>>> support for selecting the I3C power source
>>>>
>>>> Hi, Biju,
>>>>
>>>> On 7/12/26 17:55, Biju Das wrote:
>>>>> Hi Claudiu,
>>>>>
>>>>> Thanks for the patch.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Claudiu Beznea<claudiu.beznea+renesas@tuxon.dev>
>>>>>> Sent: 10 July 2026 12:37
>>>>>> Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support
>>>>>> for selecting the I3C power source
>>>>>>
>>>>>> From: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V.
>>>>>> The pin controller provides a register to select between these two options.
>>>>>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S
>> SoC.
>>>>>> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
>>>>>> Tested-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
>>>>>> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v4:
>>>>>> - none
>>>>>>
>>>>>> Changes in v3:
>>>>>> - collected tags
>>>>>>
>>>>>> Changes in v2:
>>>>>> - none
>>>>>>
>>>>>>     drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
>>>>>>     1 file changed, 68 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>>>> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>>>> index b52a85066f63..9a0706fea220 100644
>>>>>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>>>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>>>> @@ -69,6 +69,7 @@
>>>>>>     #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
>>>>>>     #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
>>>>>>     #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
>>>>>> +#define PIN_CFG_IO_VMC_I3C		BIT(22)
>>>>>>
>>>>>>     #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
>>>>>>     #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
>>>>>> @@ -186,6 +187,9 @@
>>>>>>     #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
>>>>>>     #define PVDD_MASK		0x3
>>>>>>
>>>>>> +#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
>>>>>> +#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
>>>>>> +
>>>>>>     #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
>>>>>>     #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>>>>>>     #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
>>>>>> @@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
>>>>>>      * @oen: OEN register offset
>>>>>>      * @qspi: QSPI register offset
>>>>>>      * @other_poc: OTHER_POC register offset
>>>>>> + * @i3c_set: I3C_SET register offset
>>>>>>      */
>>>>>>     struct rzg2l_register_offsets {
>>>>>>     	u16 pwpr;
>>>>>> @@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
>>>>>>     	u16 oen;
>>>>>>     	u16 qspi;
>>>>>>     	u16 other_poc;
>>>>>> +	u16 i3c_set;
>>>>>
>>>>>>     };
>>>>>>
>>>>>>     /**
>>>>>> @@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
>>>>>>      * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
>>>>>>      * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
>>>>>>      * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
>>>>>> + * @i3c_set_poc: I3C_SET_POC mask
>>>>>>      */
>>>>>>     struct rzg2l_register_masks {
>>>>>>     	union {
>>>>>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
>>>>>>     			u8 other_poc_pvdd1833_oth_iso_poc;
>>>>>>     			u8 other_poc_wdtovf_n_poc;
>>>>>>     		};
>>>>>> +
>>>>>> +		/* RZ/G3S masks */
>>>>>> +		struct {
>>>>>> +			u8 i3c_set_poc;
>>>>> How this POC is different from Ethernet, SDHI and XSPI POC?
>>>> Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.
>>> RZ/G3L has i3c_set_poc, which has same bitmask as other_poc_wdtovf_n_poc.
>>> Maybe create register specific masks??
>>>
>>> struct other_poc and struct i3c_set instead of union. So that both
>>> RZ/G3L and RZ/G3S can share the same struct for i3c.
>> When RZ/G3L I3C POC support will be added the i3c_set_poc member of struct rzg2l_register_masks could be
>> moved as common member:
>>
>> Current code base allows for this extension. You can have:
>> struct rzg2l_register_masks {
>> +       /* Common masks. */
>> +       u8 i3c_set_poc;
>>           union {
> OK, This union will go when we add RZ/G3L.
> 
>>                   /* RZ/G3L masks */
>>                   struct {
>>                           u8 other_poc_pvdd1833_oth_awo_poc;
>>                           u8 other_poc_pvdd1833_oth_iso_poc;
>>                           u8 other_poc_wdtovf_n_poc;
>>                   };
>> -               /* RZ/G3S masks */
>> -               struct {
> Looks, this struct not needed now. struct with single member
> has no value at all.

I'll let Geert decide if he wants me to drop it.

Thank you,
Claudiu
