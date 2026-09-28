Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7842222AC;
	Mon, 28 Sep 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598615; cv=fail; b=TWXZd+qWyskM+EuybCUS/IUa36CXzQsqBabG8JcezP7+SrRdSq0MyyaNkN+XwcsZd8U91+dv45l8olzSDlWMc+HdZZfVUebEyWhZGlVoQvH33rFWxna5jEyqGGdyYejGmy+nLT5hgBhF3tauLolthBujKxcSgCrc7UuuXn5VKpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598615; c=relaxed/simple;
	bh=gv1c7Ei+jI+2hZH00RnelhnWcSbvpq45T21Aujlry/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wjkl83XUYqXi4Z2uukj7pgPMcfvb4W4ESpoqxx/dYoK1XpP6BtJVZ2TJeqUV00z55eYG0WBAKdLx1eAQxz3FMmeBRmMuv9nbtY+M1E/SR9OYpkp50vAS1xpuc++I3SjgjcV3OF6A2PLTUJK04u78yGqV6luTq34U6g2D0dX2Oz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=O32JqYJt; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="O32JqYJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdVxkeg/4pqYuBifwZ3dEDppRpqv9WR++QiM/rYbkMa+yCshcLJHjDcBdmFZQ/5GwODaXE7ZXUrSqPfdBlhGdlAWR4AuEWUEBYl5I20UMmc+sutQMTS1nWsHhMsex82xdckNht0lHSnjBISgVwGRpL5j3iOkzOdRjUUkvaKmoLZmaEh4T7jpGBGKE8eWMaiYLcAxCqsVKBBlKLEu2AemgaYYQHZC4T4WbvqYYkjSv2VaZ8NkhkHlKcgyeu7hig+8H5kamhvmOagGqtT/zx/Sok16+zGEab6d5RNj8b7MAvovBILga2jMelnubqXKTV0uHFZ0pJ+wGYtLAg5IH+IXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQoNI6v02+nKOxv7f+83iXKc1X8FVzJdwxyW+EugXqA=;
 b=Q6gX0p047rKcMd437Debw3+EEncyonaRRE+W2kKoYX8MXfPpBKTgufQsHvNGCFmdGpldDLBEoKi/RtcA7m/R5tULnlHflXGZWy8TN88yXgSdqBu6FdrAgxSNIUNf4MARXCuEeBoNhpdOjtElAVOgePERLF91Fm8KBkgnjI9Ml4Y4s366jhjhzbhBd8cD/zMVPo0q3ODt79CxOI9pIoHvzJdYVEAzZJjvwGwRwItmQ+XGb2/mKeEWfQ56GfZXDFWvntWC5jEMfQZsT6wAHTi/lNUFZHLED4iy2he54P1VpILiyLKL/wNwK0LgHtsArVCm8D3z17Ph6re96GNnMdHc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQoNI6v02+nKOxv7f+83iXKc1X8FVzJdwxyW+EugXqA=;
 b=O32JqYJt4g++M4264BiE19JoLSesa5kNvswsuDBOloaG4GwVlEdah+3ebYgi6bgcJjXM4qUpy3GETKZ1rZMqRu1eBdzp+5t+qSNsKNvUU9tMfF9/8q5G6X1G57PhWGdgDA0yqir8+jb+Klxue6cNP0gXwG6GH1CluRCAqLyqxI8BKGefWMwIn/pCmyViCunvh5HsrANMrTjym0PvI4wqlmdQb0o2R0Sq3wsYZJgLIs74htug+/ZHhcx5ou9Ap8eYqZjEuMPwFcHnYPpZ4yQg4n7QXyaURXYy/Exil/PKMc+F1Co5shwEjQIX6VNbAul4JDsoX9oYgRo/GkTmwf1Plw==
Received: from OS6P279CA0066.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3f::13)
 by PAVPR10MB6766.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:32e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:30:07 +0000
