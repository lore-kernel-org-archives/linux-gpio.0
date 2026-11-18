Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795007467;
	b=pEN12Rl+c4cZUZdoIf+/9gKVMFxORA8mL01G/0Ow9PdH2G2XMM8dM04MBprwqrUTGtKf
	 8gYcIU6PPrWv+qJhCfXyAX8mlMqNl0u8/eK7W/eqvvMtPzLlR7PEjgB15FJdzdbBiBDOn
	 8bqYIQSoty3CiOjuto6vHSNNTBKUqWeh6ithZL68xJIebPsIdMektHLy14Vpblusk/4AH
	 x0RJs/kJeleuB+XGOulL3Eul1CwubkKqF+GcTVXCmhzxHQwYviClACuDNwIadKGR6gXeZ
	 t2ZEfJSke5lZnFDEXOHVKLoHLInjfqwZMQsamU85SDY/CAwZqMUvBT5RXUaF5OEr5dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007467;
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
	bh=F4eYC0YNWQ2MX17RfIJpyfqPxjdDz3DiN2wzXakj+uw=;
	b=Vl2D3Y9wZqGPeanKlsjtPNLQkTZcEuYHUukEsEmyfqz+RS+VTqnMfOOsBr6puSW2GQ/w
	 xIAAK51+csmYRRymqVIvLI5jz+Ozg5bLNsZeLG+22xM5paggBptYqrDyEqs0uXAOk/Zra
	 q+fdqTuKNL7M1fsm9Ai+uZGPKuxiKiWCAcaTYx0NxCV+Ne+VRkeoXmv0CRRK0uWoqod8s
	 M2UCtBnKjQHPMdhqVpnrDOAbnuxwJP4igSWW/RM57hVftVZ5DG9/cFyiGOwcPED3ELlP4
	 novA8/ZnjESK31VHhLP4h0Eb85Pz6hQ5009XmyMNpfsJMXF5bbUjVJZRFzGAr1szI5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VKjFwkcP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.6
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC16606A330
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC16606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VKjFwkcP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXNcDRwxFIM6DqUY+EiSEZ+y6W0JzGXN0vMlFCET1dJyl3ArTE/1eeGxRaIVTrA7n3r4ccN/5/QzPu+p1tLOUJWQmjou8+0/E/85oZTBvDPZqr8gYMsvfAJ/NyWdBpRPMbmd/2jAZ19Hiemc82Xh3/hwnrZZpA3426xykmtCxAGmE5U17JZJX2q6/IFLpwOBc3aCP0HI/DDSO4zI6SiRdDbg4sQDXcxbgWI8P8Xs52U5ZFpU/vFSUjkIrRvD52vMwzOBaNa4mE5vN1RODOwZYFcz6e5BC3p7Dn5BT7pUGGuW4ka2wib35H64KlscTYAMPgmSmG7StJykNxcqd73pQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4eYC0YNWQ2MX17RfIJpyfqPxjdDz3DiN2wzXakj+uw=;
 b=FLAcxoVRS1pr/XEwBadweCZRmnvqe1TlRqXb9cfls25pWxs2bOCBu7I+sEQdAWLwud/1Tm9MkUTVwUaIb28gLUwolENgW7j6Ffx/1JhANsimystpzousylB7zByKo3dg22HyyzTIqsPHK+d3V03ZyyrN07qsyWaf8Fpe4CoKx+hcIsusIRo3Xo+wZO9oTHIv4SkoVYfHi0gQhHrjLbI/1kwN6lRrdrCav3Exbum86yCqKJ2o3ryBc56rVaQr3dOyhrudhDfqSIDhu0baQUxfaLU1jm5Fpt+J+uAbBymyCwThMXAE13IBbMs5IxvJKOvoMSf5A0XTfHAjP9Q+GuR0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4eYC0YNWQ2MX17RfIJpyfqPxjdDz3DiN2wzXakj+uw=;
 b=VKjFwkcP4pfnqzx5ZRUiQXryTmu2ZqVkXI5NC/avrix+gaCH3B/9vRHFDus5qlZBj3LpnDUyTjYay0pSwIU+FEDxkcm/ddiopZBFgjzccQ2rlLoL3sn+jHu3rem5lCMhfNsSSMQZCpjjGJmwqe9DdUzmTqvMkeWY3nia2D+8hpKwS2AusxL+kSeazdM1y3duqakPcd0YqSxpPcRrdo0tA1NmC9eh/c5vX94eWR2uv7THw7y+2sDkvm62GpAZ4I2erodqX3nFmUXJ/9VOWF7QCcDh9wD9ZBozms6oCU7OHUC1RF6JupbK8N04FmyUAUdOsg2eIZ91JTv0q2Q7b5KIaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 13:11:02 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:11:00 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path
