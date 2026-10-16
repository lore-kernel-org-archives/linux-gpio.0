Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C144BC92;
	Fri, 16 Oct 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140296; cv=fail; b=sl9TGbP3He3LV189DHNOvQQ8qRFmEm39R92cimNRkSW0yVNIK5wGBtMHoaLuaGaL837mTRve/GhHzvYuk0iq9/6ObX4b4XOFgAd99a7/ST0MrpuxV8Vbjtxh9ouo1VTVoDiuLgRzbafbLJkx4WKofauJAlkNyfFZ3fpVGLVTu7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140296; c=relaxed/simple;
	bh=NwBzazpyo7PzZTTYml7Dlji6e+vix8/iA7DfzYqiA/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RSXnU8NvVBubHrT+qKjTirga1eNXsk0bNSrGetAsQ1PMEe9Lbc+6nqLiNabyam0GmBJg2RlrsQwxycaHxEMvkimzcksTtknx+Iuv0hMzmpLPakfZlHXfTlfxW8q6AbX4wWrpaIkIBh2XT+q8kNJEGgqRSobbWqFEHS2qfqeWv3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WdoRYuiz; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WdoRYuiz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSHGNlJ8EHNK1ZWd6WEG5sCybKug/PpfQAy2BVr4RDQEmIEZIRBEA05tbW/SC5GJFgyV5Hj+McbPAuPszRY8WsF0MHxjq+dpK9r87V6LlVWwpQVR5NvFxQoUMoyAXqf2RAHtncLmBmQzmi7Kme5/VjkGpO67xJnF2sqgwdv/JK+9N6e8FP7iGKANb2gO2lsuymjCEG44u1kVyrqmxoNaO083AQuWmYnp5wzkAO2rWBldOy5OKp8Kz/WaGBUNXrs2rTHZJpdTX+OynRPOHBGgfN8zHxStO+AGbwPbBsQCMztD2bnZoSMXIHmu7Fm0+lW04ZRLvV73Jkoi6VPt5xPejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwBzazpyo7PzZTTYml7Dlji6e+vix8/iA7DfzYqiA/g=;
 b=Le8QS/+/Fo1At18Bg5ltcYY0on2iYForMTPMdbFKyNvzwBBFRHU3zFntmwXqtvNzSnw2ay3StJrQAKUAn23Wcj6YrkQEn1jn06J4xJnK4WN3y+TNgq6qnCrzAbU9zaRdY9n1apuNcm/VRaIp/wT/9Srp3aJMueZlW73U+EhOAGkR2hZgckmFEpyHXBej61GHd3wfVw5YJcmY0Aud+NixHtXDqFVVXYT1+EC2UCWsZFT6BCR9fVG3uwcIZgerYCe8WS7Z5w7rPeL+4Q/T7dEAxE9szgx6GbRPqD+deP2rwuwXRRplv04pCSlP90HohlL5FBTGVt7ZcS9Us6SpcEDdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwBzazpyo7PzZTTYml7Dlji6e+vix8/iA7DfzYqiA/g=;
 b=WdoRYuizr+Uwdu+vjeBkO44BXNBJliUwSwVjq8qf3jb2O0dwYn/4l/c84Hu4AmeFgdliyLkbKKb7TCFsl88Q54qoZfLvfv1tJOWVVCgcGaoCnyq01AkNSBhCPVeLBLv4eBhAvRz4yzphqHn1FaOrFAw5NWawF65C9NIExPYJpujluHdcXvMngi/y78x/NS+cWmFpRmfpmqPeKY9uRmiS1enHZOcau0qyw6rRYZCLBRsy8YzZ9dGzKt3KeslF9lpxdke3l2XDojJs7qjkKY+MsDYQb0GePwvg+BrkTTG8u0CaSScJGPz/VpyHcRKx5d+t83mna4lxQNXoMdct+rrcpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 08:44:51 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 08:44:51 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Donald Shannon <donalds@nvidia.com>,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/11] dt-bindings: gpio: Add NVIDIA LSTP GPIO
