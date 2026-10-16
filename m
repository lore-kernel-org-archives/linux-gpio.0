Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547CB44F54C;
	Fri, 16 Oct 2026 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136882; cv=fail; b=Pji6J7zae8abtI4nCS53xBOiMmuvdEtIhqEBvhihVACjHuS6SkxoL3MdgtlDyjhotdikoV9jVhMdmZXhlZoBwWpoFt02tHQBHGLdYdJVoqH9UE1yInl74GeIFAg0Ovv1EgbzRV4LvqmD5a9jQJCPjav4AVDPe8QbYzSO+1WHgs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136882; c=relaxed/simple;
	bh=J4FPjkUsCyq+dLjhPEveuWyq9Xwb1T6cKbekG/zGJyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gV5Q2tURyciReSBpLq9TpDpfAA2UJdf6Zoq7cGyDX+4n+0jRz7buZMsf2wo3PUf/hF23guBkgIXbCI6UyN2IyVjKoA22KVOxgtP0nSlwrBj1TQe+YU5irNWzx1bWdtjDLs/OHqkxieLYgV8qK6l6PTFyBO4nHTYJJ2WJkFxWunM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mJUgRj/D; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mJUgRj/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubBCDBi0AEZgjsjIpeD/Rrwq2Wrl/IEl000nc8zjPZc2SrpdhRbpo8UujD7rEB5L8czL9oTuwDZU3Wd1sB/JRj7SONjEpCNynhjUXd2rvXxiSVOMWa/aPSEURvHl1alEB9/r9P1mTvOjWLxmrSJhEvjNFTjRdppoAQf0zhiXCYRnN9tM5ypoG6DAKfafpu3WvC+MZQrfRTPOMRlc6cS5O8B7XoO2HVOJHiuTXcs+DO6NRuj9TPwlbpIPraHAMmMl70/IDgfhBk3Vc2mMNVfM+E6G6aArqPD6zXupXqMo4kjg3Hwjq4zcToXwbSXNW+vHYPTnvySiRlQWSF+cgYYZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4FPjkUsCyq+dLjhPEveuWyq9Xwb1T6cKbekG/zGJyw=;
 b=RjcolC5MclsgtEiNWr5Wgu6ZAafipF4AqpcKUpxGQ+En45rMqPxPZmZsPysjQ9FyfOrsSZUWZVy9fKXBTXZJweG8wXArkQ48elPdA9/Qf6QF7HG0MEi/FhVd9a45P1PGcBore5jbncaBXigzyU94Tz7yCbh7JY/jjJBfBhOPm7cSAN/AyMis2B7DCJjHMZNDb3/tfWJoYQSfdD/bNTsH8o6bnoR/EO/W3YuuvtQn9yS8nTUMfAPDJN2PrVwyASFm06iC8KKKS2dUuCJEfxuVFz9T+OLHK2MI8hJFE0XEYH1vUKHFonoyp45c6fivVuubnunliKGaA3n2eLrPgPcMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4FPjkUsCyq+dLjhPEveuWyq9Xwb1T6cKbekG/zGJyw=;
 b=mJUgRj/DWJFqT8aO/dYJrmlOTLZOivE4OgLSygV56yHsajvjqUVpJnV0WXNjLgtN93y1YhtTy8cE2ZGUJtNO1pu9l++jAwonPAIlkMELuQJskgKc6Fv2bWV6GrL4yXlOKtllRvcyBNzibtISjwSVOg1vomQM1NKt+ltZYyuie5pSAcyObxphGv9HZM9hFnxF12cEAXVuDrCeShmfA/RdPM5+eK7LqbdpFZRxrDNhOdJl21HrnW2GRK/1473R8rLkL5NIDgeyU/YBAnD1nwcMBh/4/V2AHpl9ndKjKkyuaNX1WUM6nIwJBuuWhJbOtn2cw1fSGGviCjsE4YWwO1Wigw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 07:47:53 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 07:47:53 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: clear the event clock flags when a line is released
