Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03A748594B;
	Mon, 28 Sep 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586164; cv=fail; b=AtCMHW8iugelSned0wYRrSjBwbQ7phmN4oK7bI63Jkvbgd32RbRS/ufqANr1/B1mwK99+oE3lGTqQKuMAzPOZtokjYu2iLwNSOxned7hGxl7aSLEmLEH1a9mEkvYeMoUWNolECeJ0F01iSNv21X6fUtFoSotLukVlLlPW9QV9V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586164; c=relaxed/simple;
	bh=aX9wHTFmSDpqhbxununkBQFN0V2v4XCpcXUfkj/UqDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GyVj0GJB/bv8CkqaRtH1k7Tp/UZlYCuF9iI23/dG3zKsg8K5BG6HL237NMddHPc2p2yHy0EzGGCIhGBIAoBj78EdC6cP4IOWs8leh+9U30zbvGLeynHv19THT4FiWQfUOL6/d6ddVbQn+Koh5VM/9bX/HCr3fX7o8SaL4k03HAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=f87GfezJ; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="f87GfezJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDOz0GYx7e7v7HHb7eISkHsXk6RXtPuDKb34kUnkHrI5lJQoT31iEKZEwTgVuWVHSZ21u8hetPRCA1SU/y+VMInBfJKNYyBFaXYmpQBeuJMgta2umzeyATzph7No0/jhG+ZBB3QCEXJeWAlk/wP8mMz427WiKIsU7N7J3oViOu4SbLVb8VSPQczs/GFCUfivx/sJt+JPOSmeF3ti4l4LIi0PpENYQdbxub/8XzG9jiZI3mKwyyFW9ekkmBWY3Zw3BJwYvBU+nI5s0ZD90s1ce8wvThnCKzKXQZINUr1/J2ngMVqv8fpIM7EUdAdhXFVKgcYp3E0yubw3TKFkCzH9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjUD3iAGxM87+8KvofPzc4viQ4F5wIwIKrYP+PZVM/Y=;
 b=apoHQpjafNa1mKhSFXZVCf7zNiGeV5+vPYcjxcCAsqZU3vWwMzPrXotCUh0grgvyjicbVIPZm7iKHGfSwRHSlbbrqBJgYgnG8f2/Z0OWPZybnMOX7cQHn4i3p1vYibfuIM58vp2T6Sx7Z8K81jpzw7V79GF9t9HFtX5Iz6Uj1l9DE+1qYWU27K8g9uBnVG4wEvWeuHPrbkYfDLm3I7GmcEb0JneVpu/tOtq/xyMq5LpVbEM+Fx5rkMugtmQRa8h6dZGcpcW5FfjFK109/0+2wrZs1AKA0j7+wgwsomEvEY+7qHRBAShqVv0HOOtrx9HWZ8vcM0y2XuuGkNclJS6EcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjUD3iAGxM87+8KvofPzc4viQ4F5wIwIKrYP+PZVM/Y=;
 b=f87GfezJu6fWjZWDZIRmlNEFPjbc/7ShhC1VHUbeeODM4qXIn+CYuE1VGxAjljRhIOIx4YLIehZhGx9PCNUR72zRSD/m/5rXv/8dE8ER0ZPyDC4q1S02V7Epu7IH74ZnUOzJlUCX/kGpih8avByzt09phy3AnWEV2qFu40B8FXiOn26CCSLKSSvdfp8tDktariaRQU0YCo2tAK8HyKR8kLu36AV/NM6F+vkAt0VEq5idt5pGnAUBUV/CzT9PrhL1CIdGze6N6MJXD+YedqZghy0lVMqdo4csKbUeQZHaFfuLvegByz8XPCoTOUMXWhaXuZOFsAaFgq3bQd/g/7OGGw==