Date: Fri, 16 Oct 2026 11:44:43 +0300
Message-ID: <20261016084443.1972351-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a3433655-c2b1-463b-85c5-9cc015393d44@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com> <a3433655-c2b1-463b-85c5-9cc015393d44@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 0224f143-5d60-4561-8bcd-08df2b61bdf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|22082099003|10067099003|260925022911599003|260925021911599003|260925021311599003|3023799007|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NcAUkMMB3KIMKjLhyjEKXEBWwp5+qbsY7K7jCOz8vfnV0T0jvwbxahhLT87wbLQbObzlAjAkCybhJlLjYdNYJCFS/6He48DqgWJdMKXp7QoHforJuodeGlHqTAXECdv59V58Rmsr1fe6g8nwQwqDxOjRmE7VNh9ZOzSDSCyMpG6W+w89QsF4PZIWrndIf9XMAmbi/KXxqLgn3h+4Sss92rgHRkbnnAIrTp/yHGhvSl4H0ogVCZP30gpDQ89y07nDS0YDXflP4Ieo4yPiGUM9A/UatXoQ81ofrjwF1nrDLT5MH2QcGcmEJK3hhGeqkgbADETgO8yT1O00hly4w1cxbWFO76YRo/swQBIQ+ymJQuBUhJg8W+IyBDpC9oFUXOXKM0HfgFjuUpNnUgb0i4F5bnqap18i6lsVjOr1CuoIAjv5exmIiltMqpDDPUwY539EvDVHArpT73X7ZaaMmgp39JLLnnvBkUZsETcqoOU67FZoh8EXyNFgZcFTvzXbEHwDn+3n/Y5xqsBq7TS1gVBtqN1pbdlYCz5GhXZgY6p9gwDbHlGE7+d8xNddSadTxhV5qv5ywyH5z5M/XrS7S47XsmvAA3I3R0sC4mZKuzdsGE9z3B7WDiRAxGH4ADX6WmYllhccCoG4Vs3p7y/eKcUDgYDG1INkJ7W07cE7PwrwBZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(22082099003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(3023799007)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HbCV5mNFjK6IO9ffkk7+mYjrbbTEkEJgT5X3SoJViQfWnTWjlp3+JXCpWpMb?=
 =?us-ascii?Q?anh3G8P4E4urdUAII8jxLI2Ka46BQ5200KUT7oW9BjjrHjsDusk3XfnnKUGh?=
 =?us-ascii?Q?KasfStQLw39U5RmtIhrsspMX3sHqH1eVJ76VP/5zr+8lqBqE/uvuw0M3U0yY?=
 =?us-ascii?Q?LHOXKcnxChtHArK99nH2wBWzSnnJtvcEZVxgV5thtsI6fgY7USdF76IO+Ssa?=
 =?us-ascii?Q?aT2fd96GjAoE5P56n4xfkrMPf4A1QzUnDo+91ayeYatfg4ulD9Ot/9YQhloY?=
 =?us-ascii?Q?ukuwMO4Mnf+lLlTy05fImeRdxyU5KvkCqgMeETzv+sMMfMzMY8V1VDnoRdC0?=
 =?us-ascii?Q?ZLKpAPJFfNCDSggTYQ6/4Kcx8oKB5pkBKyz6klHAULLVvHaTVzPtySUCfI6X?=
 =?us-ascii?Q?lnun9D61Fs2sZlCvA8AblSIwiZTM/nm6J2Mr896QGu/ZGb53bnszjLLiz4jJ?=
 =?us-ascii?Q?6mP9kGbRn6Rm4u0ZD3Z7kZkuv5ENFyvBxHZnYoVOPUgo0meG50Mk20sx1Apn?=
 =?us-ascii?Q?/8XYKZrqic3Bi8Z+5Sw/o/ceoRkAB58se9q2fTWEHem0pKf9IjM4BnxXy7sO?=
 =?us-ascii?Q?TYWRSgNsTgeHLyorFcdsLAoCMU5a+ugCmO/zkrgFYMn/yDNBkxywybymreRa?=
 =?us-ascii?Q?89XzEYv4C77JWwR5k6PO4pMHsyfq+kiooO+ouYU27/eJ4vZmDNHa/W8XxrMI?=
 =?us-ascii?Q?0e3W8W7MdRVnpmMtZ+32lcD5WG9r8WuhlPQtN+su3d3FO0WmtqJY+6njLF8Q?=
 =?us-ascii?Q?RBWlfRgDOwZn3UKa9pmMdc9QzF+FdoZ9BR5IEa7cQ8S6gAjcPsLJ5cECOFPI?=
 =?us-ascii?Q?jCiw5IiPNFFt59+qhYo9hT1xFLH4s8TzXu9Nup5jxGLKqZsdewBXH0CcWIlX?=
 =?us-ascii?Q?kI6lNa2fDdcUSMNhRx+vlLvX0um9Xz1q4jqcKRMEbt29HJjFnBUa+k78Y9Hg?=
 =?us-ascii?Q?3v3cYw87pu+ma6b0H1GBeLipD41cn9MfNZOeOT1nEYtwk6j+zQqmkNTEvkHc?=
 =?us-ascii?Q?YcQOcv5Y6xJEr4CpKlWsqST3/4J/NTr0xK8khLc4r4RGo55TQdWStdcypY6L?=
 =?us-ascii?Q?tcrJW6jtp7P5YiK/+4tXqN//fTh6/2ewb+xUpeF94tpSms8SF0qzz2AOM+RN?=
 =?us-ascii?Q?38mfGEo7I3NPN+ZwNBFAB6Fb3pfNUaf8olmSL9KuVFpnbh0tqwGUJehBCubh?=
 =?us-ascii?Q?1KPbMZiQgjb5dTiO5Q50uH0JeUQcC71BvUBjmJ9RDN/JoCnPfybkV7YG+gPI?=
 =?us-ascii?Q?qOU0PMcbeT3UV4aU3ASLBewff9Dwc9eayCsQBaaGaTz3pHq8DL72j7aO5ZNA?=
 =?us-ascii?Q?HkvBFVwvF2Yq+vE8TT1AeVpRaimR2yGa1M9XFdEnhvusukOxbxWUYapz6uyJ?=
 =?us-ascii?Q?CPYxWm/j+RvOBd36VYUYyy0EjnDCqM9+HJCNlJS/wvulDvJ1Bfew2vZLoOFT?=
 =?us-ascii?Q?RkS5kPM9gcysQKmi1cJAK8Uj7YikMYmnFRKI3nUA6IEyGKhnWXHtuYOXG9Zn?=
 =?us-ascii?Q?+MMr/SuAYIhwhptxD2Z9486ms2LyyscgztlTQQ8zkCWYJm6ZZ7X/eKsgcL35?=
 =?us-ascii?Q?NYuSLoMvH73SzIUpQwFh6/THOhLZJt8/blhwCwdWPo+/c8oG+FzCcA/uY/TF?=
 =?us-ascii?Q?fx+tQdJedWUThxsxTFYvFk/eLoeZHuDm5iHIeTBH11XZkoYKn5DhooS2tRbp?=
 =?us-ascii?Q?zgvtLPs4hpZaW9P0KD0PNem+DMjqjS61H8zMm86s1YbocYp6GnGks/LCdUGL?=
 =?us-ascii?Q?iGqj994uGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0224f143-5d60-4561-8bcd-08df2b61bdf9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 08:44:50.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAniug3jBRdoYG9yvDbocKKwZqqES8TkeuCw8wqJpkvHgPI4+4gGz+jxeB+Z409CgLvUdW0TWCoReCgjHghebA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491

Hi Krzysztof,

Thanks for reviewing the bindings. This answers your mails on patches
1 to 4 together.

On 13/10/2026 08:09, Krzysztof Kozlowski wrote:
> What is LSTP?

LSTP (Low-Speed Transport Protocol) is an NVIDIA protocol that tunnels
low-speed I/O over USB. A microcontroller or bridge chip on the board
exposes several channels (GPIO, I2C, SPI, UART, IPMI) over one USB
interface. On the boards it is used on, the USB host is the BMC, which
reaches parts on other boards of the system through it. The bindings
will say so.

Whether these devices should have DT bindings at all is now part of a
broader discussion: Greg questioned DT for USB devices on the cover
letter [1], and I've answered that part there. The open DT questions
are also in the RFC sent with the series [2]. I'll come back to your
comments on patches 1 to 4 once that is settled, rather than rework the
bindings now.

[1] https://lore.kernel.org/r/2026101355-species-glance-9ff8@gregkh
[2] https://lore.kernel.org/r/20261012-lstp-dt-rfc-v1-aambrozewicz@nvidia.com

Thanks,
Adrian
