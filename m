Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF24A0901;
	Thu,  1 Oct 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847821; cv=fail; b=IXMLG7iLuJ7FtJtMAlhENm9a/i3eytHdKnR1M9B8e0EWxPHJ8BxQfUS3FNZ5fhUB8UXtnKYISMykUUBeYVhp8xE0t2ct+z7R9KlH95ncCPHEu0ueVObppNxTgR/26H5zwo06MTh9pcf9xS5p/xc8/1PRFpsmba0Pj/F3IIEOT/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847821; c=relaxed/simple;
	bh=S99VT5CN1kBERmTEIEoWH64R8RA7AdAVlfuUNN29+aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ab/5dHM04h+qqNIZcYBOmogUCP4s2ekPUiTACjpcR2ndbrlprCYuC3uYQzKfNvIDvGvAtohnj0zDy3S+GjDCPm5NUL/r5TxJgxCgnhuviNyXcf7PeuKolhthFQSz7/Oefc7SuN5llmZyRAkvBKPRCua7rYii9VNoNxxKUkkHmaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oPGe6fC4; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oPGe6fC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A79zMjvfTkaFOZyOwjVGQPbN1vbUJJ2h5+BawzG8H9LNUO1Bjh8odlL9UmRi8tCT1WRUXR0t+GGeYBICku4JgmWBBnQMfb5jQ+Z5YYyxvvUrC5JsTVYuLjmYfqCEyhf2G7ZcwORHlxDzbf88F5SeSQspBB+Fso3ApI5t6FxDZHN1zSh46WINm8tJrjmvAwCcp6AtXJTNs4JybztxXZPvJRg2pxbqR9g79Q6yPtivxwSwEacym1qVRx37J4X28jieYhZTIs7SMJnPR2bSwmqGWT3Fx02pmBDtHyyZDuZSf4FWyBHFLg4aY4tfirQfS4fH7Z4Jt52rfPabGXTs6jLHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n0CnZvo+6eTpzF1nBxQ1ccBSLbwhr/WCDc8ErOCpL8=;
 b=V6BO5v3RLy9eKWmCB08f9Rh74dmTV1KIKxBlDMVvEUNvpO6ILfnKZQZm+hCIzR02UTLjSNZ5Me0ATl/NbZQdvpA/T2dXdLO1wBntgkeDFcZaXrLABq7obPTlWTB+/8FF8Pfq9aNi/Knl99HZCtRU58/h1rcgS6gX0da5HI/hZfyj0vjuQPxFQfR0oSuFESbI4OcZ7RmkCKDY+oY0IG4EINfhGX3CY91VltjeE41JV+0bs9R+TIhaKM4fMR8HR6yxFsXHPhQMiIv1qn/R9sugGFKkWNGBnfn9Q9RA1rsvF3MD7y3ATWBOPMd43arjqLNTrCL3GDj+oCC+PSEcncvG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n0CnZvo+6eTpzF1nBxQ1ccBSLbwhr/WCDc8ErOCpL8=;
 b=oPGe6fC4jtROPYSL7/ztUof++UoKSooX5IAvnzHjaybcA8AGt1X8BkLz7R2c24FiyXVVmwvyCit2yprW6guFvNvHogW9Tfdy8aGnxPT2gAebDlK/7Z89S/7U8zML+upls4IATIplDwTc9tTx46TKcaMhY9J44MTGB3aVQtR+yNTK+DciA4DrTz7htTGI3v/p+a6YwI5DIrjnCtxWCv3jKmE47GbpEvupbXodV3FR+Bcw1suiUNKaXXjpFvWKYNucF7nbV4z/irYvpWXWo6rvKZyVym1wuz8IVA+JeR5J6fikluL/LInRkIBoLNONBlJlZGztG0mmFqc+U+rATP9Gyw==
