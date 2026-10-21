Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576565;
	b=uLEDGwo1pjkIayv8Bwx+7YYhOIzCNKCK/bkAJCH+5TCzh91ofGSqegiMC0/AxloYBIKT
	 l1tHjWikHyZd9LLvTWJsP1+K/U2ckCL7MEEc/DzwEmqLDmeCYH2sf9tf2iaIGnloKLQbo
	 Kg/SHHE0nBPPzv1JpD73WIK9F5znbQU3eoPwfxdjxeRsTIe2vH+J+XWeRFZKb0lv4Ch3E
	 +Zz6ADlM/stGMz4Jauyn+W+v/0xdYkORHQBXRZFSSIRpyveLetVxFZ9xF+fPf8bnLNRzG
	 tbZQ7hBJZcqn/CJOqFS2/wCBzqJ2h1nis6baXOkkfNbgeTVEIkMKw5V+PZ3QFQqcBIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576565;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DXnuJdQsM6kA5pE9yEjIxr27lcT78TXLTnq5bozM3m4=;
	b=kND+/iq+QfR7xmywdQZEqbpwGtvtqOnBFmXtC41HckNwJGdfH1rIBm7sj3/m5qScCImT
	 kG518nI9dn1b8bN6YYMjKRDSjcJbEwE7D/6D/KV2pGN8Cbm5oLhUytPteTngW5WI3kUmR
	 BEEW+tvAN7PlLXV1Xpgn8Ka0dSJ1kgX3Uq0giyo4fS+5CB8Bl+ntMWHe5AVEcKiZlOADy
	 SwUZrdRLnt91fKYWnhr3kw9bu2ah/+CygEYncnItvvENMNr9ZLnDgNgyfbQWNoCUvG/ex
	 ZEUiPxv9wLeoNCS098H3tri8Lam2gZnUATju8G4rXY8agYkL30Hpk+8jMVKmkcJTYFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k0yvmgUi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72D606A31F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC72D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k0yvmgUi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INbAmjpJQcWKW6RtByu0QMRYj1S48aRJAGfZNzg2ndo/G6ZN707C32dTRBUeLahHkwnbPh0YTgPpJT6rAqvobf/ZXcPAnDzmehaEUewGB69565ciix8jAOI0rELaxm7L9PPdlAQYcSsv7B7Cz7N9xvjqeEwc41hzqapeQRMTm25Vyz0Cp08aJlTigmh3p5QJoZ92c/o59VAyQkT1rvnJcvJGk4q0VOtN6m3+i/R1ceg76Ft4f4g/9SAi4q/Q300/MypnCFyF/SLVK6UsSy9oKSqLZu6g7/JIzgycPuuUV2xF+VkMjf4QftiCWrI2xc/0XvfdV8AjNBjrq5hhJQyVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXnuJdQsM6kA5pE9yEjIxr27lcT78TXLTnq5bozM3m4=;
 b=EOP6XOOXRFgBHzRqNaWDmGeekkRFopZjJGeL/gUaGjQW10ncYTkpGNoq7UEyug5vTwDQajHh/Gbn8QowfmjGkEcn+M3L3e7Rtzqgb4wMEvD3E/x+5V2aiyBoXFuGP4B5GapO3ToH2uB2g+XkxIsOybjcoRvT9kLwXQQDPtoqn698Ez3YGANOCx2zZM1ecjAUef22OoDVTZMVKLJUVbHE+5qyaIDpHKAXG043YF6/seurPTejCeBi25j8Sc7LoxZ888GoQKGiOpcqpq4KidCB24DWiHmIvGrdgDaKhUK3wYUSD7GBHGHqkbhEzQkBz2/NPkn4rrSg16UNBXTUe5w3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXnuJdQsM6kA5pE9yEjIxr27lcT78TXLTnq5bozM3m4=;
 b=k0yvmgUi2K3B6zja217h6vXAsnKp3WQ+GRPDo7uz4+tkxkYCVp6OgaCHoa3fPwfAaEes2jw5PS7seoz7R2DmZlvwMTiZa81EW24FDW1Gt7ojqFwIGd6b7R2ce5shmqkYwUjJaCvWjD57lM8PIi/450+ca3vpKMQqzwDgiLweVsyrxEb6G6hrFVKLrkXDpsnfe0iYqYHh8g2BNi+lOD26DK5dpQ3Qyfi+mFGqrJ6fQjSYG5J7GvcdmFnmaG8CGD8TkO8DEGu/QO+DWHpSps02AF5EkiinZ5UK636X/uE4rBaINA3P8q5/YEcKzL7/m07VjZ3gTSct2cqaXfIMg4Y0ZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 09:56:02 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 09:56:02 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 6/6] gpiolib: let the character device free its IRQs first on chip removal