Date: Wed, 18 Nov 2026 15:10:56 +0200
Message-ID: <20261118131055.2383780-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016105442.109836-1-warthog618@gmail.com>
References: <20261016105442.109836-1-warthog618@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To PH7PR12MB5974.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: d83a6a04-72ba-405d-392d-08df457563f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	agyDRgb/LpLUmwevwbd1eLaNF861SEjv4H9rrbagFU20CloPy1G54XZZvmNGRqgbpgsojyP77X7LYNAND498bYj1j0c/RP7KsBw9xED21yXrj8Hb3QIHp76vfX7zUa9CH4nLSxM+7TBOpOwomBi7ScY48dDvAtg+rbMJ5uO6parWYTwEsOQjy5Wtie9qHaLdu7CG2sRPge4ihLnkHMvzuPnf319QQOleo6qyO23hTWjY4iNENJV/cTWvnchmZHq4OzA7Tk/PXsQlCWNIznuEGLIM8xWk5DuSS558bRq1fiW+aIlBqw8uKeCI4Q8CDgl1mCZ3a5hgTDL2gNMbGTA3PYsNnDb3m4SkHk2/4LNHZE7qfLtqM3WHQopdtERa6tBzDknxHwHGPM7BUbN0m4QzovVjuaW1pXUHFiQBtNoBmMRtKKgd4C0f+QXP9dhU0vS+3eaAbFrKS57yK4we0x6+r2kKB18C3QpBIoBb3yyC1dRyMOcxtmYIHPTXS00mJ7VtGKTvnXQ60vXk1x7ldPZIrbzErgQzDUP/hnx56V+vpJOCKODZnkVcLtWsXz8U/CN7oJOhUxXBj1YBhyo2aI7gqqLw1FESDQ+D4ftIEdklN2xaVCzjL5jEWDMxUceBuY4H6NJlhtO80wgODSgPmKT0CQhz8e/1Hwn84Z8PjG4p+Zw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZOUuwpCG2iihWP6lDf3JG/x3i0wapI4P9skJnWPSLToLEQgRfa/O1dSTNWM?=
 =?us-ascii?Q?6Z86vagwmoIjmmBO3Kjlt2XszSPSX5E7IgtfGsH1X9RoMfovb9oVSd5YNr/Y?=
 =?us-ascii?Q?jQpJDzm/vqPmk8jrzfPclG/5Kok0eh7UMzScKwiQ7UmzMyMNPpfxXPFab5BR?=
 =?us-ascii?Q?ifihGJnLegfUsPUbCYfQYjAeuChQNZbgM2GTU5NW64ahA+WKgNgnpn5ybeQ8?=
 =?us-ascii?Q?rCN9gMws64Nlqbv7fsmbbmYteJ0/5RGBNdO6y+kezm2f12c2vDKUfjYmBUfp?=
 =?us-ascii?Q?FAsq0EArAChzceCoDvfjHxywipBGLHewc7cxlSdPoJ7myxtoPLjSZSnB60aX?=
 =?us-ascii?Q?9S4tBgkoLieZpMnsScs4YLce5SR12w+PIVJIPPIlzBonE/QrfaKYa4OXixIe?=
 =?us-ascii?Q?M/yMiBcOeLrlhc1Czp55Z6u2vKmIevuWtJUZYhQYJ6MtvVoNkXaFylGsYq1G?=
 =?us-ascii?Q?khJNJnQDJOqJF8rDzEmKVo/JvWwYR2EzKYdi9PWZutZEeaEOihD2JpQbbdqV?=
 =?us-ascii?Q?Wmvgn/hHXZtbXsUiYKk+OxufnwMakIbYcy+O7yNFThcShZ4sTVhJwVZF3I3u?=
 =?us-ascii?Q?gjQy8oz5scHpHCIOADpIuwoxA4xbwocXwJUWral+CJdvvJm4AHY5t3cRtbpx?=
 =?us-ascii?Q?p2hcMTUDrtsCkBEWT11zu4AlPzZ5AovXjI44YY2NZq+qeg3qeFe2m6uZbNg+?=
 =?us-ascii?Q?b/ImBbL/BpKcqutPupvcVpPHmPaLwcoLpjTP2ZXHcC5U3dhWRTzJLzscStXk?=
 =?us-ascii?Q?YSoXuX333rdvJes8abOz+5hHav64vyURsMiXfJmiu/eNdERCNDIMksUWSvTr?=
 =?us-ascii?Q?5CdQoyFnOXyXOe+RQOel4LNQv0BDyKR8fnHQv97/vzBLMEXgYRwfd5L6tAyD?=
 =?us-ascii?Q?TT91Bq450aYbDBi17B/yEB0fMkG6hSMBL3LfUXqdYuAIX8Bd4xYLf/ohryzy?=
 =?us-ascii?Q?LfnNhzfk+6f/EVF9Otad/+f6S9yppQXO4Xr+enJbbVtjwURr+pxeGaaOR65Y?=
 =?us-ascii?Q?SCRe1dMY4M6MPjRD8AQ0+cgTHLkXAVgpBFHcWYKKkI4Yrhcz/814YjTYa3X6?=
 =?us-ascii?Q?8SLeoVZ+6ofNz2lWl7zp1rzKg2ernC4T3LlPkeG7zsZu6Z6ZUYVvog9Nc6Hh?=
 =?us-ascii?Q?8Of8PyGT2o68yU3qKKl6T+Y2Ym/APo7nEc9JghGmhpO4tIdeeuqPEwBs++HZ?=
 =?us-ascii?Q?Np8P/BnyvXf+mqWo+M5uPA7nTZZqnOdNmvE+YebdQk/bpnspHo1NkPgrynk1?=
 =?us-ascii?Q?5Zjv2GOC1m5/xtJRED2DUQOVj+L5gJHQZeYeBYmcXuWEpyQA7k/+S0GChG9p?=
 =?us-ascii?Q?oIY+Y1ZdieFa+7wVSi3E6+I2iAbELzqGuxqA4MggbzCB6PbqyTXKtWV+gvUC?=
 =?us-ascii?Q?/aQCqlSaOulolYk/NG2tVZSIygA1DzF22o6Wn0d9VTtzgs9JEcFZyZ7XEwwC?=
 =?us-ascii?Q?a0byjtOkDFzQjHs7TB/UGjlmvIxl4Cl22ihKHyR5Fm8idQtf3WEqTb8VgA6g?=
 =?us-ascii?Q?QgDfJ2edrT0CZQQMkr0gGYP9VvGIZe0zO6Ip13EFrGJ75ZK4jVys8ifmwX3+?=
 =?us-ascii?Q?85s+URnVyrzW6iM6YDwJxtKo4uD+7TdpU6TK72XfvIxCemDZ3JO5F3lEfAuN?=
 =?us-ascii?Q?NCnJh/ebBVQn3ckM5clZANol+iyv3jy2m2n9O91RzJW27m3moNk9siaO/GnZ?=
 =?us-ascii?Q?LPh96rUBp/2BAivg2QmgD6azMcnQsTLNcuDDeyat1trU3GBwK9V8dAKI2fIO?=
 =?us-ascii?Q?r14h9Vn/3g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83a6a04-72ba-405d-392d-08df457563f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:11:00.1664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FvCSu6fESaXo8kVI9OkRgxHMA7kzRBXByswymwi0e6VZsCLv5Inyp0OFskbYtS6z2w7aW7JoNLkgaxbXJq5kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158

On Fri, Oct 16, 2026 at 06:54:42PM +0800, Kent Gibson wrote:
> A drive-by review by Sashiko reports that, where the line has not been
> configured as an output, gpiod_set_array_value_complex() can return
> without freeing potentially alloced bitmaps, thus leaking memory.

Sorry for the delay with the test I promised. With a 600-line gpio-sim
chip and 50 GPIO_V2_LINE_SET_VALUES_IOCTL calls on input lines, all
failing with -EPERM, kmemleak reported 21 leaked objects before this
patch and none with it.

Adrian
