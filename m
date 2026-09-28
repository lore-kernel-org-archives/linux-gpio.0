Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2C37C0FE;
	Mon, 28 Sep 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586294; cv=fail; b=p1tVK2B4RbDjFCL72UtOqmzjJLT/8uTVkhlLFnZmw1RL5AGpzrQzUMS8ZozhoQB/yJh3Xv8sNM92Cvf/ggm3rpUih8nSRRCqwuopIbaO7bZVBFNEm3WMZT9dCpqOZ5np3wP2TKRW5dhtIWER5Bgzu7znemqBd8MTeyynnoaKj8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586294; c=relaxed/simple;
	bh=DRYrGuo969rsVlEpP8oLC1CBamAB9P2onIdWMu+7D1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gxFkovo9FrcB2Y3ih2gJ0mcULjXHb2fmD/NqUN0A0fWzXtDKCIO8tHRf6wF7DmteZrTKASvKMpkhtFBMQoOBLFxHwhcyYVvmi5MM40cgfzyfcJdCPFJA9s7oAznBqNnA9PrtDgunpOjrbS16GlhV8Gv3J1nUyLj5s4RErtK+BTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EjEpubAb; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EjEpubAb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INcbAHvQcddwIlMGTVOFy+DgR62aSA3P5xe0shBUtR1bHLa41LtH4+ubsEwW+vCTyua2c26SjRMHQln0mO4GOP70LAonm35knGFC1yNatwLWm7zD10NdCJuVA5fKMi/HPCSIdZ+Ur2L3vvWLQB0JSlVoZTLIOziwipicEdSYo4qLbTYhhFjOObWiUSxb5KJ0nrCv38oLvpqoxnWKq/0weIhzoVm2EjVHo2t1F79uaOK0LEf5DQ0kOuZI2bxxNPRKSk0bGD9YkZHIY7IFKVfa/sKKerYVW8zX0X0aUrRi82LcUBUsWZXRRZxf8RDpDJ858QJ+CEEBOoxKelcAS42XPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKwCvD+Ns/HRvX0P7NM04E42gUeZ+GNEcDIaozPiCpY=;
 b=Nya0R36L849jkProepWg69+uXlPhuEzHWxdqXM+kXpbhMuwa1pf/ZkNMI3Y7k5ny1qk4WZ+I8evSnn24Ap561JEbml+6kspLL5SZpJHbQFpJpYDWHmgYuF/zElRFTwZDcamkvUNXHf1UxihicXwojSr2ASWByJzrg1npwPil0493L/x/5CeTwoDZzRIA0NHkfSwwNNCuBdmQavGccaxRKOQnaw8lQwfOIcV2nyROEx5lmAFFO+A57Nwpxb3QRI+OyA2GwInumy5FKrGRoLAzQlh1g/v6u928NkEm/kq6XAvTekz9Sbhdtxv5XEFMi1QYH5HnytrcCHqfxVHszAvJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKwCvD+Ns/HRvX0P7NM04E42gUeZ+GNEcDIaozPiCpY=;
 b=EjEpubAbR59up1PApWiV295JzUawiDHOFQRTUMK3wfVC9tcye6EJOxRjPLYDTSbIkawCIiEhbDEOdTzAOfjaiw7u73V5Qat6/WHnMUIkPCFLg1ddKWxOoiaEYxS/npgjCE11O7cKNPpupFdBBzZbYKNLJtk66UnvEl7bGaMyIf5qdq+R45VVqRHal8FKyYI0ibn5Eb2gqNuv7xn/8QOughwTDuJN8R3RxFsatoykYSPzmQH5gxn+UcvPFgI4w8UrtBv+jFok9ucGCkXFD3YANmxvqpArCOrTMlM9F6OAyb4RoXI0mC/DAb1iSsgcg4wcJS7GAP33zsQPR1Q88odiLA==