Date: Wed, 21 Oct 2026 12:55:54 +0300
Message-ID: <20261021095551.3283369-6-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-179021@kernel.org>
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com> <20261020-gpiolib-chip-removal-v3-6-aambrozewicz@nvidia.com> <sashiko-outbox-179021@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0197.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::12) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 9774710f-64f3-4f22-3129-08df2f5983f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|4143699003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	YBrNAdVqp2hkUvwltYkxCwvTyLVQEl1VGbhrNQ0EZZf6BXsG9SbFIPG7dHlI8DmPd8bhrG82EOs4ZVbpDvAhKB33zQi1+5rKn/4Vd3Jmo/1SDD+SrFtslNl9d4WC5EhhvNu3/dZ3GUK6Co6DPPognDoCza8lxs8tTXagyHRxeETiG+0DZFAKQE6gNUcr4vkTZKdRzBKq+9Qazm5KKojN6SH7cHipg4ShY2UfJqSoYDUvSUhzpI6InKq0f6HcXCajXXMW5TyFshE6J2VAICEcmdE3bAONiZxP5SVRPYZFrHp5K1pP1JWcnuq67jeaXklD7jNV/HCXGjFKWiq23Pgynd2nzvGFNJ2IPOnTykrtYOXriNlS2Y3DSYj7TX7zzi3ae43NlNK5ngJ/wDpAPhRhIe31DXg1T7m/bfNapR7MOjDBtIp7+Zbs+405VL8rz+zPeMTXPw9VLuLInsZBXeID/c4vTg+hUHMYEiB8B8fBJraLAf06oBOvebBx7N9Iz/OEBWZq1JCjCkqaRmhNXrIWY/OrQazilrOGWruscBnK2R/IMknq0lqA1dsPwxuNGF1TPqLqUzynPHF81NNUXpkxq2D4XBESOS62l1oGyhi1HYB3VX1fvXROWX6V6QKsrYJPSWt6DHiseGk623WBcBw9HuUl5ChwjuFgyguHznQrqgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DZZSEjvlJcafpSyeid0U9DhAok7tH4Vph7QEM5rVMMe8iMSenc84/huita2c?=
 =?us-ascii?Q?dKuSacBFAcWvMktsG3Njqn+A0KVnf2nrQ9LCw5VcqksZa5HxUl4635GanYVX?=
 =?us-ascii?Q?JA9k0jy5uF37S6Mym7BG82TQh4ws7yDOufFkLZWaMytBoFEV/P/KAej8SECr?=
 =?us-ascii?Q?bNP30Jfu42XkUFxqYWaKCsV8a9lgPmUx540N5DdtRnrdyRsc3iWJ7zTSF9y+?=
 =?us-ascii?Q?LSMkE4KwYxBGW59g+gmHny7WPWXAMAEq2HnX5FZh5ZPv0zXGHxfj9ko8SuK2?=
 =?us-ascii?Q?8Sj+drUt7GAxfWJ9KXFqmtNFnn/B5ZE0+acn+QrtTJWPOkATh1hEdBsKIXou?=
 =?us-ascii?Q?bzV/nsumG86oSdk/q7b2oII4TtT0NWw4Egann5dMddIhGrMEGywPgx/7mLEG?=
 =?us-ascii?Q?rMEnqpH6kRPpG0mbzPG8WKsndMGoiriNYe8kq09OYcILaSenU5/XMVhXT00G?=
 =?us-ascii?Q?Kyejq0ohJS0LA9J9BacppMot+ixKcP3lS/ItqRg3uM+aMLxzevVgJKmvG3oL?=
 =?us-ascii?Q?XKC9xvjGzbwHE5JvTspjPEWZ0PAd1004oY0eNypgwZoL7XErhRDEXIaJHsvD?=
 =?us-ascii?Q?NYOrLZLiqLarklg8Sx7aR9BXl7j5+4A1DIxdW0pIE/S5tY8LlzhnaiDgQWDj?=
 =?us-ascii?Q?8gp+oHVkfN2VVuaxwEKWw+/N73wx7JCUBwLJQJX/Ts47vYJd3fE7qgEyNNac?=
 =?us-ascii?Q?9GyZToBgvJDhstQ3IZCVyqm2rfGxkeLWS8eD2DCAyYu/FxTzaSyWlFy8okvj?=
 =?us-ascii?Q?mfafEGIrbJ2wNDa86BbIkiyAj6AWYMxHMOLrGgjsT2pgWYIpZTT2zHD/UJ3H?=
 =?us-ascii?Q?p1ppyNQsqnRQ4qde/znOZPBnf31c9WxjykIXJz5Y3y1rsdElPWlXM3ea8ImA?=
 =?us-ascii?Q?kYN9YE9dN15WqUaoQIM5qgL2zrrxXZO2Gpct90jOqN7gkOL5PGc0ZGaGBoB/?=
 =?us-ascii?Q?Ax365MHci1V9NrbOCfdzNJRVPYxGfJ1ovbiVPmj59YLSAUmkvc+zr1uXf74A?=
 =?us-ascii?Q?syvR0TLAY1u8kZUICnpTTVta5cRYi5xDCpgEkeQNI5sB2SX5VeBhGRR0DHIs?=
 =?us-ascii?Q?xRUh4HBnmRfqKL8HcE6O1wI/ip55gjcRI3M3zN2ZNhO23rmQJNuVQI+6yLys?=
 =?us-ascii?Q?cA+QdCeiXxOtlXsR8FEbtEmzToIM4Mtw8Xitoy+3fOAsDxAP4PllJevEL7gz?=
 =?us-ascii?Q?XTLHF9ZGN+k9kV4+/QHuEU3IZvbnWl2LscyTvfEKN873lHTNDATnlpeC0kOl?=
 =?us-ascii?Q?ypFqhQ1qfidzYpm+u0mxEWb9mchlEmFiqa+vdPVOctSRtIznsmewtWSHjrLC?=
 =?us-ascii?Q?DvjPJeVsOY0zOOKXtlP3Sl2iiwvYoKEMK9Y36Gx5oc608lv+7ygtuSXRrpLM?=
 =?us-ascii?Q?TxE2IpEaswx8yfHbFGqRDrjizmLHN4wRC4byuG/aF3qFtjI2EIbEkWx54g6F?=
 =?us-ascii?Q?DCQE8L1BDGLr8DH/QsO16ruvJyfgotx/48lwaSjouW+PIcjrM1DBIZaRTXcW?=
 =?us-ascii?Q?NVl063L51k590fjBgahUALfCEVd0CIwkg87p/YLhNPvFQ5u3DNND4gOAdCJR?=
 =?us-ascii?Q?RdaINdbz4oiGpPiC9Go/bxkta48cx+N39e58EYa1PCgX6X4ujKry/JFCRLo4?=
 =?us-ascii?Q?Uuiv+O8AJMDdI2KoNj2pgfRtXGxHIr0XMcGVEu3dc9if9ORvfHLTYqQjrOOT?=
 =?us-ascii?Q?zoBJuHkpFdlU60haR3GO82lbXilIGzPNtj36DjlmKgHlz/Ss+4HMmtueGLdy?=
 =?us-ascii?Q?VQLWW7pfJg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9774710f-64f3-4f22-3129-08df2f5983f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:56:02.3092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuvvS6ewOzoUoArnCAlXxtOb23X/TbDqmXQmvfpzFJETbigzne1611nZyAXBPLIZ8xE2OT+CnfgDvpDGFv3PUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098

On Tue, Oct 20, 2026 at 01:23:24PM +0000, sashiko-bot@kernel.org wrote:
> With character device IRQs now freed in the notifier callback after
> rcu_assign_pointer(gdev->chip, NULL), can an in-flight dual-edge interrupt
> handler queue a spurious rising-edge event to userspace?

Yes. With the IRQ thread delayed in a test kernel, a reader blocked in
read() gets a falling edge as a rising one when the chip is removed
meanwhile, with both uAPI v1 and v2. Without this patch any failed read
does the same, for example on an expander that is going away, and so
does the HTE thread.

> Should edge_irq_thread() and lineevent_irq_thread() also check for a
> negative return from gpiod_get_value_cansleep() and drop the event?

For v4 I plan a patch before this one that drops the event when the
read fails, in all three threads, as debounce_work_func() does.

Adrian