Received: from AM0P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::40)
 by PA2PR10MB8849.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:02:35 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::9f) by AM0P190CA0030.outlook.office365.com
 (2603:10a6:208:190::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 09:02:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 09:02:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 11:08:27 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 11:02:33 +0200
Message-ID: <502b58ee-2421-41d2-bdfa-a870ba8e325c@foss.st.com>
Date: Mon, 28 Sep 2026 11:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: st: Add pinmux nodes for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-9-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260711210131.236025-9-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|PA2PR10MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 123e9520-7c38-4b4c-2595-08df1d3f3ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X+TL3NrMQAypT48LF7MaBADfG3aX0N1ZGDImBNSHR+Z6EnocqT8UxrHrKOPuwbygclOPg/y0ygbBHezVPJ5bdlAjLIzuij448U0HUqDxBz83p8AazsOzZvFQHJjBoO4LRCXajMstmhCttKrw8K886yEAtXarXOpaTSuxaiSYKCAbyI67P5UJFdA44vIyfVx8ne/5NozH4lZrY3ffKaMEyycKy8+k7PKx7qyTJWgzcQD7AC2I7wp3gs+jHE3vX+j4pmFYxt3q5GWoTVf9k6TAiujKuuyyVLomMt+IcG4jynpULw0HQbga9T37KNFHKfSg9i6PiXF3/hvuvE12c94jq+53xSl7V6SnPfg4I1m6h+A5ypHzVoXGqnA5rXFF/QL1PqlK0ybu2gYlZtbU5HPkC91T+AhSFOdJaqFfpm26Kc1O8OBdLVQfb4NybIK0l5OF+hgA+bPLKbFcH0mMCK+tDoC9GXHc9XX0He8+yg7ZAlra2RQDen091zzPgwm4yf+/12TFpptgnUc++ge1LyQag8cb6MpD1o4FeGjiJWOxBLux9URQqoaPfh+IFrwBeEdeCU4hEOg8UtfnQg4J7nyo1zXDdHuy00HyOGKZ8C6nWvxlwCSZN4dvbgtN13vb9Xo4UIofMpkSWw2D1fsHfMJGfXKfRffFIt6uU8YHHzO2L4I4OaH9+mwrndmSS9B7U1N3qo5k4JtENIWdS3Bful9ezg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZdNGP4UPZRP7grA0DuJvFTTguXvLJtAMgnsifG5yUp0wvLeXwnAhuyB6bggsI1WXRAveJzh6bE8G0hrmHfZyFPRecCMqhYGdLReaeL+afgRqB/sSoTIkQAC6QhVRYoyJpVYEMTyJPcfA67yxaxp1oyPHhVm89hXgkcYHRTd3QCHXOsXuCF4XTkdD5UVtpOXxFAPIevRgI6As0cVsV+nZsaIFTyfkj8Q7AvjGNBUKOeypSexX/tizIvarRgvr2FVvpsS+d+nmdZmDxZ+eoBJrM1lHIzlDtNNmLsBS48Oofxi5l90EfI2X8qh4PeA99nSKMXhzv4WGGoKT8x0qcuTym8EmZl7qjsUiKJoR4Fu7OPk0rCq5FUDz0gf8+LJeyS3zLAiKjPsG2sHxxiMsdpyrDkhLL8SellFJUjDrKjxdGJrtRS3Uc4f1jI822ifT5ndd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:02:35.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123e9520-7c38-4b4c-2595-08df1d3f3ce4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8849

Hi Marek

On 7/11/26 22:59, Marek Vasut wrote:
> Add new pinmux nodes for DH electronics STM32MP2 DHCOS SoM and BB board.
> The following pinmux nodes are added:
> - ETH2 pins
> - I2C8 pins
> - MCO1 pins
> - SDMMC1,2,3 pins
> - SPI1,8 pins
> - UART8,9 pins
> - USART1,2,6 pins
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
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 564 ++++++++++++++++++
>   1 file changed, 564 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index 456ece7f8ebc3..1aadbc6b47da9 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> @@ -182,6 +182,30 @@ pins5 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	eth2_mdio_pins_a: eth2-mdio-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 4, AF11)>; /* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <3>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 5, AF10)>; /* ETH_MDIO */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	eth2_mdio_sleep_pins_a: eth2-mdio-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* ETH_MDC */

I assume it is G4 for MDC ? If yes I fix it when I apply.

