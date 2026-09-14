Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D2938F253;
	Mon, 14 Sep 2026 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373123; cv=fail; b=BDqW8jJ3EXOwo2bF/abSm2LJEccRp3fYLiUIUaJ0ImEsl6vY0U6iIScSjMcKH+jRDWVNf4TpM2wpODBV0mCpC7nBnCd7zJ0seRVXRMd7lGeGV/HLgODnQ4eGECNh74T5pJKtHyIHyF+al8U9CRqxNBXBuOpLK/xqBjVFiFcBuWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373123; c=relaxed/simple;
	bh=/XZb455JpmR478jcfJ2WvOxHzFdBDTOm1/opvx8WeDg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TcO6aOfGhHOSHVTZMm83ooE4KoBWzpM1t40dmg2d478hah1rOKFlhR/x8Ns2obElldESx+gzv5UKcqW0Fi/m1EC7OtnWsmqdyFbLDeSImdNpV10KctL+1oinMMfoq/sFZgiPiN6iGUmpQeVtFz2UaSni4q5ibB5/D/i8yKdZBOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tFFRa8aH; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tFFRa8aH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPYmhoYh1yD1174mRhZOUWqyiNgZlZpHMccxNYTZQLffO2awiYtYaxWUGZKZotje4jHA957Zl57aVJ05xai8zVufmni5t8MWGUkwCMg5gDuqV6CsflntQzoWOvIslFJW4kTH3eP/n+D3JnNJYEV4yT5+ksgbLEu4IgNAznIFIgFlgJNxoJOZWz/GAvTdDCee3Jl5rOeKn0ABIuBOxwapwXAuVVdD75Jomx+URh734yfOtW+rWJ+kQ6SZfWG5QUAaX+MvJ+TjoWLjkbKmLpfdz5ZZ3swHpbnz5onzGI2hElKCrhRFRRJEnL3Zuy0/OLLUZzUB7HEauDLhSs/ovodPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6EK60rhMrWUHwO9hRYuylhESdji7nYBVQOVBdz1hg8=;
 b=tYwI6OwIgPBi/iGXbUbgAjX5xSSC6pR1VUnn8Jtap9ukKwg+D0ESQLA614UQNYoonM+UsEYOs7pAFki6tq5naltOD2Z2W05QTSeepOI7BZjuX0eCwGogHXEixWQINZ7CTtHnBauzQQKrz5n9Xo7acnmTkDbj0+1QidCM6IsMU7fMyKB4mx+gXiYQ5Xxueb+zhixbTI9IPlO0WyiFbAmQXFNuxxbuZlr0Ww7Z+fbhra4ad99jlYR/2kEhkWHgCfr3KrqU37VRiTJkFn6iyPogGWV4tgPrpX31nZUcXQJtP9Dav6s55SPSN8ZyUK1TdxFtuiOfv1L9IanyrowVHUCdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6EK60rhMrWUHwO9hRYuylhESdji7nYBVQOVBdz1hg8=;
 b=tFFRa8aH5BK2olr35fwtpXO4PlNSzj5kLganAY8I3MMDHzxyOkr7eQpAlhW0BcEU2xGbJkJVRe5o25QHHY02BVI4uewnPeP0ZwDTzutYItgBFRU12ejB8uyPA+W4nWOff736tusSLCBkkHZw90HvGMZMqMmdmLFFIiGVQZbEUrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:05:17 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 08:05:17 +0000