Date: Fri, 16 Oct 2026 10:46:57 +0300
Message-ID: <20261016074704.1860749-10-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168236@kernel.org>
References: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com> <sashiko-outbox-168236@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::9)
 To PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: 14847a10-a3e9-4741-19fe-08df2b59c871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2r29N8CsMhJymQN1om3gQxjMd35emuh1k4ZL1j0xtd6XUsgXTrhMUAhhcjJCkbkG0pB1oUt6t79yS94mkZUsy+ASNXjjsAFaGE1hfG8qGJFNANQlYuD/sIfsn1vZ2ybAJddOAB8hH3HeReIwCLX9i1fsgVo1V1xtcsdUaWsEXN9Q8iUgaImNoUExr+0Fmh9Vml6ieS0xh67H02tFTiU3NpsaJdYMnyx2X3BWnMIOY8/2PHq96Vzd4uupvvtTH9VnD4hvxVtsF64zLG91kimmHATfRKydkXCWexdOrgFJ+rbki6ZN+L7HudNQR4ghAI0GL01CWTJ6erfsefBRi7AJxIGjaoJUHR7Gz6GihqXGkkxKqCbSaHKVOxWaoMiW+YVdG5iQvT84Da2KZmipIDZ+YUEICOxDQY+gCZ4N2Gmjy2In1CgHnLDgZb7z+zg2fhYf5QGxdJGAN/BI/2dZ0Rp2izgUTA5QUDgl0q3hNQ0j/ioTLMbFETZN2+GFieL/w0HfZT5bL3maGWLwoom80NX3oEitchCr/hPvoOtRHppC44wbymYqueDXFdvC6eMUOn5JTo+K2k5vtrSYRdS5JRC/MD37mp7ZP8hcOqg6Z9WOMs86T9rL9UZnCZgCE52hKmWFv25NSaMMgqbCINCGwxUsdLzFGZk6kolIqsOpOenSI5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YaFPFYsWoje+yTzcWpUbZTvhacEo6q+qzlN0jvb+hcusUdB5uoBJjf/lNVXG?=
 =?us-ascii?Q?x8vZm1dg/xa0XaGvknRL7WBZ+x4Mli5VdSJB4C9JANggHs74SGuvi2M/w04I?=
 =?us-ascii?Q?M9R4T4w+4gpJWocIkRB5ne2GdNZ3LP2WQxH06OnbsFGjaSqGiVsLAgl1YupS?=
 =?us-ascii?Q?zc6JdeposuFVmGJrUmouzpgTVaxGronC2VYLfvdTZS5jb+ASqgll71Gnz/YC?=
 =?us-ascii?Q?UuT7CECPmAYTkGVbb/XJ96ggqoZAF0qIbQrMqhv2qfq8cTFFxaf7vNfsfkKT?=
 =?us-ascii?Q?YLP0iAkqxtZtYAL6GLHivtbdjrPQmtYtkIwPvEDVQ2dGUqDYEZFXIzWxhsgD?=
 =?us-ascii?Q?HTKTO9LuPm+4TPJ3dph++byOj9ofpoyCSkFOkVHuRetYMBi5wjK165yLD0yE?=
 =?us-ascii?Q?JNErNCQwaJR5BuB/HBqqNUo5rfnSLFqos+AU1fyGmFD83N6jRnYAIBEx7hlK?=
 =?us-ascii?Q?5FWH+FUeJ1fF6L7U8ZWGll71R4DnoplXly8aX9cfjAm3gNo5E8Yp9FWjgu/7?=
 =?us-ascii?Q?oC3iIiOuY72Dgm07XVGKUpOc2u8tWoXJR2Z0v1X/V+eaNkgfQnwjZZilxziI?=
 =?us-ascii?Q?SR0tn81c1jtnUKNezmTqojXdVuiYXbJyBh3RJQ+RVgP/+82bHUIBeN93N8AN?=
 =?us-ascii?Q?FPO0W4A99eqbEAx+5ZF8sL7FAypN162rfvtWgExs29LeezlBjPqtbxDmNqId?=
 =?us-ascii?Q?yNS0y/hIsgLGSFufMD5CpKGhMAY/iRt9npLw1dlEz9bd3jzvRd5f2w6BfsCn?=
 =?us-ascii?Q?xZ48B12XsHCYbp7mYtT0KE13Rc0ypBqqboBKloaPc++GvdMAaWPO4q+Hdi5Q?=
 =?us-ascii?Q?qboVtVRHl75z5aOLo0xHC8tyecy69RefSNcd6lbP8IQJCGr7+FqC7vIYRRGz?=
 =?us-ascii?Q?WW78A5mgtvFOwuYKOHCMG77dcI2+V84BfaOq5JL0vPO/fIh7R/jIvowxQwVq?=
 =?us-ascii?Q?divMt6Pizi2fYN8Qn+0QdR8S9uXgl/3OO2+/KZCI1K4QDjb4wOlcZmbX/Luu?=
 =?us-ascii?Q?WcOXKFw0zAQItl60wD5J+qflnERw8LbgtOL3h9Jicgv9Kq2P5QnnjGpGYR9P?=
 =?us-ascii?Q?8oFIemfpkiF/xXoTX+E7t378d7oxTnyzFrgadFA/njw2QI/utsRv3ocRv/F0?=
 =?us-ascii?Q?1vVnTSIqUpIob2K/Vn6ongLWeA8qXXpjoP/TUpKOv3db8UCFYUCx872R3gKb?=
 =?us-ascii?Q?alxQ26JTuNpMVjRoVAdF8YBuo96RcdDzwMAuXAXCX0xIg6vRdA9AfIs6/su9?=
 =?us-ascii?Q?obEY5O/2s60CXBsYaMGe4HH/wcKnIbMdgVA8WO1/Tl98JOtzAcRfJdRDDWGc?=
 =?us-ascii?Q?z8iY/NRRu0xQSe4u3Vp4nPJ9Z8tYMSqGiAPk+JBLijQcHGRO9Y/huMOYJQZ1?=
 =?us-ascii?Q?Dkq3zyQMBSLo4SpdgBcAIkljHi/4QZAjUfDG5aghDJsxcvK/gxGueHzuwx6m?=
 =?us-ascii?Q?UMVt8umt0KF53eVVY1fBQIs44SORzHEsj6E0RKbFWUwJl/SukoFnx9YO0AHh?=
 =?us-ascii?Q?8h88cB4OUNsJnC1dgeOC6SOG7Q1qXzVm9sefxVr0N8NSJrn02zkSTrmb+BM2?=
 =?us-ascii?Q?BM2IlzFCPeTtGZdymQsDPSB70zWDcola46IRWWN+BT9Kl1T6ALCWNZ0cbsEb?=
 =?us-ascii?Q?rtnXDsXHlWukF0gKmqAlHSQ4pYoIT55IB7ywMyaq91Aw70BGm0G0/r5RkxcQ?=
 =?us-ascii?Q?MaBlLcW6PC1TD+YFrrUc9B/zPB4wqlVH3Ls/D2ek/KJutLNl55ah1BfjCuJ4?=
 =?us-ascii?Q?dDeVzfKflA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14847a10-a3e9-4741-19fe-08df2b59c871
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:47:53.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+YTLcP8Q/emgAj72x9wCl80QRGOgYimNKxeMWM0cZ4+bsKXBihbTpTb9EwOM6/WEIteTdVxHw8AYABaXCYkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320

On Mon, Oct 12, 2026 at 02:05:49PM +0000, sashiko-bot@kernel.org wrote:
> In gpiod_free_commit(), the ownership synchronization token
> (GPIOD_FLAG_REQUESTED) is cleared in desc->flags via a WRITE_ONCE() before
> the function finishes cleaning up ancillary state (debounce_period_us) and
> emitting the GPIO_V2_LINE_CHANGED_RELEASED notification:

This is real, and older than this patch: once the cleared
GPIOD_FLAG_REQUESTED is visible, a new request can set
desc->debounce_period_us in edge_detector_setup() before the old one
resets it to 0, and the debounce code reads the period from there.

I'll send a fix with v2 of the chip-removal series, which touches the
same function: reset the period first, then write the flags with
release ordering, pairing with the test_and_set_bit() in
gpiod_request_commit(), so that a new owner sees the reset. The
RELEASED notification can still arrive after the new request's
REQUESTED one. Moving it before the flags update would report the line
as still requested in the RELEASED event, so the fix will describe
that rather than reorder it.

Adrian