Received: from AS4P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::17)
 by AS8PR10MB7729.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:04:47 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::5f) by AS4P192CA0027.outlook.office365.com
 (2603:10a6:20b:5e1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 09:04:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 09:04:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 11:10:38 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 11:04:45 +0200
Message-ID: <7d8ee07c-14a5-429d-8c97-6c4ded486f12@foss.st.com>
Date: Mon, 28 Sep 2026 11:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on
 stm32mp251
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-7-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260711210131.236025-7-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008D:EE_|AS8PR10MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b9d952-0774-47b7-4fc6-08df1d3f8b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|36860700016|1800799024|4143699003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	JKWY1NvBz2x3QqEwtS0cWp/mwPZxZVCiP80d/nrBcsTDu1xHo9jSo79fbgdx23NNTS2GTTG040Rj07uHyGXgczdh76uy1MAiOhYICtm9PTyIXqUP5ef9bsVvd4+337fqsFL2NLfrN0qF2mik6Zl7amXbunRfJS2GmieR5mVUt0JkoqJAWTLied6scd+mYW05hfxapihKVl79JT4DmgZGBhCzdIUTPRLsHx4ke6NIZ6NTny0Axm/7wqQjClnUMe8w/++8i/nEDY9cpR0C+0ZTaa6hNl2NmQpVCrbVpdgktzHqc5q2alk0PYYEaYnhg6xse1JKwDEUeKcOJfO6YN8VGK5gqyFbRsUVCY5OqbkTi7lKesaE1aqOBk2ydgzTaE8xqTsaWdwS5hv24Y0P1r6Nv6tdqQoVNSM+XW6NzvzjBTsiAu0JV8km+XiTYnuIrTvwqCONMRF2DtvtHHRmSm8QiTQqp4Onc04m8/BHJoFzTXtC77qKkxgeUIzivtBPgsvBFNPb14jlkLsbOZn4bIM+H70DZaavUoVnn4WvdSyWnyhc6GEtHS6l8zFbR22DTTGAzZgRJfBlA2V952c16/Bj3Be487h9acmfnhZn2RtA0k+Z0w/3Ds2mukxtEJrcSzot06hxHOSJMa+DbyQCwB+Bj4wS5LZIp6AKrKxqvV0xKO4zGry815ewH+7myRU2K9hJnrvfrCAoYc416yxwbJ8U5A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(36860700016)(1800799024)(4143699003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R0s5Qjp2v+i+hxXQ5GEJGZwbhHMxx2Jk2/+NYlMXHx/lqINv3jayLIFHMMl0/s8tu3udgCvzSD34szZ71EETI5sf5oB/ypsrAfx/T7tg/a1AZ0fHtotNA3KyOvDnulXGEZvryQGFldp0A9mHksGW3Oj8YVR9wKR4QrfnuY2BVTEbw9M3kOGbnHXlbU74t2Il84lRkdjACpBAnW5hOVc2VP3LzLPUexXdIBzIh7neQNghm5pcoT3aZNN2TA85dsgNfAI65MoWSvrhqWiMyQRsMoHkXlYbYXczhLh3L6UsD8NF8NkkInxYCBPiyROSAHqv1fpraGSSu3+oq0/ep+jRFwStfp2A+rlIOAMrGQtMUdL45Wtx+4JgdLd1HrE+XeiElnmeiR1xu8e1gaUTlbp2vJNzBSbH/ClTkBFDdmGvSez0UbK5ZQs68MxpMukX3NsW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:04:46.8078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b9d952-0774-47b7-4fc6-08df1d3f8b69
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7729

Hi Marek

On 7/11/26 22:59, Marek Vasut wrote:
> Add DT nodes for the remaining SDMMC controllers 2 and 3.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 30 ++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 66f3f83b8731f..6e985f115b195 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1667,6 +1667,36 @@ sdmmc1: mmc@48220000 {
>   				status = "disabled";
>   			};
>   
> +			sdmmc2: mmc@48230000 {
> +				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
> +				arm,primecell-periphid = <0x00353180>;
> +				reg = <0x48230000 0x400>, <0x44230800 0x8>;
> +				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&rcc CK_KER_SDMMC2>;
> +				clock-names = "apb_pclk";
> +				resets = <&rcc SDMMC2_R>;
> +				cap-sd-highspeed;
> +				cap-mmc-highspeed;
> +				max-frequency = <166000000>;

I merged some weeks ago a patch introducing SDMCC2. max-freq is 120000000. I'll keep this patch adding SDMMC3, and increasing SDMMC2 max freq.

> +				access-controllers = <&rifsc 77>;
> +				status = "disabled";
> +			};
> +
> +			sdmmc3: mmc@48240000 {
> +				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
> +				arm,primecell-periphid = <0x00353180>;
> +				reg = <0x48240000 0x400>, <0x44230c00 0x8>;
> +				interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&rcc CK_KER_SDMMC3>;
> +				clock-names = "apb_pclk";
> +				resets = <&rcc SDMMC3_R>;
> +				cap-sd-highspeed;
> +				cap-mmc-highspeed;
> +				max-frequency = <166000000>;
> +				access-controllers = <&rifsc 78>;
> +				status = "disabled";
> +			};
> +
>   			ethernet1: ethernet@482c0000 {
>   				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
>   				reg = <0x482c0000 0x4000>;

