Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A539B975;
	Mon, 10 Aug 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350525; cv=fail; b=nDmUaus12q2/AOYfwBJbfTG6uWDzr1ghD2Jn92c6sq4XCOwynHStIuHqQo9+r28rYkzUqHnJrX3xaEOTcSMowMUA7wzRPkoQcY33jqI8kGfBE35E3xdLmXjyib1QZjVJee+u/S6G/F/zDI+LGglWo2DMztv47Q32VG5WkkcbVnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350525; c=relaxed/simple;
	bh=6BMEIMlZa37M8EtauMAtkKlJy7+PbNfkYvBPTMkiRkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aFDdsrjZ43Nv/aBzfK6KQfXDeSX/CMMkUXraWI2x8yPL2TmdMecdTtKKyq8MRPMWAQxliHttXXfBV01CFFVpDu2vb52+VDuFgnz5DoqsHpckn2bzRf6RRv9zlvVs92v/oG7v25H0w9/WkRLNB/OTtTLvgKjjj2bNxJbVxij1o8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AClzcBp0; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AClzcBp0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly+s73nND2BarILq4KoOml01agizUpgbfLnywRbIR9Yj+638cj3YuzJstZTYECzRrCRMSKmGabEv9vRGMnf/dOcU5yaoSqn0/wWxItmg9PFiNHuW58jRc9y2At7svJEnpH4/YVW+pyP9052R0XZ0cWA2Cmd4x4OAAbqQpINSMwFB8QblEysn676uGCkCCX7Q7EiFnPztUQSbKjUG524KO02ZUdzv9HKJz8BAQh1MN5xEHcSanbRE7P9A7LGBhKjjFGkIn3mkbOXn9Pch7InEil5svuSmFZIKzFNRjASS43D95QscwPIrwd2spv0o3TiWvv3Xe7Pd1yo7I5TdQ+YnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5YCkNgmJSvMkK+HRONYuUhvdfgZWXzie+VC3pLmtrY=;
 b=BezGTRcRUraCIQFujrrus6dw9+Dl+VviFHdksCfyJxYWU3lU2bwiORqL4kQ9AAW8DZA2/WSCtnNonNFuxG7BdJrfNq7agSgD5CNB/XPX3WFnCi03U+kumMwrYxP6ihWbYdRMMfADU1bC57NpxRrm2a/Xrl6cnUksIylB3wEYe2mI/wzOnzjEIPNe13VCJmZsu8Agne34671d8A3a6Ny8pV8Mnb/QR4Ox8/e2EczVxYvJ4PNYeBcT9M3DGJMNISeVFBT6FKWYk+EBmBkmhpRGipdLmUQ/9PhNV/lINxY/UVar/IDtQ8OHzCDvHpMnM8PgyJBdpPfO2S4I6KkENAsoXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=outlook.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5YCkNgmJSvMkK+HRONYuUhvdfgZWXzie+VC3pLmtrY=;
 b=AClzcBp0c2jX+8MfsWybNjZu3ypvK94fyhAnkGEZX8nee2HGJK2RR1PmiecnJLpoGDMDr51BpB4bt4h0s5a23ocGQLVi1C530xbHy2hhWgrCAQ9PQ3RpKS0MeHVw9sWVWZqY2Gk+QBbbYiCATFbuufHPGlJiGvLu9mti8JPJXGHsvuUZrTro9qjo0t1IIvkuM/FQ7Ibc0n+6pP62wN2x4p4s5hm2EvMFhS/Zv2/7pmr+nZag+Lf433VtQvikDtaBbhuUe7W3KunafDAikCrImWCLWkFxEPfxIh01riGqUdeyWAIJYN3CK12VAQ8bySA9ZJnUnN4p3wV6nS1Hs2ZhwA==