Received: from WA1PEPF00009B3D.eurprd05.prod.outlook.com
 (2603:10a6:e10:3f:cafe::4a) by OS6P279CA0066.outlook.office365.com
 (2603:10a6:e10:3f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 12:30:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF00009B3D.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 12:30:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:35:58 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:30:05 +0200
Message-ID: <a8522111-579d-4a6b-adbd-8f4b82e5e760@foss.st.com>
Date: Mon, 28 Sep 2026 14:30:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] arm64: dts: st: Add support for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3D:EE_|PAVPR10MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 450ec5ad-fb42-4755-4356-08df1d5c3ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|7416014|10067099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	12d+ir/ymy8jTXqsPqKnhwwfbnQegtsLWMdkGU91Bqqf2OGK4RJq1VRdMa4TBQO/2+REL7JeIUGL6ALYt4jDKYWmY97AI3yOOCFS7SO1QeZeFnA3lWd6FJLEAw6qGvx/2tpG8vqVqGqdgrFtzDBFik7LqDPQpQiP/mUuGYc3DQQFAWxFIqXpjuUjxCVlZwk46sOD5/SS8DKtOIQ0YQduI/cFf6EK5B2ZS5xsgBsj27qWfliyKIuRm6tyGpy+uDae5yzkqNJ1HFMaYJx3LX8/Eep79UdrGtOpP42n/mcjin4kZGIWcSTaodLAvMgmLP82EG6FEVlw9i/Z0FF7Ru8H2ZnbHl1AUj1ZovV5feDTI7qoEwKFaf/GuyhXQE4W+tH4cHUwELuyCbi99dZexIBuqymFfgsFeKhJDfLF3gEvmeHLgJ4V3K4lP7zTfCJ1dg8iMXY9qvw5AumysXbWl9HX/Pt1qUJuugh2H+elBiGL7ih2d8fqKKkF2kX62Jd6roTW5dDKU8ro2JvlnQjs7/Q9gq4lYI84WJVeleiBmc/rq76a/f6ci8Xx5RTqMuFsg9GJMq/MuwIPLT1WCOPPLMc83lfd5g3ns97mRK14fVjyX0wYcGu2ueSZrw+o5kNn36x582TpRsOdSb/Z4i+uN0ZX3of+p6HyrixGqwC270uRT/mjOyhKqeG5TdsO6ZzXc5Ra2sC2Y/rG50Hgy00/dmlxuw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(7416014)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/KObQ7ScsEZq+V9/PD/7xI9ObwvuiDMgcP81mMRRRAKXNs4skH35S3Vyn4fNS+HbqdkX97nX67T8fh9W2C5KpdAOzrFQWN6rAQjN/tkidFknLTuOD5fXQk199hzl6pi7ulEIKYmAi70hGQbW45dtWrDge7vNPWlMRPtUELwyM/LkGO5krqA5E6oHXuJ5h4JrCrgquJm1Nwy+yFp11Qg8vloH2WuOgjJar8pvsR52GWbcw4oMn8XfGIDetz38EfTn383IATwT+NCbT9gq5MUoCDDs86MCCHZbXWzyyNVE+PGTsvUoS+lbU0dVptwdLl93TCOvBbaGR6HSY2dUF2MLnvLechOKCkFl8R8OwWDKOcqgc6Q0LqFbSSVAx2ALoZCpruYGuDgf07rZxf/QkURmJGyWGbweA/21rUipN9EPDkVQob97obM6JsOVmBEPIKIq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:30:06.7670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450ec5ad-fb42-4755-4356-08df1d5c3ab1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6766

Hi Marek,

On 7/11/26 22:59, Marek Vasut wrote:
> This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
> STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
> Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
> on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
> STM32MP23xx SoC.
> 
> The SoM contains the following peripherals:
> - STPMIC (power delivery)
> - 4GiB LPDDR4 memory
> - eMMC and SDIO WiFi module
> 
> The Breakout Board carrier board contains the following peripherals:
> - USB-C peripheral port, power supply plug
> 
> The DHSBC carrier board contains the following peripherals:
> - Two RGMII Ethernet ports
> - MicroSD slot
> - LVDS connector
> - MIPI CSI2 connector
> - USB-A Host port, USB-C power supply plug
> - USB-C / DP port
> - Expansion connector
> 
> Marek Vasut (10):
>    dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM
>      and Breakout Board and DHSBC
>    dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
>    arm64: dts: st: Fix SDMMC1 indent on stm32mp231
>    arm64: dts: st: Fix SDMMC1 indent on stm32mp251
>    arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
>    arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp251
>    arm64: dts: st: Add OMM node on stm32mp231
>    arm64: dts: st: Add pinmux nodes for DH electronics
>      STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
>    arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx
>      DHCOS SoM and Breakout Board and DHSBC
>    MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address
Series applied on stm32-next. Some changes have been done due to conflict merge.

Thanks
Alex
