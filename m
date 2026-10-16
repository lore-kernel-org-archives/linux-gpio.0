Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF3754707E;
	Fri, 16 Oct 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136886; cv=fail; b=SSJtDUuUFMcIwtpfuTm/3mv7oIYAj9L67eERusvMI5sj2NfQnN9Vr8F8uV/K4+5ihp04cA55i0zGkKngS+I9C6YB0p+9/zqp+tpxhB1j2BQqajaYtHzj0t6HGkEraPd3TFdAfKXpmdrR9SrrLfkwK58+Hy3IK31zL+ne71ZBfN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136886; c=relaxed/simple;
	bh=4NNKvzSdyZTxcNba/jYNbH8rHgDEJWVk0/i0IFlWx90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RyPyRbqNSiumaZiOf830Lh5CwH6EfjfJSbdU31O+v0fIzN+6oGKjcZAwpga1yagoCEVxIrYG5nnPYuf1Lv9VcKCoyo9hLCUhqFVcdDXXB/G4xQz5v0KM4Fg7ATirmyaqCrI2IupnCty138JMy/l9HFUCh4WyAJNYm7bmlNawZTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UA8iQn+1; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UA8iQn+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkDf5kCRTbPcU1REnOCKOPbbm5/pAXrhr9TkozJZdJL3cqHJiTKXJOE7vgBicDmJZ0beYC1ZCO14liDJYkmj1Bk2Si968ysQbB/EOSRwOOG5HkYgHyrFkLV2igoI6jQ1RNKa+iUx6Hl0un874o/cfC6mH7Sszy0+lMltXr+ysTZd9uL6hr7FMkSJP9ZLesQ4p1yazK3/qV/aLY5J2Qf2URqUBrFws1KByJ1EqBobquSnvO2/SUO5skqhcbw/EL89/MlLzs4NAlGwKnphLVFna5+JuMoo/EB7Eax7URl03KA92H7g49pe8ep7cT+hrUAwWvDDz75rNcet0nFDCyCO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NNKvzSdyZTxcNba/jYNbH8rHgDEJWVk0/i0IFlWx90=;
 b=zQBIadEoGG3WVT6rnhhw8WckwoYWlsLQtxjowYStPdVnjHUg1qpern5RbDBjU+kiFx1RX/NTZJyazz1Volt+y3FONcs4pHQNTBSSze/65Te11kNLg45nbJRx706dQyBVTBSJq7RD1PIJ3F5VlOLD+vXteOZpzByJUk0kcnbimn+lGVHTtxkM9sxwC3kftZD/ZTIELKkUU0Fx7WQ37DO2rftmCmUTffFNSMGCEEYwvait2WwfwfP6fUqQoJiH4wWMGRyqiQZq0iDvnjlvX0l1UbpRFO6tel5Gr4lag7beMbcZmLMppvybnbwqI6GQqVuI13yzFoL2VCQ66sM9sgau/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NNKvzSdyZTxcNba/jYNbH8rHgDEJWVk0/i0IFlWx90=;
 b=UA8iQn+17j/1O4K6ynJdUX5pmCrp93IzoqmHqucebyz0+ZDmrLPrgSjXotTMt9Llb6lHSBpmUC/YM6/Kdih6sSI9W0UQuIoYIAVt5FRMVeXHtSUcv2IQou0E1MNSNDsftNB705NwRIBGZOwW9S3QEpZy+peed8VVi/0TYAy8Oh20sdUJC1Ql6FP+7DiQSHe6ov9HfeI7zyirKvRCKgOGd5rb1B71JaJHDfLjqN8I7iOJTACR4tTC749pbJAXkozwXwUUeeV0r4rasjA3WDtI8LY6W6HeoIqLBtPWg38C5qpWF7sSzXj9m1jC8k6iln8VGQZ6TQjHwEKfBkQT2mu15g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 07:47:57 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 07:47:57 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] gpiolib: fix chip removal with lines still requested from user space
