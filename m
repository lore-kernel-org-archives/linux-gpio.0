Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795763365;
	b=ESwwksSxARarPWcFOBanvSSj+ao8zhZF+vMnTQrpaPk/wJH5xvYZvv9jqXPWoohQqhD7
	 X6j8rribsZU/6MU5MwioFNhzJaXanKhiWJYTpzx3DmOQyzpW/U01TGWkzez8Cc92H9ajL
	 /sCy+0o7afDnpxV6BJbuAkJl5UkQOSiUCPOk4SZ5oFVj6+gTIiDG7R4b7mJHbBb+K6f9z
	 +5wd6fDhLTJU2SCfKW9lKHM4Ps0wOXGVVKoUXrGhcsapMsznpZzwkAN5HGC1jXhIS0FkI
	 IoZvLCXEgNM4HBYwpiiJvh5xrPKmkjm5IrFKK77JBCMbH9ZKGs0BGihCu73Lbe/V3GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763365;
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
	bh=U5GR5qvdnyYLkn+fMQvUnBvCTMkWZANMcGDFDaacRgs=;
	b=PGahS50TEOgQMV4/jMbGCcUzjVu3Fvod58smz5nOIUEXfiupTShPUSOAu5yYxuZ62xNZ
	 xYP2ZwJYUNj2zZrkQJHwDRblzfsNNJMK1EMFSRcCXIoJgw3kuXxIhZbXrCapumtMCkDsU
	 W7kXXAe2e2M+TMuqgNVQUPVk/8Up7nJ/dVURbqIzlxninBk1dJysWqe0Gi//dc4EmSmLA
	 aCD4YJkm8Qlyxh91vpw5WQrPFAOyqrqag07haK5eKhBVYEE3wI3atKQ2hUs0fGja1xwN1
	 vYJ9iujVFU01YMlr7O8h8+f9oqN3qv0JfAIz/CyqSMJpNNuNDnAsxerInwFwPamTODQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HppRPMHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.1
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39C606A31C;
	Fri, 27 Nov 2026 07:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC39C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HppRPMHE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBCbe0dFrVK5nUubJU6K7XPI4fPgpcucWdAu4wqt+m/RIz3MgguiZjBB4fb6GbogTyd/i5WsisE7sQazL184m+nbsvhGVj3wdeiF+MxaGkSricutSpDapIIYQqe2wD5WwexbXfAIue+QQVwVyX0LWoChNeVkHATcoEgp5nD8GacUxnD4VGmi31KaNWiSKMCUsMi11eau7PXOrk9AigdPY3XMer09/EvQblXeNnF8tyvr0Q1gWpoNHkGMN+EZ7ndVsB3AwZ0AQ1oI96eSVTXEJfcQECKCI/rLcWZJyKCY1mPyz3t9IizWVSXIEtinhQTS/iZ68l5p0lfyeyw6Z1ec7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5GR5qvdnyYLkn+fMQvUnBvCTMkWZANMcGDFDaacRgs=;
 b=kcNs6+dKmTuvxOroh2qnQ7bBTg1+GbEyUGcXmW3zwSVthVy69ko0l5k3rcpvTJb5y6gNmtEdQZ2ILnjwqxNJzQLpAjjoGC/1TLo/usWSyaAF0LuIXzGuGTfjCAEC7t15b/rXRS+edbf+bVVfSGHNAmp1GQJbVS1ER4C2bSEIXKF+UtDLf0t1+L5cZFjC1tTIMQbZ9yLIyL4kpqR6MjZCOQ8JjCyT4gNcHtMEXkjwZpUsO6bcRP+hNHRsfx97qs62hBiE8sczTX1MwXSRmhMUj6drvS2o0FnXwhbpf4JlKbYEBuXOpP3NIhTfdNxk+KgTIFA7lS8xqht7/s0HqT0dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5GR5qvdnyYLkn+fMQvUnBvCTMkWZANMcGDFDaacRgs=;
 b=HppRPMHE9urK0BQk5ifQTKsx9h9EgMyhJ4wYCnjF44qP7MbxjaU+fxdWWOlxu9o5FFlxz+XaGSmxA9UoREHerC22OPi/Cn1FEOxt+aQ90llSW3pIoWb99SZbr9GY+JvAJNNk9Vya991r7+ujAWsHbyOo5kXh8BZi1lFWivy4PTNc3tii3oJB/c3+DzkaFPCKy5oxpT89n70h9fFYqkZ1X6y5JXkBxVGt2XFU5ZnoEcpWPzaCV3W6nMXZa6v8Zy1USUvDuJkIOIAnZ/eqIMhBoLFfMCOxULkU9UrhRcEzyu+2g3T05lQ2reeuo2klVGcHE7YTJ/JsAwU9yjijRcX/ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Fri, 27 Nov 2026 07:09:14 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 07:09:14 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Zqiang <qiang.zhang@linux.dev>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Use srcu_barrier() instead of synchronize_srcu() in gpiodev_release()