> +				 <STM32_PINMUX('C', 5, ANALOG)>; /* ETH_MDIO */
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
>   		pins {
> @@ -203,6 +227,68 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	eth2_rgmii_pins_b: eth2-rgmii-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('C', 8, AF10)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 9, AF10)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('C', 10, AF10)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('C', 4, AF10)>; /* ETH_RGMII_TX_CTL */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <3>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
> +				 <STM32_PINMUX('F', 7, AF10)>; /* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <3>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('G', 0, AF10)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 12, AF10)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('F', 9, AF10)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
> +			bias-disable;
> +		};
> +		pins4 {
> +			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	eth2_rgmii_sleep_pins_b: eth2-rgmii-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('C', 8, ANALOG)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 9, ANALOG)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('C', 10, ANALOG)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('F', 8, ANALOG)>, /* ETH_RGMII_CLK125 */
> +				 <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('G', 0, ANALOG)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 12, ANALOG)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('F', 9, ANALOG)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('C', 11, ANALOG)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('C', 3, ANALOG)>, /* ETH_RGMII_RX_CTL */
> +				 <STM32_PINMUX('F', 6, ANALOG)>; /* ETH_RGMII_RX_CLK */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	mco1_pins_a: mco1-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('I', 6, AF1)>; /* MCO1 */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	i2c2_pins_a: i2c2-0 {
>   		pins {
> @@ -394,6 +480,26 @@ pins2 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	sdmmc1_b4_pins_b: sdmmc1-b4-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('E', 1, AF10)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
>   		pins1 {
> @@ -419,6 +525,31 @@ pins3 {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	sdmmc1_b4_od_pins_b: sdmmc1-b4-od-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('E', 1, AF10)>; /* SDMMC1_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
> +			slew-rate = <1>;
> +			drive-open-drain;
> +			bias-disable;
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
>   		pins {
> @@ -431,6 +562,187 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
> +				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
> +			slew-rate = <1>;
> +			drive-open-drain;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
> +				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
> +				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
> +				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
> +				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
> +				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
> +				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
> +				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
> +				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('D', 13, AF10)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('B', 12, AF10)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('I', 11, AF10)>, /* SDMMC3_D3 */
> +				 <STM32_PINMUX('D', 12, AF10)>; /* SDMMC3_CMD */
> +			slew-rate = <0>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 13, AF10)>; /* SDMMC3_CK */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc3_b4_pins_b: sdmmc3-b4-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('D', 13, AF10)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('B', 12, AF10)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('D', 14, AF12)>, /* SDMMC3_D3 */
> +				 <STM32_PINMUX('D', 12, AF10)>; /* SDMMC3_CMD */
> +			slew-rate = <0>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 13, AF10)>; /* SDMMC3_CK */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc3_b4_od_pins_b: sdmmc3-b4-od-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('D', 13, AF10)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('B', 12, AF10)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('D', 14, AF10)>; /* SDMMC3_D3 */
> +			slew-rate = <2>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 13, AF10)>; /* SDMMC3_CK */
> +			slew-rate = <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('D', 12, AF10)>; /* SDMMC3_CMD */
> +			slew-rate = <2>;
> +			drive-open-drain;
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	sdmmc3_b4_sleep_pins_b: sdmmc3-b4-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC3_D0 */
> +				 <STM32_PINMUX('D', 13, ANALOG)>, /* SDMMC3_D1 */
> +				 <STM32_PINMUX('B', 12, ANALOG)>, /* SDMMC3_D2 */
> +				 <STM32_PINMUX('D', 14, ANALOG)>, /* SDMMC3_D3 */
> +				 <STM32_PINMUX('B', 13, ANALOG)>, /* SDMMC3_CK */
> +				 <STM32_PINMUX('D', 12, ANALOG)>; /* SDMMC3_CMD */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	spi1_pins_a: spi1-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
> +				 <STM32_PINMUX('H', 7, AF2)>; /* SPI1_MOSI */
> +			drive-push-pull;
> +			bias-disable;
> +			slew-rate = <1>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('H', 8, AF2)>; /* SPI1_MISO */
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	spi1_sleep_pins_a: spi1-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
> +				 <STM32_PINMUX('H', 7, ANALOG)>, /* SPI1_MOSI */
> +				 <STM32_PINMUX('H', 8, ANALOG)>; /* SPI1_MISO */
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	spi3_pins_a: spi3-0 {
>   		pins1 {
> @@ -471,6 +783,50 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	usart1_pins_a: usart1-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 3, AF6)>, /* USART1_TX */
> +				 <STM32_PINMUX('A', 1, AF5)>;  /* USART1_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 2, AF6)>, /* USART1_RX */
> +				 <STM32_PINMUX('A', 7, AF6)>; /* USART1_CTS_NSS */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	usart1_idle_pins_a: usart1-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 3, ANALOG)>, /* USART1_TX */
> +				 <STM32_PINMUX('A', 7, ANALOG)>; /* USART1_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 1, AF5)>; /* USART1_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('A', 2, AF6)>; /* USART1_RX */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	usart1_sleep_pins_a: usart1-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 3, ANALOG)>, /* USART1_TX */
> +				 <STM32_PINMUX('A', 1, ANALOG)>,  /* USART1_RTS */
> +				 <STM32_PINMUX('A', 7, ANALOG)>, /* USART1_CTS_NSS */
> +				 <STM32_PINMUX('A', 2, ANALOG)>; /* USART1_RX */
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	usart2_pins_a: usart2-0 {
>   		pins1 {
> @@ -504,6 +860,50 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	usart2_pins_b: usart2-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 4, AF6)>, /* USART2_TX */
> +				 <STM32_PINMUX('A', 5, AF6)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 8, AF8)>, /* USART2_RX */
> +				 <STM32_PINMUX('A', 9, AF6)>; /* USART2_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	usart2_idle_pins_b: usart2-idle-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
> +				 <STM32_PINMUX('A', 9, ANALOG)>; /* USART2_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 5, AF6)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	usart2_sleep_pins_b: usart2-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
> +				 <STM32_PINMUX('A', 5, ANALOG)>, /* USART2_RTS */
> +				 <STM32_PINMUX('A', 9, ANALOG)>, /* USART2_CTS_NSS */
> +				 <STM32_PINMUX('A', 8, ANALOG)>; /* USART2_RX */
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	usart6_pins_a: usart6-0 {
>   		pins1 {
> @@ -547,6 +947,127 @@ pins {
>   				 <STM32_PINMUX('F', 14, ANALOG)>; /* USART6_RX */
>   		};
>   	};
> +
> +	/omit-if-no-ref/
> +	usart6_pins_b: usart6-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 5, AF6)>; /* USART6_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 4, AF6)>; /* USART6_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	usart6_idle_pins_b: usart6-idle-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART6_TX */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 4, AF6)>; /* USART6_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	usart6_sleep_pins_b: usart6-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART6_TX */
> +				 <STM32_PINMUX('F', 4, ANALOG)>; /* USART6_RX */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_pins_a: uart8-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('I', 11, AF5)>, /* UART8_TX */
> +				 <STM32_PINMUX('B', 15, AF3)>;  /* UART8_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 11, AF6)>, /* UART8_RX */
> +				 <STM32_PINMUX('H', 5, AF6)>; /* UART8_CTS_NSS */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_idle_pins_a: uart8-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('I', 11, ANALOG)>, /* UART8_TX */
> +				 <STM32_PINMUX('H', 5, ANALOG)>; /* UART8_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 15, AF3)>; /* UART8_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('F', 11, AF6)>; /* UART8_RX */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart8_sleep_pins_a: uart8-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('I', 11, ANALOG)>, /* UART8_TX */
> +				 <STM32_PINMUX('B', 15, ANALOG)>,  /* UART8_RTS */
> +				 <STM32_PINMUX('H', 5, ANALOG)>, /* UART8_CTS_NSS */
> +				 <STM32_PINMUX('F', 11, ANALOG)>; /* UART8_RX */
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart9_pins_a: uart9-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 8, AF6)>, /* UART9_TX */
> +				 <STM32_PINMUX('F', 12, AF6)>;  /* UART9_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('I', 5, AF6)>, /* UART9_RX */
> +				 <STM32_PINMUX('G', 7, AF6)>; /* UART9_CTS_NSS */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart9_idle_pins_a: uart9-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 8, ANALOG)>, /* UART9_TX */
> +				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART9_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 12, AF6)>; /* UART9_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('I', 5, AF6)>; /* UART9_RX */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	uart9_sleep_pins_a: uart9-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 8, ANALOG)>, /* UART9_TX */
> +				 <STM32_PINMUX('F', 12, ANALOG)>,  /* UART9_RTS */
> +				 <STM32_PINMUX('G', 7, ANALOG)>, /* UART9_CTS_NSS */
> +				 <STM32_PINMUX('I', 5, ANALOG)>; /* UART9_RX */
> +		};
> +	};
>   };
>   
>   &pinctrl_z {
> @@ -569,6 +1090,25 @@ pins {
>   		};
>   	};
>   
> +	/omit-if-no-ref/
> +	i2c8_pins_b: i2c8-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 4, AF8)>, /* I2C1_SCL */
> +				 <STM32_PINMUX('Z', 9, AF8)>; /* I2C1_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	i2c8_sleep_pins_b: i2c8-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C1_SCL */
> +				 <STM32_PINMUX('Z', 9, ANALOG)>; /* I2C1_SDA */
> +		};
> +	};
> +
>   	/omit-if-no-ref/
>   	spi8_pins_a: spi8-0 {
>   		pins1 {
> @@ -592,4 +1132,28 @@ pins1 {
>   				 <STM32_PINMUX('Z', 1, ANALOG)>; /* SPI8_MISO */
>   		};
>   	};
> +
> +	/omit-if-no-ref/
> +	spi8_pins_b: spi8-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('Z', 5, AF3)>, /* SPI8_SCK */
> +				 <STM32_PINMUX('Z', 7, AF3)>; /* SPI8_MOSI */
> +			drive-push-pull;
> +			bias-disable;
> +			slew-rate = <1>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('Z', 8, AF3)>; /* SPI8_MISO */
> +			bias-disable;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	spi8_sleep_pins_b: spi8-sleep-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('Z', 5, ANALOG)>, /* SPI8_SCK */
> +				 <STM32_PINMUX('Z', 7, ANALOG)>, /* SPI8_MOSI */
> +				 <STM32_PINMUX('Z', 8, ANALOG)>; /* SPI8_MISO */
> +		};
> +	};
>   };