Date: Fri, 16 Oct 2026 10:46:58 +0300
Message-ID: <20261016074704.1860749-11-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMRc=MfVU-+r_1s6Lezv4s-vRa6cBLmdVsLt__TJVL=zZW4M4A@mail.gmail.com>
References: <20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com> <CAMRc=MfVU-+r_1s6Lezv4s-vRa6cBLmdVsLt__TJVL=zZW4M4A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::19) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c57ac7-2f05-49de-edff-08df2b59cb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9cjjgdjd6/LbdZSzVa11m0K+5slAKr4wLBO4yj/9njcvMNYmPsl//QK4FxX4YWEHufzxy71IQAQBdINP3SdocA/W2HyvCBxPrbN27l33J+ZFLMvgl1waDCfyvnIR4PF/RlPRHqP/li2mmie3RhtMBC6D079ct1ZKpEcp01wysdbzubI4rqzQENmvdyxEtl3a2eZ8vTmRMywgIRCoyrWFG35s3te09XZGO7dZhCeBI2xXvGv3NaWP1hwFfQWjf23wNsfNSpl4SVANYEaTGp4EkfDTmflvv01yxmyb+RbseSjxWPd47+WqRF0p925KKyO+pWYns9tmMCNvSywwDwAbIf0a//QEIA8su5Vvsut9aOLV0oyWZVGxJVvlUUKdpjKE2hZ062BfH2fU9FtgyWZCE/RhvFnK/HSogagld4zOBHU/0ywVIBbtg4ddGZ4Y8zCQ/ieAPekg2Vzxl7SIhbmaLT4tsxfnLISiz8jWtBwFvhglAFFDPphXBMw9GUNqDh6S86N07rYBL8SHAWMcm0IoXzP/vfXz3/U4Gd+FLB5nxNv+oZwb/eTp4fuSIDy4UEJUP6Z0KSyHCYgJyFL0YJwyD+BlFCovPbaeheZxqLXJrY71j7WvgBC9eJkbUI94XLLpnQT7eCQB33I3d+U6NyNwsiKpP5nEF68hxNfpgf9PMCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1+ge4tLuEn97ZIjGhIoKKoTF9hXvuTR6y4sTesE7qrsmfOojEnPeKRzYG+Ce?=
 =?us-ascii?Q?qZOzlsL24wLCZa/dtyWmbRVj1TOonas5DHRLxtZJGLO3gNgrnGjbPNRJwgIS?=
 =?us-ascii?Q?S0X68W9KVd6CcAXl+PjOlU9eRM6z92HnP9G1/frdLrAyG9ACloDUPVuqKzrf?=
 =?us-ascii?Q?02hbrLB/8wAj604SF06Gum3GpwXYSp6vLpcdt3HhDz3SzhZxvnPOJsZsmhfz?=
 =?us-ascii?Q?vWaljDVAMk6qRovqLn0If/NMsOEXXIJGygbCpNQWVcyoGlEz+qnR3M5VO56s?=
 =?us-ascii?Q?4AnY0lbIt16+4BO8gC4SNIXVq5ZSb1asQtfF4a3ItydKarZqZtPdhmO4z8gz?=
 =?us-ascii?Q?7d2ZBkEJ6/mygYYP8c/WWsaASzP5Y09QfB5EG6H61ouWQ74k9GQW/KaB6J3w?=
 =?us-ascii?Q?Atl/gvneaMM+oqj4JvkyROJOLPiyUmg9ATy+jxbEmIBzq2lLuJ2CZxMJGKNt?=
 =?us-ascii?Q?mp2zFk2pxwkwjyNjiflj4nBf/89vMpVhFtXeBrUEZsq5iyaHIVdXAu/I0ggj?=
 =?us-ascii?Q?dctAio4PQPkZwSLkaXZ3dnHbi+oJfjC6KeuT5onGHOnRFp16ENhOZRLHgYwf?=
 =?us-ascii?Q?PbnaWxSpNLO9OOwbI7tbhiammg8rVbBDmTyta3GB2uPnEEw6TjupWAcOssPh?=
 =?us-ascii?Q?nmN9dC4VDFpdaPtI65PZufkg8fMVDaw4QFn/nsm6obwPk+Bjk7jOrfDzMdHj?=
 =?us-ascii?Q?zxDLhEHU1ZV/fbWA/VxtWoRmDGuwPm5+R0vEnDb+pNXeYPzA2QN0SjBSMVcQ?=
 =?us-ascii?Q?wrrp7E3Yc1Nocp4hVvpW9ZzPV5Vrpu4NYj1cmcZ27zDC4Pj5CUFGsI+mnIJT?=
 =?us-ascii?Q?EF5Abc7N3F+7/Cs6x4WEokpSkejLtx5pkTFEmf5YSfJ+OmKHm0NBgJ7kj4Kx?=
 =?us-ascii?Q?ZvEqvc0YivG6B0i1Ujxb5OFzuY1Uj0ecs28SVyQYULvnJkP3+ZAsE1WT+Lk+?=
 =?us-ascii?Q?ivukSgWZxsvPvTKBmQswtRNGu9olG01g6k4QrfTYyVx70XsLIlUL1wQClO4q?=
 =?us-ascii?Q?Z07phq7MJKzvXjDR3J5Wypq3p6ChsRSrK7VQfOg+gPQ+oWLhe7/qMkfjiIh9?=
 =?us-ascii?Q?C87cGY57ROg+Rib1xUSy7iVANmjmNJIhUVSpdBFgM5QcDRNoH5earjhid8Iu?=
 =?us-ascii?Q?wr7j0t/PwVq2g77nXtr0k34yEbSP/RO0rXsowQ4R9/HARKKgQphljCxe/iYT?=
 =?us-ascii?Q?xEfCAAnBZhq2qvTsF6ZtL8LFQTtZP+eb5o5CZbsvfkfTovnaakJtXVmlm5pJ?=
 =?us-ascii?Q?EXndFnPAsyJ8YjA0PhVwXfluwZZcuHhoNLyUiojyH0el4GBkH5hfDlfJJwEP?=
 =?us-ascii?Q?DpPeoFWpvenX+B1+hbQQ8x6DS6lgAlJnoV/VWjetWZWvaTttXkqMc/m0m8O5?=
 =?us-ascii?Q?62sBXGhzZ7RGJ9HlM7wzkFVMMqfYP82byhiu36Kiv3DazQgtHHy/Xd/em5QF?=
 =?us-ascii?Q?oz+mNLWt8jBvNF2D/gmhLw9TtudfXRkQvV3K0csBN2wENQB2HTf/Zu3bIuy7?=
 =?us-ascii?Q?Tz0IlmQFbhxhmeVITJkzbZ1Owr2bVrsOeboSYqlm/DTtB3Vll1opLhV+/Qkg?=
 =?us-ascii?Q?qACo6CBj0vWq82CIEb7cPtoJr7F+ByZ2mWY1dshVfD/tbUoy/RVlzJJE94MK?=
 =?us-ascii?Q?CaC+5RV46JmIOJbN50VEo1/JlEdutiM3DztUDDwFTihEoPQ9Hag3ak2mebGt?=
 =?us-ascii?Q?2GmadqNvGtlq6DNJmNUyR09Fhs/1InaIp9dKJhrh0lYsN8Ea13rl7TdxD32Z?=
 =?us-ascii?Q?hRRXwkQl8Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c57ac7-2f05-49de-edff-08df2b59cb55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:47:57.4486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t0q4LnLaYAoARTDDzL6nI44GjSCjTt8jQ0HN2qyDljg4dAVM1dIRFsnRIARIjJlkSWS35gzNyezP9a6OJUBAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320

On Thu, Oct 15, 2026 at 12:57:54PM +0000, Bartosz Golaszewski wrote:
> I'm a bit hesitant to queue it immediately before v7.3 so I'll let you address
> Andy's reviews in a v2 and pick it up during the merge window.

Thanks, that works for me. v2 will have Andy's changes and two more
fixes for existing code that Sashiko found on the direction and event
clock patches: the bitmap leak in gpiod_set_array_value_complex() and
the debounce period reset in gpiod_free_commit().

Adrian