Received: from PAZP264CA0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::8)
 by VI1PR10MB8134.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 09:43:34 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:102:237:cafe::b) by PAZP264CA0201.outlook.office365.com
 (2603:10a6:102:237::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 09:43:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 09:43:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:50:06 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:43:32 +0200
Message-ID: <f404d273-352c-436c-87f1-885297b01418@foss.st.com>
Date: Thu, 1 Oct 2026 11:43:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: st: Do not encode path in
 sdmmc2_*_pins_a/pins2 phandle
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260929194035.496244-1-marex@nabladev.com>
 <20260929194035.496244-5-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260929194035.496244-5-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|VI1PR10MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccc822a-c6a9-4fcb-12b5-08df1fa075ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vU7mAdSS+VnyzDRVITBacqKHruGXjCJhG8YiCeQTF/FsP0Qz/ZTcI/ZFn3O0C75PUz26qYma9vDDvosZuPF7LeaacSKp2XGPyqVt/h6k3GhmcBDUq6g/Bi5H3uYWOuxVg8O//4ArNJuWYEAOjMKXTUqhUFTJviedsMGnceyj2P1i61mN6x2HeDk6mWmYeACJ8FfGTU7Daztvs9E/LSUCL+ImqxGErhJ5fTc5YQX9HVcR/bzJg3yR5KDeJ8VDMmyQkzhSBb9rl/b0qy5Z+y0wJ6AhiF2xJ/MdecZimI+CJbWh4AyjCvgsr/DCrdeJcum7HSX3jUNblrMEmIHRNDLHsLt9gwTiXoD9r1O11KVsD9RfXWVY7MP8WnvhTvRXiA+2ZEqPOQd/gL2mIg35fbUHNXEDFFYPpeKJCiXluVvatI1cHEai9PTxS3GGz4UXDLcg/uknf2Gvdqx7XsvMdaum3p/bI6jcq5IHlk8/8KjcuuTO/aqKucLNOlzyX8MeT21vl61ut3AjbnsoocR+KGBsW9Oa+QVHthO0076kZvrY3P+pDolQtCoXKc41fjK0knmL20qXXXA2fV5rUTsiunuDlsdkU37GQukenz59m1wn/ulIACCNAQhWbty0LNYeBJOLc44Za8S8nFYjN4Q+LvB8cSIl0rhBY993iYx4WviwIWfsuJwfM7OHQJv0cURzdq4p2k7uq9SzsCndCiAWqqI1Sg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2hROHqvPEYBCqwjTFmD2b6Qw5Oh0Dw+x8/OWtAm91W4PkMI7RJqyN/I51dNvm/RP7rld0EbwzdbXHfGoGO8GKiyfZBqKTIctH4fokm95Mnx2sJiShV774E3jvBFj6N2n7WUrRojndZIpneHaXfgni2Atthl3MJAUe+3MFnoKdUOcqCCOLxZjcPN53duudzYEH4GlJbCGfBuW/udek7hdkos2I+9QapqpWpLeDY1Q3o9rLQxqoZarCZq3VOEUx1cJm59DiW9apOZK72uD/4wYtYxGV+9PYd/S41s29yVMoDVctNVVb9PXtlXZxbC6Fu1m8rwlLqMzWe+pnQeZc/EG0NLdgRjysfjzkaWmLNxNwF8KkcfJcAhgvb3hrUAMn4XftvrJcKHbmKadw4Wr2JwUtzKTS3tNdud5bEIHqokvZmWD+aK/LwG22Yj4/sezvPc1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:43:34.2819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccc822a-c6a9-4fcb-12b5-08df1fa075ec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8134

Hi Marek

On 9/29/26 21:39, Marek Vasut wrote:
> Do not encode node path in phandles, describe subnodes instead.
> This is only a consistency change, no functional change.
> 
> Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
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
>   .../arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> index 80d829c55d9d8..bcf63e2ea9898 100644
> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> @@ -389,14 +389,18 @@ &scmi_vddio4 {
>   	regulator-always-on;
>   };
>   
> -&{sdmmc2_b4_pins_a/pins2} {
> -	/delete-property/ bias-disable;
> -	bias-pull-up;
> +&sdmmc2_b4_pins_a {
> +	pins2 {
> +		/delete-property/ bias-disable;
> +		bias-pull-up;
> +	};
>   };
>   
> -&{sdmmc2_b4_od_pins_a/pins2} {
> -	/delete-property/ bias-disable;
> -	bias-pull-up;
> +&sdmmc2_b4_od_pins_a {
> +	pins2 {
> +		/delete-property/ bias-disable;
> +		bias-pull-up;
> +	};
>   };
>   
>   &sdmmc2 {

Patches 1 to 5 applied on stm32-next. Note that all patches have been squashed.

Thanks
Alex