Message-ID: <6eccf2a5-68a7-4741-aacf-7c2916de7345@amd.com>
Date: Mon, 14 Sep 2026 10:05:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Gary Yang <gary.yang@cixtech.com>,
 Fugang Duan <fugang.duan@cixtech.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Rahul Tanwar <rahul.tanwar@linux.intel.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 771e00d6-ded6-4841-fa1e-08df1236e9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|921020|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	KNNbnwM5YmXJpHAGnxFO1ydl4eRRJIpO1r54vTFTDELMDPXJYhoyisEQfw5VEj97jVUyl+jRcZfTYLq0uS44szqxeDG0OZ8237WOBeJ7F0uQ4han73eOHfo/Aqc1Z1CSIVKMzIirDQCc8bsLkEBl9LxfaTOGcuGKX46qz/qyVz0iJ+KtxZkbeTaSGpnQEZwlw7LfoYJ8pvIN6HbV8YzC9GJ3tn2bd8gTgP+VEtmH6De5ruLyF0jYOhvOVtIg2sxLY9twQ7RX6rtJqdX0uLbI/blGqvv/0+XD+wNRtjyA0+HW81qp5jFVV/9dOibpH3PWuBsE4O6WRSScyWCoLpg/gyRTrHjjlTcrDmmFro06mBfRwWhuuUnxbcPjC4LUHIDL3UL9001Yjlf+MpCKwELeKOupaNMx7B3blJeBJunzPm5SUlMUSj2o6bxTWEr7XSvFDvYZLG//ImTj6cH4QdMfYC6VCylEckqrB+8VK+4Wk3NYLWHIoR7typPhx+8fG2EdZVXML3IqrGYWCzt3+RiTcyJOQVXo3yrbWQ1M7txCN/4yaJcuZtoMSdf5XWCo8/OgwqGI1x0CBfIeoWSS9EJ21cdw1i0JdRBNvwAb2d92j0RAxoJwhKqJNe/IFiNUK8M9NI88suVXT+Gb6JhN/rxi+GrhIKYwJYMskLfx9uHrIm2b2gb4NrL106okOFKxW0dNKTNUm0MD/irsqjaTBpsAZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm0wZDJhYmFlYXNkK1BwTHh1eGFyMk13V3BSdmlYOWdjZkhialNtTFE4K1ZC?=
 =?utf-8?B?RWFaMzlwQW9uOFFSc2owYkpkeGpHUGtYNWFESGlBdFEvT3Vxd2hQa3pOVktT?=
 =?utf-8?B?R3RUTGRPYS95RGR6RkdjbG5talpzdFdhK2Z2TCtkL25DcS92eTUvR1NENDVE?=
 =?utf-8?B?YW5hK0tSNDcxOWZrYmNRbHVLYlVWZ3c5TURUaDkwa3ZoWWZ1cUsxV1kzNG5u?=
 =?utf-8?B?Z1MvcWZvTTBmTWZvenJ2aVZROHZiaUdtSkI5c2pKdDZvbThLQTNYMGxadDlP?=
 =?utf-8?B?MXN0bm9iUDhBMUFhdERPWjhxNEQ3VVg5MjBwTktaK3dGejJRRXJOb085Wlg3?=
 =?utf-8?B?bkRzYU1zVG5JeWlxcDRneXBvMmlGWkVCZ1RkVjA4UWxNVnR6SXp0VUw0YXhB?=
 =?utf-8?B?VjRGNVJieU5xTlhLZCtSOXdIMExtQkdRZEROV0RaNnEzVDJxREw5MENqV3U2?=
 =?utf-8?B?MEZvKzRIckJHNFgxOHJhdG9kYXlqODFEdXUrQzRuai8xMlZ6RmtBUFp6QjRW?=
 =?utf-8?B?SDFNR1lEam4za3ZBd3d4Mng1THgrd2lRZlZERUlmeHBvODJ5dmk5Zmp4L2dl?=
 =?utf-8?B?SnN5RHZZbE1YZW1PUVBxR25wWWV3cndnZDEwVm1McFdkeEU0N1JNTkF0N1pu?=
 =?utf-8?B?MUM4L2hjamNLU0dneHlJcmxnUHVaS3VqU2pYTm9wTUh0aFpORFRIbjcyT2xG?=
 =?utf-8?B?Nm9ORXpVamxiekN3L2kzcVVYYXRkVHRrSDVwbDA3VC9Na1UvdFVvV2ZVTDNq?=
 =?utf-8?B?S1BMempualZveml2cXdtR2dtR2pENE1VSmZ3dmVhWUF1bGdRNFpqTlg0Yms1?=
 =?utf-8?B?YWhpam5OYWJKSHJLRHE0QTdrNEVuZEtISzdSZ1hkcTkwUDNaYXpSYlp1cjhP?=
 =?utf-8?B?UkJNVHg1bGZITjF3dU1zZWYrY0JzRUNuMzdsdkg2RzVjTC9jRmIwczFSSkFT?=
 =?utf-8?B?cFFuNkVSdmcwWEs5dWFzdS8vOHZXd0JZTENjOWh5dmFRVUNhUUI1Mnl3WERq?=
 =?utf-8?B?MXJTR0tpNlpJTS9Pemh4MXo3NjRkVWUyanY1RHh5ejV1L0U1a0pGb0FDZlV0?=
 =?utf-8?B?NEVLemplcEd6Y0haYnNzZ2hodVZYYWVIOWRESE81K0JzdHB5K1lwQitjSHUw?=
 =?utf-8?B?KzMydzNqaGNMUGQ1K1NuOGkzUU9zbUcvdlVNZldzU0E4L2dyYlpFWndnWWZT?=
 =?utf-8?B?eXZLbGY1b25CUXdxYngzSjdZOHQ1SzBZdzhwVUpGZnRpN3hKcGUwTTkwN2pG?=
 =?utf-8?B?Y04veXdrdmhENDIvYzdIa1l5SWZ0MElSRWV1ektEb0Fkd1l2K2Eza0YrL093?=
 =?utf-8?B?YStsOEVNSXN2ZU42NWFKU1o4SlhXYjR3eHpwT3A1aE9CeEVTTDFFVkdlcFZ5?=
 =?utf-8?B?WkZtNEt2eWtBSlZsSldhZ0RrdFpLV3BhbjVycHg5VTNjS3NDKy90N3RHbVNE?=
 =?utf-8?B?MFZBUDBoRktDTzNweFd4Zmw3ZkIrcmN2MG0wYjlBSWIveEIyc08yeWhQZlFJ?=
 =?utf-8?B?cmNaNzd5RFNBSTZHNEVCNWVnbGs4Ky9aL0EyTjBVTjg1b05jMzVNbURObXJ1?=
 =?utf-8?B?YU5UYWUySjczcDAzOC9oZkZOUk5aWDdWbHUwY3NwbHhDYU9PUmYzNEZNYksw?=
 =?utf-8?B?YlBvOTFVemVvbTAzZ1JOeUtCamN5ZlYybW5MRDRXMlMrZHBzc3hLVFhibUd4?=
 =?utf-8?B?aTRnZkFjbXBRQWlNMHFsZ1dFS1grUGhMcHd4RFVITE5lSnFnY2F6N2dxcnc3?=
 =?utf-8?B?c3hRK1FVWDVVaGJsSFJwUDM2QXFOck5WQlM5YVFiSjh3OEZSY3V5MVh3b0oz?=
 =?utf-8?B?L0tDSnBjWlhyZ2JDL3JER0VlSkowT3lPbjZZVnBvSUhUYS91UVhMSmxTZEZZ?=
 =?utf-8?B?eXhnZnIwei9kRVpoaE5LTTZaWlhXVm5ieG9ndTdGT3lIemV6QnlxWElpMmdJ?=
 =?utf-8?B?bnhjaHBRRnhURE9kNEFBYjBwd2kraVJsZngwR0ZRQVFEWmpDL21xZ1BXOXJG?=
 =?utf-8?B?T1FObUJlRStGNzJUcWhlZm83dXp2UlgxV09hZXVieXZjQWxDdmkvck9NYUZj?=
 =?utf-8?B?WWlNWExXMmVZWmFQSmxpeXVEM1R1YjhIeVNCWHlna1I4a2Q2cjVXVjZ1Wkxr?=
 =?utf-8?B?ZFBOY3RpOVlxVUw0V0pFaXVtd2VWWTIzVXo4MElVcXdpaGQ4UWlsc1djQ0Ro?=
 =?utf-8?B?S290b293Vm9WenNnVTJKSURuUXd5QUV5R011UnFueWxJVDBCUGFYVjhjNmNK?=
 =?utf-8?B?TkIramYzSTBkRGMrQndYdlNPTlRJU25RNWM5ZzZQOWl3RmhJME90VTB0Qmp1?=
 =?utf-8?Q?iXnSsoNL7rlL2uO8f2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771e00d6-ded6-4841-fa1e-08df1236e9c1
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:05:17.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjJ1TvwbnrrjzQljVMjqmL2srrfaOdbl8qO4p+l9STcPASHRN4d/Y/0K4zZ2J9gO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106



On 9/13/26 14:32, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../pinctrl/awinic,aw9523-pinctrl.yaml        | 50 +++++++++----------
>   .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  2 +-
>   .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   |  8 +--
>   .../bindings/pinctrl/intel,lgm-io.yaml        | 14 +++---
>   .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 +-
>   .../pinctrl/mediatek,mt8195-pinctrl.yaml      |  2 +-
>   .../bindings/pinctrl/qcom,hawi-tlmm.yaml      |  4 +-
>   .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml |  4 +-
>   .../bindings/pinctrl/qcom,maili-tlmm.yaml     |  4 +-
>   .../bindings/pinctrl/semtech,sx1501q.yaml     |  4 +-
>   .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 46 ++++++++---------
>   11 files changed, 71 insertions(+), 71 deletions(-)
Reviewed-by: Michal Simek <michal.simek@amd.com> # ZynqMP

Thanks,
Michal
