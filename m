Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C69339375
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144875; cv=fail; b=qQ7v7MJDZjq93HqoO8cqtMHzADi9+NiLkWQpLN3OcOhRTGs/MvlOE0Kean+0dbCNKszzr2gVqtamCyzCK5trp/Mz2o9//h/C/gBfJhL4AM+fp4igklo/n8DLqsruR7dU9HPB0A2t+tbobQwgvsp17+GHm+sKs6CmZyqb6mduD3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144875; c=relaxed/simple;
	bh=5rimQvnpzpO3PmtuXuljoN1egaAsBJE5ham731S+gVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mvnijIsp3b61Lc2X07E8sy9Ly7GTyI3uyHk462LggOLEz1HbvDk2tJ5bkEVtWPnsneMWVQTwLzusYFhiF2zZ89yxZH9laH1hllah8NsZCTm2g0g62tkpLqm4+rN3b0xoTgIylsxiQ7ObuFrlV1yJ1VC4SRsnqEbftd+zYdf293U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YkCLqSwj; arc=fail smtp.client-ip=52.101.46.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YkCLqSwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ/4jPmBDD+LtM5EX+myT0bTFsW1Qo3Kf21s0tGMdce/zMsnZcAqtuNRGD45Vourvm1smmqUV1RZp2MR2HYLK+iOD+4T1LH0BmvvetVdiFHQvlLyK6MpPYKV92U7swJfbMQ3294W09znsMqGAQqQZvKhYUHtGrkPQoZ1bCjO+FQYGorW7T9ZO+FlO4z5K0Hha8QqaeAjy8+9+1+T+giIpICRn3lL/FckTqPfRv4YiCATpNBCBVqyGl1xKuiBEIvOIEEfx5bSiauMw72rANATZOogZ+77pUTTwwLfz8ja/qn9tjpIXFHnmO4QpD3LaD/FuRNTDgMdA+5KnM3VI2BGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rimQvnpzpO3PmtuXuljoN1egaAsBJE5ham731S+gVE=;
 b=bFz51VIcmq8cMUXpEazf0Yz+4/raDnPVbfS8Ya97O5TRipkMSv3d0CdKsjrimf1YqGqYAIgf+AiKDqGbPIhrZKKwktVLBnsY1QCCqxFVvVV0S/a//UQNmSQw6rXyJxuWUCsi9QC8aE35OsEQBI3fXI6vKYPv2WiAzVUWaBipr0L8n7fAuuEfXQpsbxbmSp3efNs6pbnwvVZEPf2Yl4BeI9vIbd7hUABTHBmu3nAYUD7DLqhgZGweyxfU/9tF0jnzse8KcLSQjpZrZUC9NRFjeJ8Csw7FnQwB7TcTqFJ7QcuCwwQjKWSkSo4s5o8QbKHctYgIeT3NwYgqP6TpuKn47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rimQvnpzpO3PmtuXuljoN1egaAsBJE5ham731S+gVE=;
 b=YkCLqSwjrgmpWu6TdXGT4lFPKE+b9LMUhj6toAPj1sunYN8ErOIdych3oQyEEuhrf+x3rWXBUkMwHnMW6TBXFRab8Jqd58XCWaixzDl1SKxdg/ttwXK9Culfqvlpizy0xwnf8FqLVZXjzn6hcMy75t2COH5O9GFPSFXZx8kHcKvmq4UGxj0zyOs9eXxsHur8QjBjI3XLYdFFvDTL3w4wwVOIZLwFC8n5sMfwFDvkSrghxCLRTuCMOtRx48Ht/qf8E20BMKMww2curLXYRQofq0Z/e/KQ6F3RfKO2U/WTIX4bFSqXUEe8uY1ExXB7BwxfbkJWaMAET35zHcr+M6IViA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by LV1PR12MB123218.namprd12.prod.outlook.com (2603:10b6:408:516::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 10:01:12 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 10:01:11 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/6] gpiolib: let the character device free its IRQs first on chip removal