Received: from DB8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:110::18)
 by AM0PR10MB3332.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:28:36 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::5a) by DB8PR04CA0008.outlook.office365.com
 (2603:10a6:10:110::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 08:28:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:34:04 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:28:34 +0200
Message-ID: <6c926423-777e-475a-9e28-222d3fb5798e@foss.st.com>
Date: Mon, 10 Aug 2026 10:28:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
To: Liu Changjie <liucj1228@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Lee Jones <lee@kernel.org>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, Antonio Borneo
	<antonio.borneo@foss.st.com>, Linus Walleij <linusw@kernel.org>, Russell King
	<linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <mfd@lists.linux.dev>,
	<linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|AM0PR10MB3332:EE_
X-MS-Office365-Filtering-Correlation-Id: d86437f6-c596-4a24-58e5-08def6b95f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|7416014|23010399003|32650700020|11063799006|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	e6RFKTsbjWGzZoqeIvViHcLBeQ3ECZqHNLkVR4TyAcuqesz22qvE5X3mzMLgbOeOHy1MuSHoCOsXKVqT3aGhs+JpTr7jRju9LqWDnZkcvSBGa3BunFT2OREsrPDven2x9q4Afvoc/6Ky/5V1i2p7O80MCL4M7nP8mUaGPKESQ0RaOV6/U4GtW/u/Df7WSeg8hlt71ulwhzmEOEumtI3Mm9ixcu+ljzpx8ke4JgSvf1N4HymTmDLMXXTvVi907OR2LkPc0jDxYIKDx/tq+T27nkYSEpvnRqjnQABMmyDQYorLfAZbl3RuO7fvYcWF2ZLm/WCQqaekk/TttvHX1+DEfqQapuz7vSc5l+mAmlcH2Y4gH0M0KFA7e6PMQrBh4aAALovloMgGya2Af+l+YZTqhdk+4+K/0GgvnllVNYhsKS2P+x+YRXdGH/OB9Z2iraO5khpl+iLoFxh93qUjFjqWW6NKMPSEBF3ZyKtvodxeidEIZiDiz0ieX0zlKvVu+sAJ1zNLEN6JzwoMbVsrQGETbKw9RTs6RlSpTV90M2bvcrzNRKX6NM17Nj1ziwPeqxiJZrDtqqO4mFIaOoFBy351MlX+LVuQHrvE1kntXYzLmnbMZ+Efr127S4jwrtG2HuRGBvMka0/1W3gDzduqxQt1stYHPE/Ss0J+dLOQ+hLvkrb2yqwx/IasM5rlH5jZf7e7looPvr6VW8qHdUQ3DKWELKjnS0uhCZMiWqE7PvcU31HBmzbBncKFzwBHg7jkFqKW
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(7416014)(23010399003)(32650700020)(11063799006)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j5tPkNwWD90FUCGSMmdnvqtu0S11IAbK3NFPZMUhBy1DzrzpJxwQPRxlXq+topp6cXLyNvOTu1UWt7t8n/GQlvIoP2XlOF9iCQ+HolO5rCx3f5+LhaiztFrCz85nTW6oGWEZO2BQQWJZNgGlbFU90NgCL5vx8yrsHxRA7tFccQZWLUgCrjqgNUzRPjuyfMGSzgqtozYSbQRC5YfOs+OHsB+MMaZXsUTRwB1Jz5babesd4ZWOz7nS0dKB31C7DECPBPGpMYT9fqYpMbaz/DVYYLu0Z9ZjPyHTOw+HWKRFpXo2kISN1JlDIEHFSmlGpo5zm9g1fb3E/r0ejJnD/u2m816w6Tmr1Z5U9L0tt0G+ecgO4nO8SdgXXJNIcxu/323yzDIpktLLxl5daGUEaCiaZ/x4L9B2qAFkPdcjlt0GMRQOPavylj9rUsUD6JeR8tYc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:28:36.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d86437f6-c596-4a24-58e5-08def6b95f50
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3332

Hi Liu

On 7/26/26 17:49, Liu Changjie wrote:
> Resending to repair threading after Outlook rewrote the cover Message-ID
> during SMTP submission. Patch contents are unchanged.
> Add initial mainline support for the STM32H7R7 and the Ruiside ART-Pi2
> development board.
> 
> The ART-Pi2 boots through first-stage firmware in the STM32 internal flash.
> That firmware configures the PLLs and memory interfaces before Linux
> executes in place from external XSPI NOR, with 32 MiB of HyperRAM used as
> system RAM.  Reprogramming the PLLs from Linux could therefore stop the
> instruction stream.
> 
> The RCC driver in this series intentionally reconstructs the active clock
> rates from the firmware-programmed RCC registers.  It exposes the resulting
> SYSCLK, bus, timer, UART and SDMMC clocks, while Linux owns only the
> peripheral clock gates used by the initial device tree.  It also exposes
> the RCC reset registers through the existing reset-simple driver.  The
> first reset consumer is SDMMC1.
> 
> The pinctrl driver covers GPIOA-H and GPIOM-P, including the AF0 trace
> functions described by the STM32H7RS pin-control data.  The board device
> tree enables UART4, TIM5, twelve GPIO banks, two LEDs, the user button and
> the four-bit SDMMC1 interface used by the microSD socket.  The socket has
> no card detect signal connected to the MCU, so the board uses broken-cd.
> 
> ARM noMMU selects DMA_GLOBAL_POOL.  The board therefore reserves a 2 MiB
> shared DMA pool for the SDMMC internal DMA descriptor and bounce buffer.
> The pool is required before the mainline mmci-pl18x driver can probe.
> 
Please, have a look on this series from Arnd:

https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/

"Regarding actually removing the code, I would suggest linux-7.4 (January
2027), removing both the board files and any drivers that have either
become newly unused or were missed in a previous machine removal series,
followed by removing support for then unused CPUs a release later."

To be short, cortex-v7M CPUs are now deprecated and board support will be
deleting beginning of next year.

So, I'll not take new cortex-v7M board.

regards
Alex
