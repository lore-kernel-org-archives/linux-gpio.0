Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C214EC65C;
	Thu,  3 Sep 2026 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453172; cv=none; b=KsgoOQSZHanR05Iz0MNFvtqH8RisWMyQXKUThYeCXxDLXAfZJpG8A0hsvk8tH1asHODduSXPb8JPusVcexHpK2+WsbYV5Gv9BqFKehlHcVOE+ryrKfWewxHuWIpei0HMN933hFKLhb8umILSa174T8GY5KBOkZ353prqHdl1Djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453172; c=relaxed/simple;
	bh=6pHy9//q9H0Ofm6mQAv5BYFGgr3Hvu8T1FCebCcnZo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoP1Sc39zbAUWscGLcUn1bASnBWYkgd+9eZ05tdgAHhzUv8jPUlYepJEWlg4+Y9OXvvhEP/vR8EO/USMwsryt7bYWahOCOs3UDGFGWPTHKy5xfpLHW5CPGXYU0vUCZRBwuZcFy+7RmpCL/FAVlbgdk93EBY+0+mcFFM5R+GIAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF5D1F000E9;
	Thu,  3 Sep 2026 16:32:47 +0000 (UTC)
Message-ID: <40c96e12-f2f1-4d95-a95f-d4a9cbde7ab4@tuxon.dev>
Date: Thu, 3 Sep 2026 19:32:45 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] pinctrl: renesas: rzg2l: Unify the power source
 handling
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
 <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
 <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/3/26 18:32, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 3 Sept 2026 at 13:34, Claudiu Beznea
> <claudiu.beznea+renesas@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The previous code handled power sources using a mixture of power
>> source specific definitions and lookups in the available_ps[] array.
>> Unify the power source handling by introducing
>> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
>> source through its power source value, associated register value,
>> associated capabilities (e.g. Ethernet), and associated IOLH index.
>>
>> Introduce two new functions, rzg2l_ps_to_desc() and
>> rzg2l_pwr_reg_val_to_desc(), using the
>> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
>> implementations are similar.
>>
>> These functions retrieve a power source descriptor based on either a
>> power source value or a power source register value. Other functions
>> that need to perform power source specific operations can call them to
>> retrieve the corresponding power source descriptor.
>>
>> The register values for the soft power sources were kept to zero since
>> they are not used across the driver's code.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v6:
>> - described all the available power sources in the available_ps[]
>>    array and dropped to wildcard approach to avoid letting the user
>>    selecting unavailable power source for pins
>> - simplified RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC()
>> - for these two points ^ didn't collect the Wolfram's Tb tag
>> - dropped rzg2l_ps_is_supported()
>> - used conditional operator in rzg2l_ps_to_iolh_idx()
>> - adjusted the patch description
> 
> Thanks for the update!
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> 
>> +static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
>> +       /* Ethernet I/O voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
>> +                             RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
>> +                             RZG2L_IOLH_IDX_2V5),
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
>> +                             RZG2L_IOLH_IDX_3V3),
>> +
>> +       /* SD I/O voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
>> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
>> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_2V5),
> 
> Before (see below), only Ethernet could select the 2.5V domain, so
> shouldn't this entry be dropped?

That's a mistake. I'll drop it from here and from QSPI section.

> 
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
>> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_3V3),
>> +
>> +       /* QSPI I/O voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_2V5),
> 
> Same here?
> 
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_3V3),
>> +
>> +       /* AWO I/O voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_AWO_POC,
>> +                             RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_AWO_POC,
>> +                             RZG2L_IOLH_IDX_3V3),
>> +
>> +       /* ISO I/O voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_ISO_POC,
>> +                             RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_ISO_POC,
>> +                             RZG2L_IOLH_IDX_3V3),
>> +
>> +       /* WDTOVF I/O voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_3V3),
>> +
>> +       /* Software voltage domains */
>> +       RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_1V8),
>> +       RZG2L_PINCTRL_PS_DESC(2500, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_2V5),
>> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_3V3),
> 
> I never really understood PIN_CFG_SOFT_PS...

That was to match b/w a voltage and an IOLH value according to the table from 
45.3.7 Driving Ability Control Register (IOLH_m) in the RZ/G3S manual (rev.1.30)

Thank you,
Claudiu