Date: Fri, 16 Oct 2026 13:01:07 +0300
Message-ID: <20261016100107.2072170-1-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-174094@kernel.org>
References: <20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com> <20261016-gpiolib-chip-removal-v2-6-aambrozewicz@nvidia.com> <sashiko-outbox-174094@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|LV1PR12MB123218:EE_
X-MS-Office365-Filtering-Correlation-Id: fff32ce1-477a-468a-c1c7-08df2b6c684f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|5023799004|11063799006|261009223027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Fq8snHHl8dtNWiIqa+0sWp8NfsusKQqK7a2UGUvHIoWf3f4aIS0sdXPNxE+evOyWqjksZKaiTfHi93cShZ80ARkqweFIsE848RrkTGCq07NsSkBMLYei8Zd6NKCNshYE2u5dBbVFWZfZZ9R4TH1+vHEEPiVqSsNwSS8tbvlEkgWeh+MlRFI2MtbCBp7tVhCTgrebdmb02AE8jArRGeWt4AUWAejRd7bP2nMvjdvZTnXxXhJfflgtLFBI8JxHcMNyRUcTiWPZLG3OSNe03GSuuK0cidPGQvuynQzQXfX8MbcFlkYFjP+8Q5hcNgRj71zQmuYphLlpnO4Kf51QctkDQFzuVaDa5LsDJzUlY0DWyDXThIVdCEjyYrhKk5y4vutuvMHdzxbG+F/5XYo9gaoGpC/4P3tMsCl5gjFNY5IVe/Kb+nkXnTngmMu9ZWyC6HbrUd6l0b8BBDNn3qaXah326752llGn8biXLKCSRevTzrxK3Y4OZycvVIpCWQK8xsAgIjxY8wh8H7WJDTcG7i/EQbxQoQ3QZ0es06MxjIexkIjejWKFj98/emP1F5YQ30jobThu+Z6iO1bq/a0GuRQ0YxOVunVnQ3I6XXXCIi+QB1HQfB9JpxjSkBCh2zxozb5YnUKd3FbsvWOcjnaWTqEQFluHt7LtLVav8QpwNxzlL1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(5023799004)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFIPGIjcpQXknN+NEaAL72DzwhazW8OXNDjOyS0ZEs8+wXze2fNBr9rhmcxW?=
 =?us-ascii?Q?azU/Dj9tUKYAZYR2A8v+V2O1PZfzsaRDd82vyOBbj/7tpt6fuSneFPBQACxr?=
 =?us-ascii?Q?4oTISCCwrT0QFEVIl+6m0i6liagE0zgBAFosd0zl8EQYvAQJ3CdE/n359VMH?=
 =?us-ascii?Q?ZuY2CGJoGQfat3uvqyyybE0+dNIMKbGqp5eAiKJEn7BgSD7AwuEhz0PKJ6Fm?=
 =?us-ascii?Q?cC/zQDE7bxRH5anxWIQ5Zom7yKxeTjpz7NIGvScG1v+7Eseeoly1GWRJykKm?=
 =?us-ascii?Q?WFwRsTlOaXckgVt7yI0f3ktwYGLxBYZDSLQWhWzzSWHjf5XaE3RTMjJlXET5?=
 =?us-ascii?Q?K/I2Hsd/mDFvDmr2kTj2UzmV+eRljX5+j9QhU9AOZRzDp0MnTxushKMf8FNN?=
 =?us-ascii?Q?H6dFnKtJLW963Jmdy6LGdbs8n/kYqCc/8HCYXlJOXGbqs3EI8ToBdtRKNzii?=
 =?us-ascii?Q?GjbzKznPgHR2iD4tFWKZQ9CD6gIv2ix1B4Xe7UKE91PRNFHv4zyfxkcDoYub?=
 =?us-ascii?Q?GKb58PNQoCG72rtVotzyUK9ki/6onfpzw8jilgkuSMxo3rPYAep9HWepcldb?=
 =?us-ascii?Q?ivhyaFpDfxM3DKfCogTWRoy4nRUCBm7QU7vfxHbnq9ngcGNFbAOjz8sdKtQn?=
 =?us-ascii?Q?yw2iW17RammlrivWhD7d0fmtwWsY7mLnMsNeX7vAfKtjqB+dZuUSsnpuSoWc?=
 =?us-ascii?Q?Co3bmgX6J82ddKIlZxkAT2t6rydP4mGecXLo3sFG/YQCTFzGFlbyOMT4RW0q?=
 =?us-ascii?Q?QISqimAIVYJLRR299iqkkckpZpSkEGBnKrb3tah18xwEorSesmWMq0tYuDg2?=
 =?us-ascii?Q?FgxPLZyis9Jhb9fVhk9VXXLSMucsTl/KPXt/hfe53k2xzZbd8zFKtIE7scf9?=
 =?us-ascii?Q?zLsu/u/MgEG/HJ4HUIgXslBb12DQaLaE47T0uQVigoPmLPbqFrmsniFAGD+R?=
 =?us-ascii?Q?LCzkazGw53eE3RwRuZY+5r6CrJYbjZudubIlPRlRfl4I38Wcfg7F0q0Gbvd6?=
 =?us-ascii?Q?htBx86hAwlhcMf7IJ4A6b72Es3mjv6M1Qz8TGPt5F/TCEkQx2+kK7RNlomL/?=
 =?us-ascii?Q?fRoar+2jVtCLGG35KfQUsnR45E5pfQ5RqWZEYWsXl2XG8rx3jpvDzJw+KzI/?=
 =?us-ascii?Q?cbufdKldDpmPTbeM7/DnIxJ+x8CzWALWfAL0lYoC2kfPPWIclWNwYFlOtAW9?=
 =?us-ascii?Q?sFFFwstAPMcM/HQ2uk4gJc2otdqKLqnPIxQoLEsn1gKJpSbBLPuB8MLwSQwu?=
 =?us-ascii?Q?Uyxql4lLO5N9wAhNv2XeLasvDB19BtJ0mZzgPwFClufLINahSzpzzVw4/LwW?=
 =?us-ascii?Q?isSHroZoLkJbJ/E+z7HNxc235VYi0M8NVLpju9nd2NHWubwfCu4rT4PitwPI?=
 =?us-ascii?Q?fCXQPENS2WpOatK6V9edFxCOIKPy3wXFzLs5ALjfGPE3V3eUKVdHI9MLxMjB?=
 =?us-ascii?Q?Q56lr3dhg3qe68vNek/WjVBOru59ueNFGIjc9oxoA7AdXwjXPKFAValk8Fr3?=
 =?us-ascii?Q?BzlgKPYuElk8qSIe6nmvoRtBNhpFlxAzyUwxQEFUzjK+bGWUU5M8vtd14qx8?=
 =?us-ascii?Q?NYVY8cvs6VJ2muGb/+sIMhyMWWGdJ0C6LZRH5XUy1EoQClEuh1F/GA3imGdE?=
 =?us-ascii?Q?dwnqZ4vUh0eKxYxMReSkMt+TO1DcoZ4Kfg9vwCmqdqTr970Uns6m2q914R5y?=
 =?us-ascii?Q?6rJAwQA5r6gk1iX5ivCHAcCM3rr5swLk5lape+DzDpX2S3IXbX6YDtcWoYI5?=
 =?us-ascii?Q?Ja82grz3EA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff32ce1-477a-468a-c1c7-08df2b6c684f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:01:11.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDJGCQ4MJF5shKm9+N3JCWvnZpY4Z43LnyZu3CvXsUlfBTvykbshpyMrZl3r1fAsLADQoL13gEBgH6XxpwuUTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB123218

On Fri, Oct 16, 2026 at 09:45:44AM +0000, sashiko-bot@kernel.org wrote:
> With the notifier call removed from here and moved exclusively to
> gpiochip_remove(), does this break the error teardown path in
> gpiochip_setup_dev()?

No, an IRQ requested in that window is left behind without this patch
too. The notifier handlers in gpiolib-cdev.c only wake up waiters
(linereq_unregistered_notify(), lineevent_unregistered_notify() and
gpio_device_unregistered_notify() just call wake_up_poll()), so the call
removed here never freed anything. On that path the woken waiters also
find nothing to report, as gdev->chip is still set.

The error path of gpiochip_add_data_with_key() after the character
device is visible is an existing gap: unlike gpiochip_remove(), it
neither clears gdev->chip nor frees the remaining IRQs before removing
the irqchip. That is separate from this series; I'll send a fix for it
on its own.