Date: Fri, 27 Nov 2026 09:09:11 +0200
Message-ID: <20261127070910.668333-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127023101.27568-1-qiang.zhang@linux.dev>
References: <20261127023101.27568-1-qiang.zhang@linux.dev>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::11) To PH7PR12MB5974.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 19245021-91ef-4603-b849-08df4c55582e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|261026140227099003|56012099006|261022105027099003|261009223027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ciSXsVHFU4obDcXCx/7KrPp+lRmigI7r2LMCPYC+Pg+juWcdezBAyr3GIyCnupP4JIXPRh6NVFJCpdjF+rGdO4Xv3AX8MPuHxb2VSP+4u/GR0sOsp0T1QFFw/C3mtZO3KJ+oCcMS21j+87LggqEnTlcR37JpUa/fGA14qe3bw7oW38wLdscy6ZggiXaRS8qge8yarSR/okEwIA08EM3y+SVVdRAjO97UIundBcecNseffWY8vNJ51h5w4KtiVxwyQleLjz1wGg+4qUhdbwXu5UvxIHLouolO/VyUu+5ie1m9jRx9TxsmEu7T4nR57YY7Xm/Nr8AUppU9MdqoU6XN/o5SECnhMq89Tf+ligAImKANwciDU1O0zS08tXW2Lwsc0pdyAmH78rA8D8OejMtekx0BTXTPzuHAVgbde+YXacI6odVSf83G6QEk9lvRE9+jnM2zt4gbG0ofH2KKhSJ92xeceb/NVeeL/HMRBuWKKbo1pcqbQBvunpVC7b/gWaWymJKG/gWU3otHDMzwEPhVws6NOyGz+8EtuhogoGpMqKNCZ0B9XECn21w1/Le/KgggJ5AK2rcyRLekQd284f6H7FgAo1Kcy2xtqERctOSZPDggfabzoQAEmAKab6sRSjznN0xlek8JMSapVNfhy4ZtmNRB//nzPyGpyCClF5gSDXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(261026140227099003)(56012099006)(261022105027099003)(261009223027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B1FuPvIOz82LMXXLXFibAx9Sz/3gOQdQVr4qpowXHfJ/nrGFGnynCozPpBx7?=
 =?us-ascii?Q?b6D6CeqFtmIYXks5WBXfa6zIda0LrnuGmmKjR0xzjAXc/tZ8iVzUIwdDBEoZ?=
 =?us-ascii?Q?MkcFMR1q0K+y6Fr6grnEOjrRiTZx+OYe2xdATRLgK+wlmaVu+kjXoBdo+x2N?=
 =?us-ascii?Q?jMEMJBVdrlvOy2G3TscJw0clr7tAlDh5Y+IIHifxZtRlA8rNM0pVi1esOuK7?=
 =?us-ascii?Q?ajGoLxd95vD6gLAfMPkTZHqfUzzb/DXkE76h6gblUgE7vfVKB4ZqDYi8yhsM?=
 =?us-ascii?Q?TU+QkMZtQ4lUDaJMdWTyZqMpo/egjCXggaE2jnYMfxqvSfn24uUZyOn2YesO?=
 =?us-ascii?Q?CnEr9HctXblu+8hJm7JeUaSoiedVT9upnJEwzHefHayH9FtzpVQx4ZN2AEdj?=
 =?us-ascii?Q?A+TpdQP9AwUheJNIwThnJXcyL7WTIJdQIrWN7RREVnInhzpy4oDlNFnYJ6Ke?=
 =?us-ascii?Q?AeLTBA//a3NTCL6mkKNZJ3sp++hQMeBILIbtU5oXAh3w1/36XEzvR1DkuzxW?=
 =?us-ascii?Q?Fv0BNW91d/ulJ7v9vm2XPeLyYV2xklz2MdddO1fRomnUvkwdnbMLCGWYiWHX?=
 =?us-ascii?Q?9bXpYs4uMREK3/vvotz2g85bKGMVkZN7dRvHQRz5qymWWcg9mYki3XNlNsJF?=
 =?us-ascii?Q?ADpAyy5ZhiJbKt5P7ZAgNFfCHaXenDn7W7/2gdVK1zp8Don5TLxAfyJKul4M?=
 =?us-ascii?Q?4mmv3rZk8BXEqKO1TkihwcqR3ObanTbiJQ0M99ZfzInSG2gRJ06uQ1ZNcZlO?=
 =?us-ascii?Q?gKCutiTVbLimpFGGVtD2iOUyrwAn6ZrrkRDXSjvvAT7m1oUT16NdMA9fVsvF?=
 =?us-ascii?Q?6EVxi3wzdbvClvtRWJAH0ICRcRp9ruI0FIudZdjXSE63gmNTQtys7+CwsnLF?=
 =?us-ascii?Q?3teFIYPieQEKNTZsiM0hYHUCKeJp8KRAlYd7KV6QOG+qJg+JQEs53KjnLZJX?=
 =?us-ascii?Q?NDBCFAKK0Aahkt2nuzNDt6T5gf3yKM/pxeH8cZG8dWOpG6cvzgJGDPZNsqEx?=
 =?us-ascii?Q?nc3v0php2vHB+8B+Yu5WlIJEwDG4YGt63MUijjdiEwDcGEaihXEPxXTr+SH4?=
 =?us-ascii?Q?INlyDH6mRSfZlOJEgr5mybCentn3NkUnGzuX4Qfq/tX067Hg6ko6Xt9HnmQG?=
 =?us-ascii?Q?nNDJsFbGlEOb9yQ0hNnZS9TDFELlNSb5uY0o72J5qCvica/iPYigFYOLD4b5?=
 =?us-ascii?Q?W5Y6agRI0fAwcZIZuAH9kv7cEKZ2XauQf/LSqA6bcmSW/yjR/xIrsp86OMLC?=
 =?us-ascii?Q?recIzXQ1VIzZI69UaVmIrPKmmULM67rf86NysV9yryfdc2gKZdZzVdODoPGU?=
 =?us-ascii?Q?oPaRhPDH78BcwwI3qVakIb5dVYpwbFZuUDdGR+8o25Hgm4jsAxDTVW486zfW?=
 =?us-ascii?Q?qwPghg8NPpGlYhiQ6Z+45iHsqNwxaVlLddMDeVQnRXRyADbwpxu0EKtletLv?=
 =?us-ascii?Q?Q8kPiGII8d/DeTuKq/a8N9lTknJnPyYLnGL56Fp1JrORO/cqCar/eqK8WydR?=
 =?us-ascii?Q?8DznDiDGI5T8qGZdPolUfJQpJy0EQv3wRaM4394YCs8VT+ifits2xhHRO5Km?=
 =?us-ascii?Q?kEsTkNfV7qxN0S5TdpqFgAVID8frD0MTp8+U0nTlZbUCNj+NUaHoY3Fk5i31?=
 =?us-ascii?Q?/1JR58qJVCDdffJoBoIG0PEGvWSEUp/Px+vu8Fz605RRbKZ98EzG0OX3crnO?=
 =?us-ascii?Q?Pidk+LgDQyBhvmjcW2Ovy84ERShZr2DlghOOx6RIzgTEdQSI8RMHxUjUbspq?=
 =?us-ascii?Q?7ZB+OsL1Dw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19245021-91ef-4603-b849-08df4c55582e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 07:09:14.7573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWLtfxhfYKhHXZXG7GzlxMLubzbdsVSU0rrGE2gLyJckOR1ThBhoAdYo0vo1LQKX6602fv9/QpEWOxg1a+tNkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168

On Fri, Nov 27, 2026 at 10:31:01AM +0800, Zqiang wrote:
> The gpio_desc_label object are freed asynchronously via call_srcu() on
> gdev->desc_srcu (see desc_set_label()). to drain these pending SRCU
> callbacks before cleanup the SRCU structure, gpiodev_release() currently
> calls synchronize_srcu(&gdev->desc_srcu).

[...]

>  	/* Call pending kfree()s for descriptor labels. */
> -	synchronize_srcu(&gdev->desc_srcu);
> +	srcu_barrier(&gdev->desc_srcu);
>  	cleanup_srcu_struct(&gdev->desc_srcu);

Hi Zqiang,

Bartosz already has this exact change in gpio/for-current, applied on
2026-11-24 as commit c901e8fddd3a ("gpiolib: wait for pending label
frees before cleaning up desc_srcu"):

https://git.kernel.org/brgl/c/c901e8fddd3a23353bb12c9d93b9a5fc482ac8f5

It carries Fixes: a86d27693066 and Cc: stable.

Thanks,
Adrian
