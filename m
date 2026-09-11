Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D357352022;
	Fri, 11 Sep 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140214; cv=fail; b=Ivcyc8KIGlGb5UXK11RNsdvxIL4rUSse7tGdlIfrTRGbFOArSjnyJT4Wi7VvlK+2VshFZN8hEW6kkqay99NcTvWQ566fmoLzpkPdKHvmerAuqUd6PePmRfofP6fJAgF02RZ5jG4FIxQ9rpdTZxG0qIcefsEfkiHhIIiZxEfa23g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140214; c=relaxed/simple;
	bh=YbGAmyGgsGqQUCRxNNl72qQRDhLKgJQnlOtu11Kl/RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X/tsQN48TWpyBQJpZZdzYqusDlhzr0z7OjWvqDWsjXPhRX5GaPUuneCwtnroVgziPTVsursJRpc4G2ZqgiRGXzrfJmoMA7oyXHg00wmJoavXkbkjxqwoZlGVs1oou1gYf/XOzntAnNXKqVgi7QHpefcwwW6+ilSIWK1h9U5Ymf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TtnP8nEe; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TtnP8nEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwACQygMA7Fz/fyv0EUZNS1j1o56bSHaxHWCFDQbKyfqRg34oE5/S0SfoMqbdCEFmjq/IBEG9KlqIG+0OJ8xIs7dwb9zMySzrFZPkxJIjbKL2QcDk4hTbnatoDOQ6A020dXmEmRuSjiocV8p284oUSNYeziA3tB+QdCe5+8oglf5/jMWSy3ZWfNyMz4lSaGjZfWpnX9HCz+rj6uX0XmQW6gHFW5OVCaDSZSiaFxnFrfJ8t3TuoBwrI20/H3WSnjxejhuJFiFgrxnTXUMNjT3LS/vXr4pxAbRd5iaeEz8vZ/4e8BSa0JMLt/Z6GOEngQPjOWiTeSnpSumEjYZb/lVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk7lqCnj5EHVFD8CU+/wneiMkMPyKTH7DE9Tq02uMzg=;
 b=TyI+ebWdYKJd6WwbzD6v27+FWIQTzJVecayiirqj0SHSdMPVuyos3bpGMXIrmo8TGinMrgrE+LSSgD4YpWSlho6K6VT+8fSk/amSy6YwwndpProBHieDdWY4OjaTyj4P/CFjUbsdGO/o+qELURUTgDEN23prZwmM8YILuJWBqs/iVNKinbTGLQ+88alC6a0RGreM9ZT5VfF4BgBqjVKxd9p0Cjshgb5dkL87IH6AY865cfAwSDCMzgGNiP+4LRksM02yOxQhSYvYIRbMS0ZTEoUzZHaLryjLSsuSfGstVp1Secogl/EZR72u2BbRtKSc6FUqYLBLc3wd2vSBri2FDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk7lqCnj5EHVFD8CU+/wneiMkMPyKTH7DE9Tq02uMzg=;
 b=TtnP8nEeeSwQ7JIVR1hwTWcppogvoI7hwt85nxyJ4ZuZNBAKnssSa69g8DQOJQWfWxSAZ+KMkRqgJNrxhzi7kWbT7JwRtEFkvFckaa7Pc2Pb7H7Aj7BdkYGZi7PBv9lXRidCc/81HHNbXZJBBf0SbPi6R5Yz+ihUM+GXcCQO+Vl65p7rXh2MR0Lv1Ar7VRrg9OjHICLCvLTPOzEfnb0nvohQfEvJVCr/yeXNE0KeQ1NsoUhVQVuQLgGsGiLv5RoL64CHMeVmWOny3He2UfGHpavk5CQgZxEO6SaiRsAybX9NzzvBT1VNW+CwzLENnPfCyUilk44VJoIdQRdOeyJKlQ==
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by VE1PR10MB3808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 15:23:27 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::34) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 15:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 15:23:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:29:28 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:23:25 +0200
Message-ID: <c592771c-e002-4c4a-a532-dd73e87c89f8@foss.st.com>
Date: Fri, 11 Sep 2026 17:23:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: stm32: Sort the document
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260713232440.120352-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260713232440.120352-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|VE1PR10MB3808:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a24fc4-d969-4f41-9747-08df1018a0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|82310400026|376014|36860700016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tuz43jBBl4Ir1B4tAvJ0u6pANxT4A+BOAKpCCDLFfbVRlBrhMZOJeviSVKtur/WxUw0jxxSvcVViS9loVoKeIsNeUmUT8EeeKsQhlJZk/bUalr4N5SnA98eV5S2HDzdnvurEAmn0TKNAMGfL7CwG13gNP3U7rPKU3BEsyLMSblEc04pmEMPbLCXoyjabSlZqPltuOLyR/vRn/Ny244/G8q9FhObAzLXZiLMpxcqwiKHvLPVvRoPfPY8fkLnv36svVVhc0LMJ+gQ3sSK0eCwMImyoHnXCrKhFlgEw5C3XcD0IjRZXqu5G7/j+nuRzo2IAy20209S6kJKvYa3wgChN/kSl+Zx/TjlGoCFF/D/AijV1kxjGTyJ4VXbNfKBlVA32vDUS5XdcxMLF22HCVFByq7obLHdq5MbxFMopCyo8pHFI0qKOBAE2gwEexC4lZWrFjaUoVsdbCd0jo8zWTDDQDvDf/kB/cAzq/aAwW3CxiIMDmoZi/hwrIl4odSHOqiBCAuN7QfxfMXaq1iJ9cxlcdshEidUNPBUz1DQukz3rPMx2cGM+YiDHrPWNyqesT9St3VnGF5zZ0wGyL8HP9AvhsA5lxiiAO1jGJTkNRHpx2PV2A+U1VvFrVB2nkYymN1zfBqMtmp6Qo5VK9uptvCOghUG3Zy89R3ZQa0N89No4Gil3PpcO4oQ/oFpT8CfkLXZD0qjR+osIwo7w8KdT4OT3kQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(82310400026)(376014)(36860700016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kxpLsaUccTkCT/AkNf8T556noMjpWgwjTVf7tBJ9xe+S5mjr6OHOclDRAuWbx20qNjcDbf3+nzi3zs7aYWEons+nHSWLvV18wseyf3TRo0JDxtDVMd4EtrMEW/4SFqVu64zMR2JYEGl1E1KaCleTfZu3iI0XGJzl3s4E5iI41Y2BBMd8HafmZaWqk90wH/B1aIBQEG4x6oNXPf8IlQIku0eD557z2T1N6BJqkn+vDsP9RI+rQhwjNnygxcrtF7oim4F9NarppBdKqVufJzJYMpCNBkbxERvoJ4Ny3jrPJKaDWeFFvgYhc/od3VjrKfLkli4RWUeHBJiSV61EAh6aq0LFa0/mS2dICOlg2Mby4PRGTM/RWUOe+cta+5tSQuGAdXptUd8tfolxpJvo1DXq4LzKhGK34S3/1quiyzH6BtKtw/X/JIm1PfnTly3QwY9c
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:23:27.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a24fc4-d969-4f41-9747-08df1018a0b8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3808

Hi Marek

On 7/14/26 01:24, Marek Vasut wrote:
> Sort the document, place STM32MP21 before STM32MP23, and STM32MP23
> before STM32MP25 . No functional change.
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

Applied on stm32-next.

Regards
Alex



